// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Sun Apr 29 12:35:30 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/aufheben/Vivado/dcgan/dcgan.srcs/sources_1/ip/xbip_dsp48_macro_1/xbip_dsp48_macro_1_sim_netlist.v
// Design      : xbip_dsp48_macro_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_1,xbip_dsp48_macro_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_15,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_1
   (CLK,
    CE,
    SCLR,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
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
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "96" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_1_xbip_dsp48_macro_v3_0_15 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(CE),
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
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "8" *) (* C_B_WIDTH = "8" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "0" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "1" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "96" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000010010100000000" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000000000000000000000100" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_1_xbip_dsp48_macro_v3_0_15
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
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [7:0]A;
  input [7:0]B;
  input [47:0]C;
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

  wire [7:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [7:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYOUT;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLR;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
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
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "96" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_1_xbip_dsp48_macro_v3_0_15_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(1'b0),
        .CARRYOUT(CARRYOUT),
        .CE(CE),
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
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
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
G8kCPpULcIgRJfws5AbKZkVZYmhTT1pTGyGmTCyOScCcmHSzIZUOuK+p70OV5LlzARBpVLqF9NzC
Zk6a0waecBWPHmBnXQwL8M7iMlPP/vNNDGKK8wNHx1VfmM9r7rjJM0qjjJZNvucZ+3i/74P964hB
S2b558lzbvsNjkOjdZLe59pXWV/XndLsablDlucvampQ/zoGrL44KelVyeESuhtBWgNjhYFDRvY1
T4y2lTikFymlzQmcLbk99+BpBCJ6CNqYTEqRnSeMNG3ZhBeySibaTIuwEcS1fTV2GBgOPkoScO3b
e/usLKXF9ACKPRKjJ8MPqbGrU0BQ7JEvj3vg7g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fUL2JGhCUf4COYNycW9OnWAliV0JBTw4TjhQwNZGoRDwmQoV1nGtGrq8DJoTyKZASkltaM3bczUL
WCoenFJ014WG4ZR7EblXgsTjgjkvV8dR7YSgodZoA8N4tuRVYhJAz63PA2I5Vb5LmVFq+eXJxoxK
i+Zkv2bt+Rp6nXHxm4eLOG7UL7b4/XTZ6i7EClDGheRCx3AxroWXX9Fc2c/4t5SHgE48NJeA5Arl
16UGyHh18cvACyTucckhvzBoDcAxI9I0elvE7ch6hDytx043zrpHwEacFIPmSKeGu5vwuXvjOhGh
xXakughzMzS13dxV6tr6lwramHpyCeHNGtPchQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8928)
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
