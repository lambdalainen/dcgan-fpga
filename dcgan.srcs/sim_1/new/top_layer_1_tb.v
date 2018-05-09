`timescale 1ps / 1ps

// To simulate this module:
// - Change line 250 of s25fl128s.v to 'parameter mem_file_name = "weight_1_uint8.mem";'
// - Set simulation runtime to 2000us
//
// This computes the first 2 output_planes out of 512, the weight of each is of 100x4x4 = 1600.
// Each output plane has size 4x4.
module top_layer_1_tb();

localparam T = 10000; // 100MHz = 10ns period

localparam [2:0]
    idle      = 3'b000,
    col_vec   = 3'b001,
    wait_spi  = 3'b010,
    load_spi  = 3'b011,
    transconv = 3'b100,
    bn_relu   = 3'b101,
    tanh      = 3'b110;

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
reg start_tick_cv = 1'b0;
wire done_tick_cv;

// transconv
reg we_input = 1'b0;
reg we_weight = 1'b0;
wire we_output; // we can't write 'wire we_c = 1'b0;' or 'we_c' will be tied to GND

wire [15:0] addr_input_rd, addr_input_rd_col_vec, addr_input_rd_tc;
wire [15:0] addr_input_wr;
reg [15:0] addr_weight_wr = 16'hffff;
wire [15:0] addr_weight_rd;
wire [15:0] addr_output_rw;
reg [15:0] addr_output_rd = 16'd0;

reg [7:0] input_wr = 8'd0;
wire [7:0] input_rd;
reg [7:0] weight_wr = 8'd0;
wire [7:0] weight_rd;
wire [31:0] output_wr, output_rd0;
wire [31:0] output_rd1;

reg start_tick_tc = 1'b0;
wire done_tick_tc;

wire [9:0] addr_tc_bias;
wire [31:0] tc_bias;

reg start_tick_bn_relu = 1'b0;
wire done_tick_bn_relu;

// --- Input & weight & output buffers

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8), .DATA_FILE("input_1_uint8.mem")) bram_input
    (.clk(clk), .we(we_input), .addr_a(addr_input_wr), .addr_b(addr_input_rd),
     .din_a(input_wr), .dout_a(), .dout_b(input_rd));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8)) bram_weight
    (.clk(clk), .we(we_weight), .addr_a(addr_weight_wr), .addr_b(addr_weight_rd),
     .din_a(weight_wr), .dout_a(), .dout_b(weight_rd));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(32)) bram_output
    (.clk(clk), .we(we_output), .addr_a(addr_output_rw), .addr_b(addr_output_rd),
     .din_a(output_wr), .dout_a(output_rd0), .dout_b(output_rd1));

// --- Row & column vectors for TC

// row_vec max size (max n) = 8192, precomputed
bram #(.ADDR_WIDTH(13), .DATA_WIDTH(32), .DATA_FILE("row_vec_1_int32.mem")) bram_row_vec
    (.clk(clk), .we(1'b0), .addr_a(addr_rv0), .addr_b(13'd0), .din_a(32'd0), .dout_a(rv0), .dout_b());

// col_vec max size (max m) = 1024
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32)) bram_col_vec
    (.clk(clk), .we(we_cv), .addr_a(addr_cv0), .addr_b(addr_cv1), .din_a(cvw), .dout_a(), .dout_b(cv1));

// --- Read-only BRAMs

// tc bias size = 512 + 256 + 128 + 64 + 3 = 963
bram #(.ADDR_WIDTH(10), .DATA_WIDTH(32), .DATA_FILE("tc_bias.mem")) bram_tc_bias
    (.clk(clk), .we(1'b0), .addr_a(addr_tc_bias), .addr_b(10'd0), .din_a(32'd0), .dout_a(tc_bias), .dout_b());

// --- Module instances

col_vec col_vec_unit
    (.clk(clk), .start_tick(start_tick_cv), .m(14'd1), .k(14'd100), .rhs_offset(8'd139),
     .a(input_rd), .a_rd_addr(addr_input_rd_col_vec), .addr_cvw(addr_cv0), .val(cvw), .we(we_cv), .done_tick(done_tick_cv));

// TODO: pass constants as parameters?
transconv tc_unit
    (.clk(clk), .reset(reset), .start_tick(start_tick_tc), .m(14'd1), .k(14'd100), .n(14'd8192),
     .n_output_plane(10'd2), .output_plane_start(output_plane_start), .output_plane_batch_size(10'd1),
     .output_h(7'd4), .output_w(7'd4), .input_h(7'd1), .input_w(7'd1),
     .kernel_h(3'd4), .kernel_w(3'd4), .pad_h(3'd0), .pad_w(3'd0),
     .stride_h(3'd1), .stride_w(3'd1), .dilation_h(3'd1), .dilation_w(3'd1),
     .a(input_rd), .b(weight_rd), .c(output_rd0), .rv(rv0), .cv(cv1), .term4(32'd1779200), .bias(tc_bias),
     .a_rd_addr(addr_input_rd_tc), .b_rd_addr(addr_weight_rd), .c_rw_addr(addr_output_rw),
     .addr_rv(addr_rv0), .addr_cv(addr_cv1), .addr_bias(addr_tc_bias),
     .c_out(output_wr), .c_wr_en(we_output), .done_tick(done_tick_tc));

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
s25fl128s spi_flash (.SI(o_qspi_dat[0]), .SO(i_qspi_dat[1]), .SCK(o_qspi_sck),
                     .CSNeg(o_qspi_cs_n), .RSTNeg(), .WPNeg(), .HOLDNeg());

// --- Multiplexers

//assign addr_input_wr =
assign addr_input_rd = state == col_vec ? addr_input_rd_col_vec : addr_input_rd_tc;

always @(posedge clk)
begin
    we_weight <= 1'b0;

    case (state)
        idle:
            begin
                if (btn_tick)
                    begin
                        state <= col_vec;
                        start_tick_cv <= 1'b1;
                    end
            end
        col_vec:
            begin
                start_tick_cv <= 1'b0;
                if (done_tick_cv)
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
                        weight_wr <= o_wb_data[31:24];
                        we_weight <= 1'b1;
                        addr_weight_wr <= addr_weight_wr + 1;
                        load_byte <= load_byte + 1;
                        weight_bytes_loaded <= weight_bytes_loaded + 4;
                    end
            end
        load_spi:
            begin
                case (load_byte)
                    2'b01:
                        weight_wr <= o_wb_data[23:16];
                    2'b10:
                        weight_wr <= o_wb_data[15:8];
                    2'b11:
                        weight_wr <= o_wb_data[7:0];
                endcase

                we_weight <= 1'b1;
                addr_weight_wr <= addr_weight_wr + 1;
                load_byte <= load_byte + 1;

                if (load_byte == 3) // finished the 4 bytes
                    begin
                        if (weight_bytes_loaded == 1600) // finished loading weights for this batch
                            begin
                                state <= transconv;
                                weight_bytes_loaded <= 0;
                                start_tick_tc <= 1'b1;
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
                start_tick_tc <= 1'b0;
                if (done_tick_tc)
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

    wait(done_tick_tc);
    repeat(2) @(negedge clk);
    wait(done_tick_tc);

    for (i = 0; i < 31; i = i+1) begin
        @(negedge clk);
        addr_output_rd = addr_output_rd + 1;
    end
end

endmodule
