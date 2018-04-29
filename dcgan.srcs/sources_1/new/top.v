`timescale 1ns / 1ps

module top
(
    input wire clk,
    output wire QspiMOSI,
    input wire QspiMISO,
    output wire QspiCSn,
    input wire btnC,
    output wire [7:0] an,
    output wire dp,
    output wire [6:0] seg
);

wire btn_tick;

// Wishbone inputs
reg i_wb_cyc, i_wb_data_stb;
// Wishbone outputs
wire o_wb_ack;
wire o_wb_stall;
wire [31:0] o_wb_data;
// Quad SPI control wires
wire o_qspi_sck;
wire [1:0] o_qspi_mod;
wire [3:0] o_qspi_dat;
wire [3:0] i_qspi_dat;
// Interrupt
wire o_interrupt;

wbqspiflash wbqspiflash_unit(.i_clk(clk),
		// Internal wishbone connections
		.i_wb_cyc(i_wb_cyc), // Wishbone bus cycle wire, asserted for the duration of all bus cycles
		.i_wb_data_stb(i_wb_data_stb), // Wishbone strobe, when the access is to the data memory
		.i_wb_ctrl_stb(1'b0), // Wishbone strobe, for when the access is to one of control registers
		.i_wb_we(1'b0), // Wishbone write enable, indicating a write interaction to the bus
		.i_wb_addr(20'd0), // Wishbone address. When accessing control registers, only the bottom two bits are relevant
		.i_wb_data(32'd0), // Wishbone bus data register
		// Wishbone return values
		.o_wb_ack(o_wb_ack), // Acknowledging a wishbone write, or signifying valid data of a wishbone read
		.o_wb_stall(o_wb_stall), // Indicates the device is not yet ready for another wishbone access
		.o_wb_data(o_wb_data), // Wishbone data bus, returning data values read from the interface
		// Quad Spi connections to the external device
		.o_qspi_sck(o_qspi_sck),
		.o_qspi_cs_n(QspiCSn),
		.o_qspi_mod(o_qspi_mod),
		.o_qspi_dat({o_qspi_dat[3:1], QspiMOSI}),
		.i_qspi_dat({i_qspi_dat[3:2], QspiMISO, i_qspi_dat[0]}),
		.o_interrupt(o_interrupt));

disp_hex_mux disp_unit (
    .clk(clk), .reset(1'b0),
    .hex7(o_wb_data[31:28]), .hex6(o_wb_data[27:24]), .hex5(o_wb_data[23:20]), .hex4(o_wb_data[19:16]),
    .hex3(o_wb_data[15:12]), .hex2(o_wb_data[11:8]), .hex1(o_wb_data[7:4]), .hex0(o_wb_data[3:0]),
    .dp_in(8'hFF), .an(an), .dp(dp), .seg(seg));

debounce debounce_unit0 (
    .clk(clk), .reset(1'b0), .sw(btnC), .db_level(), .db_tick(btn_tick));

// STARTUPE2: STARTUP Block 7 Series
// UG953 Xilinx HDL Libraries Guide, version 2017.4
// Also, see UG470 for more detailed descriptions
// Also, see page 6 of http://ohm.bu.edu/~dean/Xilinx/KCPSM6_Release7_30Sept13/Reference_Designs/SPI/KC705_KCPSM6_SPI_Flash_reference_design.pdf
STARTUPE2 #(
.PROG_USR("FALSE"), // Activate program event security feature. Requires encrypted bitstreams.
.SIM_CCLK_FREQ(0.0) // Set the Configuration Clock Frequency(ns) for simulation.
)
STARTUPE2_inst (
.CFGCLK(), // 1-bit output: Configuration main clock output
.CFGMCLK(), // 1-bit output: Configuration internal oscillator clock output
.EOS(), // 1-bit output: Active high output signal indicating the End Of Startup.
.PREQ(), // 1-bit output: PROGRAM request to fabric output
.CLK(1'b0), // 1-bit input: User start-up clock input
.GSR(1'b0), // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name) (should be 0)
.GTS(1'b0), // 1-bit input: Global 3-state input (GTS cannot be used for the port name) (should be 0)
.KEYCLEARB(1'b0), // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
.PACK(1'b0), // 1-bit input: PROGRAM acknowledge input
.USRCCLKO(o_qspi_sck), // 1-bit input: User CCLK input
.USRCCLKTS(1'b0), // 1-bit input: User CCLK 3-state enable input (should be 0)
.USRDONEO(1'b1), // 1-bit input: User DONE pin output control
.USRDONETS(1'b1) // 1-bit input: User DONE 3-state enable output
);
// End of STARTUPE2_inst instantiation

always @(posedge clk)
begin
    if (btn_tick)
        begin
            i_wb_cyc <= 1'b1;
            i_wb_data_stb <= 1'b1;
        end
    else if (o_wb_ack)
        begin
            i_wb_cyc <= 1'b0;
            i_wb_data_stb <= 1'b0;
        end
end

endmodule
