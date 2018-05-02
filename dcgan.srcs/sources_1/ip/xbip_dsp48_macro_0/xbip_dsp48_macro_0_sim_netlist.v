// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Sun Apr 29 12:33:39 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top xbip_dsp48_macro_0 -prefix
//               xbip_dsp48_macro_0_ xbip_dsp48_macro_0_sim_netlist.v
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
(* downgradeipidentifiedwarnings = "yes" *) 
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
jgA296wzMcqEG3M6C5GzNLhxx75H1vvZDaVVWB7Kjjpej9wjsm27KAnqSgftpbfzadPcpy/nmflF
uq2ltxsj/5auCjdBYiDSPMX7STx6jO0DadVjVRQOOGy7HAzUbqqASEdvbkjhdWoNhJ7hV/+8Q0z8
Z3l3l19jMx+ZbDQhuedGP8hKGhTgZgmk3xnYxNI1P+e1e2iMZHbqSEhg6fbe3UBX96iYSCTgHsSR
e9TXLUmMNVmNKLbgKkCWB+t840fsMWFlF/m0t+XaiLek94v1LvSrPaPyIl4iuU3eHoQlEqjxWNTZ
CiVHbypqS45FRPWfDt0lDigP60mShUfzZlK+eQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xqYe30PtT3+eL4Syz+XxPb86ZOcevMor/lys4PTpk5VREZhzWM496otYGYkLyOy9l10CLgid89DM
d22vWxt+fwyWWEgrvlEdiD1BCQ0+It+VNSS79PLXRMfTcl9fjaA/RN6nGVT5cFzZCJGhCOMvFOmV
o4iHk/h4u00FiBN2T+Fs39K4otzwLkSW5aAC4GSAMxLVSTcG+El9LXQ3NOo+cmaOdP4bl6rGgMrk
Rbi67x/rh4wOlHCNdvIN2ghxqAbqBZsRxrPTvCAR0rNvTTHLq07G7T3ykvS4+Y+r9hsaPxcLnDtW
fxANM3JP9jSnW8jBMcd/Wtz89qNUHitaulKGrQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9200)
`pragma protect data_block
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
V19scHqfjUMYWGMgjcRSREzSF1QYRBB1CQ==
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
