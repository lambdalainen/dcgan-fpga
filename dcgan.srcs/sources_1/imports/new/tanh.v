`timescale 1ns / 1ps

module tanh
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 32
)
(
    input wire clk,
    input wire start_tick,
    input wire [DATA_WIDTH-1:0] in,
    input wire [ADDR_WIDTH-1:0] count,
    output reg [DATA_WIDTH-1:0] out,
    output wire [ADDR_WIDTH-1:0] addr_rd,
    output wire [ADDR_WIDTH-1:0] addr_wr,
    output reg we,
    output reg done_tick
);

localparam [2:0]
    idle = 3'b000,
    read = 3'b001,
    done = 3'b010;

reg [2:0] state = idle, state_next = idle;
reg [ADDR_WIDTH-1:0] addr_rd_reg = {ADDR_WIDTH{1'bz}}, addr_rd_next = {ADDR_WIDTH{1'bz}};
reg [ADDR_WIDTH-1:0] addr_wr_reg = {ADDR_WIDTH{1'bz}}, addr_wr_next = {ADDR_WIDTH{1'bz}};

// x * 2
reg s_axis_a_tvalid = 1'b0;
wire s_axis_a_tready;
reg [31:0] s_axis_a_tdata = 32'd0;

wire s_axis_b_tvalid = 1'b1;
wire s_axis_b_tready;
wire [31:0] s_axis_b_tdata = 32'h40000000; // 2

wire m_axis_result_tvalid;
wire [31:0] m_axis_result_tdata;

// e ^ (x * 2)
reg s_axis_a_tvalid2 = 1'b0;
wire s_axis_a_tready2;
reg [31:0] s_axis_a_tdata2 = 32'd0;

wire m_axis_result_tvalid2;
wire [31:0] m_axis_result_tdata2;

// e ^ (x * 2) - 1
reg s_axis_a_tvalid3 = 1'b0;
wire s_axis_a_tready3;
reg [31:0] s_axis_a_tdata3 = 32'd0;

wire s_axis_b_tvalid3 = 1'b1;
wire s_axis_b_tready3;
wire [31:0] s_axis_b_tdata3 = 32'h3f800000; // 1

wire m_axis_result_tvalid3;
wire [31:0] m_axis_result_tdata3;

// e ^ (x * 2) + 1
reg s_axis_a_tvalid4 = 1'b0;
wire s_axis_a_tready4;
reg [31:0] s_axis_a_tdata4 = 32'd0;

wire s_axis_b_tvalid4 = 1'b1;
wire s_axis_b_tready4;
wire [31:0] s_axis_b_tdata4 = 32'h3f800000; // 1

wire m_axis_result_tvalid4;
wire [31:0] m_axis_result_tdata4;

// (e ^ (x * 2) - 1)  / (e ^ (x * 2) + 1)
reg s_axis_a_tvalid5 = 1'b0;
wire s_axis_a_tready5;
reg [31:0] s_axis_a_tdata5 = 32'd0;

reg s_axis_b_tvalid5 = 1'b0;
wire s_axis_b_tready5;
reg [31:0] s_axis_b_tdata5 = 32'd0;

wire m_axis_result_tvalid5;
wire [31:0] m_axis_result_tdata5;

// x * 2
floating_point_mult multiply (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata)    // output wire [31 : 0] m_axis_result_tdata
);

// e ^ (x * 2)
floating_point_exp exp (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid2),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready2),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata2),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid2),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata2)    // output wire [31 : 0] m_axis_result_tdata
);

// e ^ (x * 2) - 1
floating_point_subtract minus_1 (
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

// e ^ (x * 2) + 1
floating_point_add plus_1 (
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

floating_point_divide divide (
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

always @(posedge clk)
begin
    state <= state_next;
    addr_rd_reg <= addr_rd_next;
    addr_wr_reg <= addr_wr_next;
end

always @*
begin
    state_next = state;
    addr_rd_next = addr_rd_reg;
    addr_wr_next = addr_wr_reg;

    s_axis_a_tdata = 32'd0;
    s_axis_a_tvalid = 1'b0;

    s_axis_a_tdata2 = 32'd0;
    s_axis_a_tvalid2 = 1'b0;

    s_axis_a_tdata3 = 32'd0;
    s_axis_a_tvalid3 = 1'b0;

    s_axis_a_tdata4 = 32'd0;
    s_axis_a_tvalid4 = 1'b0;

    s_axis_a_tdata5 = 32'd0;
    s_axis_a_tvalid5 = 1'b0;
    s_axis_b_tdata5 = 32'd0;
    s_axis_b_tvalid5 = 1'b0;

    out = {DATA_WIDTH{1'bz}};
    we = 1'bz;
    done_tick = 1'b0;

    case (state)
        idle: // 0
            begin
                if (start_tick)
                    begin
                        addr_rd_next = {ADDR_WIDTH{1'b0}};
                        addr_wr_next = {ADDR_WIDTH{1'b0}};
                        state_next = read;
                    end
            end
        read:
            begin
                if (addr_rd_reg < count)
                    begin
                        s_axis_a_tvalid = 1'b1;
                        s_axis_a_tdata = in;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid)
                    begin
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = m_axis_result_tdata;
                    end
                if (m_axis_result_tvalid2)
                    begin
                        s_axis_a_tdata3 = m_axis_result_tdata2;
                        s_axis_a_tvalid3 = 1'b1;
                        s_axis_a_tdata4 = m_axis_result_tdata2;
                        s_axis_a_tvalid4 = 1'b1;
                    end
                if (m_axis_result_tvalid3 && m_axis_result_tvalid4)
                    begin
                        s_axis_a_tdata5 = m_axis_result_tdata3;
                        s_axis_a_tvalid5 = 1'b1;
                        s_axis_b_tdata5 = m_axis_result_tdata4;
                        s_axis_b_tvalid5 = 1'b1;
                    end
                if (m_axis_result_tvalid5)
                    begin
                        we = 1'b1;
                        out = m_axis_result_tdata5;
                        addr_wr_next = addr_wr_reg + 1;
                        if (!(m_axis_result_tvalid3 && m_axis_result_tvalid4)) // being a smartass here
                            state_next = done;
                    end
            end
        done:
            begin
                done_tick = 1'b1;
                state_next = idle;
                // set some outputs to high-impedance
                addr_rd_next = {ADDR_WIDTH{1'bz}};
                addr_wr_next = {ADDR_WIDTH{1'bz}};
            end
    endcase
end

assign addr_rd = addr_rd_next;
assign addr_wr = addr_wr_reg;

endmodule
