`timescale 1ns / 1ps

module top
(
    input wire clk,
    output wire QspiMOSI,
    input wire QspiMISO,
    output wire QspiCSn,
    input wire btnC, btnU,
    output reg [0:0] led,
    output wire [7:0] an,
    output wire dp,
    output wire [6:0] seg
);

localparam [2:0]
    idle      = 3'b000,
    col_vec   = 3'b001,
    wait_spi  = 3'b010,
    load_spi  = 3'b011,
    transconv = 3'b100;

wire btn_c_tick, btn_u_tick;
reg read_spi_tick = 1'b0;

reg [2:0] state = idle;
reg [1:0] load_byte = 2'b00;
reg [17:0] weight_bytes_loaded = 18'd0;
reg [9:0] output_plane_start = 10'd0;

// Wishbone inputs
reg i_wb_cyc, i_wb_data_stb;
reg [19:0] i_wb_addr = 20'd0;
// Wishbone outputs
wire o_wb_ack;
wire o_wb_stall;
wire [31:0] o_wb_data;
// Quad SPI control
wire o_qspi_sck;
wire [1:0] o_qspi_mod;
wire [3:0] o_qspi_dat;
wire [3:0] i_qspi_dat;
// interrupt
wire o_interrupt;

// row_vec & col_vec
wire [12:0] addr_rv0;
wire [9:0] addr_cv0, addr_cv1;
wire we_cv;
wire [31:0] rv0, cvw, cv1;
wire [7:0] a0, b0;
reg cv_start_tick = 1'b0;
wire cv_done_tick;

// transconv
reg we_a = 1'b0, we_b = 1'b0;
wire we_c; // we can't write 'wire we_c = 1'b0;' or 'we_c' will be tied to GND
reg [15:0] addr_b0 = 16'hffff, addr_c1 = 16'd0;
wire [15:0] addr_a0, addr_a1, addr_b1, addr_c0;
reg [7:0] aw = 8'd0, bw = 8'd0;
wire [7:0] a1, b1;
wire [31:0] cw, c0, c1;
reg tc_start_tick = 1'b0;
wire tc_done_tick;

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8), .DATA_FILE("input_1_uint8.data")) bram_lhs
    (.clk(clk), .we(we_a), .addr_a(addr_a0), .addr_b(addr_a1), .din_a(aw), .dout_a(a0), .dout_b(a1));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8)) bram_b
    (.clk(clk), .we(we_b), .addr_a(addr_b0), .addr_b(addr_b1), .din_a(bw), .dout_a(b0), .dout_b(b1));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(32)) bram_c
    (.clk(clk), .we(we_c), .addr_a(addr_c0), .addr_b(addr_c1), .din_a(cw), .dout_a(c0), .dout_b(c1));

// row_vec max size (max n) = 8192, precomputed
bram #(.ADDR_WIDTH(13), .DATA_WIDTH(32), .DATA_FILE("row_vec.mem")) bram_row_vec
    (.clk(clk), .we(1'b0), .addr_a(addr_rv0), .addr_b(13'd0), .din_a(32'd0), .dout_a(rv0), .dout_b());

// col_vec max size (max m) = 1024
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32)) bram_col_vec
    (.clk(clk), .we(we_cv), .addr_a(addr_cv0), .addr_b(addr_cv1), .din_a(cvw), .dout_a(), .dout_b(cv1));

col_vec col_vec_unit
    (.clk(clk), .start_tick(cv_start_tick), .m(14'd9), .k(14'd2), .rhs_offset(8'd2),
     .a(a0), .a_rd_addr(addr_a0), .addr_cvw(addr_cv0), .val(cvw), .we(we_cv), .done_tick(cv_done_tick));

transconv tc_unit
    (.clk(clk), .reset(1'b0), .start_tick(tc_start_tick), .m(14'd9), .k(14'd2), .n(14'd8),
     .n_output_plane(10'd2), .output_plane_start(output_plane_start), .output_plane_batch_size(10'd1),
     .output_h(7'd4), .output_w(7'd4), .input_h(7'd3), .input_w(7'd3),
     .kernel_h(3'd2), .kernel_w(3'd2), .pad_h(3'd1), .pad_w(3'd1),
     .stride_h(3'd2), .stride_w(3'd2), .dilation_h(3'd1), .dilation_w(3'd1),
     .a(a1), .b(b1), .c(c0), .rv(rv0), .cv(cv1), .term4(32'd4),
     .a_rd_addr(addr_a1), .b_rd_addr(addr_b1), .c_rw_addr(addr_c0), .addr_rv(addr_rv0), .addr_cv(addr_cv1),
     .c_out(cw), .c_wr_en(we_c), .done_tick(tc_done_tick));

wbqspiflash wbqspiflash_unit(.i_clk(clk),
		// Internal wishbone connections
		.i_wb_cyc(i_wb_cyc), // Wishbone bus cycle wire, asserted for the duration of all bus cycles
		.i_wb_data_stb(i_wb_data_stb), // Wishbone strobe, when the access is to the data memory
		.i_wb_ctrl_stb(1'b0), // Wishbone strobe, for when the access is to one of control registers
		.i_wb_we(1'b0), // Wishbone write enable, indicating a write interaction to the bus
		.i_wb_addr(i_wb_addr), // Wishbone address. When accessing control registers, only the bottom two bits are relevant
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
    .hex7(c1[31:28]), .hex6(c1[27:24]), .hex5(c1[23:20]), .hex4(c1[19:16]),
    .hex3(c1[15:12]), .hex2(c1[11:8]), .hex1(c1[7:4]), .hex0(c1[3:0]),
    .dp_in(8'hFF), .an(an), .dp(dp), .seg(seg));

debounce debounce_unit0 (
    .clk(clk), .reset(1'b0), .sw(btnC), .db_level(), .db_tick(btn_c_tick));

debounce debounce_btn_u (
    .clk(clk), .reset(1'b0), .sw(btnU), .db_level(), .db_tick(btn_u_tick));

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
    we_b <= 1'b0;

    case (state)
        idle:
            begin
                if (btn_c_tick)
                    begin
                        state <= col_vec;
                        cv_start_tick <= 1'b1;
                    end

                if (btn_u_tick)
                    addr_c1 <= addr_c1 + 1;
            end
        col_vec:
            begin
                cv_start_tick <= 1'b0;
                if (cv_done_tick)
                    begin
                        state <= wait_spi;
                        read_spi_tick <= 1'b1;
                    end
            end
        wait_spi:
            begin
                if (read_spi_tick) // technically, also !o_wb_stall
                    begin
                        i_wb_cyc <= 1'b1;
                        i_wb_data_stb <= 1'b1;

                        read_spi_tick <= 1'b0;
                        load_byte <= 2'd0;
                    end
                else if (o_wb_ack)
                    begin
                        i_wb_cyc <= 1'b0;
                        i_wb_data_stb <= 1'b0;

                        // start to load the 4 bytes into bram
                        state <= load_spi;
                        bw <= o_wb_data[31:24];
                        we_b <= 1'b1;
                        addr_b0 <= addr_b0 + 1;
                        load_byte <= load_byte + 1;
                        weight_bytes_loaded <= weight_bytes_loaded + 4;
                    end
            end
        load_spi:
            begin
                case (load_byte)
                    2'b01:
                        bw <= o_wb_data[23:16];
                    2'b10:
                        bw <= o_wb_data[15:8];
                    2'b11:
                        bw <= o_wb_data[7:0];
                endcase

                we_b <= 1'b1;
                addr_b0 <= addr_b0 + 1;
                load_byte <= load_byte + 1;

                if (load_byte == 3) // finished the 4 bytes
                    begin
                        if (weight_bytes_loaded == 8) // finished loading weights for this batch
                            begin
                                state <= transconv;
                                weight_bytes_loaded <= 0;
                                tc_start_tick <= 1'b1;
                            end
                        else // keep loading weights
                            begin
                                state <= wait_spi;
                                read_spi_tick <= 1'b1;
                                i_wb_addr <= i_wb_addr + 1; // not +4!
                            end
                    end
            end
        transconv:
            begin
                tc_start_tick <= 1'b0;
                if (tc_done_tick)
                    begin
                        if (output_plane_start < 1)
                            begin
                                state <= wait_spi;
                                output_plane_start <= output_plane_start + 1;
                                read_spi_tick <= 1'b1;
                                i_wb_addr <= i_wb_addr + 1; // not +4!
                            end
                        else
                            begin
                                state <= idle;
                                led <= 1'b1;
                            end
                    end
            end
    endcase
end

endmodule
