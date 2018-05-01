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
    output reg [ACC_WIDTH-1:0] val,
    output reg we,
    output reg done_tick
);

localparam [1:0]
    idle = 2'b00,
    sum  = 2'b01,
    done = 2'b10;

reg [1:0] state = idle, state_next = idle;
reg [ADDR_WIDTH-1:0] a_rd_addr_reg = 0, a_rd_addr_next = 0;
reg [ADDR_WIDTH-1:0] addr_cvw_reg = 0, addr_cvw_next = 0;
reg [MKN_WIDTH-1:0] i = 0, i_next = 0;
reg [MKN_WIDTH-1:0] j = 0, j_next = 0;
reg [ACC_WIDTH-1:0] acc = 0, acc_next = 0;

always @(posedge clk)
begin
    state <= state_next;
    a_rd_addr_reg <= a_rd_addr_next;
    addr_cvw_reg <= addr_cvw_next;
    i <= i_next;
    j <= j_next;
    acc <= acc_next;
end

always @*
begin
    state_next = state;
    a_rd_addr_next = a_rd_addr_reg;
    addr_cvw_next = addr_cvw_reg;
    i_next = i;
    j_next = j;
    acc_next = acc;

    val = 0;
    we = 1'b0;
    done_tick = 1'b0;

    case (state)
        idle:
            begin
                if (start_tick)
                    begin
                        state_next = sum;
                        a_rd_addr_next = 0;
                        addr_cvw_next = 0;
                        i_next = 0;
                        j_next = 0;
                        acc_next = 0;
                    end
            end
        sum:
            begin
                if (j == 0)
                    begin
                        j_next = j + 1;
                        acc_next = a;
                    end
                else if (j == k - 1)
                    begin
                        if (i == m - 1)
                            state_next = done;
                        else
                            begin
                                i_next = i + 1;
                                j_next = 0;
                            end
                        acc_next = acc + a;
                        addr_cvw_next = addr_cvw_reg + 1;
                        val = - rhs_offset * acc_next;
                        we = 1'b1;
                    end
                else
                    begin
                        j_next = j + 1;
                        acc_next = acc + a;
                    end

                a_rd_addr_next = j_next * m + i_next;
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

endmodule
