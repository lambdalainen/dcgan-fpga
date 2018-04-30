`timescale 1ps / 1ps

module top_tb();

localparam T = 10000; // 100MHz = 10ns period

localparam [2:0]
    idle = 3'b000,
    load = 3'b001,
    exec = 3'b010;

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

// bram & transconv
reg we_a = 1'b0, we_b = 1'b0;
wire we_c; // we can't write 'wire we_c = 1'b0;' or 'we_c' will be tied to GND
reg [15:0] addr_aw = 16'd0, addr_bw = 16'hffff, addr_result = 16'd0;
wire [15:0] addr_ar, addr_br, addr_c;
reg [7:0] aw = 8'd0, bw = 8'd0;
wire [7:0] a, b;
wire [31:0] c, cw, result;
reg start_tick = 1'b0;
wire done_tick;

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8), .DATA_FILE("input_1_uint8.data")) bram_a
    (.clk(clk), .we(we_a), .addr_a(addr_aw), .addr_b(addr_ar), .din_a(aw), .dout_a(), .dout_b(a));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(8)) bram_b
    (.clk(clk), .we(we_b), .addr_a(addr_bw), .addr_b(addr_br), .din_a(bw), .dout_a(), .dout_b(b));

bram #(.ADDR_WIDTH(16), .DATA_WIDTH(32)) bram_c
    (.clk(clk), .we(we_c), .addr_a(addr_c), .addr_b(addr_result), .din_a(cw), .dout_a(c), .dout_b(result));

// TODO: pass constants as parameters?
transconv tc_unit
    (.clk(clk), .reset(reset), .start_tick(start_tick), .m(14'd9), .k(14'd2), .n(14'd8),
     .n_output_plane(10'd2), .output_plane_start(output_plane_start), .output_plane_batch_size(10'd1),
     .output_h(7'd4), .output_w(7'd4), .input_h(7'd3), .input_w(7'd3),
     .kernel_h(3'd2), .kernel_w(3'd2), .pad_h(3'd1), .pad_w(3'd1),
     .stride_h(3'd2), .stride_w(3'd2), .dilation_h(3'd1), .dilation_w(3'd1), .a(a), .b(b), .c(c),
     .a_rd_addr(addr_ar), .b_rd_addr(addr_br), .c_rw_addr(addr_c), .c_out(cw), .c_wr_en(we_c),
     .done_tick(done_tick));

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
                if (btn_tick || read_spi_tick) // technically, also !o_wb_stall
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
                        state <= load;
                        bw <= o_wb_data[31:24];
                        we_b <= 1'b1;
                        addr_bw <= addr_bw + 1;
                        load_byte <= load_byte + 1;
                        weight_bytes_loaded <= weight_bytes_loaded + 4;
                    end
            end
        load:
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
                addr_bw <= addr_bw + 1;
                load_byte <= load_byte + 1;

                if (load_byte == 3) // finished the 4 bytes
                    begin
                        if (weight_bytes_loaded == 8) // finished loading weights for this batch
                            begin
                                state <= exec;
                                weight_bytes_loaded <= 0;
                                start_tick <= 1'b1;
                            end
                        else // keep loading weights
                            begin
                                state <= idle;
                                read_spi_tick <= 1'b1;
                                i_wb_addr <= i_wb_addr + 1; // not +4!
                            end
                    end
            end
        exec:
            begin
                start_tick <= 1'b0;
                if (done_tick)
                    begin
                        state <= idle;
                        if (output_plane_start < 1)
                            begin
                                output_plane_start <= output_plane_start + 1;
                                read_spi_tick <= 1'b1;
                                i_wb_addr <= i_wb_addr + 1; // not +4!
                            end
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

    wait(done_tick);
    repeat(2) @(negedge clk);
    wait(done_tick);

    for (i = 0; i < 31; i = i+1) begin
        @(negedge clk);
        addr_result = addr_result + 1;
    end
end

endmodule
