`timescale 1ns / 1ps

module transconv
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 8,
              ACC_WIDTH = 32,
              MKN_WIDTH = 14, // max 2^14 - 1 = 16383, our max row/col number is 8192
              N_OUT_PLANE_WIDTH = 10,
              INOUT_WH_WIDTH = 7,
              MISC_WIDTH = 3,
              RV_ADDR_WIDTH = 13,
              CV_ADDR_WIDTH = 10
)
(
    input wire clk,
    input wire reset,
    input wire start_tick,
    input wire [MKN_WIDTH-1:0] m,
    input wire [MKN_WIDTH-1:0] k,
    input wire [MKN_WIDTH-1:0] n,
    input wire [N_OUT_PLANE_WIDTH-1:0] n_output_plane,
    input wire [N_OUT_PLANE_WIDTH-1:0] output_plane_start,
    input wire [N_OUT_PLANE_WIDTH-1:0] output_plane_batch_size,
    input wire [INOUT_WH_WIDTH-1:0] output_h,
    input wire [INOUT_WH_WIDTH-1:0] output_w,
    input wire [INOUT_WH_WIDTH-1:0] input_h,
    input wire [INOUT_WH_WIDTH-1:0] input_w,
    input wire [MISC_WIDTH-1:0] kernel_h,
    input wire [MISC_WIDTH-1:0] kernel_w,
    input wire [MISC_WIDTH-1:0] pad_h,
    input wire [MISC_WIDTH-1:0] pad_w,
    input wire [MISC_WIDTH-1:0] stride_h,
    input wire [MISC_WIDTH-1:0] stride_w,
    input wire [MISC_WIDTH-1:0] dilation_h,
    input wire [MISC_WIDTH-1:0] dilation_w,
    input wire [DATA_WIDTH-1:0] a,
    input wire [DATA_WIDTH-1:0] b,
    input wire [ACC_WIDTH-1:0] c, // be careful with the width here
    input wire [ACC_WIDTH-1:0] rv,
    input wire [ACC_WIDTH-1:0] cv,
    input wire [ACC_WIDTH-1:0] term4,
    output wire [ADDR_WIDTH-1:0] a_rd_addr,
    output wire [ADDR_WIDTH-1:0] b_rd_addr,
    output wire [ADDR_WIDTH-1:0] c_rw_addr,
    output wire [RV_ADDR_WIDTH-1:0] addr_rv,
    output wire [CV_ADDR_WIDTH-1:0] addr_cv,
    output reg [ACC_WIDTH-1:0] c_out,
    output reg c_wr_en,
    output reg done_tick
);

// TODO: add a state to clear output BRAM
localparam [2:0]
    idle = 3'b000,
    loop = 3'b001,
    pick = 3'b010,
    macc = 3'b011,
    save = 3'b100,
    done = 3'b101;

wire [MISC_WIDTH*2-1:0] kh_x_kw = kernel_h * kernel_w;
wire [MKN_WIDTH-1:0] j_max = (output_plane_start + output_plane_batch_size) * kh_x_kw - 1;

reg [2:0] state, state_next;
reg [ADDR_WIDTH-1:0] a_rd_addr_reg, a_rd_addr_next;
reg [ADDR_WIDTH-1:0] b_rd_addr_reg, b_rd_addr_next;
reg [ADDR_WIDTH-1:0] c_rw_addr_reg, c_rw_addr_next;

reg [MKN_WIDTH-1:0] i, i_next;
reg [MKN_WIDTH-1:0] j, j_next;
reg [MKN_WIDTH-1:0] l, l_next;

// always @* is combinational and cannot hold state, therefore we have to use *_next
reg [MKN_WIDTH-1:0] i_saved, i_saved_next;
reg [MKN_WIDTH-1:0] j_saved, j_saved_next;
reg last, last_next;


reg [N_OUT_PLANE_WIDTH-1:0] c_im, c_im_next;
reg [MISC_WIDTH-1:0] h_offset, h_offset_next;
reg [MISC_WIDTH-1:0] w_offset, w_offset_next;
reg [INOUT_WH_WIDTH-1:0] h_col, h_col_next;
reg [INOUT_WH_WIDTH-1:0] w_col, w_col_next;

// DSP48 Macro reference says: "When the specified value (of P port) is less than the
// full precision width, the output is truncated, that is, the **LSBs** are removed."
//
// This is why we need to take the full precision P and truncate it down to INOUT_WH_WIDTH
wire signed [INOUT_WH_WIDTH-1:0] h_im, w_im;
wire [47:0] h_im_p, w_im_p, a_rd_addr_p, b_rd_addr_p, c_rw_addr_p;
wire [47:0] p0, p1, p2, p3, p4;
wire [47:0] acc;
reg macc_reset, macc_ce; // reset & clock enable

always @(posedge clk, posedge reset)
begin
    if (reset)
        begin
            state <= idle;
            a_rd_addr_reg <= 0;
            b_rd_addr_reg <= 0;
            c_rw_addr_reg <= 0;

            i <= 0;
            j <= 0;
            l <= 0;
            i_saved <= 0;
            j_saved <= 0;
            last <= 0;

            c_im <= 0;
            h_offset <= 0;
            w_offset <= 0;
            h_col <= 0;
            w_col <= 0;
            // no need to reset done_tick (see debounce.v, for example)
        end
    else
        begin
            state <= state_next;
            a_rd_addr_reg <= a_rd_addr_next;
            b_rd_addr_reg <= b_rd_addr_next;
            c_rw_addr_reg <= c_rw_addr_next;

            i <= i_next;
            j <= j_next;
            l <= l_next;
            i_saved <= i_saved_next;
            j_saved <= j_saved_next;
            last <= last_next;

            c_im <= c_im_next;
            h_offset <= h_offset_next;
            w_offset <= w_offset_next;
            h_col <= h_col_next;
            w_col <= w_col_next;
        end
end

always @*
begin
    state_next = state;
    a_rd_addr_next = a_rd_addr_reg;
    b_rd_addr_next = b_rd_addr_reg;
    c_rw_addr_next = c_rw_addr_reg;

    i_next = i;
    j_next = j;
    l_next = l;
    i_saved_next = i_saved;
    j_saved_next = j_saved;
    last_next = last;

    c_im_next = c_im;
    h_offset_next = h_offset;
    w_offset_next = w_offset;
    h_col_next = h_col;
    w_col_next = w_col;

    // direct output signals
    c_out = 0;
    c_wr_en = 1'b0; // a tick
    done_tick = 1'b0;
    macc_reset = 1'b0;
    macc_ce = 1'b0;

    case (state)
        idle: // 0
            begin
                if (start_tick)
                    begin
                        state_next = loop;
                        // No need to set a_rd_addr_next, ...

                        i_next = 0;
                        j_next = output_plane_start * kh_x_kw;
                        l_next = 0;

                        c_im_next = output_plane_start;
                        h_offset_next = 0;
                        w_offset_next = 0;
                        h_col_next = 0;
                        w_col_next = 0;

                        last_next = 1'b0;
                    end
            end
        loop: // 1
            begin
                if (w_col == input_w - 1)
                    begin
                        if (h_col == input_h - 1)
                            begin
                                if (w_offset == kernel_w - 1)
                                    begin
                                        if (h_offset == kernel_h - 1)
                                            begin
                                                if (c_im == n_output_plane - 1)
                                                    last_next = 1'b1;
                                                else
                                                    begin
                                                        c_im_next = c_im + 1;
                                                        h_offset_next = 0;
                                                        w_offset_next = 0;
                                                        h_col_next = 0;
                                                        w_col_next = 0;
                                                        i_next = 0;
                                                        j_next = j + 1;
                                                    end
                                            end
                                        else
                                            begin
                                                h_offset_next = h_offset + 1;
                                                w_offset_next = 0;
                                                h_col_next = 0;
                                                w_col_next = 0;
                                                i_next = 0;
                                                j_next = j + 1;
                                            end
                                    end
                                else
                                    begin
                                        w_offset_next = w_offset + 1;
                                        h_col_next = 0;
                                        w_col_next = 0;
                                        i_next = 0;
                                        j_next = j + 1;
                                    end
                            end
                        else
                            begin
                                h_col_next = h_col + 1;
                                w_col_next = 0;
                                i_next = i + 1;
                            end
                    end
                else
                    begin
                        w_col_next = w_col + 1;
                        i_next = i + 1;
                    end

                state_next = pick;
                // it is important to save i and j's values here use the saved value for macc
                i_saved_next = i;
                j_saved_next = j;
                a_rd_addr_next = i;
                b_rd_addr_next = j * k;

                if (i == m - 1 && j == j_max)
                    last_next = 1'b1;
            end
        pick: // 2
            begin
                // a & b are available in this cycle, DSP48 has 1 register delay (the M register), so acc will be
                // a * b in the next cycle
                if (h_im >= 0 && h_im < output_h && w_im >= 0 && w_im < output_w)
                    begin
                        state_next = macc;
                        // c_rw_addr_p depends on c_im, h_im and w_im, which are computed for the previous loop cycle
                        c_rw_addr_next = c_rw_addr_p[ADDR_WIDTH-1:0];
                        l_next = 1; // set to 1 so that in the next cycle, a_rd_addr_next can be computed
                    end
                else if (last_next)
                    state_next = done;
                else
                    state_next = loop;
            end
        macc: // 3
            begin
                macc_ce = 1'b1;
                if (l == k) // l started with 1 instead of 0
                    state_next = save;
                else
                    begin
                        l_next = l + 1;
                        // these addresses are ready in this cycle since we used l_next in the previous cycle as input to DSP48
                        a_rd_addr_next = a_rd_addr_p[ADDR_WIDTH-1:0];
                        b_rd_addr_next = b_rd_addr_p[ADDR_WIDTH-1:0];
                    end
            end
        save:
            begin
                if (last)
                    state_next = done;
                else
                    state_next = loop;
                c_out = c + acc[ACC_WIDTH-1:0] + rv + cv + term4;
                c_wr_en = 1'b1;
                macc_reset = 1'b1;
            end
        done: // 4
            begin
                state_next = idle;
                done_tick = 1'b1;
            end
    endcase
end

// The reason that we assign a_rd_addr to a_rd_addr_next instead of a_rd_addr_reg is so that
// a will be immediately available in the next cycle. Otherwise it's 2 DFF cascaded and a will
// be delayed a cycle.
//
// a_rd_addr_next = l_next * m + i_saved;
// b_rd_addr_next = l_next * n + j_saved;
// c_rw_addr = (c_im * output_h + h_im) * output_w + w_im;
assign a_rd_addr = a_rd_addr_next;
assign b_rd_addr = b_rd_addr_next;
assign c_rw_addr = c_rw_addr_next;

assign addr_rv = j_saved;
assign addr_cv = i_saved;

// If these were to be implemented in fabric, they pass all simulations but fail on device
// due to large propagation delays. Therefore, we compute them with DSP48 and wait for a cycle
// to obtain the results
//
// h_im = h_col * stride_h - pad_h + h_offset * dilation_h;
// w_im = w_col * stride_w - pad_w + w_offset * dilation_w;
assign h_im = h_im_p[INOUT_WH_WIDTH-1:0]; // explictly truncate down the 48-bit result
assign w_im = w_im_p[INOUT_WH_WIDTH-1:0];

// h_im = h_col * stride_h - pad_h + h_offset * dilation_h;
// NOTE: writing 0 instead of 1'b0 will not produce 1-bit width, but the width of int (32)
// NOTE: since we run the DSP48 slices with our 100MHz clk, there's no need to pipeline
xbip_dsp48_macro_0 dsp48_h_im_a (
  .CLK(clk),
  .SEL(2'd0),
  .PCIN(48'd0), // PCIN needs to be connected to avoid critical warning
  .A({15'd0, stride_h}),
  .B({11'd0, h_col}),
  .C({29'd0, pad_h}),
  .PCOUT(p0),
  .P()
);

xbip_dsp48_macro_0 dsp48_h_im_b (
  .CLK(clk),
  .SEL(2'd1),
  .PCIN(p0),
  .A({15'd0, h_offset}),
  .B({15'd0, dilation_h}),
  .C(32'd0), // C needs to be connected to avoid critical warning
  .PCOUT(p1),
  .P(h_im_p)
);

// w_im = w_col * stride_w - pad_w + w_offset * dilation_w;
xbip_dsp48_macro_0 dsp48_w_im_a (
  .CLK(clk),
  .SEL(2'd0),
  .PCIN(48'd0),
  .A({15'd0, stride_w}),
  .B({11'd0, w_col}),
  .C({29'd0, pad_w}),
  .PCOUT(p2),
  .P()
);

xbip_dsp48_macro_0 dsp48_w_im_b (
  .CLK(clk),
  .SEL(2'd1),
  .PCIN(p2),
  .A({15'd0, w_offset}),
  .B({15'd0, dilation_w}),
  .C(32'd0),
  .PCOUT(p3),
  .P(w_im_p)
);

// c_rw_addr_next = (c_im * output_h + h_im) * output_w + w_im;
xbip_dsp48_macro_0 dsp48_c_rw_addr_a (
  .CLK(clk),
  .SEL(2'd1),
  .PCIN(p1),
  .A({8'd0, c_im}),
  .B({11'd0, output_h}),
  .C(32'd0),
  .PCOUT(),
  .P(p4) // PCOUT may only drive PCIN
);

xbip_dsp48_macro_0 dsp48_c_rw_addr_b (
  .CLK(clk),
  .SEL(2'd1),
  .PCIN(p3),
  .A(p4[17:0]), // we can't cascade this p4, unfortunately
  .B({11'd0, output_w}),
  .C(32'd0),
  .PCOUT(),
  .P(c_rw_addr_p)
);

// sum_next = sum + a * b;
xbip_dsp48_macro_1 dsp48_macc (
  .CLK(clk),
  .CE(macc_ce),
  .SCLR(macc_reset),
  .A({1'b0, a}),
  .B({1'b0, b}),
  .P(acc)
);

// a_rd_addr_next = l_next * m + i_saved;
xbip_dsp48_macro_0 dsp48_a_rd_addr (
  .CLK(clk),
  .SEL(2'd2),
  .PCIN(48'd0),
  .A({4'd0, l_next}),
  .B({4'd0, m}),
  .C({18'd0, i_saved}),
  .PCOUT(),
  .P(a_rd_addr_p)
);

// b_rd_addr_next = j_saved * k + l_next;
xbip_dsp48_macro_0 dsp48_b_rd_addr (
  .CLK(clk),
  .SEL(2'd2),
  .PCIN(48'd0),
  .A({4'd0, j_saved}),
  .B({4'd0, k}),
  .C({18'd0, l_next}),
  .PCOUT(),
  .P(b_rd_addr_p)
);

endmodule
