// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (lin64) Build 2117270 Tue Jan 30 15:31:13 MST 2018
// Date        : Tue May  8 11:44:15 2018
// Host        : aufheben-desktop running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/aufheben/Vivado/dcgan/dcgan.srcs/sources_1/ip/floating_point_float_to_fixed/floating_point_float_to_fixed_sim_netlist.v
// Design      : floating_point_float_to_fixed
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "floating_point_float_to_fixed,floating_point_v7_1_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_5,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module floating_point_float_to_fixed
   (aclk,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    m_axis_result_tvalid,
    m_axis_result_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF S_AXIS_OPERATION:M_AXIS_RESULT:S_AXIS_C:S_AXIS_B:S_AXIS_A, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 10000000, PHASE 0.000" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_A, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) input s_axis_a_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TREADY" *) output s_axis_a_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) input [31:0]s_axis_a_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_RESULT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) output m_axis_result_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) output [15:0]m_axis_result_tdata;

  wire aclk;
  wire [15:0]m_axis_result_tdata;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_U0_m_axis_result_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_b_tready_UNCONNECTED;
  wire NLW_U0_s_axis_c_tready_UNCONNECTED;
  wire NLW_U0_s_axis_operation_tready_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_result_tuser_UNCONNECTED;

  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "1" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "16" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "16" *) 
  (* C_THROTTLE_SCHEME = "4" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  floating_point_float_to_fixed_floating_point_v7_1_5 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata(m_axis_result_tdata),
        .m_axis_result_tlast(NLW_U0_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_U0_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_U0_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_U0_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_U0_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule

(* C_ACCUM_INPUT_MSB = "32" *) (* C_ACCUM_LSB = "-31" *) (* C_ACCUM_MSB = "32" *) 
(* C_A_FRACTION_WIDTH = "24" *) (* C_A_TDATA_WIDTH = "32" *) (* C_A_TUSER_WIDTH = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BRAM_USAGE = "0" *) (* C_B_FRACTION_WIDTH = "24" *) 
(* C_B_TDATA_WIDTH = "32" *) (* C_B_TUSER_WIDTH = "1" *) (* C_B_WIDTH = "32" *) 
(* C_COMPARE_OPERATION = "8" *) (* C_C_FRACTION_WIDTH = "24" *) (* C_C_TDATA_WIDTH = "32" *) 
(* C_C_TUSER_WIDTH = "1" *) (* C_C_WIDTH = "32" *) (* C_FIXED_DATA_UNSIGNED = "0" *) 
(* C_HAS_ABSOLUTE = "0" *) (* C_HAS_ACCUMULATOR_A = "0" *) (* C_HAS_ACCUMULATOR_S = "0" *) 
(* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) (* C_HAS_ACCUM_OVERFLOW = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ADD = "0" *) (* C_HAS_ARESETN = "0" *) (* C_HAS_A_TLAST = "0" *) 
(* C_HAS_A_TUSER = "0" *) (* C_HAS_B = "0" *) (* C_HAS_B_TLAST = "0" *) 
(* C_HAS_B_TUSER = "0" *) (* C_HAS_C = "0" *) (* C_HAS_COMPARE = "0" *) 
(* C_HAS_C_TLAST = "0" *) (* C_HAS_C_TUSER = "0" *) (* C_HAS_DIVIDE = "0" *) 
(* C_HAS_DIVIDE_BY_ZERO = "0" *) (* C_HAS_EXPONENTIAL = "0" *) (* C_HAS_FIX_TO_FLT = "0" *) 
(* C_HAS_FLT_TO_FIX = "1" *) (* C_HAS_FLT_TO_FLT = "0" *) (* C_HAS_FMA = "0" *) 
(* C_HAS_FMS = "0" *) (* C_HAS_INVALID_OP = "0" *) (* C_HAS_LOGARITHM = "0" *) 
(* C_HAS_MULTIPLY = "0" *) (* C_HAS_OPERATION = "0" *) (* C_HAS_OPERATION_TLAST = "0" *) 
(* C_HAS_OPERATION_TUSER = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_RECIP = "0" *) 
(* C_HAS_RECIP_SQRT = "0" *) (* C_HAS_RESULT_TLAST = "0" *) (* C_HAS_RESULT_TUSER = "0" *) 
(* C_HAS_SQRT = "0" *) (* C_HAS_SUBTRACT = "0" *) (* C_HAS_UNDERFLOW = "0" *) 
(* C_LATENCY = "1" *) (* C_MULT_USAGE = "0" *) (* C_OPERATION_TDATA_WIDTH = "8" *) 
(* C_OPERATION_TUSER_WIDTH = "1" *) (* C_OPTIMIZATION = "1" *) (* C_RATE = "1" *) 
(* C_RESULT_FRACTION_WIDTH = "0" *) (* C_RESULT_TDATA_WIDTH = "16" *) (* C_RESULT_TUSER_WIDTH = "1" *) 
(* C_RESULT_WIDTH = "16" *) (* C_THROTTLE_SCHEME = "4" *) (* C_TLAST_RESOLUTION = "0" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "floating_point_v7_1_5" *) (* downgradeipidentifiedwarnings = "yes" *) 
module floating_point_float_to_fixed_floating_point_v7_1_5
   (aclk,
    aclken,
    aresetn,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    s_axis_a_tuser,
    s_axis_a_tlast,
    s_axis_b_tvalid,
    s_axis_b_tready,
    s_axis_b_tdata,
    s_axis_b_tuser,
    s_axis_b_tlast,
    s_axis_c_tvalid,
    s_axis_c_tready,
    s_axis_c_tdata,
    s_axis_c_tuser,
    s_axis_c_tlast,
    s_axis_operation_tvalid,
    s_axis_operation_tready,
    s_axis_operation_tdata,
    s_axis_operation_tuser,
    s_axis_operation_tlast,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata,
    m_axis_result_tuser,
    m_axis_result_tlast);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [31:0]s_axis_a_tdata;
  input [0:0]s_axis_a_tuser;
  input s_axis_a_tlast;
  input s_axis_b_tvalid;
  output s_axis_b_tready;
  input [31:0]s_axis_b_tdata;
  input [0:0]s_axis_b_tuser;
  input s_axis_b_tlast;
  input s_axis_c_tvalid;
  output s_axis_c_tready;
  input [31:0]s_axis_c_tdata;
  input [0:0]s_axis_c_tuser;
  input s_axis_c_tlast;
  input s_axis_operation_tvalid;
  output s_axis_operation_tready;
  input [7:0]s_axis_operation_tdata;
  input [0:0]s_axis_operation_tuser;
  input s_axis_operation_tlast;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [15:0]m_axis_result_tdata;
  output [0:0]m_axis_result_tuser;
  output m_axis_result_tlast;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire [15:0]m_axis_result_tdata;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_i_synth_m_axis_result_tlast_UNCONNECTED;
  wire NLW_i_synth_s_axis_b_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_c_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_operation_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tlast = \<const0> ;
  assign m_axis_result_tuser[0] = \<const0> ;
  assign s_axis_b_tready = \<const1> ;
  assign s_axis_c_tready = \<const1> ;
  assign s_axis_operation_tready = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "1" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "16" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "16" *) 
  (* C_THROTTLE_SCHEME = "4" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  floating_point_float_to_fixed_floating_point_v7_1_5_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .m_axis_result_tdata(m_axis_result_tdata),
        .m_axis_result_tlast(NLW_i_synth_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_i_synth_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_i_synth_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_i_synth_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_i_synth_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
Q7hLFn7KmGcs44VFkGxjL6OMURj6xLJYQnvQeHz/jTY4r4hsmkwtqO7RapERnOHqsxmkNrBeguys
wX3oSiBWhg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SfD+yrFtkWaWc8bxGCzN5FTHPj/rzdNfVgSzidHdMeXkkB3PA/EeLNfg8p/pTq1CAhSKnVxzI/m/
Wb/51eP1i07YiF+e076T9AiJFAfqXqzBy7P//6ojbxZPFdYVyIftBp5kNPNEKJ038bTr+Tf69Za/
QvfEmwb1zeoWs+LF/ak=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GUntCmEipIeBf/S+TbFPrdYN1f9BPhqqBv1IHSDtEyQKDXB4sM9mX/5xTKMmo8/Atg0dmAvbZO8G
CnhWj8IZ507KlBi+SfkyKhLoKjfoZmbHhYkT6XKWu+B5lZwwP32Loq/WQseB/c8iCDssFS9vZCoa
NIf+pbLGqnyuMKDMjCLUUvJb4eTMIszlbC9cPzZYlwVy2XDXFejcQ6nBBDH0UB3OMH7PuddGg/Oz
bs0exUb/KZG1ZvT1Ffj/aGsmUSMNW3M5gc5TtF7Hxp0/J6KS3eBKso1hj+yFwIWlwXiNCBorA3LW
N21cSMbDaRbGIuyXLSuHZXD43m6bHPCkomzQZQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lpCWHRSSLiyk+aymbXL6/ROvsOvzk/HpEQdOZ7SsQdzXaqaszN+uzaVC8RBRbVdw4jkLq0DMfcA0
H2VjGZqj+wi3Lpi3IXM7W/hbBrAPWo0wPnKwtKgZHymTZpN+o8Kb8vNMC3PhzWJb4I09OJm+Oo75
PZlQfs3BA9OmfWb9DTCLOaRatdHVw312GGAB09OYqETuTG/hQ60yh5pJOQOzjcgUl6GAlwvKlBAF
jwGEHsSVYQOGXj2eWKdg47zVVMzH9tRiHAAaS/krpOTw1rMwFZRGlMztWao5t5+SZzR14XgBTMgY
PgWTbj6wYB4ixWDoHNfYqkB9xr2Gz09f+A+tSQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9FrRDuSyexAvluWa2psW+6w+Np1oFvxz4/j0vYD3Rag52RMdFB9wz6nSQhmrxOmPf2yWPc9VH5g
TmUIClDHx/3negWvURGxCY2grxhmUvLanXv+RtIRurFvl4Q1awEB5K6Woeg2WlWeZcB90GtFCleY
psH3/vQKoLRBJayM5vM3GbdfGfPo9v/P9ZFnO5jgPTHP7wQ6v4GvSKtAAlvz+J6FiGxdl6WZWj+L
qtC6fiTEYG7v5vj3RBWVcNSTL3S/D4uhnrMU3qb648F8GgoX++oG8J42wMTMKx8REDU48HQR/kY1
/t0ggGEjynkSr0yrEw4yOpwnGH6jpy4F1/L3eA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jHuHEF/VTYkSwfm3941eQudvC1gTVlMiUoaZ/R2FdVGSgwPpK7LAgRtizSKb/DWUPuCzxrYnS2kF
s+UDjXzL8w7R8/j4ilvOsxSYCLiyOiJqUfLBVZ+0mBrRLjICPP1uVEVSi0xZhHNXHThZKL3OE/HG
r7XjT1BEF4BY1hyfNYY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nkS2Ul+EC+SLolrd8mgZjmpGCzrMtluptDzEFLQh6dqrts6glOl0to4P9hkH771A3o5d0BL1q6rE
FDrz8wS7SH4SJ5Sg4LfD+lZx6wupJlTT/MeljijxgaVXIm7ShUB33SPimOZlU5YBI4o/D44WXVEu
Q9Jxay/1NVmY7BuHjZSd3/eGecNdJPpUnuJyYGBLlHK3nYzrsGluxH27a7DfVVmjNHDVyZML+js2
6k48W2oyutkev7g5Uc30WB003Ps24jjKwxRpt3T5XPo9D8j1uQx3/nHCYQzfzCXN3koJ3kBUhzQJ
ZO9aB2jii9PpSGh7eST6lfvaE6MgGTp8QCWJ1A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ofn+LcQ+XVhZXrNOSXYVlrKaAtvas6dtGQMtvE7jGDs73oG98LG7UmuX5+7xjJVGPseKuXxQSJAJ
TT7MJ8drAw9W20Z79mpQRqBaYsOPU/7tMf1XL/Ll/bHX0peaN1L73DDYDzmgAAW8845P+Oj0kwGg
Q6BxxjZxpD0cem9BMPNdvSeNHEXOYxjhInE/gVWU996RosNBv7OdK0LbkFSP57SJKuekebby5Fy6
mPZE9pav0yDLMabr0eORz0m1Vec3HbpYqifLlYTu/FERMdre9a1yVUAF3vr4YjIADvOoI2J+rxnv
subCecc26lHdaD+1f6VQ6Hl+lYwLTd8dPPCA4g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hsrj2Shpp/xprmzzFQLaXJo5f5Jl449RPNMziBYsU/wY6Db0TFitujwoKI2s8Nt/n6GhttbAsQmv
Bg4Rc8MYl8D+VWAY2jCfwovRjCMy49rYpIbWs3gj1VUKYLUVqKfME+TkH9SQByhp/Cz9shWZE3KD
5cMBX/Z71H8iZGcnXCtw8pokHIvCT+V2KbdkWB6Flz1TZn01iPiSEZX35Oux8S2DwbPADyzhUOua
tlDjmt5CoUagzrxuZAaUye5v09VHtHe/4UQ5mX+ZEvmwXLvEWJwhQEnygGkE+xq/3YeIJznjYz+p
RnViYPkxB195A2GheSjtN4Z975D+v/QLSPsqeA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 67984)
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
