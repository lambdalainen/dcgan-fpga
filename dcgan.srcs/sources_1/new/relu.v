`timescale 1ns / 1ps

module relu
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 32
)
(
    input wire clk,
    input wire start_tick,
    input wire [DATA_WIDTH-1:0] in,
    input wire [ADDR_WIDTH-1:0] input_total_size,
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
reg [DATA_WIDTH-1:0] saved = {DATA_WIDTH{1'b0}}, saved_next = {DATA_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_rd_reg = {ADDR_WIDTH{1'b0}}, addr_rd_next = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_wr_reg = {ADDR_WIDTH{1'b0}}, addr_wr_next = {ADDR_WIDTH{1'b0}};

// Greater than 0
reg s_axis_a_tvalid = 1'b0;
wire s_axis_a_tready;
reg [31:0] s_axis_a_tdata = 32'd0;

reg s_axis_b_tvalid = 1'b0;
wire s_axis_b_tready;
reg [31:0] s_axis_b_tdata = 32'd0;

wire m_axis_result_tvalid;
wire [7:0] m_axis_result_tdata;

floating_point_greater_than greater_than (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata)    // output wire [7 : 0] m_axis_result_tdata
);

always @(posedge clk)
begin
    state <= state_next;
    saved <= saved_next;
    addr_rd_reg <= addr_rd_next;
    addr_wr_reg <= addr_wr_next;
end

always @*
begin
    state_next = state;
    saved_next = saved;
    addr_rd_next = addr_rd_reg;
    addr_wr_next = addr_wr_reg;
    
    s_axis_a_tdata = 32'd0;
    s_axis_a_tvalid = 1'b0;
    s_axis_b_tdata = 32'd0;
    s_axis_b_tvalid = 1'b0;

    out = {DATA_WIDTH{1'b0}};
    we = 1'b0;
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
                if (addr_rd_reg < input_total_size)
                    begin
                        s_axis_a_tvalid = 1'b1;
                        s_axis_a_tdata = in;
                        s_axis_b_tvalid = 1'b1;
                        s_axis_b_tdata = 32'h00000000;
                        saved_next = in;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid)
                    begin
                        we = 1'b1;
                        out = m_axis_result_tdata ? saved : 32'h00000000;
                        addr_wr_next = addr_wr_reg + 1;
                        if (!s_axis_a_tvalid)
                            state_next = done;
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

endmodule
