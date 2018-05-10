`timescale 1ns / 1ps

module dq_bn_relu_q
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 32
)
(
    input wire clk,
    input wire start_tick,
    input wire [DATA_WIDTH-1:0] sa_f,
    input wire [DATA_WIDTH-1:0] sb_f,
    input wire [DATA_WIDTH-1:0] in,
    input wire [ADDR_WIDTH-1:0] input_total_size,
    input wire [ADDR_WIDTH-1:0] input_plane_size,
    output wire [DATA_WIDTH-1:0] out32,
    output wire [7:0] out8,
    output wire [ADDR_WIDTH-1:0] addr_output_rd,
    output wire [ADDR_WIDTH-1:0] addr_output_wr,
    output wire [ADDR_WIDTH-1:0] addr_input_wr,
    output wire we_output,
    output wire we_input,
    output wire done_tick
);

localparam [1:0]
    dq   = 2'b00,
    bn   = 2'b01,
    relu = 2'b10,
    q    = 2'b11;

reg [1:0] state = dq;

reg start_tick_dq = 1'b0, start_tick_bn = 1'b0, start_tick_relu = 1'b0, start_tick_q = 1'b0;

wire we_dq, we_bn, we_relu, we_q;
wire [15:0] addr_wr_dq, addr_wr_bn, addr_wr_relu;
wire [15:0] addr_rd_dq, addr_rd_bn, addr_rd_relu, addr_rd_q;
wire [31:0] out_dq, out_bn, out_relu;
wire [31:0] in_dq, in_bn, in_relu, in_q;

wire done_tick_dq, done_tick_bn, done_tick_relu;

wire [31:0] weight, bias;
wire [9:0] addr_weight, addr_bias;

// bn weight size = 512 + 256 + 128 + 64 = 960
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32), .DATA_FILE("bn_weight_float.mem")) bram_bn_weight
    (.clk(clk), .we(1'b0), .addr_a(addr_weight), .addr_b(2'd0), .din_a(32'd0), .dout_a(weight), .dout_b());
// bn bias size = 512 + 256 + 128 + 64 = 960
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32), .DATA_FILE("bn_bias_float.mem")) bram_bias
    (.clk(clk), .we(1'b0), .addr_a(addr_bias), .addr_b(2'd0), .din_a(32'd0), .dout_a(bias), .dout_b());

dequantize dequantize_unit
    (.clk(clk), .start_tick(start_tick_dq), .sa_f(sa_f), .sb_f(sb_f),
     .in(in), .input_total_size(input_total_size), .out(out_dq), .addr_rd(addr_rd_dq), .addr_wr(addr_wr_dq), .we(we_dq),
     .done_tick(done_tick_dq));

batchnorm batchnorm_unit
    (.clk(clk), .start_tick(start_tick_bn), .in(in), .weight(weight), .bias(bias),
     .input_total_size(input_total_size), .input_plane_size(input_plane_size),
     .out(out_bn), .addr_rd(addr_rd_bn), .addr_wr(addr_wr_bn), .addr_weight(addr_weight), .addr_bias(addr_bias),
     .we(we_bn), .done_tick(done_tick_bn));

relu relu_unit
    (.clk(clk), .start_tick(start_tick_relu), .in(in), .input_total_size(input_total_size),
     .out(out_relu), .addr_rd(addr_rd_relu), .addr_wr(addr_wr_relu), .we(we_relu),
     .done_tick(done_tick_relu));

quantize quantize_unit
    (.clk(clk), .start_tick(start_tick_q), .in(in), .input_total_size(input_total_size),
     .out(out8), .addr_rd(addr_rd_q), .addr_wr(addr_input_wr), .we(we_input), .s(), .done_tick(done_tick));

always @(posedge clk)
begin
    start_tick_dq <= 1'b0;
    start_tick_bn <= 1'b0;
    start_tick_relu <= 1'b0;
    start_tick_q <= 1'b0;

    if (start_tick)
        start_tick_dq <= 1'b1;

    if (done_tick_dq)
        begin
            state <= bn;
            start_tick_bn <= 1'b1;
        end

    if (done_tick_bn)
        begin
            state <= relu;
            start_tick_relu <= 1'b1;
        end

    if (done_tick_relu)
        begin
            state <= q;
            start_tick_q <= 1'b1;
        end
end

assign we_output =
    state == dq ? we_dq :
    state == bn ? we_bn :
    state == relu ? we_relu : 1'b0;
assign addr_output_wr =
    state == dq ? addr_wr_dq :
    state == bn ? addr_wr_bn :
    state == relu ? addr_wr_relu : 16'd0;
assign addr_output_rd =
    state == dq ? addr_rd_dq :
    state == bn ? addr_rd_bn :
    state == relu ? addr_rd_relu :
    state == q ? addr_rd_q : 16'd0;
assign out32 =
    state == dq ? out_dq :
    state == bn ? out_bn :
    state == relu ? out_relu : 32'd0;
/* unecessary
assign in_dq = state == dq ? in : 32'd0;
assign in_bn = state == bn ? in : 32'd0;
*/

endmodule
