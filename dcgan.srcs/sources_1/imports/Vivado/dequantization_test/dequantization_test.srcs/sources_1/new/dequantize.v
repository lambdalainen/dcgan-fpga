`timescale 1ns / 1ps

module dequantize
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              DATA_WIDTH = 32
)
(
    input wire clk,
    input wire start_tick,
    input wire [DATA_WIDTH-1:0] sa_f,
    input wire [DATA_WIDTH-1:0] sb_f,
    input wire [DATA_WIDTH-1:0] val_i32,
    input wire [ADDR_WIDTH-1:0] count,
    output reg [DATA_WIDTH-1:0] val_f,
    output wire [ADDR_WIDTH-1:0] addr_rd,
    output wire [ADDR_WIDTH-1:0] addr_wr,
    output reg we,
    output reg done_tick
);

localparam [2:0]
    idle = 3'b000,
    sasb = 3'b001,
    read = 3'b010,
    done = 3'b011;

reg [2:0] state = idle, state_next = idle;
reg [DATA_WIDTH-1:0] sasb_reg = {DATA_WIDTH{1'b0}}, sasb_next = {DATA_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_rd_reg = {ADDR_WIDTH{1'b0}}, addr_rd_next = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_wr_reg = {ADDR_WIDTH{1'b0}}, addr_wr_next = {ADDR_WIDTH{1'b0}};

// Multiply
// Note: the IP is configured in blocking mode, it will wait for all channels to be valid
reg s_axis_a_tvalid = 1'b0;
wire s_axis_a_tready;
reg [31:0] s_axis_a_tdata = 32'd0;

reg s_axis_b_tvalid = 1'b0;
wire s_axis_b_tready;
reg [31:0] s_axis_b_tdata = 32'd0;

wire m_axis_result_tvalid;
wire [31:0] m_axis_result_tdata;

// int32 to float
reg s_axis_a_tvalid2 = 1'b0;
wire s_axis_a_tready2;
reg [31:0] s_axis_a_tdata2 = 32'd0;

wire m_axis_result_tvalid2;
wire [31:0] m_axis_result_tdata2;

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

floating_point_fixed_to_float int32_to_float (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid2),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready2),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata2),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid2),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata2)    // output wire [31 : 0] m_axis_result_tdata
);

always @(posedge clk)
begin
    state <= state_next;
    sasb_reg <= sasb_next;
    addr_rd_reg <= addr_rd_next;
    addr_wr_reg <= addr_wr_next;
end

always @*
begin
    state_next = state;
    sasb_next = sasb_reg;
    addr_rd_next = addr_rd_reg;
    addr_wr_next = addr_wr_reg;
    
    s_axis_a_tdata = 32'd0;
    s_axis_a_tvalid = 1'b0;
    s_axis_b_tdata = 32'd0;
    s_axis_b_tvalid = 1'b0;

    s_axis_a_tdata2 = 32'd0;
    s_axis_a_tvalid2 = 1'b0;

    val_f = {DATA_WIDTH{1'b0}};
    we = 1'b0;
    done_tick = 1'b0;

    case (state)
        idle: // 0
            begin
                if (start_tick)
                    begin
                        s_axis_a_tvalid = 1'b1;
                        s_axis_a_tdata = sa_f;
                        s_axis_b_tvalid = 1'b1;
                        s_axis_b_tdata = sb_f;
                        state_next = sasb;
                    end
            end
        sasb:
            begin
                sasb_next = m_axis_result_tdata;
                addr_rd_next = {ADDR_WIDTH{1'b0}};
                addr_wr_next = {ADDR_WIDTH{1'b0}};
                state_next = read;
            end
        read:
            begin
                if (addr_rd_reg < count)
                    begin
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = val_i32;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid2)
                    begin
                        s_axis_a_tvalid = 1'b1;
                        s_axis_a_tdata = sasb_reg;
                        s_axis_b_tvalid = 1'b1;
                        s_axis_b_tdata = m_axis_result_tdata2;
                    end
                if (m_axis_result_tvalid)
                    begin
                        we = 1'b1;
                        val_f = m_axis_result_tdata;
                        addr_wr_next = addr_wr_reg + 1;
                        if (!m_axis_result_tvalid2) // being a smartass here
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
