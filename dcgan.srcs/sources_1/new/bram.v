`timescale 1ns / 1ps

module bram
#(
    parameter ADDR_WIDTH = 12,
              DATA_WIDTH = 8,
              DATA_FILE = "missing"
)
(
    input wire clk,
    input wire we,
    input wire [ADDR_WIDTH-1:0] addr_a, addr_b,
    input wire [DATA_WIDTH-1:0] din_a,
    output wire [DATA_WIDTH-1:0] dout_a, dout_b
);

// signal declaration
reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
reg [ADDR_WIDTH-1:0] addr_a_reg, addr_b_reg;

integer i;
initial
begin
    if (DATA_FILE == "missing")
        begin
            $display("### no DATA_FILE specified, set BRAM to 0");
            for (i = 0; i < 2**ADDR_WIDTH; i = i+1)
                ram[i] = 0;
        end
    else
        $readmemh(DATA_FILE, ram);
end

// body
always @(posedge clk)
begin
    if (we)  // write operation
        ram[addr_a] <= din_a;
    addr_a_reg <= addr_a;
    addr_b_reg <= addr_b;
end
// read operation
assign dout_a = ram[addr_a_reg];
assign dout_b = ram[addr_b_reg];
endmodule