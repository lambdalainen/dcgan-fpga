// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Wed May  2 23:24:43 2018
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [8:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [8:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [8:0]A;
  wire [8:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "9" *) 
  (* C_B_WIDTH = "9" *) 
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

(* C_A_WIDTH = "9" *) (* C_B_WIDTH = "9" *) (* C_CONCAT_WIDTH = "48" *) 
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
  input [8:0]A;
  input [8:0]B;
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

  wire [8:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [8:0]B;
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

  (* C_A_WIDTH = "9" *) 
  (* C_B_WIDTH = "9" *) 
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
hXzOvTN4OZ1tSd13bbwPAL6mIzHFlKvHqiHwUjFd9uvrrMQY4WLlvdvYk26E146ppad85BgX5UNb
QgybEUFTcvs78wDkOJOCIrKGwhpHKVF5eIQrRtZGipkt3Lf81vzHrTB4mx6e10MfS4vp7JL7yXDN
JEDHT/UG6ZHYnrsHhBVJJlM9dkdJ+ynqXDLLSL/PGx9PFs8MeOjQsU4DiRXv1AE97buebbhBxN35
fpjSGhlMREAP7jF2TJNDbC7fYEmFMcsow58+Jl0u9azcPYUchruN/7g+8gjj/bDaOEcOobRY5YCi
QNSLa+jaSl1dwwZ1CBf/CRvHpA9J0gn2bwjjsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2cnLNIK56378CjC5Jada6qAv5bvqm+uTV6Axti/U8Q0m/hpWY5iWHU+x+g3XgUsYCOgVrTdrx+G9
rxbhzpBXIsvp3FX4UMrb0h9+on+Ntit4jsNTrsr8V2SVaqxV6+nQ6bE0y5Mtkw61lEEQtc+ZNilt
+16/ZP36ZTjketKkZX29uv40Tf8CyPrylpL6XT9wRZtm76cht1hL0uaNGoRYnlH+Ano2IVs2fBAb
4PHawnjZ0hwRm+BcNtmdWLluGsnvabL+55K9Y+Kmu9s/N4rfoyfa8CI1b+pQmk08MV26VuKdf/xN
XrSc/NB0bvmea3LZxCUwBGlwAiP0SRw/Qavr7g==

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
