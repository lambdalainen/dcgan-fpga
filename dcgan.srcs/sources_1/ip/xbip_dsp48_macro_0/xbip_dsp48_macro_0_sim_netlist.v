// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Sun Apr 29 12:33:40 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/aufheben/Vivado/dcgan/dcgan.srcs/sources_1/ip/xbip_dsp48_macro_0/xbip_dsp48_macro_0_sim_netlist.v
// Design      : xbip_dsp48_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_0,xbip_dsp48_macro_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_15,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_0
   (CLK,
    SEL,
    PCIN,
    A,
    B,
    C,
    PCOUT,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sel_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sel_intf, LAYERED_METADATA undef" *) input [1:0]SEL;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcin_intf, LAYERED_METADATA undef" *) input [47:0]PCIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [31:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire [31:0]C;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire [1:0]SEL;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;

  (* C_A_WIDTH = "18" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "1" *) 
  (* C_HAS_PCOUT = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "80" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100011010100000000,000000000001010100000000,000000000011010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000011100000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_15 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule

(* C_A_WIDTH = "18" *) (* C_B_WIDTH = "18" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "32" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "1" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "1" *) (* C_HAS_PCOUT = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "80" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000100100011010100000000,000000000001010100000000,000000000011010100000000" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000000000000000011100000" *) (* C_SEL_WIDTH = "2" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_15
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [1:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [17:0]A;
  input [17:0]B;
  input [31:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [47:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [17:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [17:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire [31:0]C;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYOUT;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire [1:0]SEL;

  (* C_A_WIDTH = "18" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "1" *) 
  (* C_HAS_PCOUT = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "80" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100011010100000000,000000000001010100000000,000000000011010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000011100000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_15_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C(C),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(1'b0),
        .CARRYOUT(CARRYOUT),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
J6Gx6falb7oQUJb/bSSCUIKketBDYmpvzWfS1qCh0uanaJRO+UcHNBLJqQtsWwgBQZ0H0iwcnedc
3sj0uI3NeQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYbKDFdbW5jq953P6PqVrUuX+yG6ftSfmcKISHyF6WGaNm8WWB8NH3tU8+0xqaegdzeKamw31ol3
L4gPD7vA7FXFJPTrlqOvuePM97+sBsv2/TRycmuhIUJS4SMGXPH3TcsVlwJJZl2tagSxCW8TR3V4
2XSRGAnhsmRAyXM08/c=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XpRa1jyvtPtNmxmDoO3L4QAk9XgppwsZzjUrQE1Y9s0mPOkKJpXqAE+nwJCxRUbiyNmqcNrbyQYI
leE/+RFANIQM0xlp8qzy3aDiWrRqaJFFa65HUZFo54+XpXIPHFn+2Eb5eEbBeR+43PgPAlJoubup
/lkZcxGXZAlQM01o9tFXNnN1t263Hdp/Kwf2J3UMEsg2CYlEYiYWQTrbeACZNMyB8RxgRLqhiwBW
EuTkoNuf/fBkkx+gkydKW2fFA0aPPkeDI7kUxLiprNRZ92QwKNuJ4ljiaC+/qiR2df0mt4h8f3EQ
uyVyJ0fe0YYSQyZM3q9O4rX7cppYkee+jblMqg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Id8M1lpXoEdQpacNxuBd73VbS+MfV4lasBpWD/2xzLOwZ3vxRCQyiY+/EmSdQS8/88kjJ3TnSOIU
s6J4Qsi+Io5q1yq0HAPOOTvTJGC6RaqyAgOmmZSNYO6nD2RGeFsINEncmPr8ssASVPPpTNZ09Vta
e6K9+X0/8dlg4YIHR1FLZMrhzx0/IUsGEE65fd0W2vAPAPx+zmqRGY0glRGDYrJ0CUuGt7eyQIHk
oKFhYVyUx+p70NmnQEyD0LaFdv2uLfEk0JQGnjtSxLPMO4aNA7wILjmatap6efncCB+TUgTI1CJI
M+VWrfzqtPNqtylTgHfXYtMs4tDrdaaMpAEDLQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HF0vvsxr1EuS/tZmOmFUy2omesblSFNpnZe2gM4iKv0q4WqwviOSmJHnl5tHji9fDVUAiRAVXW8P
dVXsZI1rMAPdc961AmhcawVs7L+MWVAboh+hxmkbGswc5towvVO9KvoMTop/3ovybfNAWq14i/b5
ACItBg9OG90fbjKnIQU/sVFDSJSdckNwUlO5/64kpsLLdPqEwDLu8Gdk4jGLfE1/04n/yS7y8t7Z
v8bQJNR/drZPWOA598NlJYP/8CBPHr7GIgk7pVSdp7foByF5Wx1iMf8nJIiNfeIFMN0NCWVBgCiR
LLq4beq98O4o2DPyBhTvutOVroPKQv4jxIHIZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
J80022cqZVC7bO0xJ9JPS+FHMIavLtvJsEbLQMR2ABoViTfte255UuxWLAl2XnYgZYzXLhnT+xj7
sioMAtM36HPk0qU5UpWly7ingD8N2M2Zt/UbbH8JRFq/0B41o2P3c1NvZi8C8qmTvTNWkotLdLIp
8GIHKvj3LxrP72Be4B8=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ITMjz6ojb4ftWlRgom6oruYm6WoZQBQ9C3kYhF5qf0l+z9oz9qHgFA3ebfpYh0A9wEIoCVmCAP7x
n7TqAfEpsYtSyYKLExIouGaRe8Wr7ue4d7GkCPEYkxhcY3Eu3667HIa3PhTSB57CMIKYn7gpziP0
I7YvSccRKtd+ehh2oQ8Z1BMFJUBGQ4MhID/pgDHCZ+F8oJPJKvgyCR4O/90OBUEjZCNGc82xAMLL
jX5RVfPJpHPAi5x54FyRCcnKz0eUJDYXB9Gm+Z5zEn4jn1xoI00cQIiEb+P1nE2ogkQVeX4ZYT8m
N4F/3e4W+kOcPMN95Ua4h8RYIcBhogYcn1GAiw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7Tt+EjeAmak+a/gNi7jQRXjbVK22HASxBNT0gkDSOOrB5nxP1NmeTMhACBtyGbhbq10Cc0e21Ib
ktCHKWwHZMEWcXh/+MKYvlXPGJiJixsIsZ+EYMnBDW4mCKQDfsBNbhu9ZIFn3eTcmQcGgjCgjO26
aqpmoH4BKjx3kE6QMOi5omJ9qcTjA99xSab2b64crQrU63CiRKzeLEEWgfkfE715xQcVYQDRmTnQ
spZreTiGFnYZZQq1KgLteELp4ld0njQa8sBFKP5+IutYkRtWCaPjyjsQ90WmtHXZAUL1iaVgDq4n
2UMdigO4aTIJ7xwSAk3lSzFzbfzOpEJ4+OSBQQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3EqZRGv87/Ekc7qEjlMP0uAmi6D9V9hnUM3U8R7g2Ggwde6IHEU9l4JQjg/QlHlPaC+Wih5wk6tb
NGbZl79fnL/J9EDOE+7QsnOAwDXIhw3W7e6oxyNaNFkIOPFitBqpeY2OvdRio/6Mtopk4OOjiqSx
eFdojKceV1INLvf8U/eierOmisoF2E5DwBjnfm3yDdMMfL9ioJIUL6awO89oMCiIN+YTQltrYqw0
Rowit7aFsw9MXhrE8ESHqU81rykwHzCpN6ffTxUOH6GUshMzJOCrbGxGbygFmrBcA/rNdHPC4oS/
XJ4s+36snZ3t985CTlBbPNtSaRaxs07+wuavgg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9232)
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
