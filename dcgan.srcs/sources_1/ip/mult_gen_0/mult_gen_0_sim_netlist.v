// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Wed May  2 12:33:16 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/aufheben/Vivado/dcgan/dcgan.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [39:0]P;

  wire [31:0]A;
  wire [7:0]B;
  wire CLK;
  wire [39:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "39" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "39" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_13
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [31:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [39:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [31:0]A;
  wire [7:0]B;
  wire CLK;
  wire [39:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "39" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
eThA4urGySHz67tBZHTx4tTp5mTo5DCRQfp+yRzcr2whoH4DIeVibo6x5of6iYBABK/MkSBB+B+H
6UAn/P5YAg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
snMFkYPMv9V6A3+iFtG7oTRSl3WGGhMc9D8j1ugpsuSLiA2Pje8/UBQUWcKNgi36vMIFClm04c/s
irbuPFknEhoJFPLTFvHNIYDDpTc/zSRSYh64zwdLSWJq8KJpVDb7t/RGYJR24edP/F+cpX1FBOkk
u5xPbUQBgvE81oAW6Vc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RgOlCHqXzvXwQsA5I/LtBs9g7c6c0zVLfSY85YSnPWeKKiiUCefF+uOTsUUUOPRJHQH/2JFLot6I
KN66WAK5AG1acq/TnIhm7kcfBhAtuMDqfJmzboDn/hOFlW/pGETTzEgGyqML86b/3Qv9/f6WzLZw
YpWcY7lvAprtM/aqt+Ej49i6Zpp0fZae9Wz7TZnG87OMzjrEEpE9TBAEmcWqMUG9pbTESrkotct1
AaXMmP91wkuOdNe3eXyW7WuGidjdhrxA8JqL0aKgFij86V1VUsSOkHsZ8lDi/+0NoSu+plsguYZG
4DD4Fc5Eef8GWXJlvHqhXVHxpytVD5r2VB3aFQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
le/1KL2Kir0qq3QcBG1RWBhxaDbWEkj8/k5hyPIo+Y31Ou5MZe5sKugCbLsyBCAxTRslfntg+BdR
6THUA3CltiLpc18R1vv7fFNgBU43i+ynX0ENrrdAEo32bLswKxtqKYEXZ0wvg9QsPfVYA3XQTCjB
nPKukZDwSKLU605KtPfGFeqog8pfrWEe9w6cEshhnhrTuGC5QXqgEJKuLR4AvikVc9W8Q9dPcRNp
QSjC2mi7DNnQBlcR0JoLdoigEO2yqIWIiYL55WaXma3jt2eJbTTbfyRtEDQxLkAn6gPN6uOmYnLU
GmuLwdjmwZQZZPsG8PPZ0fMhHrKjStIpmD3uNA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZNGRmUPX7BBXtKiJcv3ct09nQEaXPV67ls18JqsJeE30/JEe6JC9VLKY8oDe8U6FcVMBD/CIcRan
NKuWqxyDaFdif5ZYMcWtOHrCitIlwNmpl2mkatXNgSaRNSSebFSGyy+NeRGsUBbzcJk7x4zl/g/z
z4Y5zEMbf0v34IQOqA3EBYIcvbq5KBYyFmuHUcV9KExYa/1sBdIhd1Q3QafXF4BaIQrRjQRWOeyU
CwWELIXqSN5zLC/YUHFZ4I245dNbO5AgS+pWIAIj7razFBT5XpaVrVulxmW6/6fxVF2RArbW+lo7
H5ucVUWNvG8TrSha9sVMEty2FyutpMVtysav8g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
C5XA4YnAJ3khS6SlIoopor91q1/ea33YXI2DNXmXOyYrQWz2LJjAZsHefs7nfRe1ySlhdk/thpxC
zhvlzx5bt/0lmomYtSlwRSSL1sHwGugg+WXQaAWnjjya6q8S/lIfPxao26u88QS7DLqvAJI1tfOV
tBa2W+O/Q7evPFRzzOs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ra6N9gcp+jtEzd26qhq96k/trdhW10hFmj31ofzQLSu445HchyJ58i6PaJ4B2yUq9nFhiGLC76Fr
HkUbk+dsGN8NMhHdUlsoMFoSEwAMVzjQJbk1i4abYKb2hhKFlzxi9iJIaxt5AAkqWXGvGNBSjIOA
Kjtwc8EcbZs5NNH+9QrcW1AoJB24rw5joAA1tjYHM++XXH3oq6KAadKDYE9lKi4nGFgM0wTrIQBI
zVAHYIZ07XY7ZOikL7+cP4rcs+HlJiMjix8HFkdD9CV47+c9JeAA60gf8BwlCN7glzoT3ApW/MwB
v34K9AVEERPxE5hEbJa0M1TuZI+A95Wev2qahw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VXPjFEHuu3KFYH5WDPR67iEUos4rSB8k3MYSMENzmRcQJieyQ9Scm5qYYzUeGpXwXPJ3x4sqtSUW
4bpea/CZ9QqSGXW5J8FjtyPWELhWB56gHYx5MJI3jDBPEWpWB97sBjeLE3QfmXXL/u8D5sqCE8WX
OpxoThl4UGf2xGul56Aqyf5qHwrNU0xeIwXy+GB5YlZA9S/SDr5pecN0+F2MAErCpXhcWzPEf8oH
lhWebEGIJxDYkrf2fQk006qqOAHqkGXm83WKru91xw/xF+HrYtDar+NLzUJhbbTfpsggJrsBewH8
DU2PLy2IkV3p57gAf38CyQ2i8Y4JhmARuV2iXA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yVmO3wjj5nhy3TNhRL+lLpLEuuFXrWon9k4yXpCoS2FAv/dWmFdMVgW/NyT9WNSbjKTkiGR04jUG
jAxweglN1ot0K9TfMGG2sj5JBuSGoRUjeAe219DOlbh+M3l9VHq8uRe8TGd0xWN7RJUOrebbI9O1
DTnUg3Q+PNSpyPr672bMRuT3P5A/4+MX6GDdyQLJhBprGUT8UsbCMlNNAhn/YSWm40e6kiCr72fn
oHYOgo2zR7L8hixOcNP53P4yu5sFw/jiDxcPtCzG7TXiBNlEb9t74nJH3QFn21YZjyiQ+YxJ4YL0
/F0lzore8oXP8YoskT8cPQlL35EoOmY0rDbeHw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14352)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
