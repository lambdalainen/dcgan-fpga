`timescale 1ps / 1ps

module top_tb();

localparam T = 10000; // 100MHz = 10ns period

reg clk;

// Wishbone, inputs first
reg i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb, i_wb_we;
reg [19:0] i_wb_addr;
reg [31:0] i_wb_data;
// then outputs
wire o_wb_ack;
wire o_wb_stall;
wire [31:0] o_wb_data;
// Quad SPI control wires
wire o_qspi_sck, o_qspi_cs_n;
wire [1:0] o_qspi_mod;
wire [3:0] o_qspi_dat;
wire [3:0] i_qspi_dat;
// Interrupt line
wire o_interrupt;

wbqspiflash wbqspiflash_unit(.i_clk(clk),
		// Internal wishbone connections
		.i_wb_cyc(i_wb_cyc), // Wishbone bus cycle wire, asserted for the duration of all bus cycles
		.i_wb_data_stb(i_wb_data_stb), // Wishbone strobe, when the access is to the data memory
		.i_wb_ctrl_stb(i_wb_ctrl_stb), // Wishbone strobe, for when the access is to one of control registers
		.i_wb_we(i_wb_we), // Wishbone write enable, indicating a write interaction to the bus
		.i_wb_addr(i_wb_addr), // Wishbone address. When accessing control registers, only the bottom two bits are relevant
		.i_wb_data(i_wb_data), // Wishbone bus data register
		// Wishbone return values
		.o_wb_ack(o_wb_ack), // Acknowledging a wishbone write, or signifying valid data of a wishbone read
		.o_wb_stall(o_wb_stall), // Indicates the device is not yet ready for another wishbone access
		.o_wb_data(o_wb_data), // Wishbone data bus, returning data values read from the interface
		// Quad Spi connections to the external device
		.o_qspi_sck(o_qspi_sck), .o_qspi_cs_n(o_qspi_cs_n), .o_qspi_mod(o_qspi_mod), .o_qspi_dat(o_qspi_dat), .i_qspi_dat(i_qspi_dat),
		.o_interrupt(o_interrupt));

// RESET# has an internal pull-up resistor and may be left unconnected in the host system if not used,
// same for WP# and HOLD#
s25fl128s spi_flash (.SI(o_qspi_dat[0]), .SO(i_qspi_dat[1]), .SCK(o_qspi_sck), .CSNeg(o_qspi_cs_n), .RSTNeg(), .WPNeg(), .HOLDNeg());

always
begin
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
end

initial
begin
    #(T * 30000); // 300us for s25fl128s to power up
    
    // A transfer cycle is initiated by asserting i_wb_cyc
    i_wb_cyc = 1'b1;
    // i_wb_data_stb is asserted to indicate the start of the cycle
    i_wb_data_stb = 1'b1;
    i_wb_ctrl_stb = 1'b0;
    i_wb_we = 1'b0;
    i_wb_addr = 20'd0;
    i_wb_data = 32'd0;
    
    // i_wb_cyc is asserted until o_wb_ack is HIGH
    wait(o_wb_ack);
    @(posedge clk);
    // Negate i_wb_cyc and i_wb_data_stb to indicate the end of the cycle
    i_wb_cyc = 1'b0;
    i_wb_data_stb = 1'b0;
end

endmodule
