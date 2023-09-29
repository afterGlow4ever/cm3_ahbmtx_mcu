///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        18K-bit Configurable Synchronous Block RAM
// /___/   /\      Filename    : RAMB18E5.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  02/04/2017 - initial from E2
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAMB18E5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CASCADE_ORDER_A = "NONE",
  parameter CASCADE_ORDER_B = "NONE",
  parameter CLOCK_DOMAINS = "INDEPENDENT",
  parameter integer DOA_REG = 1,
  parameter integer DOB_REG = 1,
  parameter [255:0] INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter INIT_FILE = "NONE",
  parameter [0:0] IS_ARST_A_INVERTED = 1'b0,
  parameter [0:0] IS_ARST_B_INVERTED = 1'b0,
  parameter [0:0] IS_CLKARDCLK_INVERTED = 1'b0,
  parameter [0:0] IS_CLKBWRCLK_INVERTED = 1'b0,
  parameter [0:0] IS_ENARDEN_INVERTED = 1'b0,
  parameter [0:0] IS_ENBWREN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTRAMARSTRAM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTRAMB_INVERTED = 1'b0,
  parameter [0:0] IS_RSTREGARSTREG_INVERTED = 1'b0,
  parameter [0:0] IS_RSTREGB_INVERTED = 1'b0,
  parameter PR_SAVE_DATA = "FALSE",
  //parameter integer READ_WIDTH_A = 36,
  //parameter integer READ_WIDTH_B = 18,
  parameter integer READ_WIDTH_A = 0,
  parameter integer READ_WIDTH_B = 0,
  parameter RSTREG_PRIORITY_A = "RSTREG",
  parameter RSTREG_PRIORITY_B = "RSTREG",
  parameter RST_MODE_A = "SYNC",
  parameter RST_MODE_B = "SYNC",
  parameter SIM_COLLISION_CHECK = "ALL",
  parameter SLEEP_ASYNC = "FALSE",
  parameter [17:0] SRVAL_A = 18'h00000,
  parameter [17:0] SRVAL_B = 18'h00000,
  parameter WRITE_MODE_A = "NO_CHANGE",
  parameter WRITE_MODE_B = "NO_CHANGE",
  //parameter integer WRITE_WIDTH_A = 18,
  //parameter integer WRITE_WIDTH_B = 36
  parameter integer WRITE_WIDTH_A = 0,
  parameter integer WRITE_WIDTH_B = 0
)(
  output [15:0] CASDOUTA,
  output [15:0] CASDOUTB,
  output [1:0] CASDOUTPA,
  output [1:0] CASDOUTPB,
  output [15:0] DOUTADOUT,
  output [15:0] DOUTBDOUT,
  output [1:0] DOUTPADOUTP,
  output [1:0] DOUTPBDOUTP,

  input [10:0] ADDRARDADDR,
  input [10:0] ADDRBWRADDR,
  input ARST_A,
  input ARST_B,
  input [15:0] CASDINA,
  input [15:0] CASDINB,
  input [1:0] CASDINPA,
  input [1:0] CASDINPB,
  input CASDOMUXA,
  input CASDOMUXB,
  input CASDOMUXEN_A,
  input CASDOMUXEN_B,
  input CASOREGIMUXA,
  input CASOREGIMUXB,
  input CASOREGIMUXEN_A,
  input CASOREGIMUXEN_B,
  input CLKARDCLK,
  input CLKBWRCLK,
  input [15:0] DINADIN,
  input [15:0] DINBDIN,
  input [1:0] DINPADINP,
  input [1:0] DINPBDINP,
  input ENARDEN,
  input ENBWREN,
  input REGCEAREGCE,
  input REGCEB,
  input RSTRAMARSTRAM,
  input RSTRAMB,
  input RSTREGARSTREG,
  input RSTREGB,
  input SLEEP,
  input [1:0] WEA,
  input [3:0] WEBWE
);
  
// define constants
  localparam MODULE_NAME = "RAMB18E5";

// Parameter encodings and registers
  localparam CASCADE_ORDER_A_FIRST = 1;
  localparam CASCADE_ORDER_A_LAST = 2;
  localparam CASCADE_ORDER_A_MIDDLE = 3;
  localparam CASCADE_ORDER_A_NONE = 0;
  localparam CASCADE_ORDER_B_FIRST = 1;
  localparam CASCADE_ORDER_B_LAST = 2;
  localparam CASCADE_ORDER_B_MIDDLE = 3;
  localparam CASCADE_ORDER_B_NONE = 0;
  localparam CLOCK_DOMAINS_COMMON = 1;
  localparam CLOCK_DOMAINS_INDEPENDENT = 0;
  localparam PR_SAVE_DATA_FALSE = 0;
  localparam PR_SAVE_DATA_TRUE = 1;
  localparam RSTREG_PRIORITY_A_REGCE = 1;
  localparam RSTREG_PRIORITY_A_RSTREG = 0;
  localparam RSTREG_PRIORITY_B_REGCE = 1;
  localparam RSTREG_PRIORITY_B_RSTREG = 0;
  localparam RST_MODE_A_ASYNC = 1;
  localparam RST_MODE_A_SYNC = 0;
  localparam RST_MODE_B_ASYNC = 1;
  localparam RST_MODE_B_SYNC = 0;
  localparam SIM_COLLISION_CHECK_ALL = 0;
  localparam SIM_COLLISION_CHECK_GENERATE_X_ONLY = 1;
  localparam SIM_COLLISION_CHECK_NONE = 2;
  localparam SIM_COLLISION_CHECK_WARNING_ONLY = 3;
  localparam SLEEP_ASYNC_FALSE = 0;
  localparam SLEEP_ASYNC_TRUE = 1;
  localparam WRITE_MODE_A_NO_CHANGE = 0;
  localparam WRITE_MODE_A_READ_FIRST = 1;
  localparam WRITE_MODE_A_WRITE_FIRST = 2;
  localparam WRITE_MODE_B_NO_CHANGE = 0;
  localparam WRITE_MODE_B_READ_FIRST = 1;
  localparam WRITE_MODE_B_WRITE_FIRST = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "RAMB18E5_dr.v"
`else
  reg [48:1] CASCADE_ORDER_A_REG = CASCADE_ORDER_A;
  reg [48:1] CASCADE_ORDER_B_REG = CASCADE_ORDER_B;
  reg [88:1] CLOCK_DOMAINS_REG = CLOCK_DOMAINS;
  reg [31:0] DOA_REG_REG = DOA_REG;
  reg [31:0] DOB_REG_REG = DOB_REG;
  reg [255:0] INITP_00_REG = INITP_00;
  reg [255:0] INITP_01_REG = INITP_01;
  reg [255:0] INITP_02_REG = INITP_02;
  reg [255:0] INITP_03_REG = INITP_03;
  reg [255:0] INITP_04_REG = INITP_04;
  reg [255:0] INITP_05_REG = INITP_05;
  reg [255:0] INITP_06_REG = INITP_06;
  reg [255:0] INITP_07_REG = INITP_07;
  reg [255:0] INIT_00_REG = INIT_00;
  reg [255:0] INIT_01_REG = INIT_01;
  reg [255:0] INIT_02_REG = INIT_02;
  reg [255:0] INIT_03_REG = INIT_03;
  reg [255:0] INIT_04_REG = INIT_04;
  reg [255:0] INIT_05_REG = INIT_05;
  reg [255:0] INIT_06_REG = INIT_06;
  reg [255:0] INIT_07_REG = INIT_07;
  reg [255:0] INIT_08_REG = INIT_08;
  reg [255:0] INIT_09_REG = INIT_09;
  reg [255:0] INIT_0A_REG = INIT_0A;
  reg [255:0] INIT_0B_REG = INIT_0B;
  reg [255:0] INIT_0C_REG = INIT_0C;
  reg [255:0] INIT_0D_REG = INIT_0D;
  reg [255:0] INIT_0E_REG = INIT_0E;
  reg [255:0] INIT_0F_REG = INIT_0F;
  reg [255:0] INIT_10_REG = INIT_10;
  reg [255:0] INIT_11_REG = INIT_11;
  reg [255:0] INIT_12_REG = INIT_12;
  reg [255:0] INIT_13_REG = INIT_13;
  reg [255:0] INIT_14_REG = INIT_14;
  reg [255:0] INIT_15_REG = INIT_15;
  reg [255:0] INIT_16_REG = INIT_16;
  reg [255:0] INIT_17_REG = INIT_17;
  reg [255:0] INIT_18_REG = INIT_18;
  reg [255:0] INIT_19_REG = INIT_19;
  reg [255:0] INIT_1A_REG = INIT_1A;
  reg [255:0] INIT_1B_REG = INIT_1B;
  reg [255:0] INIT_1C_REG = INIT_1C;
  reg [255:0] INIT_1D_REG = INIT_1D;
  reg [255:0] INIT_1E_REG = INIT_1E;
  reg [255:0] INIT_1F_REG = INIT_1F;
  reg [255:0] INIT_20_REG = INIT_20;
  reg [255:0] INIT_21_REG = INIT_21;
  reg [255:0] INIT_22_REG = INIT_22;
  reg [255:0] INIT_23_REG = INIT_23;
  reg [255:0] INIT_24_REG = INIT_24;
  reg [255:0] INIT_25_REG = INIT_25;
  reg [255:0] INIT_26_REG = INIT_26;
  reg [255:0] INIT_27_REG = INIT_27;
  reg [255:0] INIT_28_REG = INIT_28;
  reg [255:0] INIT_29_REG = INIT_29;
  reg [255:0] INIT_2A_REG = INIT_2A;
  reg [255:0] INIT_2B_REG = INIT_2B;
  reg [255:0] INIT_2C_REG = INIT_2C;
  reg [255:0] INIT_2D_REG = INIT_2D;
  reg [255:0] INIT_2E_REG = INIT_2E;
  reg [255:0] INIT_2F_REG = INIT_2F;
  reg [255:0] INIT_30_REG = INIT_30;
  reg [255:0] INIT_31_REG = INIT_31;
  reg [255:0] INIT_32_REG = INIT_32;
  reg [255:0] INIT_33_REG = INIT_33;
  reg [255:0] INIT_34_REG = INIT_34;
  reg [255:0] INIT_35_REG = INIT_35;
  reg [255:0] INIT_36_REG = INIT_36;
  reg [255:0] INIT_37_REG = INIT_37;
  reg [255:0] INIT_38_REG = INIT_38;
  reg [255:0] INIT_39_REG = INIT_39;
  reg [255:0] INIT_3A_REG = INIT_3A;
  reg [255:0] INIT_3B_REG = INIT_3B;
  reg [255:0] INIT_3C_REG = INIT_3C;
  reg [255:0] INIT_3D_REG = INIT_3D;
  reg [255:0] INIT_3E_REG = INIT_3E;
  reg [255:0] INIT_3F_REG = INIT_3F;
  reg [0:0] IS_ARST_A_INVERTED_REG = IS_ARST_A_INVERTED;
  reg [0:0] IS_ARST_B_INVERTED_REG = IS_ARST_B_INVERTED;
  reg [0:0] IS_CLKARDCLK_INVERTED_REG = IS_CLKARDCLK_INVERTED;
  reg [0:0] IS_CLKBWRCLK_INVERTED_REG = IS_CLKBWRCLK_INVERTED;
  reg [0:0] IS_ENARDEN_INVERTED_REG = IS_ENARDEN_INVERTED;
  reg [0:0] IS_ENBWREN_INVERTED_REG = IS_ENBWREN_INVERTED;
  reg [0:0] IS_RSTRAMARSTRAM_INVERTED_REG = IS_RSTRAMARSTRAM_INVERTED;
  reg [0:0] IS_RSTRAMB_INVERTED_REG = IS_RSTRAMB_INVERTED;
  reg [0:0] IS_RSTREGARSTREG_INVERTED_REG = IS_RSTREGARSTREG_INVERTED;
  reg [0:0] IS_RSTREGB_INVERTED_REG = IS_RSTREGB_INVERTED;
  reg [40:1] PR_SAVE_DATA_REG = PR_SAVE_DATA;
  reg [31:0] READ_WIDTH_A_REG = READ_WIDTH_A;
  reg [31:0] READ_WIDTH_B_REG = READ_WIDTH_B;
  reg [48:1] RSTREG_PRIORITY_A_REG = RSTREG_PRIORITY_A;
  reg [48:1] RSTREG_PRIORITY_B_REG = RSTREG_PRIORITY_B;
  reg [40:1] RST_MODE_A_REG = RST_MODE_A;
  reg [40:1] RST_MODE_B_REG = RST_MODE_B;
  reg [120:1] SIM_COLLISION_CHECK_REG = SIM_COLLISION_CHECK;
  reg [40:1] SLEEP_ASYNC_REG = SLEEP_ASYNC;
  reg [17:0] SRVAL_A_REG = SRVAL_A;
  reg [17:0] SRVAL_B_REG = SRVAL_B;
  reg [88:1] WRITE_MODE_A_REG = WRITE_MODE_A;
  reg [88:1] WRITE_MODE_B_REG = WRITE_MODE_B;
  reg [31:0] WRITE_WIDTH_A_REG = WRITE_WIDTH_A;
  reg [31:0] WRITE_WIDTH_B_REG = WRITE_WIDTH_B;
`endif

