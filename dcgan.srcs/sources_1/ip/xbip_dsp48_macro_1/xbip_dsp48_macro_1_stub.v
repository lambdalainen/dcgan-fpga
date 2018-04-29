// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Sun Apr 29 12:35:29 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/aufheben/Vivado/dcgan/dcgan.srcs/sources_1/ip/xbip_dsp48_macro_1/xbip_dsp48_macro_1_stub.v
// Design      : xbip_dsp48_macro_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_15,Vivado 2017.4.1" *)
module xbip_dsp48_macro_1(CLK, CE, SCLR, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,A[7:0],B[7:0],P[47:0]" */;
  input CLK;
  input CE;
  input SCLR;
  input [7:0]A;
  input [7:0]B;
  output [47:0]P;
endmodule
