`timescale 1ns / 1ps

module col_vec
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 8,
              ACC_WIDTH = 32,
              MKN_WIDTH = 14 // max 2^14 - 1 = 16383, our max row/col number is 8192
)
(
    input wire clk,
    input wire start_tick,
    input wire [MKN_WIDTH-1:0] m,
    input wire [MKN_WIDTH-1:0] k,
    input wire [DATA_WIDTH-1:0] rhs_offset,
    input wire [DATA_WIDTH-1:0] a,
    output wire [ADDR_WIDTH-1:0] a_rd_addr,
    output wire [9:0] addr_cvw,
    output wire [ACC_WIDTH-1:0] val,
    output wire we,
    output reg done_tick
);

localparam [2:0]
    idle = 3'b000,
    loop = 3'b001,
    addr = 3'b010,
    sum  = 3'b011,
    save = 3'b100,
    done = 3'b101;

reg [2:0] state = idle, state_next = idle;
reg [ADDR_WIDTH-1:0] a_rd_addr_reg = 0, a_rd_addr_next = 0; //  TODO: not necessary?
reg [9:0] addr_cvw_reg = 0, addr_cvw_next = 0;
reg [MKN_WIDTH-1:0] i = 0, i_next = 0;
reg [MKN_WIDTH-1:0] j = 0, j_next = 0;
reg [ACC_WIDTH-1:0] acc = 0, acc_next = 0;
reg we_reg = 1'b0, we_next = 1'b0;

wire [47:0] a_rd_addr_p;
wire [39:0] val_p;

always @(posedge clk)
begin
    state <= state_next;
    a_rd_addr_reg <= a_rd_addr_next;
    addr_cvw_reg <= addr_cvw_next;
    i <= i_next;
    j <= j_next;
    acc <= acc_next;
    we_reg <= we_next;
end

always @*
begin
    state_next = state;
    a_rd_addr_next = a_rd_addr_reg;
    addr_cvw_next = addr_cvw_reg;
    i_next = i;
    j_next = j;
    acc_next = acc;
    we_next = 1'b0; // tick
    done_tick = 1'b0;

    case (state)
        idle:
            begin
                if (start_tick)
                    begin
                        state_next = addr;
                        a_rd_addr_next = 0;
                        addr_cvw_next = -1;
                        i_next = 0;
                        j_next = 0;
                        acc_next = 0;
                    end
            end
        loop:
            begin
                if (j == k - 1)
                    begin
                        i_next = i + 1;
                        j_next = 0;
                    end
                else
                    j_next = j + 1;

                state_next = addr;
            end
        addr:
            begin
                a_rd_addr_next = a_rd_addr_p[ADDR_WIDTH-1:0];
                state_next = sum;
            end
        sum:
            begin
                if (j == 0)
                    begin
                        acc_next = a;
                        state_next = loop;
                    end
                else if (j == k - 1)
                    begin
                        if (i == m - 1)
                            state_next = done;
                        else
                            state_next = loop;

                        acc_next = acc + a;
                        addr_cvw_next = addr_cvw_reg + 1;
                        we_next = 1'b1;
                        // val = - rhs_offset * acc_next;
                    end
                else
                    begin
                        acc_next = acc + a;
                        state_next = loop;
                    end
            end
        done:
            begin
                state_next = idle;
                done_tick = 1'b1;
            end
    endcase
end

assign a_rd_addr = a_rd_addr_next;
assign addr_cvw = addr_cvw_reg;
assign val = - val_p[31:0];
assign we = we_reg;

// a_rd_addr_next = j_next * m + i_next;
xbip_dsp48_macro_0 dsp48_a_rd_addr (
  .CLK(clk),
  .SEL(2'd2),
  .PCIN(48'd0),
  .A({4'd0, j_next}),
  .B({4'd0, m}),
  .C({18'd0, i_next}),
  .PCOUT(),
  .P(a_rd_addr_p)
);

// val = - rhs_offset * acc_next;
mult_gen_0 mult_val (
  .CLK(clk),
  .A(acc_next),
  .B(rhs_offset),
  .P(val_p)
);

endmodule
