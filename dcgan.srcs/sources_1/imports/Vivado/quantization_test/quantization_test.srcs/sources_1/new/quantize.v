`timescale 1ns / 1ps

// Since this is just for ReLU output, min is 0.0f, hence zero offset
module quantize
#(
    parameter ADDR_WIDTH = 16, // 2^16 = 65536
              FLOAT_DATA_WIDTH = 32,
              INT_DATA_WIDTH = 8
)
(
    input wire clk,
    input wire start_tick,
    input wire [FLOAT_DATA_WIDTH-1:0] val_f,
    input wire [ADDR_WIDTH-1:0] count,
    output reg [INT_DATA_WIDTH-1:0] val_i,
    output wire [ADDR_WIDTH-1:0] addr_rd,
    output wire [ADDR_WIDTH-1:0] addr_wr,
    output reg we,
    output wire [FLOAT_DATA_WIDTH-1:0] s,
    output reg done_tick
);

localparam [2:0]
    idle  = 3'b000,
    max   = 3'b001,
    scale = 3'b010,
    run   = 3'b011,
    done  = 3'b100;

reg [2:0] state = idle, state_next = idle;
reg [ADDR_WIDTH-1:0] addr_rd_reg = {ADDR_WIDTH{1'b0}}, addr_rd_next = {ADDR_WIDTH{1'b0}};
reg [ADDR_WIDTH-1:0] addr_wr_reg = {ADDR_WIDTH{1'b0}}, addr_wr_next = {ADDR_WIDTH{1'b0}};
reg [FLOAT_DATA_WIDTH-1:0] saved =  {FLOAT_DATA_WIDTH{1'b0}}, saved_next = {FLOAT_DATA_WIDTH{1'b0}};
reg [FLOAT_DATA_WIDTH-1:0] max_reg =  {FLOAT_DATA_WIDTH{1'b0}}, max_next = {FLOAT_DATA_WIDTH{1'b0}};
reg [FLOAT_DATA_WIDTH-1:0] scale_reg =  {FLOAT_DATA_WIDTH{1'b0}}, scale_next = {FLOAT_DATA_WIDTH{1'b0}};

// compare: greater than
// Note: the IP is configured in blocking mode, it will wait for all channels to be valid
reg s_axis_a_tvalid = 1'b0;
wire s_axis_a_tready;
reg [31:0] s_axis_a_tdata = 32'd0;

reg s_axis_b_tvalid = 1'b0;
wire s_axis_b_tready;
reg [31:0] s_axis_b_tdata = 32'd0;

wire m_axis_result_tvalid;
wire [7:0] m_axis_result_tdata;

// divide
reg s_axis_a_tvalid2 = 1'b0;
wire s_axis_a_tready2;
reg [31:0] s_axis_a_tdata2 = 32'd0;

reg s_axis_b_tvalid2 = 1'b0;
wire s_axis_b_tready2;
reg [31:0] s_axis_b_tdata2 = 32'd0; 

wire m_axis_result_tvalid2;
wire [31:0] m_axis_result_tdata2;

// float-to-fixed
reg s_axis_a_tvalid3 = 1'b0;
wire s_axis_a_tready3;
reg [31:0] s_axis_a_tdata3 = 32'd0;

wire m_axis_result_tvalid3;
wire [15:0] m_axis_result_tdata3;

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

floating_point_divide divide (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid2),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready2),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata2),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid2),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready2),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata2),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid2),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata2)    // output wire [31 : 0] m_axis_result_tdata
);

floating_point_float_to_fixed float_to_fixed (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid3),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready3),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata3),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid3),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata3)    // output wire [7 : 0] m_axis_result_tdata
);

always @(posedge clk)
begin
    state <= state_next;
    addr_rd_reg <= addr_rd_next;
    addr_wr_reg <= addr_wr_next;
    saved <= saved_next;
    max_reg <= max_next;
    scale_reg <= scale_next;
end

always @*
begin
    state_next = state;
    addr_rd_next = addr_rd_reg;
    addr_wr_next = addr_wr_reg;
    saved_next = saved;
    max_next = max_reg;
    scale_next = scale_reg;
    
    s_axis_a_tvalid = 1'b0;
    s_axis_a_tdata = 32'd0;
    s_axis_b_tvalid = 1'b0;
    s_axis_b_tdata = 32'd0;

    s_axis_a_tvalid2 = 1'b0;
    s_axis_a_tdata2 = 32'd0;
    s_axis_b_tvalid2 = 32'd0;
    s_axis_b_tdata2 = 1'b0;
    
    s_axis_a_tvalid3 = 1'b0;
    s_axis_a_tdata3 = 32'd0;

    val_i = {INT_DATA_WIDTH{1'b0}};
    we = 1'b0;
    done_tick = 1'b0;

    case (state)
        idle: // 0
            begin
                if (start_tick)
                    begin
                        addr_rd_next = {ADDR_WIDTH{1'b0}};
                        max_next = {FLOAT_DATA_WIDTH{1'b0}};
                        state_next = max;
                    end
            end
        max:
            begin
                if (addr_rd_reg < count)
                    begin
                        s_axis_a_tvalid = 1'b1;
                        s_axis_a_tdata = val_f;
                        s_axis_b_tvalid = 1'b1;
                        s_axis_b_tdata = max_reg;
                        saved_next = val_f;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                 else if (!m_axis_result_tvalid) // comparison ended
                    begin
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = max_reg;
                        s_axis_b_tvalid2 = 1'b1;
                        s_axis_b_tdata2 = 32'h437f0000;
                        state_next = scale;
                    end
                 
                 if (m_axis_result_tvalid)
                    begin
                        if (m_axis_result_tdata)
                            max_next = saved;
                    end
            end
        scale:
            begin
                scale_next = m_axis_result_tdata2;
                addr_rd_next = {ADDR_WIDTH{1'b0}};
                addr_wr_next = {ADDR_WIDTH{1'b0}};
                state_next = run;
            end
        run:
            begin
                if (addr_rd_reg < count)
                    begin
                        s_axis_a_tvalid2 = 1'b1;
                        s_axis_a_tdata2 = val_f;
                        s_axis_b_tvalid2 = 1'b1;
                        s_axis_b_tdata2 = scale_reg;
                        addr_rd_next = addr_rd_reg + 1;
                    end
                if (m_axis_result_tvalid2)
                    begin
                        s_axis_a_tvalid3 = 1'b1;
                        s_axis_a_tdata3 = m_axis_result_tdata2;
                    end
                if (m_axis_result_tvalid3)
                    begin
                        we = 1'b1;
                        val_i = m_axis_result_tdata3[INT_DATA_WIDTH-1:0];
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
assign s = scale_reg;

endmodule