`ifdef XIL_XECLIB
  wire [1:0] CASCADE_ORDER_A_BIN;
  wire [1:0] CASCADE_ORDER_B_BIN;
  wire CLOCK_DOMAINS_BIN;
  wire DOA_REG_BIN;
  wire DOB_REG_BIN;
  wire PR_SAVE_DATA_BIN;
  wire [5:0] READ_WIDTH_A_BIN;
  wire [4:0] READ_WIDTH_B_BIN;
  wire RSTREG_PRIORITY_A_BIN;
  wire RSTREG_PRIORITY_B_BIN;
  wire RST_MODE_A_BIN;
  wire RST_MODE_B_BIN;
  wire [1:0] SIM_COLLISION_CHECK_BIN;
  wire SLEEP_ASYNC_BIN;
  wire [1:0] WRITE_MODE_A_BIN;
  wire [1:0] WRITE_MODE_B_BIN;
  wire [4:0] WRITE_WIDTH_A_BIN;
  wire [5:0] WRITE_WIDTH_B_BIN;
`else
  reg [1:0] CASCADE_ORDER_A_BIN;
  reg [1:0] CASCADE_ORDER_B_BIN;
  reg CLOCK_DOMAINS_BIN;
  reg DOA_REG_BIN;
  reg DOB_REG_BIN;
  reg PR_SAVE_DATA_BIN;
  reg [5:0] READ_WIDTH_A_BIN;
  reg [4:0] READ_WIDTH_B_BIN;
  reg RSTREG_PRIORITY_A_BIN;
  reg RSTREG_PRIORITY_B_BIN;
  reg RST_MODE_A_BIN;
  reg RST_MODE_B_BIN;
  reg [1:0] SIM_COLLISION_CHECK_BIN;
  reg SLEEP_ASYNC_BIN;
  reg [1:0] WRITE_MODE_A_BIN;
  reg [1:0] WRITE_MODE_B_BIN;
  reg [4:0] WRITE_WIDTH_A_BIN;
  reg [5:0] WRITE_WIDTH_B_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ARST_A_in;
  wire ARST_B_in;
  wire CASDOMUXA_in;
  wire CASDOMUXB_in;
  wire CASDOMUXEN_A_in;
  wire CASDOMUXEN_B_in;
  wire CASOREGIMUXA_in;
  wire CASOREGIMUXB_in;
  wire CASOREGIMUXEN_A_in;
  wire CASOREGIMUXEN_B_in;
  wire CLKARDCLK_in;
  wire CLKBWRCLK_in;
  wire ENARDEN_in;
  wire ENBWREN_in;
  wire REGCEAREGCE_in;
  wire REGCEB_in;
  wire RSTRAMARSTRAM_in;
  wire RSTRAMB_in;
  wire RSTREGARSTREG_in;
  wire RSTREGB_in;
  wire SLEEP_in;
  wire [10:0] ADDRARDADDR_in;
  wire [10:0] ADDRBWRADDR_in;
  wire [15:0] CASDINA_in;
  wire [15:0] CASDINB_in;
  wire [15:0] DINADIN_in;
  wire [15:0] DINBDIN_in;
  wire [1:0] CASDINPA_in;
  wire [1:0] CASDINPB_in;
  wire [1:0] DINPADINP_in;
  wire [1:0] DINPBDINP_in;
  wire [1:0] WEA_in;
  wire [3:0] WEBWE_in;

  assign ADDRARDADDR_in = ADDRARDADDR;
  assign ADDRBWRADDR_in = ADDRBWRADDR;
  assign ARST_A_in = (ARST_A !== 1'bz) && (ARST_A ^ IS_ARST_A_INVERTED_REG); // rv 0
  assign ARST_B_in = (ARST_B !== 1'bz) && (ARST_B ^ IS_ARST_B_INVERTED_REG); // rv 0
  assign CASDINA_in[0] = (CASDINA[0] !== 1'bz) && CASDINA[0]; // rv 0
  assign CASDINA_in[10] = (CASDINA[10] !== 1'bz) && CASDINA[10]; // rv 0
  assign CASDINA_in[11] = (CASDINA[11] !== 1'bz) && CASDINA[11]; // rv 0
  assign CASDINA_in[12] = (CASDINA[12] !== 1'bz) && CASDINA[12]; // rv 0
  assign CASDINA_in[13] = (CASDINA[13] !== 1'bz) && CASDINA[13]; // rv 0
  assign CASDINA_in[14] = (CASDINA[14] !== 1'bz) && CASDINA[14]; // rv 0
  assign CASDINA_in[15] = (CASDINA[15] !== 1'bz) && CASDINA[15]; // rv 0
  assign CASDINA_in[1] = (CASDINA[1] !== 1'bz) && CASDINA[1]; // rv 0
  assign CASDINA_in[2] = (CASDINA[2] !== 1'bz) && CASDINA[2]; // rv 0
  assign CASDINA_in[3] = (CASDINA[3] !== 1'bz) && CASDINA[3]; // rv 0
  assign CASDINA_in[4] = (CASDINA[4] !== 1'bz) && CASDINA[4]; // rv 0
  assign CASDINA_in[5] = (CASDINA[5] !== 1'bz) && CASDINA[5]; // rv 0
  assign CASDINA_in[6] = (CASDINA[6] !== 1'bz) && CASDINA[6]; // rv 0
  assign CASDINA_in[7] = (CASDINA[7] !== 1'bz) && CASDINA[7]; // rv 0
  assign CASDINA_in[8] = (CASDINA[8] !== 1'bz) && CASDINA[8]; // rv 0
  assign CASDINA_in[9] = (CASDINA[9] !== 1'bz) && CASDINA[9]; // rv 0
  assign CASDINB_in[0] = (CASDINB[0] !== 1'bz) && CASDINB[0]; // rv 0
  assign CASDINB_in[10] = (CASDINB[10] !== 1'bz) && CASDINB[10]; // rv 0
  assign CASDINB_in[11] = (CASDINB[11] !== 1'bz) && CASDINB[11]; // rv 0
  assign CASDINB_in[12] = (CASDINB[12] !== 1'bz) && CASDINB[12]; // rv 0
  assign CASDINB_in[13] = (CASDINB[13] !== 1'bz) && CASDINB[13]; // rv 0
  assign CASDINB_in[14] = (CASDINB[14] !== 1'bz) && CASDINB[14]; // rv 0
  assign CASDINB_in[15] = (CASDINB[15] !== 1'bz) && CASDINB[15]; // rv 0
  assign CASDINB_in[1] = (CASDINB[1] !== 1'bz) && CASDINB[1]; // rv 0
  assign CASDINB_in[2] = (CASDINB[2] !== 1'bz) && CASDINB[2]; // rv 0
  assign CASDINB_in[3] = (CASDINB[3] !== 1'bz) && CASDINB[3]; // rv 0
  assign CASDINB_in[4] = (CASDINB[4] !== 1'bz) && CASDINB[4]; // rv 0
  assign CASDINB_in[5] = (CASDINB[5] !== 1'bz) && CASDINB[5]; // rv 0
  assign CASDINB_in[6] = (CASDINB[6] !== 1'bz) && CASDINB[6]; // rv 0
  assign CASDINB_in[7] = (CASDINB[7] !== 1'bz) && CASDINB[7]; // rv 0
  assign CASDINB_in[8] = (CASDINB[8] !== 1'bz) && CASDINB[8]; // rv 0
  assign CASDINB_in[9] = (CASDINB[9] !== 1'bz) && CASDINB[9]; // rv 0
  assign CASDINPA_in[0] = (CASDINPA[0] !== 1'bz) && CASDINPA[0]; // rv 0
  assign CASDINPA_in[1] = (CASDINPA[1] !== 1'bz) && CASDINPA[1]; // rv 0
  assign CASDINPB_in[0] = (CASDINPB[0] !== 1'bz) && CASDINPB[0]; // rv 0
  assign CASDINPB_in[1] = (CASDINPB[1] !== 1'bz) && CASDINPB[1]; // rv 0
  assign CASDOMUXA_in = (CASDOMUXA !== 1'bz) && CASDOMUXA; // rv 0
  assign CASDOMUXB_in = (CASDOMUXB !== 1'bz) && CASDOMUXB; // rv 0
  assign CASDOMUXEN_A_in = (CASDOMUXEN_A === 1'bz) || CASDOMUXEN_A; // rv 1
  assign CASDOMUXEN_B_in = (CASDOMUXEN_B === 1'bz) || CASDOMUXEN_B; // rv 1
  assign CASOREGIMUXA_in = (CASOREGIMUXA !== 1'bz) && CASOREGIMUXA; // rv 0
  assign CASOREGIMUXB_in = (CASOREGIMUXB !== 1'bz) && CASOREGIMUXB; // rv 0
  assign CASOREGIMUXEN_A_in = (CASOREGIMUXEN_A === 1'bz) || CASOREGIMUXEN_A; // rv 1
  assign CASOREGIMUXEN_B_in = (CASOREGIMUXEN_B === 1'bz) || CASOREGIMUXEN_B; // rv 1
  assign CLKARDCLK_in = (CLKARDCLK !== 1'bz) && (CLKARDCLK ^ IS_CLKARDCLK_INVERTED_REG); // rv 0
  assign CLKBWRCLK_in = (CLKBWRCLK !== 1'bz) && (CLKBWRCLK ^ IS_CLKBWRCLK_INVERTED_REG); // rv 0
  assign DINADIN_in = DINADIN;
  assign DINBDIN_in = DINBDIN;
  assign DINPADINP_in = DINPADINP;
  assign DINPBDINP_in = DINPBDINP;
  assign ENARDEN_in = (ENARDEN !== 1'bz) && (ENARDEN ^ IS_ENARDEN_INVERTED_REG); // rv 0
  assign ENBWREN_in = (ENBWREN !== 1'bz) && (ENBWREN ^ IS_ENBWREN_INVERTED_REG); // rv 0
  assign REGCEAREGCE_in = (REGCEAREGCE === 1'bz) || REGCEAREGCE; // rv 1
  assign REGCEB_in = (REGCEB === 1'bz) || REGCEB; // rv 1
  assign RSTRAMARSTRAM_in = (RSTRAMARSTRAM !== 1'bz) && (RSTRAMARSTRAM ^ IS_RSTRAMARSTRAM_INVERTED_REG); // rv 0
  assign RSTRAMB_in = (RSTRAMB !== 1'bz) && (RSTRAMB ^ IS_RSTRAMB_INVERTED_REG); // rv 0
  assign RSTREGARSTREG_in = (RSTREGARSTREG !== 1'bz) && (RSTREGARSTREG ^ IS_RSTREGARSTREG_INVERTED_REG); // rv 0
  assign RSTREGB_in = (RSTREGB !== 1'bz) && (RSTREGB ^ IS_RSTREGB_INVERTED_REG); // rv 0
  assign SLEEP_in = (SLEEP !== 1'bz) && SLEEP; // rv 0
  assign WEA_in[0] = (WEA[0] === 1'bz) || WEA[0]; // rv 1
  assign WEA_in[1] = (WEA[1] === 1'bz) || WEA[1]; // rv 1
  assign WEBWE_in[0] = (WEBWE[0] === 1'bz) || WEBWE[0]; // rv 1
  assign WEBWE_in[1] = (WEBWE[1] === 1'bz) || WEBWE[1]; // rv 1
  assign WEBWE_in[2] = (WEBWE[2] === 1'bz) || WEBWE[2]; // rv 1
  assign WEBWE_in[3] = (WEBWE[3] === 1'bz) || WEBWE[3]; // rv 1

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifdef XIL_XECLIB
  assign CASCADE_ORDER_A_BIN =
    (CASCADE_ORDER_A_REG == "NONE") ? CASCADE_ORDER_A_NONE :
    (CASCADE_ORDER_A_REG == "FIRST") ? CASCADE_ORDER_A_FIRST :
    (CASCADE_ORDER_A_REG == "LAST") ? CASCADE_ORDER_A_LAST :
    (CASCADE_ORDER_A_REG == "MIDDLE") ? CASCADE_ORDER_A_MIDDLE :
     CASCADE_ORDER_A_NONE;

  assign CASCADE_ORDER_B_BIN =
    (CASCADE_ORDER_B_REG == "NONE") ? CASCADE_ORDER_B_NONE :
    (CASCADE_ORDER_B_REG == "FIRST") ? CASCADE_ORDER_B_FIRST :
    (CASCADE_ORDER_B_REG == "LAST") ? CASCADE_ORDER_B_LAST :
    (CASCADE_ORDER_B_REG == "MIDDLE") ? CASCADE_ORDER_B_MIDDLE :
     CASCADE_ORDER_B_NONE;

  assign CLOCK_DOMAINS_BIN =
    (CLOCK_DOMAINS_REG == "INDEPENDENT") ? CLOCK_DOMAINS_INDEPENDENT :
    (CLOCK_DOMAINS_REG == "COMMON") ? CLOCK_DOMAINS_COMMON :
     CLOCK_DOMAINS_INDEPENDENT;

  assign DOA_REG_BIN = DOA_REG_REG[0];
  
  assign DOB_REG_BIN = DOB_REG_REG[0];

  assign PR_SAVE_DATA_BIN =
      (PR_SAVE_DATA_REG == "FALSE") ? PR_SAVE_DATA_FALSE :
      (PR_SAVE_DATA_REG == "TRUE") ? PR_SAVE_DATA_TRUE :
       PR_SAVE_DATA_FALSE;

  assign READ_WIDTH_A_BIN = READ_WIDTH_A_REG[5:0];
  
  assign READ_WIDTH_B_BIN = READ_WIDTH_B_REG[4:0];

  assign RSTREG_PRIORITY_A_BIN =
    (RSTREG_PRIORITY_A_REG == "RSTREG") ? RSTREG_PRIORITY_A_RSTREG :
    (RSTREG_PRIORITY_A_REG == "REGCE") ? RSTREG_PRIORITY_A_REGCE :
     RSTREG_PRIORITY_A_RSTREG;

  assign RSTREG_PRIORITY_B_BIN =
    (RSTREG_PRIORITY_B_REG == "RSTREG") ? RSTREG_PRIORITY_B_RSTREG :
    (RSTREG_PRIORITY_B_REG == "REGCE") ? RSTREG_PRIORITY_B_REGCE :
     RSTREG_PRIORITY_B_RSTREG;

  assign RST_MODE_A_BIN =
      (RST_MODE_A_REG == "SYNC") ? RST_MODE_A_SYNC :
      (RST_MODE_A_REG == "ASYNC") ? RST_MODE_A_ASYNC :
       RST_MODE_A_SYNC;
  
  assign RST_MODE_B_BIN =
      (RST_MODE_B_REG == "SYNC") ? RST_MODE_B_SYNC :
      (RST_MODE_B_REG == "ASYNC") ? RST_MODE_B_ASYNC :
       RST_MODE_B_SYNC;

  assign SIM_COLLISION_CHECK_BIN =
    (SIM_COLLISION_CHECK_REG == "ALL") ? SIM_COLLISION_CHECK_ALL :
    (SIM_COLLISION_CHECK_REG == "GENERATE_X_ONLY") ? SIM_COLLISION_CHECK_GENERATE_X_ONLY :
    (SIM_COLLISION_CHECK_REG == "NONE") ? SIM_COLLISION_CHECK_NONE :
    (SIM_COLLISION_CHECK_REG == "WARNING_ONLY") ? SIM_COLLISION_CHECK_WARNING_ONLY :
     SIM_COLLISION_CHECK_ALL;

  assign SLEEP_ASYNC_BIN =
    (SLEEP_ASYNC_REG == "FALSE") ? SLEEP_ASYNC_FALSE :
    (SLEEP_ASYNC_REG == "TRUE") ? SLEEP_ASYNC_TRUE :
     SLEEP_ASYNC_FALSE;

  assign WRITE_MODE_A_BIN =
    (WRITE_MODE_A_REG == "NO_CHANGE") ? WRITE_MODE_A_NO_CHANGE :
    (WRITE_MODE_A_REG == "READ_FIRST") ? WRITE_MODE_A_READ_FIRST :
    (WRITE_MODE_A_REG == "WRITE_FIRST") ? WRITE_MODE_A_WRITE_FIRST :
     WRITE_MODE_A_NO_CHANGE;

  assign WRITE_MODE_B_BIN =
    (WRITE_MODE_B_REG == "NO_CHANGE") ? WRITE_MODE_B_NO_CHANGE :
    (WRITE_MODE_B_REG == "READ_FIRST") ? WRITE_MODE_B_READ_FIRST :
    (WRITE_MODE_B_REG == "WRITE_FIRST") ? WRITE_MODE_B_WRITE_FIRST :
     WRITE_MODE_B_NO_CHANGE;

  assign WRITE_WIDTH_A_BIN = WRITE_WIDTH_A_REG[4:0];
  
  assign WRITE_WIDTH_B_BIN = WRITE_WIDTH_B_REG[5:0];

`else
  always @ (trig_attr) begin
  #1;
  CASCADE_ORDER_A_BIN =
    (CASCADE_ORDER_A_REG == "NONE") ? CASCADE_ORDER_A_NONE :
    (CASCADE_ORDER_A_REG == "FIRST") ? CASCADE_ORDER_A_FIRST :
    (CASCADE_ORDER_A_REG == "LAST") ? CASCADE_ORDER_A_LAST :
    (CASCADE_ORDER_A_REG == "MIDDLE") ? CASCADE_ORDER_A_MIDDLE :
     CASCADE_ORDER_A_NONE;

  CASCADE_ORDER_B_BIN =
    (CASCADE_ORDER_B_REG == "NONE") ? CASCADE_ORDER_B_NONE :
    (CASCADE_ORDER_B_REG == "FIRST") ? CASCADE_ORDER_B_FIRST :
    (CASCADE_ORDER_B_REG == "LAST") ? CASCADE_ORDER_B_LAST :
    (CASCADE_ORDER_B_REG == "MIDDLE") ? CASCADE_ORDER_B_MIDDLE :
     CASCADE_ORDER_B_NONE;

  CLOCK_DOMAINS_BIN =
    (CLOCK_DOMAINS_REG == "INDEPENDENT") ? CLOCK_DOMAINS_INDEPENDENT :
    (CLOCK_DOMAINS_REG == "COMMON") ? CLOCK_DOMAINS_COMMON :
     CLOCK_DOMAINS_INDEPENDENT;

  DOA_REG_BIN = DOA_REG_REG[0];
  
  DOB_REG_BIN = DOB_REG_REG[0];

  PR_SAVE_DATA_BIN =
      (PR_SAVE_DATA_REG == "FALSE") ? PR_SAVE_DATA_FALSE :
      (PR_SAVE_DATA_REG == "TRUE") ? PR_SAVE_DATA_TRUE :
       PR_SAVE_DATA_FALSE;

  READ_WIDTH_A_BIN = READ_WIDTH_A_REG[5:0];
  
  READ_WIDTH_B_BIN = READ_WIDTH_B_REG[4:0];

  RSTREG_PRIORITY_A_BIN =
    (RSTREG_PRIORITY_A_REG == "RSTREG") ? RSTREG_PRIORITY_A_RSTREG :
    (RSTREG_PRIORITY_A_REG == "REGCE") ? RSTREG_PRIORITY_A_REGCE :
     RSTREG_PRIORITY_A_RSTREG;

  RSTREG_PRIORITY_B_BIN =
    (RSTREG_PRIORITY_B_REG == "RSTREG") ? RSTREG_PRIORITY_B_RSTREG :
    (RSTREG_PRIORITY_B_REG == "REGCE") ? RSTREG_PRIORITY_B_REGCE :
     RSTREG_PRIORITY_B_RSTREG;

  RST_MODE_A_BIN =
      (RST_MODE_A_REG == "SYNC") ? RST_MODE_A_SYNC :
      (RST_MODE_A_REG == "ASYNC") ? RST_MODE_A_ASYNC :
       RST_MODE_A_SYNC;
  
  RST_MODE_B_BIN =
      (RST_MODE_B_REG == "SYNC") ? RST_MODE_B_SYNC :
      (RST_MODE_B_REG == "ASYNC") ? RST_MODE_B_ASYNC :
       RST_MODE_B_SYNC;

  SIM_COLLISION_CHECK_BIN =
    (SIM_COLLISION_CHECK_REG == "ALL") ? SIM_COLLISION_CHECK_ALL :
    (SIM_COLLISION_CHECK_REG == "GENERATE_X_ONLY") ? SIM_COLLISION_CHECK_GENERATE_X_ONLY :
    (SIM_COLLISION_CHECK_REG == "NONE") ? SIM_COLLISION_CHECK_NONE :
    (SIM_COLLISION_CHECK_REG == "WARNING_ONLY") ? SIM_COLLISION_CHECK_WARNING_ONLY :
     SIM_COLLISION_CHECK_ALL;

  SLEEP_ASYNC_BIN =
    (SLEEP_ASYNC_REG == "FALSE") ? SLEEP_ASYNC_FALSE :
    (SLEEP_ASYNC_REG == "TRUE") ? SLEEP_ASYNC_TRUE :
     SLEEP_ASYNC_FALSE;

  WRITE_MODE_A_BIN =
    (WRITE_MODE_A_REG == "NO_CHANGE") ? WRITE_MODE_A_NO_CHANGE :
    (WRITE_MODE_A_REG == "READ_FIRST") ? WRITE_MODE_A_READ_FIRST :
    (WRITE_MODE_A_REG == "WRITE_FIRST") ? WRITE_MODE_A_WRITE_FIRST :
     WRITE_MODE_A_NO_CHANGE;

  WRITE_MODE_B_BIN =
    (WRITE_MODE_B_REG == "NO_CHANGE") ? WRITE_MODE_B_NO_CHANGE :
    (WRITE_MODE_B_REG == "READ_FIRST") ? WRITE_MODE_B_READ_FIRST :
    (WRITE_MODE_B_REG == "WRITE_FIRST") ? WRITE_MODE_B_WRITE_FIRST :
     WRITE_MODE_B_NO_CHANGE;

  WRITE_WIDTH_A_BIN = WRITE_WIDTH_A_REG[4:0];
  
  WRITE_WIDTH_B_BIN = WRITE_WIDTH_B_REG[5:0];

   end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((CASCADE_ORDER_A_REG != "NONE") &&
         (CASCADE_ORDER_A_REG != "FIRST") &&
         (CASCADE_ORDER_A_REG != "LAST") &&
         (CASCADE_ORDER_A_REG != "MIDDLE"))) begin
      $display("Error: [Unisim %s-101] CASCADE_ORDER_A attribute is set to %s.  Legal values for this attribute are NONE, FIRST, LAST or MIDDLE. Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CASCADE_ORDER_B_REG != "NONE") &&
         (CASCADE_ORDER_B_REG != "FIRST") &&
         (CASCADE_ORDER_B_REG != "LAST") &&
         (CASCADE_ORDER_B_REG != "MIDDLE"))) begin
      $display("Error: [Unisim %s-102] CASCADE_ORDER_B attribute is set to %s.  Legal values for this attribute are NONE, FIRST, LAST or MIDDLE. Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLOCK_DOMAINS_REG != "INDEPENDENT") &&
         (CLOCK_DOMAINS_REG != "COMMON"))) begin
      $display("Error: [Unisim %s-103] CLOCK_DOMAINS attribute is set to %s.  Legal values for this attribute are INDEPENDENT or COMMON. Instance: %m", MODULE_NAME, CLOCK_DOMAINS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DOA_REG_REG != 1) &&
         (DOA_REG_REG != 0))) begin
      $display("Error: [Unisim %s-104] DOA_REG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DOA_REG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DOB_REG_REG != 1) &&
         (DOB_REG_REG != 0))) begin
      $display("Error: [Unisim %s-105] DOB_REG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DOB_REG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((PR_SAVE_DATA_REG != "FALSE") &&
       (PR_SAVE_DATA_REG != "TRUE"))) begin
    $display("Error: [Unisim %s-189] PR_SAVE_DATA attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PR_SAVE_DATA_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((READ_WIDTH_A_REG != 36) &&
         (READ_WIDTH_A_REG != 0) &&
         (READ_WIDTH_A_REG != 9) &&
         (READ_WIDTH_A_REG != 18))) begin
      $display("Error: [Unisim %s-190] READ_WIDTH_A attribute is set to %d.  Legal values for this attribute are 36, 0, 9 or 18. Instance: %m", MODULE_NAME, READ_WIDTH_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((READ_WIDTH_B_REG != 18) &&
         (READ_WIDTH_B_REG != 0) &&
         (READ_WIDTH_B_REG != 9))) begin
      $display("Error: [Unisim %s-191] READ_WIDTH_B attribute is set to %d.  Legal values for this attribute are 18, 0 or 9. Instance: %m", MODULE_NAME, READ_WIDTH_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSTREG_PRIORITY_A_REG != "RSTREG") &&
         (RSTREG_PRIORITY_A_REG != "REGCE"))) begin
      $display("Error: [Unisim %s-192] RSTREG_PRIORITY_A attribute is set to %s.  Legal values for this attribute are RSTREG or REGCE. Instance: %m", MODULE_NAME, RSTREG_PRIORITY_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSTREG_PRIORITY_B_REG != "RSTREG") &&
         (RSTREG_PRIORITY_B_REG != "REGCE"))) begin
      $display("Error: [Unisim %s-193] RSTREG_PRIORITY_B attribute is set to %s.  Legal values for this attribute are RSTREG or REGCE. Instance: %m", MODULE_NAME, RSTREG_PRIORITY_B_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((RST_MODE_A_REG != "SYNC") &&
       (RST_MODE_A_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-194] RST_MODE_A attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RST_MODE_A_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((RST_MODE_B_REG != "SYNC") &&
       (RST_MODE_B_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-195] RST_MODE_B attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RST_MODE_B_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((SIM_COLLISION_CHECK_REG != "ALL") &&
         (SIM_COLLISION_CHECK_REG != "GENERATE_X_ONLY") &&
         (SIM_COLLISION_CHECK_REG != "NONE") &&
         (SIM_COLLISION_CHECK_REG != "WARNING_ONLY"))) begin
      $display("Error: [Unisim %s-196] SIM_COLLISION_CHECK attribute is set to %s.  Legal values for this attribute are ALL, GENERATE_X_ONLY, NONE or WARNING_ONLY. Instance: %m", MODULE_NAME, SIM_COLLISION_CHECK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SLEEP_ASYNC_REG != "FALSE") &&
         (SLEEP_ASYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-197] SLEEP_ASYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SLEEP_ASYNC_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_MODE_A_REG != "NO_CHANGE") &&
         (WRITE_MODE_A_REG != "READ_FIRST") &&
         (WRITE_MODE_A_REG != "WRITE_FIRST"))) begin
      $display("Error: [Unisim %s-200] WRITE_MODE_A attribute is set to %s.  Legal values for this attribute are NO_CHANGE, READ_FIRST or WRITE_FIRST. Instance: %m", MODULE_NAME, WRITE_MODE_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_MODE_B_REG != "NO_CHANGE") &&
         (WRITE_MODE_B_REG != "READ_FIRST") &&
         (WRITE_MODE_B_REG != "WRITE_FIRST"))) begin
      $display("Error: [Unisim %s-201] WRITE_MODE_B attribute is set to %s.  Legal values for this attribute are NO_CHANGE, READ_FIRST or WRITE_FIRST. Instance: %m", MODULE_NAME, WRITE_MODE_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_WIDTH_A_REG != 18) &&
         (WRITE_WIDTH_A_REG != 0) &&
         (WRITE_WIDTH_A_REG != 9))) begin
      $display("Error: [Unisim %s-202] WRITE_WIDTH_A attribute is set to %d.  Legal values for this attribute are 18, 0 or 9. Instance: %m", MODULE_NAME, WRITE_WIDTH_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_WIDTH_B_REG != 36) &&
         (WRITE_WIDTH_B_REG != 0) &&
         (WRITE_WIDTH_B_REG != 9) &&
         (WRITE_WIDTH_B_REG != 18))) begin
      $display("Error: [Unisim %s-203] WRITE_WIDTH_B attribute is set to %d.  Legal values for this attribute are 36, 0, 9 or 18. Instance: %m", MODULE_NAME, WRITE_WIDTH_B_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
// internal variables, signals, busses

  localparam integer ADDR_WIDTH = 14;
  localparam integer INIT_WIDTH = 36;
  localparam integer D_WIDTH = 32;
  localparam integer DP_WIDTH = 4;

  localparam mem_width = 1;
  localparam memp_width = 1;
  localparam mem_size = 16384;
  localparam mem_depth = mem_size;
  localparam memp_depth = mem_size/8;
  localparam mem_pad = 32;
  localparam memp_pad = 4;
//localparam tmp_mem_width = (READ_WIDTH_A >= READ_WIDTH_B) ? READ_WIDTH_A : READ_WIDTH_B;
  localparam tmp_mem_width = (READ_WIDTH_A >= READ_WIDTH_B) ? ((READ_WIDTH_A == 0) ? 9 : READ_WIDTH_A) : 
                                                              READ_WIDTH_B;
  localparam tmp_memp_width = (tmp_mem_width <  9) ? 0 :
                              (tmp_mem_width < 18) ? 1 :
                              (tmp_mem_width < 36) ? 2 :
                              (tmp_mem_width < 72) ? 4 : 8;
  localparam tmp_mem_depth = mem_size/(tmp_mem_width-tmp_memp_width);

  reg [15:0] CASDOUTA_out;
  reg [15:0] CASDOUTB_out;
  reg [15:0] DOUTADOUT_out;
  reg [15:0] DOUTBDOUT_out;
  reg [1:0] CASDOUTPA_out;
  reg [1:0] CASDOUTPB_out;
  reg [1:0] DOUTPADOUTP_out;
  reg [1:0] DOUTPBDOUTP_out;

  reg [tmp_mem_width-1:0] tmp_mem_tmp = 0;
  integer t_coll_min = 50;
  integer t_coll_max = 500 - 99;
  reg [255:0] INITP_TMP;
  reg [255:0] INIT_TMP;
  integer i=0;
  integer j=0;
  integer k=0;
  integer ra=0;
  integer raa=0;
  integer raw=0;
  integer wb=0;
  integer rb=0;
  integer rbb=0;
  integer rbw=0;
  integer wa=0;
  integer rd_loops_a = 1;
  integer wr_loops_a = 1;
  integer rd_loops_b = 1;
  integer rd_loops_f = 1;
  integer wr_loops_b = 1;
  localparam max_rd_loops = D_WIDTH;
  localparam max_wr_loops = D_WIDTH;
  wire SLEEP_A_int;
  wire SLEEP_B_int;
  reg  [1:0] SLEEP_A_reg = 2'b0;
  reg  [1:0] SLEEP_B_reg = 2'b0;
  wire RSTREG_A_int;
  wire REGCE_A_int;
  wire RSTREG_B_int;
  wire REGCE_B_int;
  reg CASDOMUXA_reg = 1'b0;
  reg CASOREGIMUXA_reg = 1'b0;
  reg CASDOMUXB_reg = 1'b0;
  reg CASOREGIMUXB_reg = 1'b0;
  wire CASDOMUXB_int;
  wire [INIT_WIDTH-1:0] SRVAL_A_int;
  wire [INIT_WIDTH/2-1:0] SRVAL_B_int;

  wire mem_wr_en_a;
  reg mem_wr_en_a_wf = 1'b0;
  reg [D_WIDTH/2-1:0] mem_we_a;
  reg [DP_WIDTH/2-1:0] memp_we_a;
  wire [D_WIDTH/2-1:0] mem_rm_doutb;
  wire [DP_WIDTH/2-1:0] memp_rm_doutb;
  wire [D_WIDTH-1:0] mem_rm_a;
  wire [D_WIDTH-1:0] mem_rm_b;
  wire [D_WIDTH-1:0] mem_wm_a;
  wire [D_WIDTH-1:0] mem_wm_b;
  reg wr_data_matches = 0;
  reg wr_a_data_matches_rd_b_data = 0;
  reg wr_b_data_matches_rd_a_data = 0;
  wire mem_wr_en_b;
  reg mem_wr_en_b_wf = 1'b0;
  reg [D_WIDTH-1:0] mem_we_b;
  reg [DP_WIDTH-1:0] memp_we_b;
  wire [D_WIDTH-1:0] mem_rm_douta;
  wire [DP_WIDTH-1:0] memp_rm_douta;
  wire mem_rd_en_a;
  wire mem_rst_a;
  reg mem_is_rst_a = 1'b0;
  wire mem_arst_a;
  wire mem_rd_en_b;
  wire mem_rst_b;
  reg mem_is_rst_b = 1'b0;
  wire mem_arst_b;
  reg first_time = 1'b1;

  reg                     mem      [0 : mem_depth+mem_pad-1];
  reg [D_WIDTH/2-1 : 0]  mem_wr_a;
  reg  wr_a_event = 1'b0;
  reg  wr_a_wf_event = 1'b0;
  reg  [D_WIDTH-1 : 0]  mem_rd_a;
  reg  [D_WIDTH-1 : 0]  mem_rd_a_wf;
  reg [D_WIDTH-1 : 0]  mem_wr_b;
  reg  wr_b_event = 1'b0;
  reg  wr_b_wf_event = 1'b0;
  reg  [D_WIDTH-1 : 0]  mem_rd_b;
  reg  [D_WIDTH-1 : 0]  mem_rd_b_rf;
  reg  [D_WIDTH-1 : 0]  mem_rd_b_wf;
  reg  [D_WIDTH-1 : 0]  mem_a_reg;
  reg [D_WIDTH-1 : 0]  mem_a_reg_mux;
  reg  [D_WIDTH-1 : 0]  mem_a_lat;
  reg  [D_WIDTH/2-1 : 0]  mem_b_reg;
  reg [D_WIDTH/2-1 : 0]  mem_b_reg_mux;
  reg  [D_WIDTH/2-1 : 0]  mem_b_lat;
  reg                     memp     [0 : memp_depth+memp_pad-1];
  reg [DP_WIDTH-1 : 0] memp_wr_a;
  reg  [DP_WIDTH-1 : 0] memp_rd_a;
  reg  [DP_WIDTH-1 : 0] memp_rd_a_wf;
  reg [DP_WIDTH-1 : 0] memp_wr_b;
  reg  [DP_WIDTH-1 : 0] memp_rd_b;
  reg  [DP_WIDTH-1 : 0] memp_rd_b_rf;
  reg  [DP_WIDTH-1 : 0] memp_rd_b_wf;
  reg  [DP_WIDTH-1 : 0]  memp_a_reg;
  reg [DP_WIDTH-1 : 0]  memp_a_reg_mux;
  reg  [DP_WIDTH-1 : 0]  memp_a_lat;
  reg [DP_WIDTH-1 : 0]  memp_a_out;
  reg  [DP_WIDTH/2-1 : 0]  memp_b_reg;
  reg [DP_WIDTH/2-1 : 0]  memp_b_reg_mux;
  reg  [DP_WIDTH/2-1 : 0]  memp_b_lat;
  reg [DP_WIDTH/2-1 : 0]  memp_b_out;
  wire [ADDR_WIDTH-1:0] rd_addr_a_mask;
  wire [ADDR_WIDTH-1:0] rd_addr_b_mask;
  wire [ADDR_WIDTH-1:0] wr_addr_a_mask;
  wire [ADDR_WIDTH-1:0] wr_addr_b_mask;
  reg [ADDR_WIDTH-1:0] rd_addr_a = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_a_last = 0;
  reg [ADDR_WIDTH-1:0] rd_addr_a_last = 0;
  reg rd_addr_a_valid = 0;
  reg rd_addr_a_nochange = 0;
  reg [63:0] rd_addr_a_count = 0;
  reg [63:0] rd_addr_a_nocount = 0;
  reg [ADDR_WIDTH-1:0] rd_addr_b = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_a = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_b_last = 0;
  reg [ADDR_WIDTH-1:0] rd_addr_b_last = 0;
  reg rd_addr_b_valid = 0;
  reg rd_addr_b_nochange = 0;
  reg [63:0] rd_addr_b_count = 0;
  reg [63:0] rd_addr_b_nocount = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_b = 0;
  reg wr_a_rd_b_addr_coll = 1'b0;
  reg wr_addr_coll = 1'b0;
  reg wr_b_rd_a_addr_coll = 1'b0;
  wire sdp_mode;
  wire sdp_mode_wr;
  wire sdp_mode_rd;

// clk period for collision window variables
integer t_max_a=3000, t_max_b=3000;
integer clk_period_a=10000, clk_period_b=10000;
reg clk_a_slowest = 1'b0;  //victor
reg [63:0] total_clks_a=1, total_clks_b=1;
reg clka_toggled=1'b0, clkb_toggled=1'b0;
reg clka_done=1'b0, clkb_done=1'b0;
reg clka_timeout=0, clkb_timeout=0;
reg clka_changed = 1'b0;
reg clkb_changed = 1'b0;
wire clks_done;
reg en_clk_sync = 1'b0;

task read_init_file;
reg [tmp_mem_width-1:0] tmp_mem [0:tmp_mem_depth-1];
integer w,d;
begin
  $readmemh (INIT_FILE, tmp_mem);
  for (d=0;d<tmp_mem_depth;d=d+1) begin
    tmp_mem_tmp = tmp_mem[d];
    for (w=0;w<tmp_mem_width-tmp_memp_width;w=w+1) begin
      mem[d*(tmp_mem_width-tmp_memp_width)+w] = tmp_mem[d][w];
    end
    if (tmp_memp_width > 0) begin
      for (w=0;w<tmp_memp_width;w=w+1) begin
        memp[d*tmp_memp_width+w] = tmp_mem[d][tmp_mem_width-tmp_memp_width+w];
      end
    end
  end
end
endtask

reg cas_a_warning = 1'b0;
reg cas_b_warning = 1'b0;
task is_cas_a_zero;
integer i;
begin
  cas_a_warning = 1'b0;
  for (i=0;i<=15;i=i+1) begin
    if (CASDINA[i] !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINA[%2d] signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_A_REG);
    end
  end
  for (i=0;i<=1;i=i+1) begin
    if (CASDINPA[i] !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINPA[%2d] signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_A_REG);
    end
  end
  if (CASDOMUXA !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXA signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASDOMUXEN_A !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXEN_A signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASOREGIMUXA !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXA signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASOREGIMUXEN_A !== 1'b0) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXEN_A signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
end
endtask // is_cas_a_zero

task is_cas_a_floating;
integer i;
begin
  cas_a_warning = 1'b0;
  for (i=0;i<=15;i=i+1) begin
    if (CASDINA[i] === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINA[%2d] signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_A_REG);
    end
  end
  for (i=0;i<=1;i=i+1) begin
    if (CASDINPA[i] === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINPA[%2d] signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_A_REG);
    end
  end
  if (CASDOMUXA === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXA signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASDOMUXEN_A === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXEN_A signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASOREGIMUXA === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXA signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
  if (CASOREGIMUXEN_A === 1'bz) begin
    cas_a_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXEN_A signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end
end
endtask // is_cas_a_floating

task is_cas_b_zero;
integer i;
begin
  cas_b_warning = 1'b0;
  for (i=0;i<=15;i=i+1) begin
    if (CASDINB[i] !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINB[%2d] signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_B_REG);
    end
  end
  for (i=0;i<=1;i=i+1) begin
    if (CASDINPB[i] !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINPB[%2d] signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_B_REG);
    end
  end
  if (CASDOMUXB !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXB signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASDOMUXEN_B !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXEN_B signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASOREGIMUXB !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXB signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASOREGIMUXEN_B !== 1'b0) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXEN_B signal is not tied low in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
end
endtask // is_cas_b_zero

task is_cas_b_floating;
integer i;
begin
  cas_b_warning = 1'b0;
  for (i=0;i<=15;i=i+1) begin
    if (CASDINB[i] === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINB[%2d] signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_B_REG);
    end
  end
  for (i=0;i<=1;i=i+1) begin
    if (CASDINPB[i] === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDINPB[%2d] signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, i, CASCADE_ORDER_B_REG);
    end
  end
  if (CASDOMUXB === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXB signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASDOMUXEN_B === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASDOMUXEN_B signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASOREGIMUXB === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXB signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
  if (CASOREGIMUXEN_B === 1'bz) begin
    cas_b_warning = 1'b1;
      $display("Warning: [Unisim %s-130] CASOREGIMUXEN_B signal is unconnected in CASCADE mode (%s) Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end
end
endtask // is_cas_b_floating

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
  #1;
    if ((CASCADE_ORDER_A_REG == "NONE") ||
        (CASCADE_ORDER_A_REG == "FIRST")) begin
       is_cas_a_zero;
       if (cas_a_warning) $display("Warning: [Unisim %s-126] CASCADE_ORDER_A attribute is set to %s and some or all of the CASCADE signals are not tied low. Simulation behavior may not match hardware under these circumstances. Please check that all CASCADE signals are properly tied off. Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end

    if ((CASCADE_ORDER_A_REG == "LAST") ||
        (CASCADE_ORDER_A_REG == "MIDDLE")) begin
       is_cas_a_floating;
       if (cas_a_warning) $display("Warning: [Unisim %s-126] CASCADE_ORDER_A attribute is set to %s and some or all of the CASCADE signals are unconnected. Simulation behavior may not match hardware under these circumstances. Please check that all CASCADE signals are properly connected. Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
    end

    if ((CASCADE_ORDER_B_REG == "NONE") ||
        (CASCADE_ORDER_B_REG == "FIRST")) begin
       is_cas_b_zero;
       if (cas_b_warning) $display("Warning: [Unisim %s-127] CASCADE_ORDER_B attribute is set to %s and some or all of the CASCADE signals are not tied low. Simulation behavior may not match hardware under these circumstances. Please check that all CASCADE signals are properly tied off. Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end

    if ((CASCADE_ORDER_B_REG == "LAST") ||
        (CASCADE_ORDER_B_REG == "MIDDLE")) begin
       is_cas_b_floating;
       if (cas_b_warning) $display("Warning: [Unisim %s-127] CASCADE_ORDER_B attribute is set to %s and some or all of the CASCADE signals are unconnected. Simulation behavior may not match hardware under these circumstances. Please check that all CASCADE signals are properly connected. Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_XECLIB
  wire [255:0] INITP_BIN [0:7];
  wire [255:0] INIT_BIN [0:63];
  assign INITP_BIN['h00] = INITP_00_REG;

  assign INITP_BIN['h01] = INITP_01_REG;

  assign INITP_BIN['h02] = INITP_02_REG;

  assign INITP_BIN['h03] = INITP_03_REG;

  assign INITP_BIN['h04] = INITP_04_REG;

  assign INITP_BIN['h05] = INITP_05_REG;

  assign INITP_BIN['h06] = INITP_06_REG;

  assign INITP_BIN['h07] = INITP_07_REG;

  assign INIT_BIN['h00] = INIT_00_REG;

  assign INIT_BIN['h01] = INIT_01_REG;

  assign INIT_BIN['h02] = INIT_02_REG;

  assign INIT_BIN['h03] = INIT_03_REG;

  assign INIT_BIN['h04] = INIT_04_REG;

  assign INIT_BIN['h05] = INIT_05_REG;

  assign INIT_BIN['h06] = INIT_06_REG;

  assign INIT_BIN['h07] = INIT_07_REG;

  assign INIT_BIN['h08] = INIT_08_REG;

  assign INIT_BIN['h09] = INIT_09_REG;

  assign INIT_BIN['h0A] = INIT_0A_REG;

  assign INIT_BIN['h0B] = INIT_0B_REG;

  assign INIT_BIN['h0C] = INIT_0C_REG;

  assign INIT_BIN['h0D] = INIT_0D_REG;

  assign INIT_BIN['h0E] = INIT_0E_REG;

  assign INIT_BIN['h0F] = INIT_0F_REG;

  assign INIT_BIN['h10] = INIT_10_REG;

  assign INIT_BIN['h11] = INIT_11_REG;

  assign INIT_BIN['h12] = INIT_12_REG;

  assign INIT_BIN['h13] = INIT_13_REG;

  assign INIT_BIN['h14] = INIT_14_REG;

  assign INIT_BIN['h15] = INIT_15_REG;

  assign INIT_BIN['h16] = INIT_16_REG;

  assign INIT_BIN['h17] = INIT_17_REG;

  assign INIT_BIN['h18] = INIT_18_REG;

  assign INIT_BIN['h19] = INIT_19_REG;

  assign INIT_BIN['h1A] = INIT_1A_REG;

  assign INIT_BIN['h1B] = INIT_1B_REG;

  assign INIT_BIN['h1C] = INIT_1C_REG;

  assign INIT_BIN['h1D] = INIT_1D_REG;

  assign INIT_BIN['h1E] = INIT_1E_REG;

  assign INIT_BIN['h1F] = INIT_1F_REG;

  assign INIT_BIN['h20] = INIT_20_REG;

  assign INIT_BIN['h21] = INIT_21_REG;

  assign INIT_BIN['h22] = INIT_22_REG;

  assign INIT_BIN['h23] = INIT_23_REG;

  assign INIT_BIN['h24] = INIT_24_REG;

  assign INIT_BIN['h25] = INIT_25_REG;

  assign INIT_BIN['h26] = INIT_26_REG;

  assign INIT_BIN['h27] = INIT_27_REG;

  assign INIT_BIN['h28] = INIT_28_REG;

  assign INIT_BIN['h29] = INIT_29_REG;

  assign INIT_BIN['h2A] = INIT_2A_REG;

  assign INIT_BIN['h2B] = INIT_2B_REG;

  assign INIT_BIN['h2C] = INIT_2C_REG;

  assign INIT_BIN['h2D] = INIT_2D_REG;

  assign INIT_BIN['h2E] = INIT_2E_REG;

  assign INIT_BIN['h2F] = INIT_2F_REG;

  assign INIT_BIN['h30] = INIT_30_REG;

  assign INIT_BIN['h31] = INIT_31_REG;

  assign INIT_BIN['h32] = INIT_32_REG;

  assign INIT_BIN['h33] = INIT_33_REG;

  assign INIT_BIN['h34] = INIT_34_REG;

  assign INIT_BIN['h35] = INIT_35_REG;

  assign INIT_BIN['h36] = INIT_36_REG;

  assign INIT_BIN['h37] = INIT_37_REG;

  assign INIT_BIN['h38] = INIT_38_REG;

  assign INIT_BIN['h39] = INIT_39_REG;

  assign INIT_BIN['h3A] = INIT_3A_REG;

  assign INIT_BIN['h3B] = INIT_3B_REG;

  assign INIT_BIN['h3C] = INIT_3C_REG;

  assign INIT_BIN['h3D] = INIT_3D_REG;

  assign INIT_BIN['h3E] = INIT_3E_REG;

  assign INIT_BIN['h3F] = INIT_3F_REG;

`else
  reg [255:0] INIT_BIN [0:63];
  reg [255:0] INITP_BIN [0:7];
  always @ (trig_attr) begin
  #1;
  INITP_BIN['h00] = INITP_00_REG;

  INITP_BIN['h01] = INITP_01_REG;

  INITP_BIN['h02] = INITP_02_REG;

  INITP_BIN['h03] = INITP_03_REG;

  INITP_BIN['h04] = INITP_04_REG;

  INITP_BIN['h05] = INITP_05_REG;

  INITP_BIN['h06] = INITP_06_REG;

  INITP_BIN['h07] = INITP_07_REG;

  INIT_BIN['h00] = INIT_00_REG;

  INIT_BIN['h01] = INIT_01_REG;

  INIT_BIN['h02] = INIT_02_REG;

  INIT_BIN['h03] = INIT_03_REG;

  INIT_BIN['h04] = INIT_04_REG;

  INIT_BIN['h05] = INIT_05_REG;

  INIT_BIN['h06] = INIT_06_REG;

  INIT_BIN['h07] = INIT_07_REG;

  INIT_BIN['h08] = INIT_08_REG;

  INIT_BIN['h09] = INIT_09_REG;

  INIT_BIN['h0A] = INIT_0A_REG;

  INIT_BIN['h0B] = INIT_0B_REG;

  INIT_BIN['h0C] = INIT_0C_REG;

  INIT_BIN['h0D] = INIT_0D_REG;

  INIT_BIN['h0E] = INIT_0E_REG;

  INIT_BIN['h0F] = INIT_0F_REG;

  INIT_BIN['h10] = INIT_10_REG;

  INIT_BIN['h11] = INIT_11_REG;

  INIT_BIN['h12] = INIT_12_REG;

  INIT_BIN['h13] = INIT_13_REG;

  INIT_BIN['h14] = INIT_14_REG;

  INIT_BIN['h15] = INIT_15_REG;

  INIT_BIN['h16] = INIT_16_REG;

  INIT_BIN['h17] = INIT_17_REG;

  INIT_BIN['h18] = INIT_18_REG;

  INIT_BIN['h19] = INIT_19_REG;

  INIT_BIN['h1A] = INIT_1A_REG;

  INIT_BIN['h1B] = INIT_1B_REG;

  INIT_BIN['h1C] = INIT_1C_REG;

  INIT_BIN['h1D] = INIT_1D_REG;

  INIT_BIN['h1E] = INIT_1E_REG;

  INIT_BIN['h1F] = INIT_1F_REG;

  INIT_BIN['h20] = INIT_20_REG;

  INIT_BIN['h21] = INIT_21_REG;

  INIT_BIN['h22] = INIT_22_REG;

  INIT_BIN['h23] = INIT_23_REG;

  INIT_BIN['h24] = INIT_24_REG;

  INIT_BIN['h25] = INIT_25_REG;

  INIT_BIN['h26] = INIT_26_REG;

  INIT_BIN['h27] = INIT_27_REG;

  INIT_BIN['h28] = INIT_28_REG;

  INIT_BIN['h29] = INIT_29_REG;

  INIT_BIN['h2A] = INIT_2A_REG;

  INIT_BIN['h2B] = INIT_2B_REG;

  INIT_BIN['h2C] = INIT_2C_REG;

  INIT_BIN['h2D] = INIT_2D_REG;

  INIT_BIN['h2E] = INIT_2E_REG;

  INIT_BIN['h2F] = INIT_2F_REG;

  INIT_BIN['h30] = INIT_30_REG;

  INIT_BIN['h31] = INIT_31_REG;

  INIT_BIN['h32] = INIT_32_REG;

  INIT_BIN['h33] = INIT_33_REG;

  INIT_BIN['h34] = INIT_34_REG;

  INIT_BIN['h35] = INIT_35_REG;

  INIT_BIN['h36] = INIT_36_REG;

  INIT_BIN['h37] = INIT_37_REG;

  INIT_BIN['h38] = INIT_38_REG;

  INIT_BIN['h39] = INIT_39_REG;

  INIT_BIN['h3A] = INIT_3A_REG;

  INIT_BIN['h3B] = INIT_3B_REG;

  INIT_BIN['h3C] = INIT_3C_REG;

  INIT_BIN['h3D] = INIT_3D_REG;

  INIT_BIN['h3E] = INIT_3E_REG;

  INIT_BIN['h3F] = INIT_3F_REG;

end
`endif

  assign CASDOUTA = CASDOUTA_out;
  assign CASDOUTB = CASDOUTB_out;
  assign CASDOUTPA = CASDOUTPA_out;
  assign CASDOUTPB = CASDOUTPB_out;
  assign DOUTADOUT = DOUTADOUT_out;
  assign DOUTBDOUT = DOUTBDOUT_out;
  assign DOUTPADOUTP = DOUTPADOUTP_out;
  assign DOUTPBDOUTP = DOUTPBDOUTP_out;

  assign mem_rst_a = (RSTRAMARSTRAM_in && (RST_MODE_A_BIN == RST_MODE_A_SYNC));
                  
  assign mem_arst_a = (ARST_A_in && (RST_MODE_A_BIN == RST_MODE_A_ASYNC));
  assign mem_rst_b = (sdp_mode_rd && (RSTRAMARSTRAM_in && (RST_MODE_A_BIN == RST_MODE_A_SYNC))) ||
                     (~sdp_mode_rd && (RSTRAMB_in && (RST_MODE_B_BIN == RST_MODE_B_SYNC)));
  assign mem_arst_b = (sdp_mode_rd && (ARST_A_in  && (RST_MODE_A_BIN == RST_MODE_A_ASYNC))) ||
                      (~sdp_mode_rd && (ARST_B_in  && (RST_MODE_B_BIN == RST_MODE_B_ASYNC)));
  always @ (*) begin
       mem_wr_a = {16'h0, DINADIN_in};
  end

  always @ (*) begin
       memp_wr_a = {2'b0, DINPADINP_in};
  end

  always @ (*) begin
    if (WRITE_WIDTH_B_BIN != 36) begin
        mem_wr_b = {16'h0, DINBDIN_in};
        memp_wr_b = {4'h0, DINPBDINP_in};
      end
    else begin
        mem_wr_b = {DINBDIN_in, DINADIN_in};
        memp_wr_b = {DINPBDINP_in, DINPADINP_in};
    end
  end


  assign mem_wr_en_a = ~sdp_mode && ENARDEN_in && (|mem_we_a || |memp_we_a);
  assign mem_rd_en_a = (WRITE_MODE_A_BIN == WRITE_MODE_A_NO_CHANGE) ?
                        ENARDEN_in && (~mem_wr_en_a || mem_rst_a || mem_arst_a) : ENARDEN_in;
  assign mem_wr_en_b = ENBWREN_in && (|mem_we_b || |memp_we_b);
  assign mem_rd_en_b = (WRITE_MODE_B_BIN == WRITE_MODE_B_NO_CHANGE) ?
                        ~sdp_mode && ENBWREN_in && (~mem_wr_en_b || mem_rst_b || mem_arst_b) :
                        ~sdp_mode && ENBWREN_in;

//victor DRC
reg sleep_is_asserted;
reg sleep_is_deasserted;
reg ENARDEN_p1;
reg ENBWREN_p1; 
reg SLEEPA_p1; 
reg SLEEPA_p2; 
reg SLEEPB_p1; 
reg SLEEPB_p2; 

  always @(SLEEP_in) begin
     sleep_is_asserted <= 1'b0;
     sleep_is_deasserted <= 1'b0;
     if (SLEEP_in == 1'b1)
        sleep_is_asserted <= 1'b1;
     else if (SLEEP_in == 1'b0)
        sleep_is_deasserted <= 1'b1;
  end

  //victor drc #5
  always @(posedge CLKARDCLK_in) begin
      if (SLEEP_ASYNC_REG == "FALSE") begin
         if (sleep_is_asserted && ENARDEN_in)
            $display("Error: [Unisim %s-23] DRC : When SLEEP_ASYNC = FALSE, ENA must be LOW in the clock cycle when SLEEP is going from LOW to HIGH. Instance: %m", MODULE_NAME); 
      end
  end
  always @(posedge CLKBWRCLK_in) begin
      if (SLEEP_ASYNC_REG == "FALSE") begin
         if (sleep_is_asserted && ENBWREN_in)
            $display("Error: [Unisim %s-23] DRC : When SLEEP_ASYNC = FALSE, ENB must be LOW in the clock cycle when SLEEP is going from LOW to HIGH. Instance: %m", MODULE_NAME); 
      end
  end

  always @(posedge CLKARDCLK_in) begin
      if (glblGSR)
         ENARDEN_p1 <= 1'b0;
      else
         ENARDEN_p1 <= ENARDEN_in;
  end
  always @(posedge CLKBWRCLK_in) begin
      if (glblGSR)
         ENBWREN_p1 <= 1'b0;
      else
         ENBWREN_p1 <= ENBWREN_in;
  end
  always @(posedge CLKARDCLK_in or posedge CLKBWRCLK_in) begin
      if (SLEEP_ASYNC_REG == "TRUE") begin
              if (clk_a_slowest) begin 
                 if (sleep_is_asserted && ENARDEN_p1)
                     $display("Error: [Unisim %s-23] DRC : When SLEEP_ASYNC = TRUE, ENA must be LOW at least one clock cycle (slowest clock) before SLEEP is going from LOW to HIGH. Instance: %m", MODULE_NAME); 
              end else begin
                 if (sleep_is_asserted && ENBWREN_p1)
                     $display("Error: [Unisim %s-23] DRC : When SLEEP_ASYNC = TRUE, ENB must be LOW at least one clock cycle (slowest clock) before SLEEP is going from LOW to HIGH. Instance: %m", MODULE_NAME); 
              end
      end
  end

  //victor drc #6
  always @(posedge CLKARDCLK_in) begin
      if (glblGSR) begin
         SLEEPA_p1 <= 1'b0;
         SLEEPA_p2 <= 1'b0;
      end
      else begin
         SLEEPA_p1 <= SLEEP_in;
         SLEEPA_p2 <= SLEEPA_p1;
      end
  end
  always @(posedge CLKBWRCLK_in) begin
      if (glblGSR) begin
         SLEEPB_p1 <= 1'b0;
         SLEEPB_p2 <= 1'b0;
      end
      else begin
         SLEEPB_p1 <= SLEEP_in;
         SLEEPB_p2 <= SLEEPB_p1;
      end
  end
  always @(ENARDEN_in) begin
      if (ENARDEN_in && SLEEPA_p2)
         $display("Error: [Unisim %s-23] DRC : ENA can be asserted at least 2 cycles CLKARDCLK after SLEEP signal has been de-asserted. Instance: %m", MODULE_NAME); 
  end
  always @(ENBWREN_in) begin
      if (ENBWREN_in && SLEEPB_p2)
         $display("Error: [Unisim %s-23] DRC : ENB can be asserted at least 2 cycles CLKBWRCLK after SLEEP signal has been de-asserted. Instance: %m", MODULE_NAME); 
  end
  //victor drc #13 for ramb18
  always @(READ_WIDTH_A_BIN or WRITE_WIDTH_B_BIN or sdp_mode or WRITE_MODE_A_BIN or WRITE_MODE_B_BIN) begin
    if (((READ_WIDTH_A_BIN == 36) || (WRITE_WIDTH_B_BIN == 36)) && sdp_mode)
       if (WRITE_MODE_A_BIN != WRITE_MODE_B_BIN)
         $display("Error: [Unisim %s-23] DRC : In SDP mode, when READ_WIDTH_A or WRITE_WIDTH_B = 36, WRITE_MODE_A must be same as WRITE_MODE_B. Instance: %m", MODULE_NAME); 
  end
  //victor drc #37 for ramb18
  always @(READ_WIDTH_A_BIN or WRITE_WIDTH_B_BIN or CASCADE_ORDER_A_BIN or CASCADE_ORDER_B_BIN) begin
    if ((READ_WIDTH_A_BIN == 36) || (WRITE_WIDTH_B_BIN == 36))
       if (CASCADE_ORDER_A_BIN != CASCADE_ORDER_B_BIN)
         $display("Error: [Unisim %s-23] DRC : When READ_WIDTH_A = WRITE_WIDTH_B = 36, CASCADE_ORDER_A must be same as CASCADE_ORDER_B. Instance: %m", MODULE_NAME); 
  end

  reg INIT_MEM = 0;

  initial begin
    INIT_MEM  <= #100 1'b1;
    INIT_MEM  <= #200 1'b0;
  end

  initial begin
  #1;
  if (glblGSR) @(negedge glblGSR);
    first_time = 1'b0;
  end

  always @ (trig_attr) begin
    INIT_MEM  <= #100 1'b1;
    INIT_MEM  <= #200 1'b0;
  end

  assign rd_addr_a_mask =
    (READ_WIDTH_A_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_A_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_A_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (READ_WIDTH_A_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign rd_addr_b_mask =
    (READ_WIDTH_B_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_B_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_B_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (READ_WIDTH_B_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign wr_addr_a_mask =
    (WRITE_WIDTH_A_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_A_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_A_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (WRITE_WIDTH_A_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign wr_addr_b_mask =
    (WRITE_WIDTH_B_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_B_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_B_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (WRITE_WIDTH_B_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  always @(READ_WIDTH_A_BIN) begin
    if      (READ_WIDTH_A_BIN == 0)  rd_loops_a = 8;
    else if (READ_WIDTH_A_BIN == 9)  rd_loops_a = 8;
    else if (READ_WIDTH_A_BIN == 18) rd_loops_a = 16;
    else if (READ_WIDTH_A_BIN == 36) rd_loops_a = 32;
  end

  always @(READ_WIDTH_B_BIN) begin
    if      (READ_WIDTH_B_BIN == 0)  rd_loops_b = 8;
    else if (READ_WIDTH_B_BIN == 9)  rd_loops_b = 8;
    else if (READ_WIDTH_B_BIN == 18) rd_loops_b = 16;
    else if (READ_WIDTH_B_BIN == 36) rd_loops_b = 32;
  end

  always @(WRITE_WIDTH_A_BIN) begin
    if      (WRITE_WIDTH_A_BIN == 0)  wr_loops_a = 8;
    else if (WRITE_WIDTH_A_BIN == 9)  wr_loops_a = 8;
    else if (WRITE_WIDTH_A_BIN == 18) wr_loops_a = 16;
    else if (WRITE_WIDTH_A_BIN == 36) wr_loops_a = 32;
  end

  always @(WRITE_WIDTH_B_BIN) begin
    if      (WRITE_WIDTH_B_BIN == 0)  wr_loops_b = 8;
    else if (WRITE_WIDTH_B_BIN == 9)  wr_loops_b = 8;
    else if (WRITE_WIDTH_B_BIN == 18) wr_loops_b = 16;
    else if (WRITE_WIDTH_B_BIN == 36) wr_loops_b = 32;
  end

  always @(*) begin
    if (rd_loops_a > rd_loops_b) rd_loops_f <= rd_loops_a;
    else rd_loops_f <= rd_loops_b;
  end

// determine clk period for collision window.
assign clks_done = clka_done && clkb_done;
always @(posedge trig_attr or posedge clka_changed or posedge clkb_changed) begin
  clka_timeout = 0;
  clka_done = 0;
  if (glblGSR || INIT_MEM) @(negedge glblGSR or negedge INIT_MEM);
  @(posedge CLKARDCLK_in);
  @(posedge CLKARDCLK_in);
  @(posedge CLKARDCLK_in);
  clka_timeout <= #6000 1;
  @(posedge CLKARDCLK_in or posedge clka_timeout);
  if (~clka_timeout) begin
    t_max_a = $time/1.0;
    @ (negedge CLKARDCLK_in) t_max_a = $time/1.0 - t_max_a;
  end else begin
    t_max_a = 2000;
  end
  clka_done = 1;
end

always @(posedge trig_attr or posedge clka_changed or posedge clkb_changed) begin
  @(posedge CLKARDCLK_in)
  @(posedge CLKARDCLK_in)
  @(posedge CLKARDCLK_in)
  @(posedge CLKARDCLK_in)
  clk_period_a = $time/1.0;
  @(posedge CLKARDCLK_in)
  clk_period_a = $time/1.0 - clk_period_a;
  clka_toggled = 1'b1;
end

always @(posedge trig_attr or posedge clka_changed or posedge clkb_changed) begin
  @(posedge CLKBWRCLK_in)
  @(posedge CLKBWRCLK_in)
  @(posedge CLKBWRCLK_in)
  @(posedge CLKBWRCLK_in)
  clk_period_b = $time/1.0;
  @(posedge CLKBWRCLK_in)
  clk_period_b = $time/1.0 - clk_period_b;
  clkb_toggled = 1'b1;
end

always @(posedge trig_attr or posedge clka_changed or posedge clkb_changed) begin
  clkb_timeout = 0;
  clkb_done = 0;
  if (glblGSR || INIT_MEM) @(negedge glblGSR or negedge INIT_MEM);
  @(posedge CLKBWRCLK_in);
  @(posedge CLKBWRCLK_in);
  @(posedge CLKBWRCLK_in);
  clkb_timeout <= #6000 1;
  @(posedge CLKBWRCLK_in or posedge clkb_timeout);
  if (~clkb_timeout) begin
    t_max_b = $time;
    @ (negedge CLKBWRCLK_in) t_max_b = $time - t_max_b;
  end else begin
    t_max_b = 2000;
  end
  clkb_done = 1;
end

always @(posedge trig_attr or posedge clka_changed or posedge clkb_changed) begin
 @(posedge clks_done);
 if (((t_max_a > 50) && (t_max_a <= 1500)) &&
     ((t_max_b == 0) || (t_max_a <= t_max_b))) t_coll_max = 2 * t_max_a - 99;
 if (((t_max_b > 50) && (t_max_b <= 1500)) &&
     ((t_max_a == 0) || (t_max_b <  t_max_a))) t_coll_max = 2 * t_max_b - 99;
 if ((t_max_a <= 50)  && (t_max_b <= 50))      t_coll_max = 500 -99;
 if ((t_max_a > 1500) && (t_max_b > 1500))     t_coll_max = 3000 -99;
end

    always @ (posedge CLKARDCLK_in) begin
      if (glblGSR || INIT_MEM) begin
          SLEEP_A_reg <= 2'b0;
      end
      else begin
          SLEEP_A_reg <= {SLEEP_A_reg[0], SLEEP_in};
      end
    end

    always @ (posedge CLKBWRCLK_in) begin
      if (glblGSR || INIT_MEM) begin
          SLEEP_B_reg <= 2'b0;
      end
      else begin
          SLEEP_B_reg <= {SLEEP_B_reg[0], SLEEP_in};
      end
    end

    assign SLEEP_A_int = SLEEP_A_reg[1] || (SLEEP_in && (SLEEP_ASYNC_BIN == SLEEP_ASYNC_FALSE));
    assign SLEEP_B_int = SLEEP_B_reg[1] || (SLEEP_in && (SLEEP_ASYNC_BIN == SLEEP_ASYNC_FALSE));

    assign sdp_mode_wr = (WRITE_WIDTH_B_BIN == 36);
    assign sdp_mode_rd = (READ_WIDTH_A_BIN == 36);
   assign sdp_mode = sdp_mode_rd || sdp_mode_wr;
   assign REGCE_A_int = REGCEAREGCE_in;
   assign REGCE_B_int = REGCEB_in;
   assign RSTREG_A_int = (RST_MODE_A_BIN == RST_MODE_A_SYNC) && 
                         (((RSTREG_PRIORITY_A_BIN == RSTREG_PRIORITY_A_RSTREG) &&
                           RSTREGARSTREG_in) ||
                          ((RSTREG_PRIORITY_A_BIN == RSTREG_PRIORITY_A_REGCE) &&
                           (RSTREGARSTREG_in && REGCEAREGCE_in)));
   assign RSTREG_B_int = (RST_MODE_B_BIN == RST_MODE_B_SYNC) && 
                         (((RSTREG_PRIORITY_B_BIN == RSTREG_PRIORITY_B_RSTREG) &&
                           RSTREGB_in) ||
                          ((RSTREG_PRIORITY_B_BIN == RSTREG_PRIORITY_B_REGCE) &&
                           (RSTREGB_in && REGCEB_in)));
   always @ (*) begin
     if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
          (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) && CASDOMUXA_reg) begin
       DOUTADOUT_out = CASDINA_in;
       DOUTPADOUTP_out = CASDINPA_in;
     end
     else if (DOA_REG_BIN == 1) begin
       DOUTADOUT_out = mem_a_reg ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_a_reg ^ memp_rm_douta;
     end
     else if (mem_wr_en_a_wf) begin
       DOUTADOUT_out = mem_rd_a_wf ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_rd_a_wf ^ memp_rm_douta;
     end
     else begin
       DOUTADOUT_out = mem_a_lat ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_a_lat ^ memp_rm_douta;
     end
   end
   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) && CASDOMUXB_int) begin
          DOUTBDOUT_out = CASDINB_in;
          DOUTPBDOUTP_out = CASDINPB_in;
     end
     else if (sdp_mode_rd) begin
       if (DOA_REG_BIN == 1) begin
         DOUTBDOUT_out = mem_a_reg[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_a_reg[3:2] ^ memp_rm_douta[3:2];
       end
       else if (mem_wr_en_a_wf) begin
         DOUTBDOUT_out = mem_rd_a_wf[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_rd_a_wf[3:2] ^ memp_rm_douta[3:2];
       end
       else begin
         DOUTBDOUT_out = mem_a_lat[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_a_lat[3:2] ^ memp_rm_douta[3:2];
       end
     end
     else begin
       if (DOB_REG_BIN == 1) begin
         DOUTBDOUT_out = mem_b_reg ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_b_reg ^ memp_rm_doutb;
       end
       else if (mem_wr_en_b_wf) begin
         DOUTBDOUT_out = mem_rd_b_wf ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_rd_b_wf ^ memp_rm_doutb;
       end
       else begin
         DOUTBDOUT_out = mem_b_lat ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_b_lat ^ memp_rm_doutb;
       end
     end
   end

   assign SRVAL_A_int =
    (READ_WIDTH_A_BIN <= 9)  ? {{4{SRVAL_A_REG[8]}},     {4{SRVAL_A_REG[7:0]}}} :
    (READ_WIDTH_A_BIN == 18) ? {{2{SRVAL_A_REG[17:16]}}, {2{SRVAL_A_REG[15:0]}}} :
          {SRVAL_B_REG[17:16],SRVAL_A_REG[17:16],SRVAL_B_REG[15:0],SRVAL_A_REG[15:0]};
   assign SRVAL_B_int =
    (READ_WIDTH_B_BIN <= 9)  ? {{2{SRVAL_B_REG[8]}}, {2{SRVAL_B_REG[7:0]}}} :
                                            SRVAL_B_REG;
   always @(*) begin
     if ((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_FIRST) ||
         (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) begin
       CASDOUTA_out = DOUTADOUT_out;
       CASDOUTPA_out = DOUTPADOUTP_out;
     end else begin
       CASDOUTA_out = {D_WIDTH-1{1'b0}};
       CASDOUTPA_out = {DP_WIDTH-1{1'b0}};
     end
   end

   always @(*) begin
     if ((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_FIRST) ||
         (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) begin
       CASDOUTB_out = DOUTBDOUT_out;
       CASDOUTPB_out = DOUTPBDOUTP_out;
     end else begin
       CASDOUTB_out = {D_WIDTH-1{1'b0}};
       CASDOUTPB_out = {DP_WIDTH-1{1'b0}};
     end
   end

// start model internals

// cascade control
   always @ (posedge CLKARDCLK_in) begin
      if (glblGSR || INIT_MEM) CASDOMUXA_reg <= 1'b0;
      else if (CASDOMUXEN_A_in == 1'b1) CASDOMUXA_reg <= CASDOMUXA_in;
      end

   always @ (posedge CLKARDCLK_in) begin
      if (glblGSR || INIT_MEM) CASOREGIMUXA_reg <= 1'b0;
      else if (CASOREGIMUXEN_A_in == 1'b1) CASOREGIMUXA_reg <= CASOREGIMUXA_in;
      end

   assign CASDOMUXB_int = (READ_WIDTH_A_BIN == 36) ?
                          CASDOMUXA_reg : CASDOMUXB_reg;
   always @ (posedge CLKBWRCLK_in) begin
      if (glblGSR || INIT_MEM || sdp_mode) CASDOMUXB_reg <= 1'b0;
      else if (CASDOMUXEN_B_in == 1'b1) CASDOMUXB_reg <= CASDOMUXB_in;
      end

   always @ (posedge CLKBWRCLK_in) begin
      if (glblGSR || INIT_MEM || sdp_mode) CASOREGIMUXB_reg <= 1'b0;
      else if (CASOREGIMUXEN_B_in == 1'b1) CASOREGIMUXB_reg <= CASOREGIMUXB_in;
      end

// collison detection
reg coll_win_wr_clk_a_min = 1'b0;
reg coll_win_wr_clk_b_min = 1'b0;
reg coll_win_rd_clk_a_min = 1'b0;
reg coll_win_rd_clk_b_min = 1'b0;
reg coll_win_wr_clk_a_max = 1'b0;
reg coll_win_wr_clk_b_max = 1'b0;
reg coll_win_rd_clk_a_max = 1'b0;
reg coll_win_rd_clk_b_max = 1'b0;
reg wr_b_wr_a_coll = 1'b0;
reg wr_b_rd_a_coll = 1'b0;
reg rd_b_wr_a_coll = 1'b0;
reg wr_a_wr_b_coll = 1'b0;
reg wr_a_rd_b_coll = 1'b0;
reg rd_a_wr_b_coll = 1'b0;

wire coll_wr_sim;
wire coll_wr_b_wr_a;
wire coll_wr_b_rd_a_sim;
wire coll_wr_b_rd_a;
wire coll_rd_b_wr_a;
wire coll_wr_a_wr_b;
wire coll_wr_a_rd_b_sim;
wire coll_wr_a_rd_b;
wire coll_rd_a_wr_b;

assign coll_wr_sim = wr_addr_coll && coll_win_wr_clk_a_min && coll_win_wr_clk_b_min;
assign coll_wr_b_wr_a = wr_addr_coll && coll_win_wr_clk_b_min && ~coll_win_wr_clk_a_min && coll_win_wr_clk_a_max;
assign coll_wr_b_rd_a_sim = wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && coll_win_rd_clk_a_min;
assign coll_wr_a_rd_b_sim = wr_a_rd_b_addr_coll && coll_win_wr_clk_a_min && coll_win_rd_clk_b_min;
assign coll_wr_b_rd_a = wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && ~coll_win_rd_clk_a_min && coll_win_rd_clk_a_max;
assign coll_rd_b_wr_a = wr_a_rd_b_addr_coll && coll_win_rd_clk_b_min && ~coll_win_wr_clk_a_min && coll_win_wr_clk_a_max;
assign coll_wr_a_wr_b = wr_addr_coll && coll_win_wr_clk_a_min && ~coll_win_wr_clk_b_min && coll_win_wr_clk_b_max;
assign coll_wr_a_rd_b = wr_a_rd_b_addr_coll && coll_win_wr_clk_a_min && ~coll_win_rd_clk_b_min && coll_win_rd_clk_b_max;
assign coll_rd_a_wr_b = wr_b_rd_a_addr_coll && coll_win_rd_clk_a_min && ~coll_win_wr_clk_b_min && coll_win_wr_clk_b_max;

always @(posedge CLKARDCLK_in) begin
  if (mem_wr_en_a === 1'b1 && ~(glblGSR || INIT_MEM) && clkb_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE) & ~sdp_mode) begin
    if (coll_win_wr_clk_a_max) begin
      coll_win_wr_clk_a_max = 1'b0;
      if (clks_done) clka_changed = 1'b1;
    end else if (clks_done) begin
      clka_changed = 1'b0;
      coll_win_wr_clk_a_min <= #1 1'b1;
      coll_win_wr_clk_a_max <= #99 1'b1;
      coll_win_wr_clk_a_min <= #(t_coll_min) 1'b0;
      coll_win_wr_clk_a_max <= #(t_coll_max) 1'b0;
    end
  end
end

always @(posedge coll_wr_sim) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
       $display("Error: [Unisim %s-1] Memory Collision at time %.3f ns.\nA simultaneous WRITE occured on port A (addr:%h data:%h) and port B (addr:%h data:%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, mem_wr_a, wr_addr_b, mem_wr_b);
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
       $display("Error: [Unisim %s-2] Memory Collision at time %.3f ns.\nA simultaneous WRITE occured on port A (addr:%h data:%h) and port B (addr:%h data:%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, mem_wr_a, wr_addr_b, mem_wr_b);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_wr_b) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-3] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the WRITE window on port B (%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, wr_addr_b_last);
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-4] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the WRITE window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, wr_addr_b_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_rd_b_sim) begin
  if (~wr_a_data_matches_rd_b_data && (WRITE_MODE_A_BIN != WRITE_MODE_A_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-5] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port A (%h) and a READ on port B (%h) occured.\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
      wr_a_rd_b_coll <= #10  1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-6] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port A (%h) occured during a READ on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
    else if (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_rd_b_coll <= #10  1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_rd_b) begin
  if (~wr_a_data_matches_rd_b_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-7] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the READ window on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b_last);
      wr_a_rd_b_coll <= #10 1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-8] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the READ window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_rd_b_coll <= #10 1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKBWRCLK_in) begin
  if (mem_wr_en_b === 1'b1 && ~(glblGSR || INIT_MEM) && clka_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
    if (coll_win_wr_clk_b_max) begin
      coll_win_wr_clk_b_max = 1'b0;
      if (clks_done) clkb_changed = 1'b1;
    end else if (clks_done) begin
      clkb_changed = 1'b0;
      coll_win_wr_clk_b_min <= #1 1'b1;
      coll_win_wr_clk_b_max <= #99 1'b1;
      coll_win_wr_clk_b_min <= #(t_coll_min) 1'b0;
      coll_win_wr_clk_b_max <= #(t_coll_max) 1'b0;
    end
  end
end


always @(posedge coll_wr_b_wr_a) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-9] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the WRITE window on port A (%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, wr_addr_a_last);
      wr_b_wr_a_coll <= #10  1'b1;
      wr_b_wr_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-10] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the WRITE window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, wr_addr_a_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_wr_a_coll <= #10  1'b1;
      wr_b_wr_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_b_rd_a_sim) begin
  if (~wr_b_data_matches_rd_a_data && (WRITE_MODE_B_BIN != WRITE_MODE_B_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-11] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port B (%h) and READ on port A (%h) occured.\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
      wr_b_rd_a_coll <= #10  1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-12] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port B (%h) occured during a READ on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
    else if (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_rd_a_coll <= #10  1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_b_rd_a) begin
  if (~wr_b_data_matches_rd_a_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-13] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the READ window on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a_last);
      wr_b_rd_a_coll <= #10 1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-14] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the READ window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_rd_a_coll <= #10 1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKARDCLK_in) begin
  if (mem_rd_en_a === 1'b1 && ~(glblGSR || INIT_MEM) && clkb_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
    if (coll_win_rd_clk_a_max) begin
      coll_win_rd_clk_a_max = 1'b0;
      if (clks_done) clka_changed = 1'b1;
    end else if (clks_done) begin
      clka_changed = 1'b0;
      coll_win_rd_clk_a_min <= #1 1'b1;
      coll_win_rd_clk_a_max <= #99 1'b1;
      coll_win_rd_clk_a_min <= #(t_coll_min) 1'b0;
      coll_win_rd_clk_a_max <= #(t_coll_max) 1'b0;
    end
  end
end

always @(posedge coll_rd_a_wr_b) begin
  if (~wr_b_data_matches_rd_a_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-17] Memory Collision at time %.3f ns.\nA READ on port A (%h) occured during the WRITE window on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b_last);
      rd_a_wr_b_coll <= #10 1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-18] Memory Collision at time %.3f ns.\nA READ on port A (%h) occured during the WRITE window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_a_wr_b_coll <= #10 1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKBWRCLK_in) begin
  if (mem_rd_en_b === 1'b1 && ~(glblGSR || INIT_MEM) && clka_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE) && ~sdp_mode) begin
    if (coll_win_rd_clk_b_max) begin
      coll_win_rd_clk_b_max = 1'b0;
      if (clks_done) clkb_changed = 1'b1;
    end else if (clks_done) begin
      clkb_changed = 1'b0;
      coll_win_rd_clk_b_min <= #1 1'b1;
      coll_win_rd_clk_b_max <= #99 1'b1;
      coll_win_rd_clk_b_min <= #(t_coll_min) 1'b0;
      coll_win_rd_clk_b_max <= #(t_coll_max) 1'b0;
    end
  end
end


always @(posedge coll_rd_b_wr_a) begin
  if (~wr_a_data_matches_rd_b_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-21] Memory Collision at time %.3f ns.\nA READ on port B (%h) occured during the WRITE window on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a_last);
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-22] Memory Collision at time %.3f ns.\nA READ on port B (%h) occured during the WRITE window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a_last);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
  end
end

// output register
   always @ (*) begin
     if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
          (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) &&
          CASOREGIMUXA_reg) mem_a_reg_mux = {CASDINB_in, CASDINA_in};
     else if (mem_wr_en_a_wf) mem_a_reg_mux = mem_rd_a_wf;
     else mem_a_reg_mux = mem_a_lat;
   end
   always @ (*) begin
     if  (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
           (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) &&
          CASOREGIMUXA_reg) memp_a_reg_mux = {CASDINPB_in, CASDINPA_in};
     else if (mem_wr_en_a_wf) memp_a_reg_mux = memp_rd_a_wf;
     else memp_a_reg_mux = memp_a_lat;
   end

   always @ (posedge CLKARDCLK_in or posedge mem_arst_a or posedge INIT_MEM or posedge glblGSR) begin
      if (glblGSR || INIT_MEM) begin
         if ((RST_MODE_A_BIN == RST_MODE_A_SYNC) || first_time) begin
           {memp_a_reg, mem_a_reg} <= #100 SRVAL_A_int;
         end else begin
           mem_a_reg  <= #100 {D_WIDTH-1{1'b0}};
           memp_a_reg <= #100 {DP_WIDTH-1{1'b0}};
         end
      end else if (mem_arst_a) begin
        mem_a_reg  <= #100 {D_WIDTH-1{1'b0}};
        memp_a_reg <= #100 {DP_WIDTH-1{1'b0}};
      end else if (RSTREG_A_int) begin
        {memp_a_reg, mem_a_reg} <= #100 SRVAL_A_int;
      end else if (REGCE_A_int) begin
        mem_a_reg <= #100 mem_a_reg_mux;
        memp_a_reg <= #100 memp_a_reg_mux;
      end
   end

   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) &&
         CASOREGIMUXB_reg) mem_b_reg_mux = CASDINB_in;
     else if (mem_wr_en_b_wf) mem_b_reg_mux = mem_rd_b_wf;
     else mem_b_reg_mux = mem_b_lat;
   end
   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) &&
         CASOREGIMUXB_reg) memp_b_reg_mux = CASDINPB_in;
     else if (mem_wr_en_b_wf) memp_b_reg_mux = memp_rd_b_wf;
     else memp_b_reg_mux = memp_b_lat;
   end

   always @ (posedge CLKBWRCLK_in or posedge mem_arst_b or posedge INIT_MEM or posedge glblGSR) begin
      if (glblGSR || INIT_MEM || sdp_mode_rd) begin
         if ((RST_MODE_B_BIN == RST_MODE_B_SYNC) || first_time) begin
           {memp_b_reg, mem_b_reg} <= #100 SRVAL_B_int;
         end else begin
           mem_b_reg  <= #100 {D_WIDTH/2-1{1'b0}};
           memp_b_reg <= #100 {DP_WIDTH/2-1{1'b0}};
         end
      end else if (mem_arst_b) begin
        mem_b_reg  <= #100 {D_WIDTH/2-1{1'b0}};
        memp_b_reg <= #100 {DP_WIDTH/2-1{1'b0}};
      end else if (RSTREG_B_int) begin
         {memp_b_reg, mem_b_reg} <= #100 SRVAL_B_int;
      end else if (REGCE_B_int) begin
         mem_b_reg <= #100 mem_b_reg_mux;
         memp_b_reg <= #100 memp_b_reg_mux;
         end
      end

// read engine
   always @ (posedge CLKARDCLK_in or posedge mem_arst_a) begin
     if ((WRITE_MODE_A_BIN == WRITE_MODE_A_WRITE_FIRST) && ~sdp_mode && mem_rd_en_a && ~(glblGSR || INIT_MEM)) begin
       mem_wr_en_a_wf <= mem_wr_en_a && ~(mem_rst_a || mem_arst_a);
     end
   end

   always @ (posedge CLKBWRCLK_in or posedge mem_arst_b) begin
     if ((WRITE_MODE_B_BIN == WRITE_MODE_B_WRITE_FIRST) && mem_rd_en_b && ~(glblGSR || INIT_MEM)) begin
       mem_wr_en_b_wf <= mem_wr_en_b && ~(mem_rst_b || mem_arst_b);
     end
   end

   always @ (rd_addr_a or mem_rd_en_a or mem_rst_a or mem_arst_a or wr_a_event or wr_b_event or INIT_MEM) begin
      if ((mem_rd_en_a || INIT_MEM) && ~(mem_rst_a || mem_arst_a)) begin
         for (raa=0;raa<rd_loops_a;raa=raa+1) begin
           mem_rd_a[raa] = mem [rd_addr_a+raa];
         end
         if (rd_loops_a >= 8) begin
           for (raa=0;raa<rd_loops_a/8;raa=raa+1) begin
             memp_rd_a[raa] = memp [(rd_addr_a/8)+raa];
           end
         end
      end else if (mem_rst_a || mem_arst_a) begin
         for (raa=0;raa<rd_loops_a;raa=raa+1) begin
           mem_rd_a[raa] = 1'b0;
         end
         if (rd_loops_a >= 8) begin
           for (raa=0;raa<rd_loops_a/8;raa=raa+1) begin
             memp_rd_a[raa] = 1'b0;
           end
         end
      end
   end

   always @(posedge CLKARDCLK_in or posedge INIT_MEM or posedge wr_b_rd_a_coll or posedge rd_a_wr_b_coll or posedge wr_a_wr_b_coll or posedge wr_b_wr_a_coll or posedge mem_arst_a) begin
      if (glblGSR || INIT_MEM) begin
         mem_is_rst_a <= 1'b0;
         if ((RST_MODE_A_BIN == RST_MODE_A_SYNC) || first_time) begin
           mem_a_lat <= #100 SRVAL_A_int[D_WIDTH-1:0];
           memp_a_lat <= #100 SRVAL_A_int[INIT_WIDTH-1:D_WIDTH];
         end else begin
           mem_a_lat  <= #100 {D_WIDTH-1{1'b0}};
           memp_a_lat <= #100 {DP_WIDTH-1{1'b0}};
         end
      end
      else if (SLEEP_A_int && mem_rd_en_a) begin
         $display("Error: [Unisim %s-23] DRC : READ on port A attempted while in SLEEP mode at time %.3f ns. Instance: %m.", MODULE_NAME, $time/1000.0);
         mem_is_rst_a <= 1'b0;
         mem_a_lat <= #100 {D_WIDTH-1{1'bx}};
         memp_a_lat <= #100 {DP_WIDTH-1{1'bx}};
      end
      else if (mem_arst_a) begin
        mem_a_lat  <= #100 {D_WIDTH-1{1'b0}};
        memp_a_lat <= #100 {DP_WIDTH-1{1'b0}};
      end
      else if (mem_rst_a && mem_rd_en_a) begin
         if (~mem_is_rst_a) begin
           mem_is_rst_a <= 1'b1;
         mem_a_lat  <= #100 SRVAL_A_int[D_WIDTH-1:0];
         memp_a_lat <= #100 SRVAL_A_int[INIT_WIDTH-1:D_WIDTH];
         end
      end
      else if (rd_a_wr_b_coll || wr_b_rd_a_coll || wr_a_wr_b_coll || wr_b_wr_a_coll) begin
        if (~wr_b_data_matches_rd_a_data &&
            ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
             (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
          mem_is_rst_a <= 1'b0;
         mem_a_lat <= #100 {D_WIDTH-1{1'bx}};
         memp_a_lat <= #100 {DP_WIDTH-1{1'bx}};
        end
      end
      else if (mem_rd_en_a) begin
        mem_is_rst_a <= 1'b0;
         if (wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && sdp_mode && (WRITE_MODE_B_BIN == WRITE_MODE_B_READ_FIRST)) begin
           mem_a_lat   <= #100 mem_rd_b_rf;
           memp_a_lat  <= #100 memp_rd_b_rf;
         end
         else begin
           mem_a_lat   <= #100 mem_rd_a;
           memp_a_lat  <= #100 memp_rd_a;
         end
      end
   end

   always @ (rd_addr_b or mem_rd_en_b or mem_rst_b or mem_arst_b or wr_b_event or wr_a_event or INIT_MEM) begin
      if ((mem_rd_en_b || INIT_MEM) && ~(mem_rst_b || mem_arst_b)) begin
        for (rbb=0;rbb<rd_loops_b;rbb=rbb+1) begin
          mem_rd_b[rbb] <= mem [rd_addr_b+rbb];
          if (rbb<rd_loops_b/8) begin
            memp_rd_b[rbb] <= memp [(rd_addr_b/8)+rbb];
          end
        end
      end else if (mem_rst_b || mem_arst_b) begin
         for (rbb=0;rbb<rd_loops_b;rbb=rbb+1) begin
           mem_rd_b[rbb] = 1'b0;
         end
         if (rd_loops_b >= 8) begin
           for (rbb=0;rbb<rd_loops_b/8;rbb=rbb+1) begin
             memp_rd_b[rbb] = 1'b0;
           end
         end
      end
   end

   always @(posedge CLKBWRCLK_in or posedge INIT_MEM or posedge wr_a_rd_b_coll or posedge rd_b_wr_a_coll or posedge wr_a_wr_b_coll or posedge  wr_b_wr_a_coll or posedge mem_arst_b) begin
      if (glblGSR || INIT_MEM) begin
         mem_is_rst_b <= 1'b0;
         if ((RST_MODE_B_BIN == RST_MODE_B_SYNC) || first_time) begin
           mem_b_lat  <= #100 SRVAL_B_int[D_WIDTH/2-1:0];
           memp_b_lat <= #100 SRVAL_B_int[INIT_WIDTH/2-1:D_WIDTH/2];
         end else begin
           mem_b_lat  <= #100 {D_WIDTH/2-1{1'b0}};
           memp_b_lat <= #100 {DP_WIDTH/2-1{1'b0}};
         end
      end else if (SLEEP_B_int && mem_rd_en_b && ~sdp_mode) begin
         $display("Error: [Unisim %s-24] DRC : READ on port B attempted while in SLEEP mode at time %.3f ns. Instance: %m.", MODULE_NAME, $time/1000.0);
         mem_is_rst_b <= 1'b0;
         mem_b_lat <= #100 {D_WIDTH/2-1{1'bx}};
         memp_b_lat <= #100 {DP_WIDTH/2-1{1'bx}};
      end else if (mem_arst_b) begin
        mem_b_lat  <= #100 {D_WIDTH/2-1{1'b0}};
        memp_b_lat <= #100 {DP_WIDTH/2-1{1'b0}};
      end else if (mem_rst_b && mem_rd_en_b && ~sdp_mode_rd) begin
         if (~mem_is_rst_b) begin
           mem_is_rst_b <= 1'b1;
         mem_b_lat  <= #100 SRVAL_B_int[D_WIDTH/2-1:0];
         memp_b_lat <= #100 SRVAL_B_int[INIT_WIDTH/2-1:D_WIDTH/2];
         end
      end
      else if (rd_b_wr_a_coll || wr_a_rd_b_coll || wr_a_wr_b_coll || wr_b_wr_a_coll) begin
        mem_is_rst_b <= 1'b0;
        if (~wr_a_data_matches_rd_b_data &&
            ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
             (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
         mem_b_lat <= #100 {D_WIDTH/2-1{1'bx}};
         memp_b_lat <= #100 {DP_WIDTH/2-1{1'bx}};
        end
      end else if (mem_rd_en_b && ~sdp_mode_rd) begin
        mem_is_rst_b <= 1'b0;
        mem_b_lat <= #100 mem_rd_b[D_WIDTH/2-1:0];
        memp_b_lat <= #100 memp_rd_b[DP_WIDTH/2-1:0];
      end
   end

// write engine
   always @ (posedge CLKARDCLK_in or posedge wr_a_wr_b_coll or posedge glblGSR or posedge mem_arst_a) begin
     if (INIT_MEM || glblGSR || mem_arst_a) begin
       if ((RST_MODE_A_BIN == RST_MODE_A_SYNC) || first_time) begin
         mem_rd_a_wf = SRVAL_A_int[D_WIDTH-1:0];
         memp_rd_a_wf = SRVAL_A_int[INIT_WIDTH-1:D_WIDTH];
       end else begin
         mem_rd_a_wf  = {D_WIDTH-1{1'b0}};
         memp_rd_a_wf = {DP_WIDTH-1{1'b0}};
       end
     end
     if (wr_a_wr_b_coll && ~(glblGSR || INIT_MEM)) begin
       if (~wr_data_matches) begin
         mem_rd_a_wf = {D_WIDTH-1{1'bx}};
         memp_rd_a_wf = {DP_WIDTH-1{1'bx}};
         for (wa=0;wa<wr_loops_a;wa=wa+1) begin
           if (mem_we_a[wa]) mem [wr_addr_a+wa] = {mem_width{1'bx}};
           if (wa<wr_loops_a/8) begin
             if (memp_we_a[wa]) memp [(wr_addr_a/8)+wa] = {memp_width{1'bx}};
           end
         end
       end
     end else if (mem_wr_en_a && ~(glblGSR || INIT_MEM) && ~sdp_mode) begin
       if (SLEEP_A_int) begin
         $display("Error: [Unisim %s-25] DRC : WRITE on port A attempted while in SLEEP mode at time %.3f ns. Instance: %m.", MODULE_NAME, $time/1000.0);
       end else begin
         for (wa=0;wa<wr_loops_a;wa=wa+1) begin
           if (mem_we_a[wa]) begin
             mem [wr_addr_a+wa] = mem_wr_a[wa];
           end
         end
         if (wr_loops_a >= 8) begin
           for (wa=0;wa<wr_loops_a/8;wa=wa+1) begin
             if (memp_we_a[wa]) begin
               memp [(wr_addr_a/8)+wa] = memp_wr_a[wa];
             end
           end
         end
         wr_a_event <= ~wr_a_event;
         if (WRITE_MODE_A_BIN == WRITE_MODE_A_WRITE_FIRST) begin
         if (~mem_arst_a) begin
           for (raw=0;raw<rd_loops_f;raw=raw+1) begin
             mem_rd_a_wf[raw]    = mem [rd_addr_a+raw];
             if (raw<rd_loops_f/8) begin
                 memp_rd_a_wf[raw]        = memp [rd_addr_a/8+raw];
             end
           end
         end
         end
       end
     end
   end

   always @ (posedge CLKBWRCLK_in or posedge INIT_MEM or posedge wr_b_wr_a_coll or posedge glblGSR or posedge mem_arst_b) begin
     if (INIT_MEM == 1'b1) begin
// initialize memory
       if ((RST_MODE_B_BIN == RST_MODE_B_SYNC) || first_time) begin
         mem_rd_b_wf = SRVAL_B_int[D_WIDTH/2-1:0];
         memp_rd_b_wf = SRVAL_B_int[INIT_WIDTH/2-1:D_WIDTH/2];
       end else begin
         mem_rd_b_wf  = {D_WIDTH/2-1{1'b0}};
         memp_rd_b_wf = {DP_WIDTH/2-1{1'b0}};
       end
       if (INIT_FILE != "NONE") begin
         if (READ_WIDTH_A != READ_WIDTH_A_REG) begin
          $display("Error: [Unisim %s-27] DRC : READ_WIDTH_A (%d) has been changed (%d) through write_attr function. In order to initialize memory via INIT_FILE (%s), the READ_WIDTH must be set by a static parameter. Instance: %m.", MODULE_NAME, READ_WIDTH_A, READ_WIDTH_A_REG, INIT_FILE);
         end else if (READ_WIDTH_B != READ_WIDTH_B_REG) begin
          $display("Error: [Unisim %s-28] DRC : READ_WIDTH_B (%d) has been changed (%d) through write_attr function. In order to initialize memory via INIT_FILE (%s), the READ_WIDTH must be set by a static parameter. Instance: %m.", MODULE_NAME, READ_WIDTH_B, READ_WIDTH_B_REG, INIT_FILE);
         end else begin
          read_init_file; 
         end
       end else begin
         for (j=0;j<64;j=j+1) begin
           INIT_TMP = INIT_BIN[j];
           for (i=0;i<256;i=i+1) begin
             mem [j*256+i] = INIT_TMP[i];
           end
         end
// initialize memory p
       for (j=0;j<8;j=j+1) begin
         INITP_TMP = INITP_BIN[j];
         for (i=0;i<256;i=i+1) begin
           memp [j*256+i] = INITP_TMP[i];
         end
       end
       end
     end else if (glblGSR || mem_arst_b) begin
       if ((RST_MODE_B_BIN == RST_MODE_B_SYNC) || first_time) begin
         mem_rd_b_wf = SRVAL_B_int[D_WIDTH/2-1:0];
         memp_rd_b_wf = SRVAL_B_int[INIT_WIDTH/2-1:D_WIDTH/2];
       end else begin
         mem_rd_b_wf  = {D_WIDTH/2-1{1'b0}};
         memp_rd_b_wf = {DP_WIDTH/2-1{1'b0}};
       end
     end
     if (wr_b_wr_a_coll && ~(glblGSR || INIT_MEM)) begin
       if (~wr_data_matches) begin
       mem_rd_b_wf = {D_WIDTH/2-1{1'bx}};
       memp_rd_b_wf = {DP_WIDTH/2-1{1'bx}};
         for (wb=0;wb<wr_loops_b;wb=wb+1) begin
           if (mem_we_b[wb]) mem [wr_addr_b+wb] = {mem_width{1'bx}};
           if (wb<wr_loops_b/8) begin
             if (memp_we_b[wb]) memp [(wr_addr_b/8)+wb] = {memp_width{1'bx}};
           end
         end
       end
     end else if (mem_wr_en_b && ~(glblGSR || INIT_MEM)) begin
       if (SLEEP_B_int) begin
         $display("Error: [Unisim %s-26] DRC : WRITE on port B attempted while in SLEEP mode at time %.3f ns. Instance: %m.", MODULE_NAME, $time/1000.0);
       end
       else begin
         if (WRITE_MODE_B_BIN == WRITE_MODE_B_READ_FIRST) begin
         if (~mem_arst_b) begin
         for (wb=0;wb<rd_loops_f;wb=wb+1) begin
           mem_rd_b_rf[wb]    = mem [rd_addr_b+wb];
           if (wb<rd_loops_f/8) begin
               memp_rd_b_rf[wb]        = memp [rd_addr_b/8+wb];
           end
         end
         end
         end
         for (wb=0;wb<wr_loops_b;wb=wb+1) begin
           if (mem_we_b[wb]) begin
             mem [wr_addr_b+wb] = mem_wr_b[wb];
           end
         end
           for (wb=0;wb<wr_loops_b/8;wb=wb+1) begin
             if (memp_we_b[wb]) begin
               memp [(wr_addr_b/8)+wb] = memp_wr_b[wb];
             end
           end
         wr_b_event <= ~wr_b_event;
         if (WRITE_MODE_B_BIN == WRITE_MODE_B_WRITE_FIRST) begin
           for (rbw=0;rbw<rd_loops_f;rbw=rbw+1) begin
             mem_rd_b_wf[rbw]    = mem [rd_addr_b+rbw];
             if (rbw<rd_loops_f/8) begin
                 memp_rd_b_wf[rbw]        = memp [rd_addr_b/8+rbw];
             end
           end
         end
       end
     end
   end

  assign mem_rm_douta = sdp_mode_rd ? {D_WIDTH{1'b0}} : {D_WIDTH{1'bx}}<<rd_loops_a;
  assign memp_rm_douta = sdp_mode_rd ? {DP_WIDTH{1'b0}} : {DP_WIDTH{1'bx}}<<rd_loops_a/8;
  assign mem_rm_doutb = sdp_mode_rd ? {D_WIDTH/2{1'b0}} : {D_WIDTH{1'bx}}<<rd_loops_b;
  assign memp_rm_doutb = sdp_mode_rd ? {DP_WIDTH/2{1'b0}} : {DP_WIDTH/2{1'bx}}<<rd_loops_b/8;

  always @(ADDRARDADDR_in) begin
      rd_addr_a = {ADDRARDADDR_in, 3'b0} & rd_addr_a_mask;
      wr_addr_a = {ADDRARDADDR_in, 3'b0} & wr_addr_a_mask;
  end

  always @(posedge CLKARDCLK_in or posedge glblGSR) begin
    if (mem_wr_en_a) begin
      wr_addr_a_last <= wr_addr_a;
    end
    if (mem_rd_en_a) begin
      rd_addr_a_last <= rd_addr_a;
    end
    if (glblGSR || INIT_MEM || mem_wr_en_a || mem_wr_en_b) begin
      rd_addr_a_valid <= 1'b0;
    end else if (mem_rd_en_a) begin
      rd_addr_a_valid <= 1'b1;
    end
  end

  always @(ADDRBWRADDR_in or ADDRARDADDR_in or sdp_mode_rd) begin
      if (sdp_mode_rd == 1'b1) begin
        rd_addr_b = {ADDRARDADDR_in, 3'b0} & rd_addr_a_mask;
      end else begin
        rd_addr_b = {ADDRBWRADDR_in, 3'b0} & rd_addr_b_mask;
      end
      wr_addr_b = {ADDRBWRADDR_in, 3'b0} & wr_addr_b_mask;
  end

  always @(posedge CLKBWRCLK_in or posedge glblGSR) begin
    if (mem_wr_en_b) begin
      wr_addr_b_last <= wr_addr_b;
    end
    if (mem_rd_en_b) begin
      rd_addr_b_last <= rd_addr_b;
    end
    if (glblGSR || INIT_MEM || mem_wr_en_a || mem_wr_en_b) begin
      rd_addr_b_valid <= 1'b0;
    end else if (mem_rd_en_b) begin
      rd_addr_b_valid <= 1'b1;
    end
  end

  assign mem_rm_a = {D_WIDTH{1'b1}}>>(max_rd_loops-rd_loops_a);
  assign mem_rm_b = {D_WIDTH{1'b1}}>>(max_rd_loops-rd_loops_b);
  assign mem_wm_a = {D_WIDTH{1'b1}}>>(max_wr_loops-wr_loops_a);
  assign mem_wm_b = {D_WIDTH{1'b1}}>>(max_wr_loops-wr_loops_b);

  always @(*) begin
    if (~sdp_mode && mem_wr_en_a && mem_rd_en_b && ~mem_wr_en_b && ~mem_rst_a && ~mem_rst_b && ~mem_arst_a && ~mem_arst_b && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_a_last & rd_addr_b_mask) == (rd_addr_b_last & wr_addr_a_mask)) wr_a_rd_b_addr_coll = 1'b1;
      else wr_a_rd_b_addr_coll = 1'b0;
    end
    else wr_a_rd_b_addr_coll = 1'b0;
  end

  always @(*) begin
    if (~sdp_mode && mem_wr_en_b && mem_wr_en_a && ~mem_rst_a && ~mem_rst_b && ~mem_arst_a && ~mem_arst_b && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_a_last & wr_addr_b_mask) == (wr_addr_b_last & wr_addr_a_mask)) wr_addr_coll = 1'b1;
      else wr_addr_coll = 1'b0;
      end
    else wr_addr_coll = 1'b0;
  end

  always @(*) begin
    if (mem_wr_en_b && mem_rd_en_a && ~mem_wr_en_a && ~mem_rst_a && ~mem_rst_b && ~mem_arst_a && ~mem_arst_b && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_b_last & rd_addr_a_mask) == (rd_addr_a_last & wr_addr_b_mask)) wr_b_rd_a_addr_coll = 1'b1;
      else wr_b_rd_a_addr_coll = 1'b0;
      end
    else wr_b_rd_a_addr_coll = 1'b0;
  end

  always @ (*) begin
    if (sdp_mode_wr) begin
      mem_we_a = 16'b0;
      memp_we_a = 2'b0;
    end else if (WRITE_WIDTH_A_BIN == 18) begin
      mem_we_a = {{8{WEA_in[1]}}, {8{WEA_in[0]}}};
      memp_we_a = WEA_in;
    end else if (WRITE_WIDTH_A_BIN == 9)  begin
      mem_we_a = {8'b0, {8{WEA_in[0]}}};
      memp_we_a = {1'b0, WEA_in[0]};
    end else if (WRITE_WIDTH_A_BIN == 0)  begin
      mem_we_a = {8'b0, {8{WEA_in[0]}}};
      memp_we_a = {1'b0, WEA_in[0]};
    end
  end

  always @ (*) begin
    if (WRITE_WIDTH_B_BIN == 36) begin
      mem_we_b = {{8{WEBWE_in[3]}},{8{WEBWE_in[2]}},{8{WEBWE_in[1]}},{8{WEBWE_in[0]}}};
      memp_we_b = WEBWE_in;
    end else if (WRITE_WIDTH_B_BIN == 18) begin
      mem_we_b = {16'b0,{8{WEBWE_in[1]}},{8{WEBWE_in[0]}}};
      memp_we_b = {2'b0, WEBWE_in[1:0]};
    end else if (WRITE_WIDTH_B_BIN == 9)  begin
      mem_we_b = {24'b0,{8{WEBWE_in[0]}}};
      memp_we_b = {3'b0, WEBWE_in[0]};
    end else if (WRITE_WIDTH_B_BIN == 0)  begin
      mem_we_b = {24'b0,{8{WEBWE_in[0]}}};
      memp_we_b = {3'b0, WEBWE_in[0]};
    end
  end

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CASDINA[0] => CASDOUTA[0]) = (0:0:0, 0:0:0);
    (CASDINA[0] => DOUTADOUT[0]) = (0:0:0, 0:0:0);
    (CASDINA[10] => CASDOUTA[10]) = (0:0:0, 0:0:0);
    (CASDINA[10] => DOUTADOUT[10]) = (0:0:0, 0:0:0);
    (CASDINA[11] => CASDOUTA[11]) = (0:0:0, 0:0:0);
    (CASDINA[11] => DOUTADOUT[11]) = (0:0:0, 0:0:0);
    (CASDINA[12] => CASDOUTA[12]) = (0:0:0, 0:0:0);
    (CASDINA[12] => DOUTADOUT[12]) = (0:0:0, 0:0:0);
    (CASDINA[13] => CASDOUTA[13]) = (0:0:0, 0:0:0);
    (CASDINA[13] => DOUTADOUT[13]) = (0:0:0, 0:0:0);
    (CASDINA[14] => CASDOUTA[14]) = (0:0:0, 0:0:0);
    (CASDINA[14] => DOUTADOUT[14]) = (0:0:0, 0:0:0);
    (CASDINA[15] => CASDOUTA[15]) = (0:0:0, 0:0:0);
    (CASDINA[15] => DOUTADOUT[15]) = (0:0:0, 0:0:0);
    (CASDINA[1] => CASDOUTA[1]) = (0:0:0, 0:0:0);
    (CASDINA[1] => DOUTADOUT[1]) = (0:0:0, 0:0:0);
    (CASDINA[2] => CASDOUTA[2]) = (0:0:0, 0:0:0);
    (CASDINA[2] => DOUTADOUT[2]) = (0:0:0, 0:0:0);
    (CASDINA[3] => CASDOUTA[3]) = (0:0:0, 0:0:0);
    (CASDINA[3] => DOUTADOUT[3]) = (0:0:0, 0:0:0);
    (CASDINA[4] => CASDOUTA[4]) = (0:0:0, 0:0:0);
    (CASDINA[4] => DOUTADOUT[4]) = (0:0:0, 0:0:0);
    (CASDINA[5] => CASDOUTA[5]) = (0:0:0, 0:0:0);
    (CASDINA[5] => DOUTADOUT[5]) = (0:0:0, 0:0:0);
    (CASDINA[6] => CASDOUTA[6]) = (0:0:0, 0:0:0);
    (CASDINA[6] => DOUTADOUT[6]) = (0:0:0, 0:0:0);
    (CASDINA[7] => CASDOUTA[7]) = (0:0:0, 0:0:0);
    (CASDINA[7] => DOUTADOUT[7]) = (0:0:0, 0:0:0);
    (CASDINA[8] => CASDOUTA[8]) = (0:0:0, 0:0:0);
    (CASDINA[8] => DOUTADOUT[8]) = (0:0:0, 0:0:0);
    (CASDINA[9] => CASDOUTA[9]) = (0:0:0, 0:0:0);
    (CASDINA[9] => DOUTADOUT[9]) = (0:0:0, 0:0:0);
    (CASDINB[0] => CASDOUTB[0]) = (0:0:0, 0:0:0);
    (CASDINB[0] => DOUTBDOUT[0]) = (0:0:0, 0:0:0);
    (CASDINB[10] => CASDOUTB[10]) = (0:0:0, 0:0:0);
    (CASDINB[10] => DOUTBDOUT[10]) = (0:0:0, 0:0:0);
    (CASDINB[11] => CASDOUTB[11]) = (0:0:0, 0:0:0);
    (CASDINB[11] => DOUTBDOUT[11]) = (0:0:0, 0:0:0);
    (CASDINB[12] => CASDOUTB[12]) = (0:0:0, 0:0:0);
    (CASDINB[12] => DOUTBDOUT[12]) = (0:0:0, 0:0:0);
    (CASDINB[13] => CASDOUTB[13]) = (0:0:0, 0:0:0);
    (CASDINB[13] => DOUTBDOUT[13]) = (0:0:0, 0:0:0);
    (CASDINB[14] => CASDOUTB[14]) = (0:0:0, 0:0:0);
    (CASDINB[14] => DOUTBDOUT[14]) = (0:0:0, 0:0:0);
    (CASDINB[15] => CASDOUTB[15]) = (0:0:0, 0:0:0);
    (CASDINB[15] => DOUTBDOUT[15]) = (0:0:0, 0:0:0);
    (CASDINB[1] => CASDOUTB[1]) = (0:0:0, 0:0:0);
    (CASDINB[1] => DOUTBDOUT[1]) = (0:0:0, 0:0:0);
    (CASDINB[2] => CASDOUTB[2]) = (0:0:0, 0:0:0);
    (CASDINB[2] => DOUTBDOUT[2]) = (0:0:0, 0:0:0);
    (CASDINB[3] => CASDOUTB[3]) = (0:0:0, 0:0:0);
    (CASDINB[3] => DOUTBDOUT[3]) = (0:0:0, 0:0:0);
    (CASDINB[4] => CASDOUTB[4]) = (0:0:0, 0:0:0);
    (CASDINB[4] => DOUTBDOUT[4]) = (0:0:0, 0:0:0);
    (CASDINB[5] => CASDOUTB[5]) = (0:0:0, 0:0:0);
    (CASDINB[5] => DOUTBDOUT[5]) = (0:0:0, 0:0:0);
    (CASDINB[6] => CASDOUTB[6]) = (0:0:0, 0:0:0);
    (CASDINB[6] => DOUTBDOUT[6]) = (0:0:0, 0:0:0);
    (CASDINB[7] => CASDOUTB[7]) = (0:0:0, 0:0:0);
    (CASDINB[7] => DOUTBDOUT[7]) = (0:0:0, 0:0:0);
    (CASDINB[8] => CASDOUTB[8]) = (0:0:0, 0:0:0);
    (CASDINB[8] => DOUTBDOUT[8]) = (0:0:0, 0:0:0);
    (CASDINB[9] => CASDOUTB[9]) = (0:0:0, 0:0:0);
    (CASDINB[9] => DOUTBDOUT[9]) = (0:0:0, 0:0:0);
    (CASDINPA[0] => CASDOUTPA[0]) = (0:0:0, 0:0:0);
    (CASDINPA[0] => DOUTPADOUTP[0]) = (0:0:0, 0:0:0);
    (CASDINPA[1] => CASDOUTPA[1]) = (0:0:0, 0:0:0);
    (CASDINPA[1] => DOUTPADOUTP[1]) = (0:0:0, 0:0:0);
    (CASDINPB[0] => CASDOUTPB[0]) = (0:0:0, 0:0:0);
    (CASDINPB[0] => DOUTPBDOUTP[0]) = (0:0:0, 0:0:0);
    (CASDINPB[1] => CASDOUTPB[1]) = (0:0:0, 0:0:0);
    (CASDINPB[1] => DOUTPBDOUTP[1]) = (0:0:0, 0:0:0);
    (CLKARDCLK => CASDOUTA[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[10]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[11]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[12]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[13]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[14]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[15]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[2]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[3]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[4]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[5]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[6]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[7]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[8]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTA[9]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[10]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[11]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[12]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[13]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[14]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[15]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[2]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[3]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[4]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[5]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[6]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[7]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[8]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTB[9]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTPA[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTPA[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTPB[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => CASDOUTPB[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[10]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[11]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[12]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[13]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[14]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[15]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[2]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[3]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[4]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[5]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[6]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[7]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[8]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTADOUT[9]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[10]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[11]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[12]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[13]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[14]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[15]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[2]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[3]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[4]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[5]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[6]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[7]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[8]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTBDOUT[9]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTPADOUTP[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTPADOUTP[1]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTPBDOUTP[0]) = (100:100:100, 100:100:100);
    (CLKARDCLK => DOUTPBDOUTP[1]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[0]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[10]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[11]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[12]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[13]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[14]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[15]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[1]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[2]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[3]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[4]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[5]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[6]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[7]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[8]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTB[9]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTPB[0]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => CASDOUTPB[1]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[0]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[10]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[11]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[12]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[13]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[14]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[15]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[1]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[2]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[3]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[4]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[5]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[6]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[7]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[8]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTBDOUT[9]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTPBDOUTP[0]) = (100:100:100, 100:100:100);
    (CLKBWRCLK => DOUTPBDOUTP[1]) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTA[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTB[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTPA[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTPA[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTPB[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (CASDOUTPB[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTADOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTBDOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTPADOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTPADOUTP[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTPBDOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_A => (DOUTPBDOUTP[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTB[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTPB[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (CASDOUTPB[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTBDOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTPBDOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge ARST_B => (DOUTPBDOUTP[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTA[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTB[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTPA[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTPA[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTPB[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (CASDOUTPB[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTADOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTBDOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTPADOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTPADOUTP[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTPBDOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_A => (DOUTPBDOUTP[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTB[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTPB[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (CASDOUTPB[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[10] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[11] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[12] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[13] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[14] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[15] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[5] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[6] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[7] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[8] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTBDOUT[9] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTPBDOUTP[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge ARST_B => (DOUTPBDOUTP[1] +: 0)) = (100:100:100, 100:100:100);
  endspecify
`endif
endmodule

`endcelldefine
