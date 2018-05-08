`timescale 1ns / 1ps

module batchnorm
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              WB_ADDR_WIDTH = 2,
              DATA_WIDTH = 32
)
(
    input wire clk,
    input wire start_tick,
    input wire [DATA_WIDTH-1:0] in,
    input wire [DATA_WIDTH-1:0] weight,
    input wire [DATA_WIDTH-1:0] bias,
    input wire [ADDR_WIDTH-1:0] input_total_size,
    input wire [ADDR_WIDTH-1:0] input_plane_size,
    output reg [DATA_WIDTH-1:0] out,
    output wire [ADDR_WIDTH-1:0] addr_rd,
    output wire [ADDR_WIDTH-1:0] addr_wr,
    output wire [WB_ADDR_WIDTH-1:0] addr_weight,
    output wire [WB_ADDR_WIDTH-1:0] addr_bias,
    output reg we,
    output reg done_tick
);

localparam [2:0]
    idle   = 3'b000,
    mean   = 3'b001,
    invstd = 3'b010,
    run    = 3'b011,
    done   = 3'b100;

wire [DATA_WIDTH-1:0] eps = 32'h3727c5ac; // 0.00001

reg [2:0] state = idle, state_next = idle;
reg [ADDR_WIDTH-1:0] start_addr = {ADDR_WIDTH{1'b0}}, start_addr_next = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_rd_reg = {ADDR_WIDTH{1'b0}}, addr_rd_next = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_wr_reg = {ADDR_WIDTH{1'b0}}, addr_wr_next = {ADDR_WIDTH{1'b0}};
reg [WB_ADDR_WIDTH-1:0] addr_weight_reg = {WB_ADDR_WIDTH{1'b0}}, addr_weight_next = {WB_ADDR_WIDTH{1'b0}};
reg [WB_ADDR_WIDTH-1:0] addr_bias_reg = {WB_ADDR_WIDTH{1'b0}}, addr_bias_next = {WB_ADDR_WIDTH{1'b0}};
reg [DATA_WIDTH-1:0] mean_reg = {DATA_WIDTH{1'b0}}, mean_next = {DATA_WIDTH{1'b0}};
reg [DATA_WIDTH-1:0] invstd_reg = {DATA_WIDTH{1'b0}}, invstd_next = {DATA_WIDTH{1'b0}};

// multiply
reg s_axis_a_tvalid0 = 1'b0;
wire s_axis_a_tready0;
reg [31:0] s_axis_a_tdata0 = 32'd0;

reg s_axis_b_tvalid0 = 1'b0;
wire s_axis_b_tready0;
reg [31:0] s_axis_b_tdata0 = 32'd0;

wire m_axis_result_tvalid0;
wire [31:0] m_axis_result_tdata0;

// fixed-to-float: float(input_plane_size)
reg s_axis_a_tvalid1 = 1'b0;
wire s_axis_a_tready1;
reg [31:0] s_axis_a_tdata1 = 32'd0;

wire m_axis_result_tvalid1;
wire [31:0] m_axis_result_tdata1;

// accumulator: sum
reg s_axis_a_tvalid2 = 1'b0;
wire s_axis_a_tready2;
reg [31:0] s_axis_a_tdata2 = 32'd0;
reg s_axis_a_tlast2 = 1'b0;

wire m_axis_result_tvalid2;
wire [31:0] m_axis_result_tdata2;
wire m_axis_result_tlast2;

// divide: x / n
reg s_axis_a_tvalid3 = 1'b0;
wire s_axis_a_tready3;
reg [31:0] s_axis_a_tdata3 = 32'd0;

reg s_axis_b_tvalid3 = 1'b0;
wire s_axis_b_tready3;
reg [31:0] s_axis_b_tdata3 = 32'd0;

wire m_axis_result_tvalid3;
wire [31:0] m_axis_result_tdata3;

// minus: in - mean
reg s_axis_a_tvalid4 = 1'b0;
wire s_axis_a_tready4;
reg [31:0] s_axis_a_tdata4 = 32'd0;

reg s_axis_b_tvalid4 = 1'b0;
wire s_axis_b_tready4;
reg [31:0] s_axis_b_tdata4 = 32'd0;

wire m_axis_result_tvalid4;
wire [31:0] m_axis_result_tdata4;

// plus: variance + eps
reg s_axis_a_tvalid5 = 1'b0;
wire s_axis_a_tready5;
reg [31:0] s_axis_a_tdata5 = 32'd0;

reg s_axis_b_tvalid5 = 1'b0;
wire s_axis_b_tready5;
reg [31:0] s_axis_b_tdata5 = 32'd0;

wire m_axis_result_tvalid5;
wire [31:0] m_axis_result_tdata5;

// inverse sqrt
reg s_axis_a_tvalid6 = 1'b0;
wire s_axis_a_tready6;
reg [31:0] s_axis_a_tdata6 = 32'd0;

wire m_axis_result_tvalid6;
wire [31:0] m_axis_result_tdata6;

// multiply by w, add b
reg s_axis_a_tvalid7 = 1'b0;
wire s_axis_a_tready7;
reg [31:0] s_axis_a_tdata7 = 32'd0;

reg s_axis_b_tvalid7 = 1'b0;
wire s_axis_b_tready7;
reg [31:0] s_axis_b_tdata7 = 32'd0;

reg s_axis_c_tvalid7 = 1'b0;
wire s_axis_c_tready7;
reg [31:0] s_axis_c_tdata7 = 32'd0;

wire m_axis_result_tvalid7;
wire [31:0] m_axis_result_tdata7;

floating_point_mult multiply (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid0),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready0),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata0),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid0),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready0),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata0),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid0),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata0)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_fixed_to_float fixed_to_float (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid1),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready1),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata1),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid1),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata1)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_acc accumulate (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid2),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready2),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata2),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_a_tlast(s_axis_a_tlast2),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(m_axis_result_tvalid2),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata2),    // output wire [31 : 0] m_axis_result_tdata
  .m_axis_result_tlast(m_axis_result_tlast2)    // output wire m_axis_result_tlast
);

floating_point_divide divide (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid3),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready3),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata3),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid3),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready3),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata3),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid3),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata3)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_subtract minus (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid4),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready4),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata4),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid4),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready4),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata4),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid4),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata4)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_add plus (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid5),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready5),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata5),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid5),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready5),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata5),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid5),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata5)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_invsqrt inverse_sqrt (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid6),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready6),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata6),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid6),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata6)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_mult_add mult_add (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid7),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready7),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata7),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid7),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready7),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata7),              // input wire [31 : 0] s_axis_b_tdata
  .s_axis_c_tvalid(s_axis_c_tvalid7),            // input wire s_axis_c_tvalid
  .s_axis_c_tready(s_axis_c_tready7),            // output wire s_axis_c_tready
  .s_axis_c_tdata(s_axis_c_tdata7),              // input wire [31 : 0] s_axis_c_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid7),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata7)    // output wire [31 : 0] m_axis_result_tdata
);

always @(posedge clk)
begin
    state <= state_next;
    start_addr <= start_addr_next;
    addr_rd_reg <= addr_rd_next;
    addr_wr_reg <= addr_wr_next;
    addr_weight_reg <= addr_weight_next;
    addr_bias_reg <= addr_bias_next;
    mean_reg <= mean_next;
    invstd_reg <= invstd_next;
end

always @*
begin
    state_next = state;
    start_addr_next = start_addr;
    addr_rd_next = addr_rd_reg;
    addr_wr_next = addr_wr_reg;
    addr_weight_next = addr_weight_reg;
    addr_bias_next = addr_bias_reg;
    mean_next = mean_reg;
    invstd_next = invstd_reg;
  
    s_axis_a_tdata0 = 32'd0;
    s_axis_a_tvalid0 = 1'b0;
    s_axis_b_tdata0 = 32'd0;
    s_axis_b_tvalid0 = 1'b0;
  
    s_axis_a_tdata1 = 32'd0;
    s_axis_a_tvalid1 = 1'b0;
  
    s_axis_a_tdata2 = 32'd0;
    s_axis_a_tvalid2 = 1'b0;
    s_axis_a_tlast2 = 1'b0;

    s_axis_a_tdata3 = 32'd0;
    s_axis_a_tvalid3 = 1'b0;
    s_axis_b_tdata3 = 32'd0;
    s_axis_b_tvalid3 = 1'b0;
  
    s_axis_a_tdata4 = 32'd0;
    s_axis_a_tvalid4 = 1'b0;
    s_axis_b_tdata4 = 32'd0;
    s_axis_b_tvalid4 = 1'b0;
  
    s_axis_a_tdata5 = 32'd0;
    s_axis_a_tvalid5 = 1'b0;
    s_axis_b_tdata5 = 32'd0;
    s_axis_b_tvalid5 = 1'b0;
  
    s_axis_a_tdata6 = 32'd0;
    s_axis_a_tvalid6 = 1'b0;
  
    s_axis_a_tdata7 = 32'd0;
    s_axis_a_tvalid7 = 1'b0;
    s_axis_b_tdata7 = 32'd0;
    s_axis_b_tvalid7 = 1'b0;
    s_axis_c_tdata7 = 32'd0;
    s_axis_c_tvalid7 = 1'b0;

    out = {DATA_WIDTH{1'b0}};
    we = 1'b0;
    done_tick = 1'b0;

    case (state)
        idle:
            begin
                if (start_tick)
                    begin
                        s_axis_a_tvalid1 = 1'b1;
                        s_axis_a_tdata1 = input_plane_size;   
                    end
                if (m_axis_result_tvalid1) // this should in fact be in a separate state
                    begin
                        addr_rd_next = start_addr; // 0
                        addr_wr_next = {ADDR_WIDTH{1'b0}};
                        addr_weight_next = {WB_ADDR_WIDTH{1'b0}};
                        addr_bias_next = {WB_ADDR_WIDTH{1'b0}};
                        state_next = mean;
                    end
            end
        mean:
            begin
                if (addr_rd_reg < start_addr + input_plane_size)
                    begin
                        // accumulate: sum
                        if (addr_rd_reg == start_addr + input_plane_size - 1)
                            s_axis_a_tlast2 = 1'b1;
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = in;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid2 && m_axis_result_tlast2) // somehow this signal remains HIGH even after aresetn
                    begin
                        // divide: mean = sum / input_plane_size (batch size = 1)
                        s_axis_a_tvalid3 = 1'b1;
                        s_axis_a_tdata3 = m_axis_result_tdata2;
                        s_axis_b_tvalid3 = 1'b1;
                        s_axis_b_tdata3 = m_axis_result_tdata1;
                    end
                if (m_axis_result_tvalid3)
                    begin
                        mean_next = m_axis_result_tdata3;
                        addr_rd_next = start_addr;
                        state_next = invstd;
                    end
            end
        invstd:
            begin
                if (addr_rd_reg < start_addr + input_plane_size)
                    begin
                        // minus: x - mean
                        s_axis_a_tvalid4 = 1'b1;
                        s_axis_a_tdata4 = in;
                        s_axis_b_tvalid4 = 1'b1;
                        s_axis_b_tdata4 = mean_reg;
                        addr_rd_next = addr_rd_reg + 1;
                    end

                if (m_axis_result_tvalid4)
                    begin
                        // multiply: (x - mean) * (x - mean)
                        s_axis_a_tvalid0 = 1'b1;
                        s_axis_a_tdata0 = m_axis_result_tdata4;
                        s_axis_b_tvalid0 = 1'b1;
                        s_axis_b_tdata0 = m_axis_result_tdata4;
                    end
                if (m_axis_result_tvalid0)
                    begin
                        // accumulate: sum2
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = m_axis_result_tdata0;
                        if (!s_axis_a_tvalid0) // latency dependent
                            s_axis_a_tlast2 = 1'b1;
                    end
                if (m_axis_result_tvalid2 && m_axis_result_tlast2)
                    begin
                        // divide: sum2 / input_plane_size
                        s_axis_a_tvalid3 = 1'b1;
                        s_axis_a_tdata3 = m_axis_result_tdata2;
                        s_axis_b_tvalid3 = 1'b1;
                        s_axis_b_tdata3 = m_axis_result_tdata1;
                    end
                if (m_axis_result_tvalid3)
                    begin
                        // plus eps: variance = sum2 / input_plane_size + eps
                        s_axis_a_tvalid5 = 1'b1;
                        s_axis_a_tdata5 = m_axis_result_tdata3;
                        s_axis_b_tvalid5 = 1'b1;
                        s_axis_b_tdata5 = eps;
                    end
                if (m_axis_result_tvalid5)
                    begin
                        // inverse sqrt: 1 / sqrt(variance)
                        s_axis_a_tvalid6 = 1'b1;
                        s_axis_a_tdata6 = m_axis_result_tdata5;
                    end
                if (m_axis_result_tvalid6)
                    begin
                        invstd_next = m_axis_result_tdata6;
                        addr_rd_next = start_addr;
                        state_next = run;
                    end
            end
        run:
            begin
                if (addr_rd_reg < start_addr + input_plane_size)
                    begin
                        // minus : (x - mean)
                        s_axis_a_tvalid4 = 1'b1;
                        s_axis_a_tdata4 = in;
                        s_axis_b_tvalid4 = 1'b1;
                        s_axis_b_tdata4 = mean_reg;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid4)
                    begin
                        // multiply: (x - mean) * invstd
                        s_axis_a_tvalid0 = 1'b1;
                        s_axis_a_tdata0 = m_axis_result_tdata4;
                        s_axis_b_tvalid0 = 1'b1;
                        s_axis_b_tdata0 = invstd_reg;
                    end
                if (m_axis_result_tvalid0)
                        begin
                            // multiply-add: (x - mean) * invstd * weight + bias
                            s_axis_a_tvalid7 = 1'b1;
                            s_axis_a_tdata7 = m_axis_result_tdata0;
                            s_axis_b_tvalid7 = 1'b1;
                            s_axis_b_tdata7 = weight;
                            s_axis_c_tvalid7 = 1'b1;
                            s_axis_c_tdata7 = bias;
                        end
                    if (m_axis_result_tvalid7)
                        begin
                            we = 1'b1;
                            out = m_axis_result_tdata7;
                            addr_wr_next = addr_wr_reg + 1;
                            if (!s_axis_a_tvalid7) // being a smartass here
                                begin
                                    if (start_addr + input_plane_size == input_total_size)
                                        state_next = done;
                                    else
                                        begin
                                            start_addr_next = start_addr + input_plane_size;
                                            addr_rd_next = start_addr_next;
                                            addr_weight_next = addr_weight_reg + 1;
                                            addr_bias_next = addr_bias_reg + 1;
                                            state_next = mean;
                                        end
                                end
                        end
            end
        done:
            begin
                done_tick = 1'b1;
                state_next = idle;
            end
    endcase
end

assign addr_rd = addr_rd_next;
assign addr_wr = addr_wr_reg;
assign addr_weight = addr_weight_next;
assign addr_bias = addr_bias_next;

endmodule
