`timescale 1ps / 1ps

// To simulate this module:
// - Change line 250 of s25fl128s.v to 'parameter mem_file_name = "weight_1_uint8.mem";'
// - Set simulation runtime to 2000us
//
// This computes the first 2 output_planes out of 512, the weight of each is of 100x4x4 = 1600
module top_layer_1_tb();

localparam T = 10000; // 100MHz = 10ns period

localparam [2:0]
    idle      = 3'b000,
    col_vec   = 3'b001,
    wait_spi  = 3'b010,
    load_spi  = 3'b011,
    transconv = 3'b100;

reg clk, reset;
reg btn_tick = 1'b0, read_spi_tick = 1'b0;

reg [2:0] state = idle;
reg [1:0] load_byte = 2'b00;
reg [17:0] weight_bytes_loaded = 18'd0;
reg [9:0] output_plane_start = 10'd0;

// Wishbone inputs
reg i_wb_cyc = 1'b0, i_wb_data_stb = 1'b0;
reg [19:0] i_wb_addr = 20'd0;
// Wishbone outputs
wire o_wb_ack;
wire o_wb_stall;
wire [31:0] o_wb_data;
// Quad SPI control
wire o_qspi_sck, o_qspi_cs_n;
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

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8), .DATA_FILE("input_1_uint8.mem")) bram_a
    (.clk(clk), .we(we_a), .addr_a(addr_a0), .addr_b(addr_a1), .din_a(aw), .dout_a(a0), .dout_b(a1));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8)) bram_b
    (.clk(clk), .we(we_b), .addr_a(addr_b0), .addr_b(addr_b1), .din_a(bw), .dout_a(b0), .dout_b(b1));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(32)) bram_c
    (.clk(clk), .we(we_c), .addr_a(addr_c0), .addr_b(addr_c1), .din_a(cw), .dout_a(c0), .dout_b(c1));

// row_vec max size (max n) = 8192, precomputed
bram #(.ADDR_WIDTH(13), .DATA_WIDTH(32), .DATA_FILE("row_vec_1_int32.mem")) bram_row_vec
    (.clk(clk), .we(1'b0), .addr_a(addr_rv0), .addr_b(13'd0), .din_a(32'd0), .dout_a(rv0), .dout_b());

// col_vec max size (max m) = 1024
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32)) bram_col_vec
    (.clk(clk), .we(we_cv), .addr_a(addr_cv0), .addr_b(addr_cv1), .din_a(cvw), .dout_a(), .dout_b(cv1));

col_vec col_vec_unit
    (.clk(clk), .start_tick(cv_start_tick), .m(14'd1), .k(14'd100), .rhs_offset(8'd139),
     .a(a0), .a_rd_addr(addr_a0), .addr_cvw(addr_cv0), .val(cvw), .we(we_cv), .done_tick(cv_done_tick));

// TODO: pass constants as parameters?
transconv tc_unit
    (.clk(clk), .reset(reset), .start_tick(tc_start_tick), .m(14'd1), .k(14'd100), .n(14'd8192),
     .n_output_plane(10'd2), .output_plane_start(output_plane_start), .output_plane_batch_size(10'd1),
     .output_h(7'd4), .output_w(7'd4), .input_h(7'd1), .input_w(7'd1),
     .kernel_h(3'd4), .kernel_w(3'd4), .pad_h(3'd0), .pad_w(3'd0),
     .stride_h(3'd1), .stride_w(3'd1), .dilation_h(3'd1), .dilation_w(3'd1),
     .a(a1), .b(b1), .c(c0), .rv(rv0), .cv(cv1), .term4(32'd1779200),
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
		.o_qspi_cs_n(o_qspi_cs_n),
		.o_qspi_mod(o_qspi_mod),
		.o_qspi_dat(o_qspi_dat),
		.i_qspi_dat(i_qspi_dat),
		.o_interrupt(o_interrupt));

// RESET# has an internal pull-up resistor and may be left unconnected in the host system if not used,
// same for WP# and HOLD#
s25fl128s spi_flash (.SI(o_qspi_dat[0]), .SO(i_qspi_dat[1]), .SCK(o_qspi_sck), .CSNeg(o_qspi_cs_n), .RSTNeg(), .WPNeg(), .HOLDNeg());

always @(posedge clk)
begin
    we_b <= 1'b0;

    case (state)
        idle:
            begin
                if (btn_tick)
                    begin
                        state <= col_vec;
                        cv_start_tick <= 1'b1;
                    end
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
                        if (weight_bytes_loaded == 1600) // finished loading weights for this batch
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
                            state <= idle;
                    end
            end
    endcase
end

always
begin
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
end

// reset for the first half cycle
initial
begin
    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;
end

integer i;
initial
begin
    #(T * 30000); // 300us for s25fl128s to power up

    @(negedge clk);
    btn_tick = 1'b1;
    @(negedge clk);
    btn_tick = 1'b0;

    wait(tc_done_tick);
    repeat(2) @(negedge clk);
    wait(tc_done_tick);

    for (i = 0; i < 31; i = i+1) begin
        @(negedge clk);
        addr_c1 = addr_c1 + 1;
    end
end

endmodule
