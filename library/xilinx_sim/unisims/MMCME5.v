///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        MMCME5
// /___/   /\      Filename    : MMCME5.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module MMCME5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
  parameter real CLKIN_FREQ_MAX = 1230.000,
  parameter real CLKIN_FREQ_MIN = 10.000,
  parameter real CLKPFD_FREQ_MAX = 550.000,
  parameter real CLKPFD_FREQ_MIN = 10.000,
  parameter real VCOCLK_FREQ_MAX = 4320.000,
  parameter real VCOCLK_FREQ_MIN = 2160.000,
`endif
  parameter BANDWIDTH = "OPTIMIZED",
  parameter integer CLKFBOUT_FRACT = 0,
  parameter integer CLKFBOUT_MULT = 42,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter real CLKIN1_PERIOD = 0.000,
  parameter real CLKIN2_PERIOD = 0.000,
  parameter integer CLKOUT0_DIVIDE = 2,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter [1:0] CLKOUT0_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT1_DIVIDE = 2,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter [1:0] CLKOUT1_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT2_DIVIDE = 2,
  parameter real CLKOUT2_DUTY_CYCLE = 0.500,
  parameter real CLKOUT2_PHASE = 0.000,
  parameter [1:0] CLKOUT2_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT3_DIVIDE = 2,
  parameter real CLKOUT3_DUTY_CYCLE = 0.500,
  parameter real CLKOUT3_PHASE = 0.000,
  parameter [1:0] CLKOUT3_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT4_DIVIDE = 2,
  parameter real CLKOUT4_DUTY_CYCLE = 0.500,
  parameter real CLKOUT4_PHASE = 0.000,
  parameter [1:0] CLKOUT4_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT5_DIVIDE = 2,
  parameter real CLKOUT5_DUTY_CYCLE = 0.500,
  parameter real CLKOUT5_PHASE = 0.000,
  parameter [1:0] CLKOUT5_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT6_DIVIDE = 2,
  parameter real CLKOUT6_DUTY_CYCLE = 0.500,
  parameter real CLKOUT6_PHASE = 0.000,
  parameter [1:0] CLKOUT6_PHASE_CTRL = 2'b00,
  parameter [1:0] CLKOUTFB_PHASE_CTRL = 2'b00,
  parameter COMPENSATION = "AUTO",
  parameter integer DESKEW_DELAY1 = 0,
  parameter integer DESKEW_DELAY2 = 0,
  parameter DESKEW_DELAY_EN1 = "FALSE",
  parameter DESKEW_DELAY_EN2 = "FALSE",
  parameter DESKEW_DELAY_PATH1 = "FALSE",
  parameter DESKEW_DELAY_PATH2 = "FALSE",
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFB1_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKFB2_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKFBIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN1_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN1_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN2_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN2_INVERTED = 1'b0,
  parameter [0:0] IS_CLKINSEL_INVERTED = 1'b0,
  parameter [0:0] IS_PSEN_INVERTED = 1'b0,
  parameter [0:0] IS_PSINCDEC_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter LOCK_WAIT = "FALSE",
  parameter real REF_JITTER1 = 0.010,
  parameter real REF_JITTER2 = 0.010,
  parameter SS_EN = "FALSE",
  parameter SS_MODE = "CENTER_HIGH",
  parameter integer SS_MOD_PERIOD = 10000
)(
  output CLKFBOUT,
  output CLKFBSTOPPED,
  output CLKINSTOPPED,
  output CLKOUT0,
  output CLKOUT1,
  output CLKOUT2,
  output CLKOUT3,
  output CLKOUT4,
  output CLKOUT5,
  output CLKOUT6,
  output [15:0] DO,
  output DRDY,
  output LOCKED,
  output LOCKED1_DESKEW,
  output LOCKED2_DESKEW,
  output LOCKED_FB,
  output PSDONE,

  input CLKFB1_DESKEW,
  input CLKFB2_DESKEW,
  input CLKFBIN,
  input CLKIN1,
  input CLKIN1_DESKEW,
  input CLKIN2,
  input CLKIN2_DESKEW,
  input CLKINSEL,
  input [6:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input PSCLK,
  input PSEN,
  input PSINCDEC,
  input PWRDWN,
  input RST
);

`ifndef XIL_TIMING
  localparam real CLKIN_FREQ_MAX = 1230.000;
  localparam real CLKIN_FREQ_MIN = 10.000;
  localparam real CLKPFD_FREQ_MAX = 550.000;
  localparam real CLKPFD_FREQ_MIN = 10.000;
  localparam real VCOCLK_FREQ_MAX = 4320.000;
  localparam real VCOCLK_FREQ_MIN = 2160.000;
`endif

// define constants
  localparam MODULE_NAME = "MMCME5";
  
// Parameter encodings and registers
  localparam BANDWIDTH_HIGH = 0; //changed as per veam 2019/03/19
  localparam BANDWIDTH_LOW = 1;
  localparam BANDWIDTH_OPTIMIZED = 2;
  localparam COMPENSATION_AUTO = 0;
  localparam COMPENSATION_BUF_IN = 1;
  localparam COMPENSATION_EXTERNAL = 2;
  localparam COMPENSATION_INTERNAL = 3;
  localparam DESKEW_DELAY_EN1_FALSE = 0;
  localparam DESKEW_DELAY_EN1_TRUE = 1;
  localparam DESKEW_DELAY_EN2_FALSE = 0;
  localparam DESKEW_DELAY_EN2_TRUE = 1;
  localparam DESKEW_DELAY_PATH1_FALSE = 0;
  localparam DESKEW_DELAY_PATH1_TRUE = 1;
  localparam DESKEW_DELAY_PATH2_FALSE = 0;
  localparam DESKEW_DELAY_PATH2_TRUE = 1;
  localparam LOCK_WAIT_FALSE = 0;
  localparam LOCK_WAIT_TRUE = 1;
  localparam SS_EN_FALSE = 0;
  localparam SS_EN_TRUE = 1;
  localparam SS_MODE_CENTER_HIGH = 0;
  localparam SS_MODE_CENTER_LOW = 1;
  localparam SS_MODE_DOWN_HIGH = 2;
  localparam SS_MODE_DOWN_LOW = 3;
  localparam SLIP_TOLERANCE = 0.1; //10% slip is tolerated

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "MMCME5_dr.v"
`else
  reg [72:1] BANDWIDTH_REG = BANDWIDTH;
  reg [31:0] CLKFBOUT_FRACT_REG = CLKFBOUT_FRACT;
  reg [31:0] CLKFBOUT_MULT_REG = CLKFBOUT_MULT;
  real CLKFBOUT_PHASE_REG = CLKFBOUT_PHASE;
  real CLKIN1_PERIOD_REG = CLKIN1_PERIOD;
  real CLKIN2_PERIOD_REG = CLKIN2_PERIOD;
  real CLKIN_FREQ_MAX_REG = CLKIN_FREQ_MAX;
  real CLKIN_FREQ_MIN_REG = CLKIN_FREQ_MIN;
  reg [31:0] CLKOUT0_DIVIDE_REG = CLKOUT0_DIVIDE;
  real CLKOUT0_DUTY_CYCLE_REG = CLKOUT0_DUTY_CYCLE;
  real CLKOUT0_PHASE_REG = CLKOUT0_PHASE;
  reg [1:0] CLKOUT0_PHASE_CTRL_REG = CLKOUT0_PHASE_CTRL;
  reg [31:0] CLKOUT1_DIVIDE_REG = CLKOUT1_DIVIDE;
  real CLKOUT1_DUTY_CYCLE_REG = CLKOUT1_DUTY_CYCLE;
  real CLKOUT1_PHASE_REG = CLKOUT1_PHASE;
  reg [1:0] CLKOUT1_PHASE_CTRL_REG = CLKOUT1_PHASE_CTRL;
  reg [31:0] CLKOUT2_DIVIDE_REG = CLKOUT2_DIVIDE;
  real CLKOUT2_DUTY_CYCLE_REG = CLKOUT2_DUTY_CYCLE;
  real CLKOUT2_PHASE_REG = CLKOUT2_PHASE;
  reg [1:0] CLKOUT2_PHASE_CTRL_REG = CLKOUT2_PHASE_CTRL;
  reg [31:0] CLKOUT3_DIVIDE_REG = CLKOUT3_DIVIDE;
  real CLKOUT3_DUTY_CYCLE_REG = CLKOUT3_DUTY_CYCLE;
  real CLKOUT3_PHASE_REG = CLKOUT3_PHASE;
  reg [1:0] CLKOUT3_PHASE_CTRL_REG = CLKOUT3_PHASE_CTRL;
  reg [31:0] CLKOUT4_DIVIDE_REG = CLKOUT4_DIVIDE;
  real CLKOUT4_DUTY_CYCLE_REG = CLKOUT4_DUTY_CYCLE;
  real CLKOUT4_PHASE_REG = CLKOUT4_PHASE;
  reg [1:0] CLKOUT4_PHASE_CTRL_REG = CLKOUT4_PHASE_CTRL;
  reg [31:0] CLKOUT5_DIVIDE_REG = CLKOUT5_DIVIDE;
  real CLKOUT5_DUTY_CYCLE_REG = CLKOUT5_DUTY_CYCLE;
  real CLKOUT5_PHASE_REG = CLKOUT5_PHASE;
  reg [1:0] CLKOUT5_PHASE_CTRL_REG = CLKOUT5_PHASE_CTRL;
  reg [31:0] CLKOUT6_DIVIDE_REG = CLKOUT6_DIVIDE;
  real CLKOUT6_DUTY_CYCLE_REG = CLKOUT6_DUTY_CYCLE;
  real CLKOUT6_PHASE_REG = CLKOUT6_PHASE;
  reg [1:0] CLKOUT6_PHASE_CTRL_REG = CLKOUT6_PHASE_CTRL;
  reg [1:0] CLKOUTFB_PHASE_CTRL_REG = CLKOUTFB_PHASE_CTRL;
  real CLKPFD_FREQ_MAX_REG = CLKPFD_FREQ_MAX;
  real CLKPFD_FREQ_MIN_REG = CLKPFD_FREQ_MIN;
  reg [64:1] COMPENSATION_REG = COMPENSATION;
  reg [31:0] DESKEW_DELAY1_REG = DESKEW_DELAY1;
  reg [31:0] DESKEW_DELAY2_REG = DESKEW_DELAY2;
  reg [40:1] DESKEW_DELAY_EN1_REG = DESKEW_DELAY_EN1;
  reg [40:1] DESKEW_DELAY_EN2_REG = DESKEW_DELAY_EN2;
  reg [40:1] DESKEW_DELAY_PATH1_REG = DESKEW_DELAY_PATH1;
  reg [40:1] DESKEW_DELAY_PATH2_REG = DESKEW_DELAY_PATH2;
  reg [31:0] DIVCLK_DIVIDE_REG = DIVCLK_DIVIDE;
  reg [0:0] IS_CLKFB1_DESKEW_INVERTED_REG = IS_CLKFB1_DESKEW_INVERTED;
  reg [0:0] IS_CLKFB2_DESKEW_INVERTED_REG = IS_CLKFB2_DESKEW_INVERTED;
  reg [0:0] IS_CLKFBIN_INVERTED_REG = IS_CLKFBIN_INVERTED;
  reg [0:0] IS_CLKIN1_DESKEW_INVERTED_REG = IS_CLKIN1_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN1_INVERTED_REG = IS_CLKIN1_INVERTED;
  reg [0:0] IS_CLKIN2_DESKEW_INVERTED_REG = IS_CLKIN2_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN2_INVERTED_REG = IS_CLKIN2_INVERTED;
  reg [0:0] IS_CLKINSEL_INVERTED_REG = IS_CLKINSEL_INVERTED;
  reg [0:0] IS_PSEN_INVERTED_REG = IS_PSEN_INVERTED;
  reg [0:0] IS_PSINCDEC_INVERTED_REG = IS_PSINCDEC_INVERTED;
  reg [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  reg [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  reg [40:1] LOCK_WAIT_REG = LOCK_WAIT;
  real REF_JITTER1_REG = REF_JITTER1;
  real REF_JITTER2_REG = REF_JITTER2;
  reg [40:1] SS_EN_REG = SS_EN;
  reg [88:1] SS_MODE_REG = SS_MODE;
  reg [31:0] SS_MOD_PERIOD_REG = SS_MOD_PERIOD;
  real VCOCLK_FREQ_MAX_REG = VCOCLK_FREQ_MAX;
  real VCOCLK_FREQ_MIN_REG = VCOCLK_FREQ_MIN;
`endif

`ifdef XIL_XECLIB
  wire [1:0] BANDWIDTH_BIN;
  wire [5:0] CLKFBOUT_FRACT_BIN;
  wire [8:0] CLKFBOUT_MULT_BIN;
  wire [63:0] CLKFBOUT_PHASE_BIN;
  wire [63:0] CLKIN1_PERIOD_BIN;
  wire [63:0] CLKIN2_PERIOD_BIN;
  wire [63:0] CLKIN_FREQ_MAX_BIN;
  wire [63:0] CLKIN_FREQ_MIN_BIN;
  wire [8:0] CLKOUT0_DIVIDE_BIN;
  wire [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT0_PHASE_BIN;
  wire [8:0] CLKOUT1_DIVIDE_BIN;
  wire [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT1_PHASE_BIN;
  wire [8:0] CLKOUT2_DIVIDE_BIN;
  wire [63:0] CLKOUT2_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT2_PHASE_BIN;
  wire [8:0] CLKOUT3_DIVIDE_BIN;
  wire [63:0] CLKOUT3_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT3_PHASE_BIN;
  wire [8:0] CLKOUT4_DIVIDE_BIN;
  wire [63:0] CLKOUT4_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT4_PHASE_BIN;
  wire [8:0] CLKOUT5_DIVIDE_BIN;
  wire [63:0] CLKOUT5_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT5_PHASE_BIN;
  wire [8:0] CLKOUT6_DIVIDE_BIN;
  wire [63:0] CLKOUT6_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT6_PHASE_BIN;
  wire [63:0] CLKPFD_FREQ_MAX_BIN;
  wire [63:0] CLKPFD_FREQ_MIN_BIN;
  wire [1:0] COMPENSATION_BIN;
  wire [5:0] DESKEW_DELAY1_BIN;
  wire [5:0] DESKEW_DELAY2_BIN;
  wire DESKEW_DELAY_EN1_BIN;
  wire DESKEW_DELAY_EN2_BIN;
  wire DESKEW_DELAY_PATH1_BIN;
  wire DESKEW_DELAY_PATH2_BIN;
  wire [6:0] DIVCLK_DIVIDE_BIN;
  wire LOCK_WAIT_BIN;
  wire [63:0] REF_JITTER1_BIN;
  wire [63:0] REF_JITTER2_BIN;
  wire SS_EN_BIN;
  wire [1:0] SS_MODE_BIN;
  wire [15:0] SS_MOD_PERIOD_BIN;
  wire [63:0] VCOCLK_FREQ_MAX_BIN;
  wire [63:0] VCOCLK_FREQ_MIN_BIN;
`else
  reg [1:0] BANDWIDTH_BIN;
  reg [5:0] CLKFBOUT_FRACT_BIN;
  reg [8:0] CLKFBOUT_MULT_BIN;
  reg [63:0] CLKFBOUT_PHASE_BIN;
  reg [63:0] CLKIN1_PERIOD_BIN;
  reg [63:0] CLKIN2_PERIOD_BIN;
  reg [63:0] CLKIN_FREQ_MAX_BIN;
  reg [63:0] CLKIN_FREQ_MIN_BIN;
  reg [8:0] CLKOUT0_DIVIDE_BIN;
  reg [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT0_PHASE_BIN;
  reg [8:0] CLKOUT1_DIVIDE_BIN;
  reg [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT1_PHASE_BIN;
  reg [8:0] CLKOUT2_DIVIDE_BIN;
  reg [63:0] CLKOUT2_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT2_PHASE_BIN;
  reg [8:0] CLKOUT3_DIVIDE_BIN;
  reg [63:0] CLKOUT3_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT3_PHASE_BIN;
  reg [8:0] CLKOUT4_DIVIDE_BIN;
  reg [63:0] CLKOUT4_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT4_PHASE_BIN;
  reg [8:0] CLKOUT5_DIVIDE_BIN;
  reg [63:0] CLKOUT5_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT5_PHASE_BIN;
  reg [8:0] CLKOUT6_DIVIDE_BIN;
  reg [63:0] CLKOUT6_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT6_PHASE_BIN;
  reg [63:0] CLKPFD_FREQ_MAX_BIN;
  reg [63:0] CLKPFD_FREQ_MIN_BIN;
  reg [1:0] COMPENSATION_BIN;
  reg [5:0] DESKEW_DELAY1_BIN;
  reg [5:0] DESKEW_DELAY2_BIN;
  reg DESKEW_DELAY_EN1_BIN;
  reg DESKEW_DELAY_EN2_BIN;
  reg DESKEW_DELAY_PATH1_BIN;
  reg DESKEW_DELAY_PATH2_BIN;
  reg [6:0] DIVCLK_DIVIDE_BIN;
  reg LOCK_WAIT_BIN;
  reg [63:0] REF_JITTER1_BIN;
  reg [63:0] REF_JITTER2_BIN;
  reg SS_EN_BIN;
  reg [1:0] SS_MODE_BIN;
  reg [15:0] SS_MOD_PERIOD_BIN;
  reg [63:0] VCOCLK_FREQ_MAX_BIN;
  reg [63:0] VCOCLK_FREQ_MIN_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CLKFB1_DESKEW_in;
  wire CLKFB2_DESKEW_in;
  wire CLKFBIN_in;
  wire CLKIN1_DESKEW_in;
  wire CLKIN1_in;
  wire CLKIN2_DESKEW_in;
  wire CLKIN2_in;
  wire CLKINSEL_in;
  wire DCLK_in;
  wire DEN_in;
  wire DWE_in;
  wire PSCLK_in;
  wire PSEN_in;
  wire PSINCDEC_in;
  wire PWRDWN_in;
  wire RST_in;
  wire [15:0] DI_in;
  wire [6:0] DADDR_in;

`ifdef XIL_TIMING
  wire DCLK_delay;
  wire DEN_delay;
  wire DWE_delay;
  wire PSCLK_delay;
  wire PSEN_delay;
  wire PSINCDEC_delay;
  wire [15:0] DI_delay;
  wire [6:0] DADDR_delay;
`endif

`ifdef XIL_TIMING
  assign DADDR_in = DADDR_delay;
  assign DCLK_in = DCLK_delay;
  assign DEN_in = DEN_delay;
  assign DI_in = DI_delay;
  assign DWE_in = DWE_delay;
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK_delay; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN_delay ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = (PSINCDEC !== 1'bz) && (PSINCDEC_delay ^ IS_PSINCDEC_INVERTED_REG); // rv 0
`else
  assign DADDR_in = DADDR;
  assign DCLK_in = DCLK;
  assign DEN_in = DEN;
  assign DI_in = DI;
  assign DWE_in = DWE;
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = (PSINCDEC !== 1'bz) && (PSINCDEC ^ IS_PSINCDEC_INVERTED_REG); // rv 0
`endif

  assign CLKFB1_DESKEW_in = CLKFB1_DESKEW ^ IS_CLKFB1_DESKEW_INVERTED_REG;
  assign CLKFB2_DESKEW_in = CLKFB2_DESKEW ^ IS_CLKFB2_DESKEW_INVERTED_REG;
  assign CLKFBIN_in = (CLKFBIN === 1'bz) || (CLKFBIN ^ IS_CLKFBIN_INVERTED_REG); // rv 1
  assign CLKIN1_DESKEW_in = CLKIN1_DESKEW ^ IS_CLKIN1_DESKEW_INVERTED_REG;
  assign CLKIN1_in = (CLKIN1 === 1'bz) || (CLKIN1 ^ IS_CLKIN1_INVERTED_REG); // rv 1
  assign CLKIN2_DESKEW_in = CLKIN2_DESKEW ^ IS_CLKIN2_DESKEW_INVERTED_REG;
  assign CLKIN2_in = (CLKIN2 === 1'bz) || (CLKIN2 ^ IS_CLKIN2_INVERTED_REG); // rv 1
  assign CLKINSEL_in = (CLKINSEL === 1'bz) || (CLKINSEL ^ IS_CLKINSEL_INVERTED_REG); // rv 1
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN ^ IS_PWRDWN_INVERTED_REG); // rv 0
  assign RST_in = (RST !== 1'bz) && (RST ^ IS_RST_INVERTED_REG); // rv 0

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
  assign BANDWIDTH_BIN =
      (BANDWIDTH_REG == "OPTIMIZED") ? BANDWIDTH_OPTIMIZED :
      (BANDWIDTH_REG == "HIGH") ? BANDWIDTH_HIGH :
      (BANDWIDTH_REG == "LOW") ? BANDWIDTH_LOW :
       BANDWIDTH_OPTIMIZED;
  
  assign CLKFBOUT_FRACT_BIN = CLKFBOUT_FRACT_REG[5:0];
  
  assign CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[8:0];
  
  assign CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  assign CLKIN1_PERIOD_BIN = CLKIN1_PERIOD_REG * 1000;
  
  assign CLKIN2_PERIOD_BIN = CLKIN2_PERIOD_REG * 1000;
  
  assign CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  assign CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  assign CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[8:0];
  
  assign CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  assign CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[8:0];
  
  assign CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  assign CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[8:0];
  
  assign CLKOUT2_DUTY_CYCLE_BIN = CLKOUT2_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  assign CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[8:0];
  
  assign CLKOUT3_DUTY_CYCLE_BIN = CLKOUT3_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  assign CLKOUT4_DIVIDE_BIN = CLKOUT4_DIVIDE_REG[8:0];
  
  assign CLKOUT4_DUTY_CYCLE_BIN = CLKOUT4_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT4_PHASE_BIN = CLKOUT4_PHASE_REG * 1000;
  
  assign CLKOUT5_DIVIDE_BIN = CLKOUT5_DIVIDE_REG[8:0];
  
  assign CLKOUT5_DUTY_CYCLE_BIN = CLKOUT5_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT5_PHASE_BIN = CLKOUT5_PHASE_REG * 1000;
  
  assign CLKOUT6_DIVIDE_BIN = CLKOUT6_DIVIDE_REG[8:0];
  
  assign CLKOUT6_DUTY_CYCLE_BIN = CLKOUT6_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT6_PHASE_BIN = CLKOUT6_PHASE_REG * 1000;
  
  assign CLKPFD_FREQ_MAX_BIN = CLKPFD_FREQ_MAX_REG * 1000;
  
  assign CLKPFD_FREQ_MIN_BIN = CLKPFD_FREQ_MIN_REG * 1000;
  
  assign COMPENSATION_BIN =
      (COMPENSATION_REG == "AUTO") ? COMPENSATION_AUTO :
      (COMPENSATION_REG == "BUF_IN") ? COMPENSATION_BUF_IN :
      (COMPENSATION_REG == "EXTERNAL") ? COMPENSATION_EXTERNAL :
      (COMPENSATION_REG == "INTERNAL") ? COMPENSATION_INTERNAL :
       COMPENSATION_AUTO;
  
  assign DESKEW_DELAY1_BIN = DESKEW_DELAY1_REG[5:0];
  
  assign DESKEW_DELAY2_BIN = DESKEW_DELAY2_REG[5:0];
  
  assign DESKEW_DELAY_EN1_BIN =
      (DESKEW_DELAY_EN1_REG == "FALSE") ? DESKEW_DELAY_EN1_FALSE :
      (DESKEW_DELAY_EN1_REG == "TRUE") ? DESKEW_DELAY_EN1_TRUE :
       DESKEW_DELAY_EN1_FALSE;
  
  assign DESKEW_DELAY_EN2_BIN =
      (DESKEW_DELAY_EN2_REG == "FALSE") ? DESKEW_DELAY_EN2_FALSE :
      (DESKEW_DELAY_EN2_REG == "TRUE") ? DESKEW_DELAY_EN2_TRUE :
       DESKEW_DELAY_EN2_FALSE;
  
  assign DESKEW_DELAY_PATH1_BIN =
      (DESKEW_DELAY_PATH1_REG == "FALSE") ? DESKEW_DELAY_PATH1_FALSE :
      (DESKEW_DELAY_PATH1_REG == "TRUE") ? DESKEW_DELAY_PATH1_TRUE :
       DESKEW_DELAY_PATH1_FALSE;
  
  assign DESKEW_DELAY_PATH2_BIN =
      (DESKEW_DELAY_PATH2_REG == "FALSE") ? DESKEW_DELAY_PATH2_FALSE :
      (DESKEW_DELAY_PATH2_REG == "TRUE") ? DESKEW_DELAY_PATH2_TRUE :
       DESKEW_DELAY_PATH2_FALSE;
  
  assign DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[6:0];
  
  assign LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
  
  assign REF_JITTER1_BIN = REF_JITTER1_REG * 1000;
  
  assign REF_JITTER2_BIN = REF_JITTER2_REG * 1000;
  
  assign SS_EN_BIN =
      (SS_EN_REG == "FALSE") ? SS_EN_FALSE :
      (SS_EN_REG == "TRUE") ? SS_EN_TRUE :
       SS_EN_FALSE;
  
  assign SS_MODE_BIN =
      (SS_MODE_REG == "CENTER_HIGH") ? SS_MODE_CENTER_HIGH :
      (SS_MODE_REG == "CENTER_LOW") ? SS_MODE_CENTER_LOW :
      (SS_MODE_REG == "DOWN_HIGH") ? SS_MODE_DOWN_HIGH :
      (SS_MODE_REG == "DOWN_LOW") ? SS_MODE_DOWN_LOW :
       SS_MODE_CENTER_HIGH;
  
  assign SS_MOD_PERIOD_BIN = SS_MOD_PERIOD_REG[15:0];
  
  assign VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  assign VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
`else
  always @ (trig_attr) begin
  #1;
  BANDWIDTH_BIN =
      (BANDWIDTH_REG == "OPTIMIZED") ? BANDWIDTH_OPTIMIZED :
      (BANDWIDTH_REG == "HIGH") ? BANDWIDTH_HIGH :
      (BANDWIDTH_REG == "LOW") ? BANDWIDTH_LOW :
       BANDWIDTH_OPTIMIZED;
  
  CLKFBOUT_FRACT_BIN = CLKFBOUT_FRACT_REG[5:0];
  
  CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[8:0];
  
  CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  CLKIN1_PERIOD_BIN = CLKIN1_PERIOD_REG * 1000;
  
  CLKIN2_PERIOD_BIN = CLKIN2_PERIOD_REG * 1000;
  
  CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[8:0];
  
  CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[8:0];
  
  CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[8:0];
  
  CLKOUT2_DUTY_CYCLE_BIN = CLKOUT2_DUTY_CYCLE_REG * 1000;
  
  CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[8:0];
  
  CLKOUT3_DUTY_CYCLE_BIN = CLKOUT3_DUTY_CYCLE_REG * 1000;
  
  CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  CLKOUT4_DIVIDE_BIN = CLKOUT4_DIVIDE_REG[8:0];
  
  CLKOUT4_DUTY_CYCLE_BIN = CLKOUT4_DUTY_CYCLE_REG * 1000;
  
  CLKOUT4_PHASE_BIN = CLKOUT4_PHASE_REG * 1000;
  
  CLKOUT5_DIVIDE_BIN = CLKOUT5_DIVIDE_REG[8:0];
  
  CLKOUT5_DUTY_CYCLE_BIN = CLKOUT5_DUTY_CYCLE_REG * 1000;
  
  CLKOUT5_PHASE_BIN = CLKOUT5_PHASE_REG * 1000;
  
  CLKOUT6_DIVIDE_BIN = CLKOUT6_DIVIDE_REG[8:0];
  
  CLKOUT6_DUTY_CYCLE_BIN = CLKOUT6_DUTY_CYCLE_REG * 1000;
  
  CLKOUT6_PHASE_BIN = CLKOUT6_PHASE_REG * 1000;
  
  CLKPFD_FREQ_MAX_BIN = CLKPFD_FREQ_MAX_REG * 1000;
  
  CLKPFD_FREQ_MIN_BIN = CLKPFD_FREQ_MIN_REG * 1000;
  
  COMPENSATION_BIN =
      (COMPENSATION_REG == "AUTO") ? COMPENSATION_AUTO :
      (COMPENSATION_REG == "BUF_IN") ? COMPENSATION_BUF_IN :
      (COMPENSATION_REG == "EXTERNAL") ? COMPENSATION_EXTERNAL :
      (COMPENSATION_REG == "INTERNAL") ? COMPENSATION_INTERNAL :
       COMPENSATION_AUTO;
  
  DESKEW_DELAY1_BIN = DESKEW_DELAY1_REG[5:0];
  
  DESKEW_DELAY2_BIN = DESKEW_DELAY2_REG[5:0];
  
  DESKEW_DELAY_EN1_BIN =
      (DESKEW_DELAY_EN1_REG == "FALSE") ? DESKEW_DELAY_EN1_FALSE :
      (DESKEW_DELAY_EN1_REG == "TRUE") ? DESKEW_DELAY_EN1_TRUE :
       DESKEW_DELAY_EN1_FALSE;
  
  DESKEW_DELAY_EN2_BIN =
      (DESKEW_DELAY_EN2_REG == "FALSE") ? DESKEW_DELAY_EN2_FALSE :
      (DESKEW_DELAY_EN2_REG == "TRUE") ? DESKEW_DELAY_EN2_TRUE :
       DESKEW_DELAY_EN2_FALSE;
  
  DESKEW_DELAY_PATH1_BIN =
      (DESKEW_DELAY_PATH1_REG == "FALSE") ? DESKEW_DELAY_PATH1_FALSE :
      (DESKEW_DELAY_PATH1_REG == "TRUE") ? DESKEW_DELAY_PATH1_TRUE :
       DESKEW_DELAY_PATH1_FALSE;
  
  DESKEW_DELAY_PATH2_BIN =
      (DESKEW_DELAY_PATH2_REG == "FALSE") ? DESKEW_DELAY_PATH2_FALSE :
      (DESKEW_DELAY_PATH2_REG == "TRUE") ? DESKEW_DELAY_PATH2_TRUE :
       DESKEW_DELAY_PATH2_FALSE;
  
  DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[6:0];
  
  LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
  
  REF_JITTER1_BIN = REF_JITTER1_REG * 1000;
  
  REF_JITTER2_BIN = REF_JITTER2_REG * 1000;
  
  SS_EN_BIN =
      (SS_EN_REG == "FALSE") ? SS_EN_FALSE :
      (SS_EN_REG == "TRUE") ? SS_EN_TRUE :
       SS_EN_FALSE;
  
  SS_MODE_BIN =
      (SS_MODE_REG == "CENTER_HIGH") ? SS_MODE_CENTER_HIGH :
      (SS_MODE_REG == "CENTER_LOW") ? SS_MODE_CENTER_LOW :
      (SS_MODE_REG == "DOWN_HIGH") ? SS_MODE_DOWN_HIGH :
      (SS_MODE_REG == "DOWN_LOW") ? SS_MODE_DOWN_LOW :
       SS_MODE_CENTER_HIGH;
  
  SS_MOD_PERIOD_BIN = SS_MOD_PERIOD_REG[15:0];
  
  VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((BANDWIDTH_REG != "OPTIMIZED") &&
         (BANDWIDTH_REG != "HIGH") &&
         (BANDWIDTH_REG != "LOW"))) begin
      $display("Error: [Unisim %s-101] BANDWIDTH attribute is set to %s.  Legal values for this attribute are OPTIMIZED, HIGH or LOW. Instance: %m", MODULE_NAME, BANDWIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_FRACT_REG < 0) || (CLKFBOUT_FRACT_REG > 63))) begin
      $display("Error: [Unisim %s-102] CLKFBOUT_FRACT attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, CLKFBOUT_FRACT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_MULT_REG < 4) || (CLKFBOUT_MULT_REG > 432))) begin
      $display("Error: [Unisim %s-103] CLKFBOUT_MULT attribute is set to %d.  Legal values for this attribute are 4 to 432. Instance: %m", MODULE_NAME, CLKFBOUT_MULT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKFBOUT_PHASE_REG < -360.000 || CLKFBOUT_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-104] CLKFBOUT_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKFBOUT_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN1_PERIOD_REG < 0.000 || CLKIN1_PERIOD_REG > 100.000)) begin
      $display("Error: [Unisim %s-105] CLKIN1_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN1_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN2_PERIOD_REG < 0.000 || CLKIN2_PERIOD_REG > 100.000)) begin
      $display("Error: [Unisim %s-106] CLKIN2_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN2_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MAX_REG < 750.000 || CLKIN_FREQ_MAX_REG > 1230.000)) begin
      $display("Error: [Unisim %s-107] CLKIN_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 750.000 to 1230.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MIN_REG < 10.000 || CLKIN_FREQ_MIN_REG > 10.000)) begin
      $display("Error: [Unisim %s-108] CLKIN_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT0_DIVIDE_REG < 2) || (CLKOUT0_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-109] CLKOUT0_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT0_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_DUTY_CYCLE_REG < 0.001 || CLKOUT0_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-110] CLKOUT0_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT0_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_PHASE_REG < -360.000 || CLKOUT0_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-111] CLKOUT0_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT0_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT1_DIVIDE_REG < 2) || (CLKOUT1_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-113] CLKOUT1_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT1_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_DUTY_CYCLE_REG < 0.001 || CLKOUT1_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-114] CLKOUT1_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT1_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_PHASE_REG < -360.000 || CLKOUT1_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-115] CLKOUT1_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT1_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT2_DIVIDE_REG < 2) || (CLKOUT2_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-117] CLKOUT2_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT2_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT2_DUTY_CYCLE_REG < 0.001 || CLKOUT2_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-118] CLKOUT2_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT2_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT2_PHASE_REG < -360.000 || CLKOUT2_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-119] CLKOUT2_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT2_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT3_DIVIDE_REG < 2) || (CLKOUT3_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-121] CLKOUT3_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT3_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT3_DUTY_CYCLE_REG < 0.001 || CLKOUT3_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-122] CLKOUT3_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT3_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT3_PHASE_REG < -360.000 || CLKOUT3_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-123] CLKOUT3_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT3_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT4_DIVIDE_REG < 2) || (CLKOUT4_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-125] CLKOUT4_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT4_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT4_DUTY_CYCLE_REG < 0.001 || CLKOUT4_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-126] CLKOUT4_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT4_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT4_PHASE_REG < -360.000 || CLKOUT4_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-127] CLKOUT4_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT4_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT5_DIVIDE_REG < 2) || (CLKOUT5_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-129] CLKOUT5_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT5_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT5_DUTY_CYCLE_REG < 0.001 || CLKOUT5_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-130] CLKOUT5_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT5_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT5_PHASE_REG < -360.000 || CLKOUT5_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-131] CLKOUT5_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT5_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT6_DIVIDE_REG < 2) || (CLKOUT6_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-133] CLKOUT6_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT6_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT6_DUTY_CYCLE_REG < 0.001 || CLKOUT6_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-134] CLKOUT6_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT6_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT6_PHASE_REG < -360.000 || CLKOUT6_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-135] CLKOUT6_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT6_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKPFD_FREQ_MAX_REG < 450.000 || CLKPFD_FREQ_MAX_REG > 550.000)) begin
      $display("Error: [Unisim %s-138] CLKPFD_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 450.000 to 550.000. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKPFD_FREQ_MIN_REG < 10.000 || CLKPFD_FREQ_MIN_REG > 10.000)) begin
      $display("Error: [Unisim %s-139] CLKPFD_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((COMPENSATION_REG != "AUTO") &&
         (COMPENSATION_REG != "BUF_IN") &&
         (COMPENSATION_REG != "EXTERNAL") &&
         (COMPENSATION_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-140] COMPENSATION attribute is set to %s.  Legal values for this attribute are AUTO, BUF_IN, EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, COMPENSATION_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY1_REG < 0) || (DESKEW_DELAY1_REG > 63))) begin
      $display("Error: [Unisim %s-141] DESKEW_DELAY1 attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, DESKEW_DELAY1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY2_REG < 0) || (DESKEW_DELAY2_REG > 63))) begin
      $display("Error: [Unisim %s-142] DESKEW_DELAY2 attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, DESKEW_DELAY2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_EN1_REG != "FALSE") &&
         (DESKEW_DELAY_EN1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-143] DESKEW_DELAY_EN1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_EN1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_EN2_REG != "FALSE") &&
         (DESKEW_DELAY_EN2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-144] DESKEW_DELAY_EN2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_EN2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_PATH1_REG != "FALSE") &&
         (DESKEW_DELAY_PATH1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-145] DESKEW_DELAY_PATH1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_PATH1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_PATH2_REG != "FALSE") &&
         (DESKEW_DELAY_PATH2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-146] DESKEW_DELAY_PATH2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_PATH2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIVCLK_DIVIDE_REG < 1) || (DIVCLK_DIVIDE_REG > 123))) begin
      $display("Error: [Unisim %s-147] DIVCLK_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 123. Instance: %m", MODULE_NAME, DIVCLK_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOCK_WAIT_REG != "FALSE") &&
         (LOCK_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-160] LOCK_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOCK_WAIT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REF_JITTER1_REG < 0.000 || REF_JITTER1_REG > 0.200)) begin
      $display("Error: [Unisim %s-161] REF_JITTER1 attribute is set to %f.  Legal values for this attribute are 0.000 to 0.200. Instance: %m", MODULE_NAME, REF_JITTER1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REF_JITTER2_REG < 0.000 || REF_JITTER2_REG > 0.200)) begin
      $display("Error: [Unisim %s-162] REF_JITTER2 attribute is set to %f.  Legal values for this attribute are 0.000 to 0.200. Instance: %m", MODULE_NAME, REF_JITTER2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SS_EN_REG != "FALSE") &&
         (SS_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-163] SS_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SS_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SS_MODE_REG != "CENTER_HIGH") &&
         (SS_MODE_REG != "CENTER_LOW") &&
         (SS_MODE_REG != "DOWN_HIGH") &&
         (SS_MODE_REG != "DOWN_LOW"))) begin
      $display("Error: [Unisim %s-164] SS_MODE attribute is set to %s.  Legal values for this attribute are CENTER_HIGH, CENTER_LOW, DOWN_HIGH or DOWN_LOW. Instance: %m", MODULE_NAME, SS_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SS_MOD_PERIOD_REG < 4000) || (SS_MOD_PERIOD_REG > 40000))) begin
      $display("Error: [Unisim %s-165] SS_MOD_PERIOD attribute is set to %d.  Legal values for this attribute are 4000 to 40000. Instance: %m", MODULE_NAME, SS_MOD_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MAX_REG < 4320.000 || VCOCLK_FREQ_MAX_REG > 4320.000)) begin
      $display("Error: [Unisim %s-166] VCOCLK_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 4320.000 to 4320.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MIN_REG < 2160.000 || VCOCLK_FREQ_MIN_REG > 2160.000)) begin
      $display("Error: [Unisim %s-167] VCOCLK_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 2160.000 to 2160.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  // UNISIM %s- warning/error message next number: 38
  
  reg CLKFBOUT_out;
  reg CLKFBSTOPPED_out;
  reg CLKINSTOPPED_out;
  reg CLKOUT0_out;
  reg CLKOUT1_out;
  reg CLKOUT2_out;
  reg CLKOUT3_out;
  reg CLKOUT4_out;
  reg CLKOUT5_out;
  reg CLKOUT6_out;
  reg DRDY_out;
  reg LOCKED_out;
  reg   LOCKED1_DESKEW_out;
  reg   LOCKED2_DESKEW_out;
  reg   LOCKED_FB_out;
  wire       PSDONE_out;
  reg [15:0] DO_out;
  reg        psdone_repeat_on;
  reg [4:0]  psdone_repeat_cnt;
  reg        psdone_real;

  assign CLKFBOUT = CLKFBOUT_out;
  assign CLKFBSTOPPED = CLKFBSTOPPED_out;
  assign CLKINSTOPPED = CLKINSTOPPED_out;
  assign CLKOUT0 =  CLKOUT0_out;
  assign CLKOUT1 =  CLKOUT1_out;
  assign CLKOUT2 =  CLKOUT2_out;
  assign CLKOUT3 =  CLKOUT3_out;
  assign CLKOUT4 =  CLKOUT4_out;
  assign CLKOUT5 =  CLKOUT5_out;
  assign CLKOUT6 =  CLKOUT6_out;
  assign DO = DO_out;
  assign DRDY = DRDY_out;
  assign LOCKED = LOCKED_out;
  assign LOCKED1_DESKEW = LOCKED1_DESKEW_out;
  assign LOCKED2_DESKEW = LOCKED2_DESKEW_out;
  assign LOCKED_FB      = LOCKED_FB_out;     
  assign PSDONE = PSDONE_out;

  localparam ps_res = 32; // phase interpolator resolution is 32. 
  localparam real pi_res = 32.0; 
  localparam AVGI = 16; //number of input clk periods used for averaging
  reg [160:1] clkout_name;
  integer ps_in_init;
  integer clk0_delay=0, clk1_delay=0, clk2_delay=0, clk3_delay=0;
  integer clk0_delay_next=0, clk1_delay_next=0, clk2_delay_next=0, clk3_delay_next=0;
  reg[4:0] clk0_pi=0, clk1_pi=0, clk2_pi=0, clk3_pi=0;
  reg[1:0] clk0_intp_sel=0, clk1_intp_sel=0, clk2_intp_sel=0, clk3_intp_sel=0;
  integer clk4_delay=0, clk5_delay=0, clk6_delay=0, clkfbout_delay=0, clkfbout_delay_abs=0;
  integer clk4_delay_next=0, clk5_delay_next=0, clk6_delay_next=0, clkfbout_delay_next=0;
  reg[4:0] clk4_pi=0, clk5_pi=0, clk6_pi=0, clkfbout_pi=0;
  reg[1:0] clk4_intp_sel=0, clk5_intp_sel=0, clk6_intp_sel=0, clkfbout_intp_sel=0;
  reg[4:0] pi_dummy;
  reg[5:0] dt_dummy;
  reg clk0_fps_en=0, clk1_fps_en=0, clk2_fps_en=0, clk3_fps_en=0;
  reg clk4_fps_en=0, clk5_fps_en=0, clk6_fps_en=0, clkfbout_fps_en=0;
  reg clk0_pd1_en=0, clk1_pd1_en=0, clk2_pd1_en=0, clk3_pd1_en=0;
  reg clk4_pd1_en=0, clk5_pd1_en=0, clk6_pd1_en=0;
  reg clk0_pd2_en=0, clk1_pd2_en=0, clk2_pd2_en=0, clk3_pd2_en=0;
  reg clk4_pd2_en=0, clk5_pd2_en=0, clk6_pd2_en=0;
  reg [5:0]  deskew_prg_dly1_reg = 0;
  reg [5:0]  deskew_prg_dly2_reg = 0;
  integer    deskew_prg_dly1 = 0;
  integer    deskew_prg_dly2 = 0;
  integer clkin1_deskew_prg_dly =0;
  integer clkfb1_deskew_prg_dly =0;
  integer clkin2_deskew_prg_dly =0;
  integer clkfb2_deskew_prg_dly =0;
  reg deskew_dly_path1 = 0;
  reg deskew_dly_path2 = 0;
  reg deskew_dly_en1 = 0;
  reg deskew_dly_en2 = 0;
  reg fps_en=1'b0, fps_clk_en=1'b0;
  reg clkinstopped_out1;
  reg  psen_w = 0;
  reg clkfbstopped_out1;
  reg rst_clkfbstopped = 0;
  reg clkinstopped_out_dly = 0;
  reg rst_clkinstopped = 0;
  integer clkin_lost_cnt;
  integer clkfbin_lost_cnt;
  integer ps_cnt0;
  integer ps_cnt1;
  integer ps_cnt2;
  integer ps_cnt3;
  integer ps_cnt4;
  integer ps_cnt5;
  integer ps_cnt6;
  integer ps_cnt_fb;
  reg [6:0] daddr_lat;
  reg valid_daddr;
  reg drp_lock;
  integer drp_lock_lat = 4;
  integer drp_lock_lat_cnt;
  reg [15:0] dr_sram [127:0];
  reg rst_int = 1'b0;
  wire rst_in_o;
  reg clkout_en;
  reg clkfb_en;
  reg clkout_en_pre;
  reg clkout_en_pre2 = 0;
  integer  clkin_lock_cnt;
  integer clkout_en_time;
  integer locked_en_time;
  integer lock_cnt_max;
  integer pll_lock_time;
  integer lock_period_time;
  reg clkvco = 1'b0;
  reg clkpll_dly = 1'b0;
  reg clkpll_stopped;
  reg clkin_osc, clkin_p;
  reg clkfbin_osc, clkfbin_p;
  reg fb_delay_found=1'b0, fb_delay_found_tmp=1'b0;
  reg d1_delay_found=1'b0, d1_delay_found_tmp=1'b0;
  reg d2_delay_found=1'b0, d2_delay_found_tmp=1'b0;
  time fb_delay=0;
  time clkvco_delay=0;
  time clkpll_delay=0;
  time clkout_en_delay=0;
  time fb_d1_det_delay=0;//digital deskew 1 detected fb delay 
  time fb_d2_det_delay=0;//digital deskew 2 detected fb delay 
  time pd1_clk0_applied_det_delay=0;
  time pd1_clk1_applied_det_delay=0;
  time pd1_clk2_applied_det_delay=0;
  time pd1_clk3_applied_det_delay=0;
  time pd1_clk4_applied_det_delay=0;
  time pd1_clk5_applied_det_delay=0;
  time pd1_clk6_applied_det_delay=0;
  time pd2_clk0_applied_det_delay=0;
  time pd2_clk1_applied_det_delay=0;
  time pd2_clk2_applied_det_delay=0;
  time pd2_clk3_applied_det_delay=0;
  time pd2_clk4_applied_det_delay=0;
  time pd2_clk5_applied_det_delay=0;
  time pd2_clk6_applied_det_delay=0;
  time pd1_applied_delay=0;
  time pd2_applied_delay=0;
  real clkvco_delay_mod = 0;
  time fb_comp_delay=0;
  time clkin_edge;
  time clkin1_d_edge;
  time clkin2_d_edge;
  time delay_edge;
  time delay_edge_d1;
  time delay_edge_d2;
  real     period_clkin=500.0;
  real     period_clkin1_d=500.0;
  real     period_clkin2_d=500.0;
  integer  clkin_period_tmp;
  integer  clkin1_d_period_tmp;
  integer  clkin2_d_period_tmp;
  integer  clkin1_d_cnt;
  integer  clkin2_d_cnt;
  integer  clkin_period [AVGI-1:0];
  integer  clkin1_d_period [AVGI-1:0];
  integer  clkin2_d_period [AVGI-1:0];
  real     period_vco_rl = 2000.0;
  real     period_vco_rl_half = 1000.0;
  integer  period_fbout=100000;
  integer  period_avg=100000;
  integer  period_avg_clkin1_d=100000; //deskew
  integer  period_avg_clkin2_d=100000;
  integer  period_avg_clkin1_d_d=100000;
  integer  period_avg_clkin2_d_d=100000;
  reg  period_avg_clkin1_d_stable=0;
  reg  period_avg_clkin1_d_stable_i=0;
  reg  period_avg_clkin1_d_stable_f=0;
  reg  period_avg_clkin2_d_stable=0;
  reg  period_avg_clkin2_d_stable_i=0;
  reg  period_avg_clkin2_d_stable_f=0;
  integer period_ps0, period_ps_old0;
  integer period_ps1, period_ps_old1;
  integer period_ps2, period_ps_old2;
  integer period_ps3, period_ps_old3;
  integer period_ps4, period_ps_old4;
  integer period_ps5, period_ps_old5;
  integer period_ps6, period_ps_old6;
  integer period_ps_fb, period_ps_old_fb;
  reg  ps_lock;
  integer md_product;
  integer m_product;
  integer mf_product;
  integer pll_locked_delay;
  integer pll_locked_delay_cnt;
  integer clkin_lost_val;
  integer clkfbin_lost_val;
  wire pll_unlock;
  reg lock_period;
  reg unlock_recover;
  reg pll_locked = 0;
  reg clkout_locked = 0;
  reg clkpll_jitter_unlock = 0;
  reg clk0in=1'b0,clk1in=1'b0,clk2in=1'b0,clk3in=1'b0;
  reg clk4in=1'b0,clk5in=1'b0,clk6in=1'b0;
  wire clkpll;
  reg clkfboutin=1'b0;
  wire clkfbps_en;
  wire clk0ps_en, clk1ps_en, clk2ps_en, clk3ps_en;
  wire clk4ps_en, clk5ps_en, clk6ps_en;
  reg [9:0] clk0_dly_cnt;
  reg [9:0] clk1_dly_cnt;
  reg [9:0] clk2_dly_cnt;
  reg [9:0] clk3_dly_cnt;
  reg [9:0] clk4_dly_cnt;
  reg [9:0] clk5_dly_cnt;
  reg [9:0] clk6_dly_cnt;
  real clk0_phase;
  real clk1_phase;
  real clk2_phase;
  real clk3_phase;
  real clk4_phase;
  real clk5_phase;
  real clk6_phase;
  real divclk_phase;
  real clkfb_out_phase;
  reg [5:0] clkfb_out_fract;
  real clkfbout_duty; 
  real clkfbout_duty_calc; 
  real divclk_duty; 
  real clk0_duty;
  real clk1_duty;
  real clk2_duty;
  real clk3_duty;
  real clk4_duty;
  real clk5_duty;
  real clk6_duty;
  reg [1:0] clkfbout_mx = 2'b01;
  reg [1:0] clk0_mx = 2'b01;
  reg [1:0] clk1_mx = 2'b01;
  reg [1:0] clk2_mx = 2'b01;
  reg [1:0] clk3_mx = 2'b01;
  reg [1:0] clk4_mx = 2'b01;
  reg [1:0] clk5_mx = 2'b01;
  reg [1:0] clk6_mx = 2'b01;
  reg divclk_e, clkfbin_e;
  reg clkfbout_e;
  reg clk0_e;
  reg clk1_e; 
  reg clk2_e;
  reg clk3_e;
  reg clk4_e;
  reg clk5_e;
  reg clk6_e;
  reg [7:0] d_dt=0, clkfbout_dt=0;
  reg [7:0] clk0_dt=0, clk1_dt=0, clk2_dt=0, clk3_dt=0;
  reg [7:0] clk4_dt=0, clk5_dt=0, clk6_dt=0;
  reg [9:0] clk0_dt_int=0, clk1_dt_int=0, clk2_dt_int=0, clk3_dt_int=0;
  reg [9:0] clk4_dt_int=0, clk5_dt_int=0, clk6_dt_int=0, clkfbout_dt_int=0;
  reg       divclk_en=1, clkfbout_en=1;
  reg       clk0_en=1, clk1_en=1, clk2_en=1, clk3_en=1;
  reg       clk4_en=1, clk5_en=1, clk6_en=1;
  reg [7:0] clkfbout_ht;
  reg [7:0] divclk_ht;
  reg [7:0] clk0_ht, clk1_ht, clk2_ht, clk3_ht;
  reg [7:0] clk4_ht, clk5_ht, clk6_ht;
  reg [9:0] clkfbin_lt;
  reg [7:0] divclk_lt;
  reg [7:0] clkfbout_lt;
  reg [7:0] clk0_lt, clk1_lt, clk2_lt, clk3_lt;
  reg [7:0] clk4_lt, clk5_lt, clk6_lt;
  real      clkfbout_f_div=42.0;
  integer   clkfbout_div=42;
  reg       clkfbout_fract_en;
  reg [9:0] clk0_cnt =0;
  reg [9:0] clk1_cnt =0;
  reg [9:0] clk2_cnt =0;
  reg [9:0] clk3_cnt =0;
  reg [9:0] clk4_cnt =0;
  reg [9:0] clk5_cnt =0;
  reg [9:0] clk6_cnt =0;
  reg [9:0] clk0_div =0;
  reg [9:0] clk1_div =0;
  reg [9:0] clk2_div =0;
  reg [9:0] clk3_div =0;
  reg [9:0] clk4_div =0;
  reg [9:0] clk5_div =0;
  reg [9:0] clk6_div =0;
  integer divclk_cnt_max;
  integer clkfbout_cnt_max;
  integer clk0_cnt_max, clk1_cnt_max, clk2_cnt_max, clk3_cnt_max;
  integer clk4_cnt_max, clk5_cnt_max, clk6_cnt_max;
  integer divclk_cnt_ht;
  integer clk0_cnt_ht, clk1_cnt_ht, clk2_cnt_ht, clk3_cnt_ht;
  integer clk4_cnt_ht, clk5_cnt_ht, clk6_cnt_ht, clkfbout_cnt_ht;
  reg [7:0] divclk_div=8'd1 ;
  reg [7:0] divclk_cnt=8'd0;
  wire CLKFBIN_int;
  wire clkfbin_sel;
  reg drp_updt = 1'b0;

  real halfperiod_sum = 0.0;
  integer halfperiod = 0;
  reg clkvco_free = 1'b0;
  integer ik10=0, ik11=0;
  integer i=0;

  reg  ps_wr_to_max0 = 1'b0;
  reg  ps_wr_to_max1 = 1'b0;
  reg  ps_wr_to_max2 = 1'b0;
  reg  ps_wr_to_max3 = 1'b0;
  reg  ps_wr_to_max4 = 1'b0;
  reg  ps_wr_to_max5 = 1'b0;
  reg  ps_wr_to_max6 = 1'b0;

  reg  clk0_prediv2     = 1;
  reg  clk1_prediv2     = 1;
  reg  clk2_prediv2     = 1;
  reg  clk3_prediv2     = 1;
  reg  clk4_prediv2     = 1;
  reg  clk5_prediv2     = 1;
  reg  clk6_prediv2     = 1;
  reg  clkfbout_prediv2 = 1; 
  reg  clk0_start_h     = 0;
  reg  clk1_start_h     = 0;
  reg  clk2_start_h     = 0;
  reg  clk3_start_h     = 0;
  reg  clk4_start_h     = 0;
  reg  clk5_start_h     = 0;
  reg  clk6_start_h     = 0;
  reg  clkfbout_start_h = 0;
  reg  clk0_p5_en       = 0;
  reg  clk1_p5_en       = 0;
  reg  clk2_p5_en       = 0;
  reg  clk3_p5_en       = 0;
  reg  clk4_p5_en       = 0;
  reg  clk5_p5_en       = 0;
  reg  clk6_p5_en       = 0;
  reg  clk0_p5_fedge    = 0;
  reg  clk1_p5_fedge    = 0;
  reg  clk2_p5_fedge    = 0;
  reg  clk3_p5_fedge    = 0;
  reg  clk4_p5_fedge    = 0;
  reg  clk5_p5_fedge    = 0;
  reg  clk6_p5_fedge    = 0;
  reg  p5_fedge_dummy;
  reg  p5_en_dummy   ;
  reg  start_h_dummy ;
  reg  [3:0] pll_cp;
  reg  [3:0] pll_res;
  reg  [1:0] pll_lfhf;
  reg        dig_deskew_en1;
  reg        dig_deskew_en2;
  wire       anlg_deskew_en;
  reg  [9:0] lock_cnt;
  reg  [4:0] lock_fb_dly;
  reg  [9:0] lock_sat_high;
  reg  [4:0] lock_ref_dly;
  reg  [9:0] unlock_cnt;
  reg        ss_enabled;
  reg  clkin1_deskew_in_dly;
  reg  clkfb1_deskew_in_dly;
  reg  clkin2_deskew_in_dly;
  reg  clkfb2_deskew_in_dly;
  reg  pd1_locked;
  reg  pd2_locked;

  wire     slip_det_en;
  time     clkfbin_edge;
  integer  clkfbin_period_tmp;
  integer  clkfbin_period[4:0];
  integer  period_avg_clkfbin=100000;
  integer  period_clkin_at_lock   = 0;
  integer  period_clkfbin_at_lock = 0;
  wire     slip;
  reg      slip_clkin;
  reg      slip_clkfb;
  reg      slip_warn_displayed_clkin =0;
  reg      slip_warn_displayed_clkfbin =0;
  integer  slip_avg_in_cnt =0;
  integer  slip_avg_fb_cnt =0;
  wire     slip_avg_rdy;


  // reverse calculations
  reg [4:0]  clkfbout_pi_revc =0;
  reg [7:0]  clkfbout_dt_revc=0;
  reg [7:0]  clkfbout_ht_revc;
  reg [7:0]  clkfbout_lt_revc;
  reg        clkfbout_e_revc;
  reg [4:0]  clk0_pi_revc=0, clk1_pi_revc=0, clk2_pi_revc=0, clk3_pi_revc=0, clk4_pi_revc=0, clk5_pi_revc=0, clk6_pi_revc=0;
  reg        clk0_e_revc, clk1_e_revc, clk2_e_revc,clk3_e_revc,clk4_e_revc,clk5_e_revc,clk6_e_revc;
  reg [7:0]  clk0_dt_revc=0,clk1_dt_revc=0,clk2_dt_revc=0,clk3_dt_revc=0,clk4_dt_revc=0,clk5_dt_revc=0,clk6_dt_revc=0;
  reg [7:0]  clk0_ht_revc,clk1_ht_revc,clk2_ht_revc,clk3_ht_revc,clk4_ht_revc,clk5_ht_revc,clk6_ht_revc;
  reg [7:0]  clk0_lt_revc,clk1_lt_revc,clk2_lt_revc,clk3_lt_revc,clk4_lt_revc,clk5_lt_revc,clk6_lt_revc;
  reg        clk0_start_h_revc=0,clk1_start_h_revc=0,clk2_start_h_revc=0,clk3_start_h_revc=0,clk4_start_h_revc=0,clk5_start_h_revc=0,clk6_start_h_revc=0;
  reg        clk0_p5_en_revc=0,clk1_p5_en_revc=0,clk2_p5_en_revc=0,clk3_p5_en_revc=0,clk4_p5_en_revc=0,clk5_p5_en_revc=0,clk6_p5_en_revc=0;
  reg        clk0_p5_fedge_revc=0,clk1_p5_fedge_revc=0,clk2_p5_fedge_revc=0,clk3_p5_fedge_revc=0,clk4_p5_fedge_revc=0,clk5_p5_fedge_revc=0,clk6_p5_fedge_revc=0;
  reg        dig_deskew_en1_revc=0, dig_deskew_en2_revc=0;

  reg      psdec_adj0;
  reg      psdec_adj1;
  reg      psdec_adj2;
  reg      psdec_adj3;
  reg      psdec_adj4;
  reg      psdec_adj5;
  reg      psdec_adj6;
  reg      psdec_adj0_done;
  reg      psdec_adj1_done;
  reg      psdec_adj2_done;
  reg      psdec_adj3_done;
  reg      psdec_adj4_done;
  reg      psdec_adj5_done;
  reg      psdec_adj6_done;

  wire     dwe_in_pe;
  reg      dwe_in_dly;

  reg      input_jitter_warn_issued = 1'b0; //CR-1062375

  localparam    ST_PSDK_IDLE   = 0,
                ST_PSDK_LOCK   = 1,
                ST_PSDK_RLOCK1 = 2,
                ST_PSDK_RLOCK2 = 3;
              
  reg  [1:0]    ps_deskew_state;
  reg  [1:0]    ps_deskew_state_next; 
  reg           ps_deskew1_detected  =1'b0;
  reg           ps_deskew2_detected  =1'b0;
  reg           ps_deskew1_delay_found_tmp = 1'b0;
  reg           ps_deskew2_delay_found_tmp = 1'b0;
  reg           ps_deskew1_delay_found = 1'b0;
  reg           ps_deskew2_delay_found = 1'b0;
  wire          ps_deskew_lock;
  reg           ps_deskew1_rst;
  reg           ps_deskew2_rst;
  reg           ps_deskew_stop_upd_avg;


  integer jj1;
`ifndef XIL_XECLIB
  initial begin
    #1;
    if ($realtime == 0) begin
      $display ("Error: [Unisim %s-1] Simulator resolution is set to a value greater than 1 ps. ", MODULE_NAME);
      $display ("The simulator resolution must be set to 1ps or smaller. Instance %m");
      #1 $finish;
    end
  end
`endif

`ifndef XIL_XECLIB
`ifdef XIL_DR
  always @ (trig_attr) begin
`else
  initial begin
`endif
    #1;
    if ((CLKINSEL ^ IS_CLKINSEL_INVERTED_REG) == 0) begin
      if (CLKIN2_PERIOD_REG != 0.0) period_clkin =  CLKIN2_PERIOD_REG * 1000;
    end else begin
      if (CLKIN1_PERIOD_REG != 0.0) period_clkin =  CLKIN1_PERIOD_REG * 1000;
    end
    for( jj1=0;jj1<AVGI; jj1=jj1+1) begin
      clkin_period[jj1]    = period_clkin; 
      clkin1_d_period[jj1] = period_clkin1_d;
      clkin2_d_period[jj1] = period_clkin2_d;
    end
    clkin_period_tmp = 0;
    period_avg = period_clkin;

    clkin1_d_period_tmp = 0;
    period_avg_clkin1_d = period_clkin1_d;

    clkin2_d_period_tmp = 0;
    period_avg_clkin2_d = period_clkin2_d;

    //Make sure phase is positive btw 0 to 360.0
    mod_phase (CLKOUT0_PHASE_REG,  clk0_phase);
    mod_phase (CLKOUT1_PHASE_REG,  clk1_phase);
    mod_phase (CLKOUT2_PHASE_REG,  clk2_phase);
    mod_phase (CLKOUT3_PHASE_REG,  clk3_phase);
    mod_phase (CLKOUT4_PHASE_REG,  clk4_phase);
    mod_phase (CLKOUT5_PHASE_REG,  clk5_phase);
    mod_phase (CLKOUT6_PHASE_REG,  clk6_phase);
    mod_phase (CLKFBOUT_PHASE_REG, clkfb_out_phase);

    clk0_duty = CLKOUT0_DUTY_CYCLE_REG;
    clk1_duty = CLKOUT1_DUTY_CYCLE_REG;
    clk2_duty = CLKOUT2_DUTY_CYCLE_REG;
    clk3_duty = CLKOUT3_DUTY_CYCLE_REG;
    clk4_duty = CLKOUT4_DUTY_CYCLE_REG;
    clk5_duty = CLKOUT5_DUTY_CYCLE_REG;
    clk6_duty = CLKOUT6_DUTY_CYCLE_REG;
    clkfbout_duty  = 0.5; // always 0.5
    
    clkfbout_f_div  = (CLKFBOUT_MULT_REG * 1.0) + ((CLKFBOUT_FRACT_REG * 1.0) / (64.0));
    clkfbout_div    = CLKFBOUT_MULT_REG;
    clkfb_out_fract = CLKFBOUT_FRACT_REG;
    clkfbout_delay = period_avg * DIVCLK_DIVIDE_REG * (clkfb_out_phase / 360.0);
    clkfbout_e     = 0; 
    
    if(clkfb_out_fract=='d0) begin //non fractional mode. SDM disabled.
      clkfbout_fract_en = 0;
    end
    else begin
      clkfbout_fract_en = 1;
    end

    clkout_name = "CLKFBOUT";
    attr_to_mc (clkout_name, clkfbout_div, clkfb_out_phase, clkfbout_duty, 0, //prediv2 is considered 0 for fb calculations
                clkfbout_pi, clkfbout_e, clkfbout_dt, clkfbout_ht, clkfbout_lt,
                p5_fedge_dummy, p5_en_dummy,clkfbout_start_h );

    if (clkfbout_fract_en) begin //fractional mode. overwrite dt and pi
      attr_to_mc_fb( clkfbout_div, clkfb_out_phase, clkfb_out_fract,
        clkfbout_pi, clkfbout_dt);
    end  
    ht_calc(clkfbout_div,clkfbout_duty,clkfbout_dt,clkfbout_start_h,clkfbout_cnt_ht,clkfbout_cnt_max,clkfbout_dt_int);
    
    //
    if(clkfbout_fract_en && BANDWIDTH_REG != BANDWIDTH_LOW) 
      $display("Warning: [Unisim %s-25] Illegal BANDWIDTH setting for fractional mode at time %t. Instance %m ", MODULE_NAME, $time);

    if(clkfbout_fract_en)   begin
      GetMultVal(clkfbout_div,BANDWIDTH_LOW, pll_cp, pll_res );
      GetLockDetSettings_fract (clkfbout_div, lock_ref_dly, lock_fb_dly, lock_cnt, lock_sat_high, unlock_cnt);
    end
    else begin
      GetMultVal(clkfbout_div,BANDWIDTH_REG, pll_cp, pll_res );
      GetLockDetSettings (clkfbout_div, lock_ref_dly, lock_fb_dly, lock_cnt, lock_sat_high, unlock_cnt);
    end
    pll_lfhf = 2'b11;


    clk0_div = CLKOUT0_DIVIDE_REG;
    clk1_div = CLKOUT1_DIVIDE_REG;
    clk2_div = CLKOUT2_DIVIDE_REG;
    clk3_div = CLKOUT3_DIVIDE_REG;
    clk4_div = CLKOUT4_DIVIDE_REG;
    clk5_div = CLKOUT5_DIVIDE_REG;
    clk6_div = CLKOUT6_DIVIDE_REG;

    clkout_name = "CLKOUT0";
    attr_to_mc(clkout_name, clk0_div, clk0_phase, clk0_duty, clk0_prediv2,
               clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt, 
               clk0_p5_fedge, clk0_p5_en, clk0_start_h   );
    ht_calc(clk0_div,clk0_duty,clk0_dt,clk0_start_h,clk0_cnt_ht,clk0_cnt_max,clk0_dt_int);

    clkout_name = "CLKOUT1";
    attr_to_mc(clkout_name, clk1_div, clk1_phase, clk1_duty, clk1_prediv2,
               clk1_pi, clk1_e, clk1_dt,  clk1_ht, clk1_lt, 
               clk1_p5_fedge, clk1_p5_en, clk1_start_h   );
    ht_calc(clk1_div,clk1_duty,clk1_dt,clk1_start_h,clk1_cnt_ht,clk1_cnt_max,clk1_dt_int);

    clkout_name = "CLKOUT2";
    attr_to_mc(clkout_name, clk2_div, clk2_phase, clk2_duty, clk2_prediv2,
               clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt, 
               clk2_p5_fedge, clk2_p5_en, clk2_start_h   );
    ht_calc(clk2_div,clk2_duty,clk2_dt,clk2_start_h,clk2_cnt_ht,clk2_cnt_max,clk2_dt_int);

    clkout_name = "CLKOUT3";
    attr_to_mc(clkout_name, clk3_div, clk3_phase, clk3_duty, clk3_prediv2,
               clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt, 
               clk3_p5_fedge, clk3_p5_en, clk3_start_h   );
    ht_calc(clk3_div,clk3_duty,clk3_dt,clk3_start_h,clk3_cnt_ht,clk3_cnt_max,clk3_dt_int);

    clkout_name = "CLKOUT4";
    attr_to_mc(clkout_name, clk4_div, clk4_phase, clk4_duty, clk4_prediv2,
               clk4_pi, clk4_e, clk4_dt, clk4_ht, clk4_lt, 
               clk4_p5_fedge, clk4_p5_en, clk4_start_h   );
    ht_calc(clk4_div,clk4_duty,clk4_dt,clk4_start_h,clk4_cnt_ht,clk4_cnt_max,clk4_dt_int);

    clkout_name = "CLKOUT5";
    attr_to_mc(clkout_name, clk5_div, clk5_phase, clk5_duty, clk5_prediv2,
               clk5_pi, clk5_e, clk5_dt, clk5_ht, clk5_lt, 
               clk5_p5_fedge, clk5_p5_en, clk5_start_h   );
    ht_calc(clk5_div,clk5_duty,clk5_dt,clk5_start_h,clk5_cnt_ht,clk5_cnt_max,clk5_dt_int);

    clkout_name = "CLKOUT6";
    attr_to_mc(clkout_name, clk6_div, clk6_phase, clk6_duty, clk6_prediv2,
               clk6_pi, clk6_e, clk6_dt, clk6_ht, clk6_lt, 
               clk6_p5_fedge, clk6_p5_en, clk6_start_h   );
    ht_calc(clk6_div,clk6_duty,clk6_dt,clk6_start_h,clk6_cnt_ht,clk6_cnt_max,clk6_dt_int);


    divclk_div   = DIVCLK_DIVIDE_REG;
    divclk_duty  = 0.5;
    divclk_phase = 0;
    divclk_ht      = divclk_div;
    divclk_lt      = divclk_div;
    divclk_e       = 0;
    divclk_cnt_max = 2*divclk_div-1; //divclk_ht + divclk_lt-1; 
    divclk_cnt_ht  = divclk_div;

    ps_in_init  = 0;
    ps_cnt0     = ps_in_init;
    ps_cnt1     = ps_in_init;
    ps_cnt2     = ps_in_init;
    ps_cnt3     = ps_in_init;
    ps_cnt4     = ps_in_init;
    ps_cnt5     = ps_in_init;
    ps_cnt6     = ps_in_init;
    ps_cnt_fb   = ps_in_init;

    clk0_intp_sel = CLKOUT0_PHASE_CTRL_REG;
    clk1_intp_sel = CLKOUT1_PHASE_CTRL_REG;
    clk2_intp_sel = CLKOUT2_PHASE_CTRL_REG;
    clk3_intp_sel = CLKOUT3_PHASE_CTRL_REG;
    clk0_fps_en = (clk0_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT0
    clk1_fps_en = (clk1_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT1
    clk2_fps_en = (clk2_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT2
    clk3_fps_en = (clk3_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT3
    clk4_intp_sel = CLKOUT4_PHASE_CTRL_REG;
    clk5_intp_sel = CLKOUT5_PHASE_CTRL_REG;
    clk6_intp_sel = CLKOUT6_PHASE_CTRL_REG;
    clk4_fps_en = (clk4_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT4
    clk5_fps_en = (clk5_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT5
    clk6_fps_en = (clk6_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT6
    fps_en =    clk0_fps_en || clk1_fps_en || clk2_fps_en || clk3_fps_en
             || clk4_fps_en || clk5_fps_en || clk6_fps_en || clkfbout_fps_en;

    pll_lock_time = 12;
    lock_period_time = 10;
    m_product = clkfbout_div;
    md_product = clkfbout_div * divclk_div;
    mf_product = clkfbout_f_div * 64;
    period_fbout = period_avg * divclk_div;
    period_vco_rl = 1.0 * period_fbout / clkfbout_f_div;
    period_vco_rl_half = period_vco_rl / 2.0;
    clkfbout_delay_abs = period_avg * divclk_div * (clkfb_out_phase / 360.0);

    clkfbin_period[0] = period_fbout;
    clkfbin_period[1] = period_fbout;
    clkfbin_period[2] = period_fbout;
    clkfbin_period[3] = period_fbout;
    clkfbin_period[4] = period_fbout;
    clkfbin_period_tmp = 0;
    period_avg_clkfbin = period_fbout;

    if (~clkfbout_fract_en) begin
      clkout_en_time = 2 * md_product + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time + 2;
    end else begin
      clkout_en_time = 64 + 2 + pll_lock_time;
      locked_en_time = 64 +  clkout_en_time;
    end
      lock_cnt_max = locked_en_time + 16;

    clk0_pd1_en     = (clk0_intp_sel == 2'b01) ; // Digital deskew Phase Detector 1 for CLKOUT0 is enabled.
    clk1_pd1_en     = (clk1_intp_sel == 2'b01) ;
    clk2_pd1_en     = (clk2_intp_sel == 2'b01) ;
    clk3_pd1_en     = (clk3_intp_sel == 2'b01) ;
    clk4_pd1_en     = (clk4_intp_sel == 2'b01) ;
    clk5_pd1_en     = (clk5_intp_sel == 2'b01) ;
    clk6_pd1_en     = (clk6_intp_sel == 2'b01) ;
    dig_deskew_en1  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  ||
                       clk4_pd1_en || clk5_pd1_en || clk6_pd1_en );
    clk0_pd2_en     = (clk0_intp_sel == 2'b11) ; // Digital deskew Phase Detector 2 for CLKOUT0 is enabled.
    clk1_pd2_en     = (clk1_intp_sel == 2'b11) ;
    clk2_pd2_en     = (clk2_intp_sel == 2'b11) ;
    clk3_pd2_en     = (clk3_intp_sel == 2'b11) ;
    clk4_pd2_en     = (clk4_intp_sel == 2'b11) ;
    clk5_pd2_en     = (clk5_intp_sel == 2'b11) ;
    clk6_pd2_en     = (clk6_intp_sel == 2'b11) ;
    dig_deskew_en2  = (clk0_pd2_en || clk1_pd2_en || clk2_pd2_en || clk3_pd2_en  ||
                       clk4_pd2_en || clk5_pd2_en || clk6_pd2_en );

    //1: Add delay to CLKFB_DESKEW path 
    //0: Add delay to CLKIN_DESKEW path
    deskew_dly_path1 = (DESKEW_DELAY_PATH1_BIN == DESKEW_DELAY_PATH1_TRUE)? 1'b1 : 1'b0; 
    deskew_dly_path2 = (DESKEW_DELAY_PATH2_BIN == DESKEW_DELAY_PATH2_TRUE)? 1'b1 : 1'b0;

    //digital deskew programmable delay path enabled or not
    deskew_dly_en1 = (DESKEW_DELAY_EN1_BIN == DESKEW_DELAY_EN1_TRUE)? 1'b1 : 1'b0; 
    deskew_dly_en2 = (DESKEW_DELAY_EN2_BIN == DESKEW_DELAY_EN2_TRUE)? 1'b1 : 1'b0;

    //absolute programmable delay in ps
    deskew_prg_dly1_reg   = DESKEW_DELAY1_BIN;
    deskew_prg_dly2_reg   = DESKEW_DELAY2_BIN;
    deskew_prg_dly1       = (DESKEW_DELAY1_BIN * 40) + 200 ;
    deskew_prg_dly2       = (DESKEW_DELAY2_BIN * 40) + 200 ;
    clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
    clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;
    clkin2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==0)) ? deskew_prg_dly2 : 0;
    clkfb2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==1)) ? deskew_prg_dly2 : 0;
       
    clk0_delay = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay) + (clk0_pd2_en * pd2_clk0_applied_det_delay);
    clk1_delay = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay) + (clk1_pd2_en * pd2_clk1_applied_det_delay);
    clk2_delay = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay) + (clk2_pd2_en * pd2_clk2_applied_det_delay);
    clk3_delay = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay) + (clk3_pd2_en * pd2_clk3_applied_det_delay);
    clk4_delay = ((clk4_pi * period_vco_rl) / pi_res) + (clk4_fps_en * period_ps4) + (clk4_pd1_en * pd1_clk4_applied_det_delay) + (clk4_pd2_en * pd2_clk4_applied_det_delay);
    clk5_delay = ((clk5_pi * period_vco_rl) / pi_res) + (clk5_fps_en * period_ps5) + (clk5_pd1_en * pd1_clk5_applied_det_delay) + (clk5_pd2_en * pd2_clk5_applied_det_delay);
    clk6_delay = ((clk6_pi * period_vco_rl) / pi_res) + (clk6_fps_en * period_ps6) + (clk6_pd1_en * pd1_clk6_applied_det_delay) + (clk6_pd2_en * pd2_clk6_applied_det_delay);
    clkfbout_delay = ((clkfbout_pi * period_vco_rl) / pi_res) + (clkfbout_fps_en*period_ps_fb);

    dr_sram[8'h28>>2] = 16'd0; // RESERVED
    dr_sram[8'h2c>>2] = 16'd0; // RESERVED
    dr_sram[8'h30>>2] = {3'd0, clkfbout_prediv2, 2'b01, clkfbout_en, clkfbout_e, clkfbout_dt[7:0]};
    dr_sram[8'h34>>2] = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; 
    dr_sram[8'h38>>2] = {clk0_p5_fedge, clk0_start_h, clk0_p5_en, clk0_en, clk0_prediv2, clk0_mx[1:0], clk0_e, clk0_dt[7:0]};
    dr_sram[8'h3c>>2] = {clk0_ht[7:0], clk0_lt[7:0]}; 
    dr_sram[8'h40>>2] = {clk1_p5_fedge, clk1_start_h, clk1_p5_en, clk1_en, clk1_prediv2, clk1_mx[1:0], clk1_e, clk1_dt[7:0]};
    dr_sram[8'h44>>2] = {clk1_ht[7:0], clk1_lt[7:0]}; 
    dr_sram[8'h48>>2] = {clk2_p5_fedge, clk2_start_h, clk2_p5_en, clk2_en, clk2_prediv2, clk2_mx[1:0], clk2_e, clk2_dt[7:0]};
    dr_sram[8'h4c>>2] = {clk2_ht[7:0], clk2_lt[7:0]}; 
    dr_sram[8'h50>>2] = {clk3_p5_fedge, clk3_start_h, clk3_p5_en, clk3_en, clk3_prediv2, clk3_mx[1:0], clk3_e, clk3_dt[7:0]};
    dr_sram[8'h54>>2] = {clk3_ht[7:0], clk3_lt[7:0]}; 
    dr_sram[8'h58>>2] = 16'd0; // RESERVED
    dr_sram[8'h5c>>2] = 16'd0; // RESERVED
    dr_sram[8'h60>>2] = 16'd0; // RESERVED
    dr_sram[8'h64>>2] = 16'd0; // RESERVED
    dr_sram[8'h68>>2] = 16'd0; // RESERVED
    dr_sram[8'h6c>>2] = 16'd0; // RESERVED
    dr_sram[8'h70>>2] = 16'd0; // RESERVED
    dr_sram[8'h74>>2] = 16'd0; // RESERVED
    dr_sram[8'h78>>2] = {12'h002, pll_cp};
    dr_sram[8'h7c>>2] = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
    dr_sram[8'h80>>2] = {5'd0, divclk_e, 1'b0, dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]};
    dr_sram[8'h84>>2] = {divclk_ht[7:0], divclk_lt[7:0]}; 
    dr_sram[8'h88>>2] = 16'd0; // RESERVED
    dr_sram[8'h8c>>2] = 16'd0; // RESERVED
    dr_sram[8'h90>>2] = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
    dr_sram[8'h94>>2] = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
    dr_sram[8'h98>>2] = {4'd0, pll_lfhf, 10'h280};
    dr_sram[8'h9c>>2] = {1'b0, lock_fb_dly[4:0], lock_cnt[9:0]};
    dr_sram[8'ha0>>2] = {1'b0, lock_ref_dly[4:0],lock_sat_high[9:0]}; 
    dr_sram[8'ha4>>2] = 16'd0; // RESERVED
    dr_sram[8'ha8>>2] = {11'd0, pll_res,1'b0};
    dr_sram[8'hac>>2] = 16'd0; // RESERVED
    dr_sram[8'hb0>>2] = 16'd0; // RESERVED
    dr_sram[8'hb4>>2] = 16'd0; // RESERVED
    dr_sram[8'hb8>>2] = 16'd0; // RESERVED
    dr_sram[8'hbc>>2] = 16'd0; // RESERVED
    dr_sram[8'hc0>>2] = {6'd0, unlock_cnt[9:0]};
    dr_sram[9'hc4>>2] = 16'd0; // RESERVED
    dr_sram[8'hc8>>2] = 16'd0; // RESERVED
    dr_sram[8'hcc>>2] = {clk4_p5_fedge, clk4_start_h, clk4_p5_en, clk4_en, clk4_prediv2, clk4_mx[1:0], clk4_e, clk4_dt[7:0]};
    dr_sram[8'hd0>>2] = {clk4_ht[7:0], clk4_lt[7:0]}; 
    dr_sram[8'hd4>>2] = {clk5_p5_fedge, clk5_start_h, clk5_p5_en, clk5_en, clk5_prediv2, clk5_mx[1:0], clk5_e, clk5_dt[7:0]};
    dr_sram[8'hd8>>2] = {clk5_ht[7:0], clk5_lt[7:0]}; 
    dr_sram[8'hdc>>2] = {clk6_p5_fedge, clk6_start_h, clk6_p5_en, clk6_en, clk6_prediv2, clk6_mx[1:0], clk6_e, clk6_dt[7:0]};
    dr_sram[8'he0>>2] = {clk6_ht[7:0], clk6_lt[7:0]};
    dr_sram[8'he4>>2] = {1'b0,clk5_pi,clk5_intp_sel,1'b0,clk4_pi,clk4_intp_sel}; 
    dr_sram[8'he8>>2] = {1'b0,clkfbout_pi,clkfbout_intp_sel,1'b0,clk6_pi,clk6_intp_sel}; 
    dr_sram[8'hec>>2] = 16'd0; // RESERVED
    dr_sram[8'hf0>>2] = {10'd0,clkfb_out_fract[5:0]};
    dr_sram[8'hf4>>2] = 16'd0; // RESERVED
    dr_sram[8'hf8>>2] = {9'h027,ss_enabled,6'h01};
    dr_sram[8'hfc>>2] = {14'd0,clkfbout_fract_en,1'b1}; 
  end
`endif

  initial begin
    clkpll_stopped = 0;
    clkin_osc = 0;
    clkfbin_osc = 0;
    clkin_p = 0;
    clkfbin_p = 0;
    ps_lock = 0;
    psdone_real = 1'b0;
    rst_int = 0;
    CLKINSTOPPED_out = 1'b0;
    clkinstopped_out1 = 0;
    CLKFBSTOPPED_out = 1'b0;
    clkfbstopped_out1 = 0;
    clkin_lost_val = 2;
    clkfbin_lost_val = 2;
    clkvco_delay = 0;
    clkvco_delay_mod = 0;
    clkpll_delay = 0;
    period_ps0 = 0;
    period_ps1 = 0;
    period_ps2 = 0;
    period_ps3 = 0;
    period_ps4 = 0;
    period_ps5 = 0;
    period_ps6 = 0;
    period_ps_old0 = 0;
    period_ps_old1 = 0;
    period_ps_old2 = 0;
    period_ps_old3 = 0;
    period_ps_old4 = 0;
    period_ps_old5 = 0;
    period_ps_old6 = 0;
    fb_delay_found = 1'b0;
    fb_delay_found_tmp = 1'b0;
    d1_delay_found = 1'b0;
    d1_delay_found_tmp = 1'b0;
    d2_delay_found = 1'b0;
    d2_delay_found_tmp = 1'b0;
    clkin_edge = 0;
    clkin1_d_edge =0;
    clkin2_d_edge =0;
    clkfbin_edge = 0;
    clkin1_d_cnt = 0;
    clkin2_d_cnt = 0;
    delay_edge = 0;
    delay_edge_d1 = 0;
    delay_edge_d2 = 0;
    clkout_en = 0;
    clkfb_en = 0;
    clkout_en_pre = 0;
    pll_locked_delay = 0;
    pll_locked_delay_cnt = 0;
    unlock_recover = 0;
    clkin_lock_cnt = 0;
    lock_period = 0;
    DRDY_out = 1'b0;
    LOCKED_out = 1'b0;
    LOCKED_FB_out = 1'b0;
    LOCKED1_DESKEW_out = 1'b0;
    LOCKED2_DESKEW_out = 1'b0;
    DO_out = 16'd0;
    clk0_dly_cnt = 10'd0;
    clk1_dly_cnt = 10'd0;
    clk2_dly_cnt = 10'd0;
    clk3_dly_cnt = 10'd0;
    clk4_dly_cnt = 10'd0;
    clk5_dly_cnt = 10'd0;
    clk6_dly_cnt = 10'd0;
    CLKOUT0_out = 1'b0;
    CLKOUT1_out = 1'b0;
    CLKOUT2_out = 1'b0;
    CLKOUT3_out = 1'b0;
    CLKOUT4_out = 1'b0;
    CLKOUT5_out = 1'b0;
    CLKOUT6_out = 1'b0;
    CLKFBOUT_out = 1'b0;
    pd1_clk0_applied_det_delay=0;
    pd1_clk1_applied_det_delay=0;
    pd1_clk2_applied_det_delay=0;
    pd1_clk3_applied_det_delay=0;
    pd1_clk4_applied_det_delay=0;
    pd1_clk5_applied_det_delay=0;
    pd1_clk6_applied_det_delay=0;
    pd2_clk0_applied_det_delay=0;
    pd2_clk1_applied_det_delay=0;
    pd2_clk2_applied_det_delay=0;
    pd2_clk3_applied_det_delay=0;
    pd2_clk4_applied_det_delay=0;
    pd2_clk5_applied_det_delay=0;
    pd2_clk6_applied_det_delay=0;
    period_avg_clkin1_d=100000;
    period_avg_clkin2_d=100000;
    period_avg_clkin1_d_d=100000;
    period_avg_clkin2_d_d=100000;
    period_avg_clkin1_d_stable=0;
    period_avg_clkin1_d_stable_i=0;
    period_avg_clkin1_d_stable_f=0;
    period_avg_clkin2_d_stable=0;
    period_avg_clkin2_d_stable_i=0;
    period_avg_clkin2_d_stable_f=0;
    pd1_locked = 0;
    pd2_locked = 0;
    slip_clkin = 0;
    slip_clkfb = 0;
    psdec_adj0 = 1'b0;
    psdec_adj1 = 1'b0;
    psdec_adj2 = 1'b0;
    psdec_adj3 = 1'b0;
    psdec_adj4 = 1'b0;
    psdec_adj5 = 1'b0;
    psdec_adj6 = 1'b0;
    ps_deskew_state      = ST_PSDK_IDLE;
    ps_deskew_state_next = ST_PSDK_IDLE;
    ps_deskew1_detected  =1'b0;
    ps_deskew2_detected  =1'b0;
    ps_deskew1_delay_found_tmp = 1'b0;
    ps_deskew2_delay_found_tmp = 1'b0;
    ps_deskew1_delay_found = 1'b0;
    ps_deskew2_delay_found = 1'b0;
    ps_deskew1_rst = 1'b0;    
    ps_deskew2_rst = 1'b0;    
    ps_deskew_stop_upd_avg = 1'b0;
  end

  assign clkpll = (CLKINSEL_in & CLKIN1_in) | (~CLKINSEL_in & CLKIN2_in);

  always @(posedge clkpll or posedge RST_in or posedge PWRDWN_in)
       rst_int <= (RST_in === 1'b1) || (PWRDWN_in === 1'b1);

  assign rst_in_o = (rst_int || rst_clkfbstopped || rst_clkinstopped);

  //
  // DRP access
  //
  assign dwe_in_ne = ~DWE_in & dwe_in_dly;

  always @(posedge DCLK_in or posedge glblGSR) begin
    if (glblGSR == 1) 
      dwe_in_dly <= 1'b0;
    else
      dwe_in_dly <= DWE_in;
  end

  always @(posedge DCLK_in or posedge glblGSR) begin
    if (~glblGSR) begin
      if (drp_lock) begin
        if(~DEN_in) begin
          $display("Error: [Unisim %s-33] DEN is deasserted at time %t. Need wait for DRDY signal to be asserted to comply with APB3 transfer. Instance %m ", MODULE_NAME, $time);
          #1 $finish;
        end
        else if(dwe_in_ne) begin
          $display("Error: [Unisim %s-34] DWE is deasserted at time %t. Need wait for DRDY signal to be asserted to comply with APB3 transfer. Instance %m ", MODULE_NAME, $time);
          #1 $finish;
        end
      end
    end
  end

  always @(posedge DCLK_in or posedge glblGSR)
    if (glblGSR == 1) begin
      drp_lock <= 0;
      drp_updt <= 1'b0;
    end else begin
      if (~RST_in && drp_updt) 
        drp_updt <= 1'b0;

      if (DEN_in == 1) begin
        valid_daddr = addr_is_valid(DADDR_in);
        
        if (~drp_lock) begin
          drp_lock <= 1;
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
          daddr_lat <= DADDR_in;
        end

        if (~valid_daddr) 
          $display("Warning: [Unisim %s-15] Address DADDR=%b is unsupported at time %t. Instance %m ", MODULE_NAME, DADDR_in, $time);

          if (DWE_in == 1) begin          // write process
            if (rst_int == 1) begin
              //if (valid_daddr) dr_sram[DADDR_in] <= DI_in;
              if (valid_daddr || drp_updt) 
                drp_updt <= 1'b1;
              case ({DADDR_in,2'b00})
                8'h28: begin // = 16'h0; // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h2c: begin // = 16'h0; // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h30: begin 
                       {clkfbout_e, clkfbout_dt[7:0]} = DI_in[8:0];
                       end
                8'h34: begin // = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; // RSVD[31:16] CLKFBOUT_HT[15:8], CLKFBOUT_LT[7:0]
                       {clkfbout_ht[7:0], clkfbout_lt[7:0]} = DI_in[15:0];
                       end
                8'h38: begin 
                       {clk0_p5_fedge, clk0_start_h, clk0_p5_en} = DI_in[15:13];
                       {clk0_e, clk0_dt[7:0]} = DI_in[8:0];
                       end
                8'h3c: begin // RSVD[31:16] CLKOUT0_HT[15:8], CLKOUT0_LT[7:0]
                       {clk0_ht[7:0], clk0_lt[7:0]} = DI_in[15:0];
                       end
                8'h40: begin 
                       {clk1_p5_fedge, clk1_start_h, clk1_p5_en} = DI_in[15:13];
                       {clk1_e, clk1_dt[7:0]} = DI_in[8:0];
                       end
                8'h44: begin // = {clk1_ht[7:0], clk1_lt[7:0]}; // RSVD[31:16] CLKOUT1_HT[15:8], CLKOUT1_LT[7:0]
                       {clk1_ht[7:0], clk1_lt[7:0]} = DI_in[15:0];
                       end
                8'h48: begin 
                       {clk2_p5_fedge, clk2_start_h, clk2_p5_en} = DI_in[15:13];
                       {clk2_e, clk2_dt[7:0]} = DI_in[8:0];
                       end
                8'h4c: begin // = {clk2_ht[7:0], clk2_lt[7:0]}; // RSVD[31:16] CLKOUT2_HT[15:8], CLKOUT2_LT[7:0]
                       {clk2_ht[7:0], clk2_lt[7:0]} = DI_in[15:0];
                       end
                8'h50: begin 
                       {clk3_p5_fedge, clk3_start_h, clk3_p5_en} = DI_in[15:13];
                       {clk3_e, clk3_dt[7:0]} = DI_in[8:0];
                       end
                8'h54: begin // = {clk3_ht[7:0], clk3_lt[7:0]}; // RSVD[31:16] CLKOUT3_HT[15:8], CLKOUT3_LT[7:0]
                       {clk3_ht[7:0], clk3_lt[7:0]} = DI_in[15:0];
                       end
                8'h58: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h5c: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h60: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h64: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h68: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h6c: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h70: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h74: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h78: begin // RESERVED[31:4]  CP[3:0]
                       pll_cp[3:0] = DI_in[3:0];
                       end
                8'h7c: begin  
                       {dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]} = DI_in[8:0]; 
                       end
                8'h80: begin 
                       divclk_e = DI_in[10];
                       {dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]} = DI_in[8:0]; 
                       end
                8'h84: begin // RSVD[31:16] DIVCLK_HT[15:8], DIVCLK_LT[7:0]
                       {divclk_ht[7:0], divclk_lt[7:0]} = DI_in[15:0];
                       end
                8'h88: begin  // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h8c: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'h90: begin // RESERVED[31:15] INTERP1_SKEW[14:10] INTERP1_SEL[9:8] RESERVED[7] INTERP0_SKEW[6:2] INTERP0_SEL[1:0]
                       {clk1_pi,clk1_intp_sel} = DI_in[14:8];
                       {clk0_pi,clk0_intp_sel} = DI_in[6:0];
                       end
                8'h94: begin // RESERVED[31:15] INTERP3_SKEW[14:10] INTERP3_SEL[9:8] RESERVED[7] INTERP2_SKEW[6:2] INTERP2_SEL[1:0]
                       {clk3_pi,clk3_intp_sel} = DI_in[14:8];
                       {clk2_pi,clk2_intp_sel} = DI_in[6:0];
                       end
                8'h98: begin // RESERVED[31:12] LFHF[11:10] RESERVED[9:0]
                       pll_lfhf = DI_in[11:10];
                       end
                8'h9c: begin // RESERVED[31:15] LOCK_FB_DLY[14:10] LOCK_CNT[9:0]
                       {lock_fb_dly[4:0],lock_cnt[9:0]} = DI_in[14:0];
                       end
                8'ha0: begin // RESERVED[31:15] LOCK_REF_DLY[14:10] LOCK_SAT_HIGH[9:0]
                       {lock_ref_dly[4:0],lock_sat_high[9:0]} = DI_in[14:0];
                       end
                8'ha4: begin // = 16'h0; // RESERVED[31:13] MMCM_EN[12] PI_PROGRAM[11] PFD_STARTUP[10] PFD[9:3] MAN_LF[2:0]
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'ha8: begin // RESERVED[31:5] RES[4:1] RESERVED[0]
                       pll_res[3:0] = DI_in[4:1];
                       end
                8'hac: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hb0: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hb4: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hb8: begin  // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hbc: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hc0: begin // RESERVED[31:10] UNLOCK_CNT[9:0]
                       unlock_cnt = DI_in[9:0];
                       end
                8'hc4: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hc8: begin // RESERVED[31:12] 
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hcc: begin 
                       {clk4_p5_fedge, clk4_start_h, clk4_p5_en} = DI_in[15:13];
                       {clk4_e, clk4_dt[7:0]} = DI_in[8:0];
                       end
                8'hd0: begin // RSVD[31:16] CLKOUT4_HT[15:8], CLKOUT4_LT[7:0]
                       {clk4_ht[7:0], clk4_lt[7:0]} = DI_in[15:0];
                       end
                8'hd4: begin 
                       {clk5_p5_fedge, clk5_start_h, clk5_p5_en} = DI_in[15:13];
                       {clk5_e, clk5_dt[7:0]} = DI_in[8:0];
                       end
                8'hd8: begin // RSVD[31:16] CLKOUT5_HT[15:8], CLKOUT5_LT[7:0]
                       {clk5_ht[7:0], clk5_lt[7:0]} = DI_in[15:0];
                       end
                8'hdc: begin 
                       {clk6_p5_fedge, clk6_start_h, clk6_p5_en} = DI_in[15:13];
                       {clk6_e, clk6_dt[7:0]} = DI_in[8:0];
                       end
                8'he0: begin // RSVD[31:16] CLKOUT6_HT[15:8], CLKOUT6_LT[7:0]
                       {clk6_ht[7:0], clk6_lt[7:0]} = DI_in[15:0];
                       end
                8'he4: begin // = {1'b0,clk5_pi,clk5_intp_sel,1'b0,clk4_pi,clk4_intp_sel}; // RESERVED[31:15] INTERP5_SKEW[14:10] INTERP5_SEL[9:8] RESERVED[7] INTERP4_SKEW[6:2] INTERP4_SEL[1:0]
                       {clk5_pi,clk5_intp_sel} = DI_in[14:8];
                       {clk4_pi,clk4_intp_sel} = DI_in[6:0];
                       end
                8'he8: begin // = {1'b0,clkfbout_pi,clkfbout_intp_sel,1'b0,clk6_pi,clk6_intp_sel}; // RESERVED[31:15] INTERPFB_SKEW[14:10] INTERPFB_SEL[9:8] RESERVED[7] INTERP6_SKEW[6:2] INTERP6_SEL[1:0]
                       {clkfbout_pi,clkfbout_intp_sel} = DI_in[14:8];
                       {clk6_pi,clk6_intp_sel} = DI_in[6:0];
                       end
                8'hec: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hf0: begin // RESERVED[31:6] CLKFBOUT_FRACT[5:0]
                       clkfb_out_fract[5:0] = DI_in[5:0];
                       end
                8'hf4: begin // RESERVED
                       $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
                8'hf8: begin // RESERVED[31:7]  SS_EN[6] RESERVED[5:0]
                       ss_enabled = DI_in[6];
                       end
                8'hfc: begin // = 16'h0; // RESERVED[31:2] CLKFBOUT_FRACT_EN[1] RESERVED[0]
                       clkfbout_fract_en = DI_in[1];
                       end
                default: begin
                      $display("Warning: [Unisim %s-6] Address DADDR=%b is unsupported at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                         end
              endcase
            end else begin
            $display("Error: [Unisim %s-18] RST is low at time %t. RST need to be high when changing paramters through DRP. Instance %m", MODULE_NAME, $time);
          end
        end else begin //DRP read
          case ({DADDR_in,2'b00})
            8'h28: DO_out = 16'd0; // RESERVED
            8'h2c: DO_out = 16'd0; // RESERVED
            8'h30: DO_out = {3'd0, clkfbout_prediv2, 2'b01, clkfbout_en, clkfbout_e, clkfbout_dt[7:0]}; 
            8'h34: DO_out = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; 
            8'h38: DO_out = {clk0_p5_fedge, clk0_start_h, clk0_p5_en, clk0_en, clk0_prediv2, clk0_mx[1:0], clk0_e, clk0_dt[7:0]};
            8'h3c: DO_out = {clk0_ht[7:0], clk0_lt[7:0]}; 
            8'h40: DO_out = {clk1_p5_fedge, clk1_start_h, clk1_p5_en, clk1_en, clk1_prediv2, clk1_mx[1:0], clk1_e, clk1_dt[7:0]};
            8'h44: DO_out = {clk1_ht[7:0], clk1_lt[7:0]}; 
            8'h48: DO_out = {clk2_p5_fedge, clk2_start_h, clk2_p5_en, clk2_en, clk2_prediv2, clk2_mx[1:0], clk2_e, clk2_dt[7:0]};
            8'h4c: DO_out = {clk2_ht[7:0], clk2_lt[7:0]}; 
            8'h50: DO_out = {clk3_p5_fedge, clk3_start_h, clk3_p5_en, clk3_en, clk3_prediv2, clk3_mx[1:0], clk3_e, clk3_dt[7:0]};
            8'h54: DO_out = {clk3_ht[7:0], clk3_lt[7:0]};
            8'h58: DO_out = 16'd0; // RESERVED
            8'h5c: DO_out = 16'd0; // RESERVED
            8'h60: DO_out = 16'd0; // RESERVED
            8'h64: DO_out = 16'd0; // RESERVED
            8'h68: DO_out = 16'd0; // RESERVED
            8'h6c: DO_out = 16'd0; // RESERVED
            8'h70: DO_out = 16'd0; // RESERVED
            8'h74: DO_out = 16'd0; // RESERVED
            8'h78: DO_out = {12'h002, pll_cp}; // RESERVED[31:4] CP[3:0]
            8'h7c: DO_out = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
            8'h80: DO_out = {5'd0, divclk_e, 1'b0, dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]};
            8'h84: DO_out = {divclk_ht[7:0], divclk_lt[7:0]}; // RSVD[31:16] DIVCLK_HT[15:8], DIVCLK_LT[7:0]
            8'h88: DO_out = 16'd0; // RESERVED
            8'h8c: DO_out = 16'd0; // RESERVED
            8'h90: DO_out = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel};
            8'h94: DO_out = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel};
            8'h98: DO_out = {4'd0, pll_lfhf, 10'h280};
            8'h9c: DO_out = {1'b0, lock_fb_dly[4:0], lock_cnt[9:0]}; 
            8'ha0: DO_out = {1'b0, lock_ref_dly[4:0],lock_sat_high[9:0]}; 
            8'ha4: DO_out = 16'd0;
            8'ha8: DO_out = {11'd0, pll_res,1'b0};
            8'hac: DO_out = 16'd0; // RESERVED
            8'hb0: DO_out = 16'd0; 
            8'hb4: DO_out = 16'd0; 
            8'hb8: DO_out = 16'd0; 
            8'hbc: DO_out = 16'd0; 
            8'hc0: DO_out = {6'd0, unlock_cnt[9:0]}; 
            8'hc4: DO_out = 16'd0; 
            8'hc8: DO_out = 16'd0;
            8'hcc: DO_out = {clk4_p5_fedge, clk4_start_h, clk4_p5_en, clk4_en, clk4_prediv2, clk4_mx[1:0], clk4_e, clk4_dt[7:0]};
            8'hd0: DO_out = {clk4_ht[7:0], clk4_lt[7:0]};
            8'hd4: DO_out = {clk5_p5_fedge, clk5_start_h, clk5_p5_en, clk5_en, clk5_prediv2, clk5_mx[1:0], clk5_e, clk5_dt[7:0]};
            8'hd8: DO_out = {clk5_ht[7:0], clk5_lt[7:0]}; 
            8'hdc: DO_out = {clk6_p5_fedge, clk6_start_h, clk6_p5_en, clk6_en, clk6_prediv2, clk6_mx[1:0], clk6_e, clk6_dt[7:0]};
            8'he0: DO_out = {clk6_ht[7:0], clk6_lt[7:0]}; 
            8'he4: DO_out = {1'b0,clk5_pi,clk5_intp_sel,1'b0,clk4_pi,clk4_intp_sel}; 
            8'he8: DO_out = {1'b0,clkfbout_pi,clkfbout_intp_sel,1'b0,clk6_pi,clk6_intp_sel}; 
            8'hec: DO_out = 16'd0;
            8'hf0: DO_out = {10'd0,clkfb_out_fract[5:0]}; 
            8'hf4: DO_out = 16'd0; // RESERVED
            8'hf8: DO_out = {9'h027,ss_enabled,6'h01}; 
            8'hfc: DO_out = {14'd0,clkfbout_fract_en,1'b1}; 
          endcase
       end
    end  //DEN
    if ( drp_lock == 1) begin
       if (drp_lock_lat_cnt < drp_lock_lat) begin
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
       end else begin
          DRDY_out <= 1;
          drp_lock_lat_cnt <= 0;
       end
    end
    if (DRDY == 1) begin
      DRDY_out <= 0;
      drp_lock <= 0;
    end
  end

  function addr_is_valid;
  input [6:0] daddr_in;
  begin
    addr_is_valid = 1'b1;
    for (i=0; i<=6; i=i+1)
      if (daddr_in[i] != 0 && daddr_in[i] != 1) addr_is_valid = 1'b0;
  end
  endfunction

  integer jj2;
  always @(posedge clkpll or posedge rst_int)
    if (rst_int) begin
      for( jj2=0;jj2<AVGI; jj2=jj2+1) 
        clkin_period[jj2]   <= period_clkin; 
      clkout_en_pre <= 0;
      clkin_lock_cnt <= 0;
      pll_locked <= 0;
      clkout_locked <= 0;
      unlock_recover <= 0;
      pll_locked_delay_cnt <= 0;
    end else begin
      clkin_edge <= $time;
      if (clkin_edge != 0 && CLKINSTOPPED_out == 0) begin 
        for( jj2=0;jj2<AVGI-1; jj2=jj2+1)
          clkin_period[jj2+1]   <= clkin_period[jj2]; 
         clkin_period[0] <= $time - clkin_edge;
      end

      if ( ~glblGSR && (clkin_lock_cnt < lock_cnt_max) && fb_delay_found && (~pll_unlock || unlock_recover) && ~clkfbstopped_out1)
         clkin_lock_cnt <= clkin_lock_cnt + 1;
      else if (pll_unlock == 1 && clkout_locked ==1 ) begin
         clkin_lock_cnt <= lock_cnt_max - 6;
         unlock_recover <= 1;
      end
      if ( clkin_lock_cnt >= pll_lock_time && pll_unlock == 0)
         pll_locked <= 1;
         if (clkfbout_fract_en) 
           clkout_en_pre <= 1;
      if ( clkin_lock_cnt == lock_period_time )
         lock_period <= 1;
      if (~clkfbout_fract_en &&
          ((clkin_lock_cnt >= clkout_en_time) && pll_locked == 1)) begin
         clkout_en_pre <= 1;
      end
      if (unlock_recover ==1 && clkin_lock_cnt  >= lock_cnt_max)
         unlock_recover <= 0;
      if ((clkin_lock_cnt >= locked_en_time) && (pll_locked_delay_cnt >= pll_locked_delay) && clkout_en == 1) begin
         clkout_locked <= 1;
      end else if (pll_locked_delay_cnt < pll_locked_delay) begin
         pll_locked_delay_cnt <= pll_locked_delay_cnt + 1;
         clkout_locked <= 0;
      end
    end

  //CR-1062375
  always @(rst_int or pll_unlock or LOCKED_out or clkin_period[4]) begin
    if(rst_int || pll_unlock)
      input_jitter_warn_issued <= 1'b0;
    else if(LOCKED_out && !input_jitter_warn_issued)
      if(clkin_period[4] != clkin_period[3]) begin
        $display("Warning:  [Unisim %s-35] Input clock has jitter @%0t. This may cause misalignment in output clocks. Instance %m ", MODULE_NAME, $time);
        input_jitter_warn_issued <= 1'b1;
      end
  end

  always @(*)
    if (rst_int == 0) begin
      if (~clkfbout_fract_en ) begin
        clkout_en_time = md_product + m_product + pll_lock_time;
        locked_en_time = md_product +  clkout_en_time + 2;
      end else begin
        clkout_en_time = 64 + 2 + pll_lock_time;
        locked_en_time = 64 +  clkout_en_time;
      end
      lock_cnt_max = locked_en_time + 16;
    end

  always @(rst_int or clkout_locked or pll_unlock or unlock_recover or slip) begin
    if ((rst_int == 1) && (LOCKED !== 1'b0))
      LOCKED_FB_out <= #1000 0;
    else if ((clkout_locked && ~pll_unlock && ~unlock_recover && ~slip) === 1'b1)
      LOCKED_FB_out <= 1'b1;
    else
      LOCKED_FB_out <= 1'b0;
  end

  always @(*) begin
    LOCKED1_DESKEW_out <= dig_deskew_en1 && pd1_locked; 
    LOCKED2_DESKEW_out <= dig_deskew_en2 && pd2_locked;
    LOCKED_out         <= LOCKED_FB_out && 
                          (!dig_deskew_en1 || LOCKED1_DESKEW_out) && 
                          (!dig_deskew_en2 || LOCKED2_DESKEW_out);
  end

  integer jj3;
  always @(clkin_edge) begin
    if(~ps_deskew_stop_upd_avg) begin
      if (clkin_period[0] > clkin_period[1])
          clkin_period_tmp = clkin_period[0] - clkin_period[1];
      else
          clkin_period_tmp = clkin_period[1] - clkin_period[0];
      if ( (clkin_period[0] != period_avg) && 
        (clkin_period[0] < 1.5 * period_avg || clkin_period_tmp <= 300) )  begin
        period_avg = 0;
        for( jj3=0;jj3<AVGI; jj3=jj3+1) 
          period_avg = period_avg + clkin_period[jj3];
        period_avg  = period_avg  / AVGI;
      end
    end
  end

  //always @(period_avg or divclk_div or clkfbout_f_div) begin
  always @(period_avg or divclk_div or clkfbout_div or clkfb_out_fract or clkfb_out_phase) begin
    if(~ps_deskew_stop_upd_avg) begin
      if(clkfb_out_fract=='d0) 
        clkfbout_fract_en = 0;
      else 
        clkfbout_fract_en = 1;

      clkfbout_f_div = (clkfbout_div * 1.0) + ((clkfb_out_fract * 1.0) / (64.0));
      m_product = clkfbout_div;
      mf_product = clkfbout_f_div * 64;
      period_fbout = period_avg * divclk_div;
      period_vco_rl = 1.0 * period_fbout / clkfbout_f_div;
      period_vco_rl_half = period_vco_rl / 2.0;
      pll_locked_delay = (period_fbout * clkfbout_f_div) / period_avg;
      clkfbout_delay_abs = period_avg * divclk_div * (clkfb_out_phase / 360.0);
    end
  end

  always @ (negedge RST_in) begin
    if (drp_updt) begin
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKFBOUT";

      if( (clkfb_out_fract>0 && clkfbout_fract_en==1'b0) || (clkfb_out_fract==0 && clkfbout_fract_en==1'b1))
        $display("Warning: [Unisim %s-27] Illegal values for CLKFBOUT_FRACT=%0d and CLKFBOUT_FRACT_EN=%0d after DRP write. @%0t",
          MODULE_NAME, clkfb_out_fract, clkfbout_fract_en, $time);

      //calculate attribute values
      mc_to_attr_fbout (clkfbout_pi, clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e, clkfb_out_fract, clkfbout_fract_en, 
                        clkfbout_div, clkfb_out_phase); 

      //reverse calculations for sanity check
      attr_to_mc (clkout_name, clkfbout_div, clkfb_out_phase,0.5,0, 
                clkfbout_pi_revc, clkfbout_e_revc, clkfbout_dt_revc, clkfbout_ht_revc, clkfbout_lt_revc,
                p5_fedge_dummy, p5_en_dummy,start_h_dummy   );
      if (clkfbout_fract_en) begin //fractional mode. overwrite dt and pi
        attr_to_mc_fb( clkfbout_div, clkfb_out_phase, clkfb_out_fract,
          clkfbout_pi_revc, clkfbout_dt_revc);
      end  
      if({clkfbout_pi,clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e} !=
         {clkfbout_pi_revc,clkfbout_dt_revc,clkfbout_ht_revc, clkfbout_lt_revc,clkfbout_e_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clkfbout_pi,clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d} \n\
          Intended clkfbout_div=%0d, clkfbout_phase=%0d", 
          MODULE_NAME, clkout_name, $time, 
          clkfbout_pi,clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e,
          clkfbout_pi_revc,clkfbout_dt_revc,clkfbout_ht_revc, clkfbout_lt_revc,clkfbout_e_revc,
          clkfbout_div, clkfb_out_phase);
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT0";
      mc_to_attr (clkout_name, clk0_prediv2, clk0_pi, clk0_dt, clk0_ht, clk0_lt, clk0_e, 
                  clk0_p5_fedge, clk0_p5_en, clk0_start_h,
                  clk0_div, clk0_phase, clk0_duty);
      ht_calc(clk0_div,clk0_duty,clk0_dt,clk0_start_h,clk0_cnt_ht,clk0_cnt_max,clk0_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk0_div, clk0_phase, clk0_duty, clk0_prediv2,
                 clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc, 
                 clk0_p5_fedge_revc, clk0_p5_en_revc, clk0_start_h_revc   );
      if({clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h} !=
         {clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc,clk0_p5_fedge_revc,clk0_p5_en_revc,clk0_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h,
          clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc,clk0_p5_fedge_revc,clk0_p5_en_revc,clk0_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT1";
      mc_to_attr (clkout_name, clk1_prediv2, clk1_pi, clk1_dt, clk1_ht, clk1_lt, clk1_e, 
                  clk1_p5_fedge, clk1_p5_en, clk1_start_h,
                  clk1_div, clk1_phase, clk1_duty);
      ht_calc(clk1_div,clk1_duty,clk1_dt,clk1_start_h,clk1_cnt_ht,clk1_cnt_max,clk1_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk1_div, clk1_phase, clk1_duty, clk1_prediv2,
                 clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc, 
                 clk1_p5_fedge_revc, clk1_p5_en_revc, clk1_start_h_revc   );
      if({clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h} !=
         {clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc,clk1_p5_fedge_revc,clk1_p5_en_revc,clk1_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h,
          clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc,clk1_p5_fedge_revc,clk1_p5_en_revc,clk1_start_h_revc);
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT2";
      mc_to_attr (clkout_name, clk2_prediv2, clk2_pi, clk2_dt, clk2_ht, clk2_lt, clk2_e, 
                  clk2_p5_fedge, clk2_p5_en, clk2_start_h,
                  clk2_div, clk2_phase, clk2_duty);
      ht_calc(clk2_div,clk2_duty,clk2_dt,clk2_start_h,clk2_cnt_ht,clk2_cnt_max,clk2_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk2_div, clk2_phase, clk2_duty, clk2_prediv2,
                 clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc, 
                 clk2_p5_fedge_revc, clk2_p5_en_revc, clk2_start_h_revc   );
      if({clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h} !=
         {clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc,clk2_p5_fedge_revc,clk2_p5_en_revc,clk2_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h,
          clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc,clk2_p5_fedge_revc,clk2_p5_en_revc,clk2_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT3";
      mc_to_attr (clkout_name, clk3_prediv2, clk3_pi, clk3_dt, clk3_ht, clk3_lt, clk3_e, 
                  clk3_p5_fedge, clk3_p5_en, clk3_start_h,
                  clk3_div, clk3_phase, clk3_duty);
      ht_calc(clk3_div,clk3_duty,clk3_dt,clk3_start_h,clk3_cnt_ht,clk3_cnt_max,clk3_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk3_div, clk3_phase, clk3_duty, clk3_prediv2,
                 clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc, 
                 clk3_p5_fedge_revc, clk3_p5_en_revc, clk3_start_h_revc   );
      if({clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h} !=
         {clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc,clk3_p5_fedge_revc,clk3_p5_en_revc,clk3_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.", 
          MODULE_NAME,clkout_name, $time,
          clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h,
          clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc,clk3_p5_fedge_revc,clk3_p5_en_revc,clk3_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT4";
      mc_to_attr (clkout_name, clk4_prediv2, clk4_pi, clk4_dt, clk4_ht, clk4_lt, clk4_e, 
                  clk4_p5_fedge, clk4_p5_en, clk4_start_h,
                  clk4_div, clk4_phase, clk4_duty);
      ht_calc(clk4_div,clk4_duty,clk4_dt,clk4_start_h,clk4_cnt_ht,clk4_cnt_max,clk4_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk4_div, clk4_phase, clk4_duty, clk4_prediv2,
                 clk4_pi_revc, clk4_e_revc, clk4_dt_revc,  clk4_ht_revc, clk4_lt_revc, 
                 clk4_p5_fedge_revc, clk4_p5_en_revc, clk4_start_h_revc   );
      if({clk4_pi, clk4_e, clk4_dt, clk4_ht, clk4_lt,clk4_p5_fedge, clk4_p5_en, clk4_start_h} !=
         {clk4_pi_revc, clk4_e_revc, clk4_dt_revc,  clk4_ht_revc, clk4_lt_revc,clk4_p5_fedge_revc,clk4_p5_en_revc,clk4_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk4_pi, clk4_e, clk4_dt, clk4_ht, clk4_lt,clk4_p5_fedge, clk4_p5_en, clk4_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk4_pi, clk4_e, clk4_dt, clk4_ht, clk4_lt,clk4_p5_fedge, clk4_p5_en, clk4_start_h,
          clk4_pi_revc, clk4_e_revc, clk4_dt_revc,  clk4_ht_revc, clk4_lt_revc,clk4_p5_fedge_revc,clk4_p5_en_revc,clk4_start_h_revc );

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT5";
      mc_to_attr (clkout_name, clk5_prediv2, clk5_pi, clk5_dt, clk5_ht, clk5_lt, clk5_e, 
                  clk5_p5_fedge, clk5_p5_en, clk5_start_h,
                  clk5_div, clk5_phase, clk5_duty);
      ht_calc(clk5_div,clk5_duty,clk5_dt,clk5_start_h,clk5_cnt_ht,clk5_cnt_max,clk5_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk5_div, clk5_phase, clk5_duty, clk5_prediv2,
                 clk5_pi_revc, clk5_e_revc, clk5_dt_revc,  clk5_ht_revc, clk5_lt_revc, 
                 clk5_p5_fedge_revc, clk5_p5_en_revc, clk5_start_h_revc   );
      if({clk5_pi, clk5_e, clk5_dt, clk5_ht, clk5_lt,clk5_p5_fedge, clk5_p5_en, clk5_start_h} !=
         {clk5_pi_revc, clk5_e_revc, clk5_dt_revc,  clk5_ht_revc, clk5_lt_revc,clk5_p5_fedge_revc,clk5_p5_en_revc,clk5_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk5_pi, clk5_e, clk5_dt, clk5_ht, clk5_lt,clk5_p5_fedge, clk5_p5_en, clk5_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}  calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk5_pi, clk5_e, clk5_dt, clk5_ht, clk5_lt,clk5_p5_fedge, clk5_p5_en, clk5_start_h,
          clk5_pi_revc, clk5_e_revc, clk5_dt_revc,  clk5_ht_revc, clk5_lt_revc,clk5_p5_fedge_revc,clk5_p5_en_revc,clk5_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT6";
      mc_to_attr (clkout_name, clk6_prediv2, clk6_pi, clk6_dt, clk6_ht, clk6_lt, clk6_e, 
                  clk6_p5_fedge, clk6_p5_en, clk6_start_h,
                  clk6_div, clk6_phase, clk6_duty);
      ht_calc(clk6_div,clk6_duty,clk6_dt,clk6_start_h,clk6_cnt_ht,clk6_cnt_max,clk6_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk6_div, clk6_phase, clk6_duty, clk6_prediv2,
                 clk6_pi_revc, clk6_e_revc, clk6_dt_revc,  clk6_ht_revc, clk6_lt_revc, 
                 clk6_p5_fedge_revc, clk6_p5_en_revc, clk6_start_h_revc   );
      if({clk6_pi, clk6_e, clk6_dt, clk6_ht, clk6_lt,clk6_p5_fedge, clk6_p5_en, clk6_start_h} !=
         {clk6_pi_revc, clk6_e_revc, clk6_dt_revc,  clk6_ht_revc, clk6_lt_revc,clk6_p5_fedge_revc,clk6_p5_en_revc,clk6_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk6_pi, clk6_e, clk6_dt, clk6_ht, clk6_lt,clk6_p5_fedge, clk6_p5_en, clk6_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
          clk6_pi, clk6_e, clk6_dt, clk6_ht, clk6_lt,clk6_p5_fedge, clk6_p5_en, clk6_start_h,
          clk6_pi_revc, clk6_e_revc, clk6_dt_revc,  clk6_ht_revc, clk6_lt_revc,clk6_p5_fedge_revc,clk6_p5_en_revc,clk6_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "DIVCLK";
      mc_to_attr_div (divclk_ht,divclk_lt,divclk_e, divclk_div);
      divclk_cnt_ht  = divclk_div/2;
      divclk_cnt_max = divclk_div-1;

      // mc_to_attr_div (clkfbin_ht,clkfbin_lt,clkfbin_e, clkfbin_div);
      // ht_calc(clkfbin_ht, clkfbin_div, clkfbin_e, 0, 0, clkfbin_cnt_ht, clkfbin_cnt_max);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clk0_fps_en = (clk0_intp_sel == 2'b10); 
      clk1_fps_en = (clk1_intp_sel == 2'b10); 
      clk2_fps_en = (clk2_intp_sel == 2'b10); 
      clk3_fps_en = (clk3_intp_sel == 2'b10); 
      clk4_fps_en = (clk4_intp_sel == 2'b10); 
      clk5_fps_en = (clk5_intp_sel == 2'b10); 
      clk6_fps_en = (clk6_intp_sel == 2'b10); 
      clk0_pd1_en = (clk0_intp_sel == 2'b01) ;
      clk1_pd1_en = (clk1_intp_sel == 2'b01) ;
      clk2_pd1_en = (clk2_intp_sel == 2'b01) ;
      clk3_pd1_en = (clk3_intp_sel == 2'b01) ;
      clk4_pd1_en = (clk4_intp_sel == 2'b01) ;
      clk5_pd1_en = (clk5_intp_sel == 2'b01) ;
      clk6_pd1_en = (clk6_intp_sel == 2'b01) ;
      clk0_pd2_en = (clk0_intp_sel == 2'b11) ;
      clk1_pd2_en = (clk1_intp_sel == 2'b11) ;
      clk2_pd2_en = (clk2_intp_sel == 2'b11) ;
      clk3_pd2_en = (clk3_intp_sel == 2'b11) ;
      clk4_pd2_en = (clk4_intp_sel == 2'b11) ;
      clk5_pd2_en = (clk5_intp_sel == 2'b11) ;
      clk6_pd2_en = (clk6_intp_sel == 2'b11) ;
      dig_deskew_en1_revc  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  ||
                              clk4_pd1_en || clk5_pd1_en || clk6_pd1_en  );
      dig_deskew_en2_revc  = (clk0_pd2_en || clk1_pd2_en || clk2_pd2_en || clk3_pd2_en  ||
                              clk4_pd2_en || clk5_pd2_en || clk6_pd2_en );
      if(dig_deskew_en1 != dig_deskew_en1_revc) 
        $display("Error: [Unisim %s-30] Illegal DRP programming values for DESKEW_EN at time %0t. Instance %m.\n\
          DRP Write doesn't match calculated value from CLK*INTP_SEL registers. Values of 2'b10 enable DESKEW_EN.\n\
          written: CLK*_INTP_SEL={%0b,%0b,%0b,%0b,%0b,%0b,%0b} DESKEW_EN=%0b. Calculated DESKEW_EN=%0b",
          MODULE_NAME, $time,
          clk0_intp_sel,clk1_intp_sel,clk2_intp_sel,clk3_intp_sel,clk4_intp_sel,clk5_intp_sel,clk6_intp_sel,
          dig_deskew_en1,dig_deskew_en1_revc);
      if(dig_deskew_en2 != dig_deskew_en2_revc)
        $display("Error: [Unisim %s-30] Illegal values for DESKEW_EN_2ND at time %0t. Instance %m.\n\
          DRP Write doesn't match calculated value from CLK*INTP_SEL registers. Values of 2'b11 enable DESKEW_EN_2ND.\n\
          written: CLK*_INTP_SEL={%0b,%0b,%0b,%0b,%0b,%0b,%0b} DESKEW_EN_2ND=%0b. Calculated DESKEW_EN_2ND=%0b",
          MODULE_NAME, $time,
          clk0_intp_sel,clk1_intp_sel,clk2_intp_sel,clk3_intp_sel,clk4_intp_sel,clk5_intp_sel,clk6_intp_sel,
          dig_deskew_en2,dig_deskew_en2_revc);
      
      deskew_prg_dly1       = (deskew_prg_dly1_reg * 40) + 200 ;
      deskew_prg_dly2       = (deskew_prg_dly2_reg * 40) + 200 ;
      clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
      clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;
      clkin2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==0)) ? deskew_prg_dly2 : 0;
      clkfb2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==1)) ? deskew_prg_dly2 : 0;
    end
  end

  always @(/*period_vco_rl or */ ps_cnt0)
  if (fps_en == 1) begin
    period_ps_old0 = period_ps0;
    if (ps_cnt0 < 0)
      period_ps0 = period_vco_rl + ps_cnt0 * period_vco_rl / (ps_res*1.0); //cannot be a negative shift
    else if ((ps_cnt0 == 0) && PSINCDEC_in == 0)
      period_ps0 = 0;
    else
      period_ps0 = ps_cnt0 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or*/ ps_cnt1)
  if (fps_en == 1) begin
    period_ps_old1 = period_ps1;
    if (ps_cnt1 < 0)
      period_ps1 = period_vco_rl + ps_cnt1 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt1 == 0) && PSINCDEC_in == 0)
      period_ps1 = 0;
    else
      period_ps1 = ps_cnt1 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or*/ ps_cnt2)
  if (fps_en == 1) begin
    period_ps_old2 = period_ps2;
    if (ps_cnt2 < 0)
      period_ps2 = period_vco_rl + ps_cnt2 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt2 == 0) && PSINCDEC_in == 0)
      period_ps2 = 0;
    else
      period_ps2 = ps_cnt2 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or*/ ps_cnt3)
  if (fps_en == 1) begin
    period_ps_old3 = period_ps3;
    if (ps_cnt3 < 0)
      period_ps3 = period_vco_rl + ps_cnt3 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt3 == 0) && PSINCDEC_in == 0)
      period_ps3 = 0;
    else
      period_ps3 = ps_cnt3 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or */ps_cnt4)
  if (fps_en == 1) begin
    period_ps_old4 = period_ps4;
    if (ps_cnt4 < 0)
      period_ps4 = period_vco_rl + ps_cnt4 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt4 == 0) && PSINCDEC_in == 0)
      period_ps4 = 0;
    else
      period_ps4 = ps_cnt4 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or */ps_cnt5)
  if (fps_en == 1) begin
    period_ps_old5 = period_ps5;
    if (ps_cnt5 < 0)
      period_ps5 = period_vco_rl + ps_cnt5 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt5 == 0) && PSINCDEC_in == 0)
      period_ps5 = 0;
    else
      period_ps5 = ps_cnt5 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or*/ ps_cnt6)
  if (fps_en == 1) begin
    period_ps_old6 = period_ps6;
    if (ps_cnt6 < 0)
      period_ps6 = period_vco_rl + ps_cnt6 * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt6 == 0) && PSINCDEC_in == 0)
      period_ps6 = 0;
    else
      period_ps6 = ps_cnt6 * period_vco_rl / (ps_res*1.0);
  end

  always @(/*period_vco_rl or */ps_cnt_fb)
  if (fps_en == 1) begin
    period_ps_old_fb = period_ps_fb;
    if (ps_cnt_fb < 0)
      period_ps_fb = period_vco_rl + ps_cnt_fb * period_vco_rl / (ps_res*1.0); 
    else if ((ps_cnt_fb == 0) && PSINCDEC_in == 0)
      period_ps_fb = 0;
    else
      period_ps_fb = ps_cnt_fb * period_vco_rl / (ps_res*1.0);
  end


  always @(posedge clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      CLKINSTOPPED_out <= 0;
    else begin
     CLKINSTOPPED_out <= 1;
       if (CLKINSEL_in == 1)
        $display("Warning: [Unisim %s-21] Input CLKIN1 is stopped at time %t. Reset is required when input clock returns. Instance %m ", MODULE_NAME, $time);
       else
        $display("Warning: [Unisim %s-22] Input CLKIN2 is stopped at time %t. Reset is required when input clock returns. Instance %m ", MODULE_NAME, $time);
    end

  always @(posedge clkfbstopped_out1 or posedge rst_int)
  if (rst_int)
     CLKFBSTOPPED_out <= 1'b0;
  else begin
     CLKFBSTOPPED_out <= 1'b1;
     @(posedge LOCKED)
       CLKFBSTOPPED_out <= 1'b0;
  end

  // free run vco comp
  always @(posedge clkpll_dly) 
    if (pll_locked == 1 ) begin
      clkvco_free = 1'b1;
      halfperiod_sum = 0.0;
      halfperiod = 0;
      
      clkvco_delay_mod = clkvco_delay - ($itor($rtoi(clkvco_delay /period_vco_rl))*period_vco_rl);
      if((period_vco_rl-clkvco_delay_mod)<1.0)
        clkvco_delay_mod = 0;
      clkout_en_delay  = period_fbout-clkfbout_delay_abs-clkvco_delay_mod;
            
      if (clkfbout_fract_en) begin
        if(clkout_en_pre2==1) 
          clkfb_en  <= #(period_fbout -period_avg/64) clkout_en_pre;
        else 
          clkfb_en  <= #(2*period_fbout -period_avg/64) clkout_en_pre;

        if (mf_product > 1) begin
          for (ik10=1; ik10 < mf_product; ik10=ik10+1) begin
            if (rst_int) ik10 = mf_product;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b0;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b1;
          end
        end
      end else begin
        if (m_product > 1) begin
          if(clkout_en_pre2==1) 
            clkfb_en  <= #(period_fbout-period_avg/64) clkout_en_pre;
          else 
            clkfb_en  <= #(2*period_fbout -period_avg/64) clkout_en_pre;

          for (ik11=1; ik11 < m_product; ik11=ik11+1) begin
            if (rst_int) ik11 = m_product;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b0;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b1;
          end
        end
      end

      halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
      halfperiod = $rtoi(halfperiod_sum);
      #halfperiod clkvco_free = 1'b0;

      clkout_en      <= #(clkout_en_delay) clkout_en_pre;
      clkout_en_pre2 = clkout_en_pre; //needed when clkout_en is aligned with clkpll_dly and clkvco_free loop start
      
      if(divclk_div>clkfbout_div) 
        #(period_vco_rl_half -1.0);   

    end else begin
      clkout_en <= 1'b0;
      clkvco_free = 1'b1;
      halfperiod_sum = 0.0;
      halfperiod = 0;
    end

  always @ (*) begin
    if (lock_period == 1) begin
      if (clkfbout_delay == 0) begin
        clkvco_delay = period_fbout;
      end else if ( clkfbout_delay < period_fbout) begin
        clkvco_delay = period_fbout - clkfbout_delay;
      end else begin
        clkvco_delay = period_fbout - (clkfbout_delay % period_fbout) ;
      end
    end
  end

  always @ (*) begin
    if (fb_delay_found == 1) begin
      if (fb_delay == 0) begin
        clkpll_delay = 0;
      end else if ( fb_delay < period_avg) begin
        clkpll_delay = period_avg - fb_delay;
      end else begin
        clkpll_delay = period_avg - fb_delay % period_avg ;
      end
    end
  end

  always @(*) clkvco <= #(clkvco_delay) clkvco_free;

  always @(*) clkpll_dly <= #(clkpll_delay) (clkpll | clkpll_stopped);

  always @(posedge PSCLK_in or posedge rst_int)
    if (rst_int) begin
      ps_cnt0   <= ps_in_init;
      ps_cnt1   <= ps_in_init;
      ps_cnt2   <= ps_in_init;
      ps_cnt3   <= ps_in_init;
      ps_cnt4   <= ps_in_init;
      ps_cnt5   <= ps_in_init;
      ps_cnt6   <= ps_in_init;
      ps_cnt_fb <= ps_in_init;
      psen_w    <= 0;
      ps_lock   <= 0;

    end else if (fps_en == 1) begin
    if (PSEN_in) begin
      if (psen_w == 1)
        $display("Error: [Unisim %s-23] PSEN is active more than 1 PSCLK period at time %t. PSEN must be active for only one PSCLK period. Instance %m ", MODULE_NAME, $time);
      psen_w <= 1;

        if(~LOCKED_out)
          $display("Warning: [Unisim %s-37] Clock outputs are not locked yet. Please check for the LOCKED output signal before sending a PS request. This PSEN will be ignored. Instance %m", MODULE_NAME, $time );
        else if (ps_lock == 1)
        $display("Warning: [Unisim %s-24] Please wait for PSDONE signal at time %t before adjusting the Phase Shift. Instance %m ", MODULE_NAME, $time);
        else if (ps_deskew_lock)
          $display("Warning: [Unisim %s-36] Deskew is actively adjusting right now. PS request cannot be accepted before the output clocks are realinged. It is recommended to wait for 15 CLKIN_DESKEW cycles after PSDONE before sending a new PSEN request. This PSEN will be ignored. Instance %m", MODULE_NAME, $time );

      else if (PSINCDEC_in == 1) begin
        if (ps_cnt0   < $rtoi($itor((ps_res*clk0_div)-1)))    ps_cnt0 <= ps_cnt0 + 1;
        else                                                  ps_cnt0 <= 0;
        if (ps_cnt1   < $rtoi($itor((ps_res*clk1_div)-1)))    ps_cnt1 <= ps_cnt1 + 1; 
        else                                                  ps_cnt1 <= 0;       
        if (ps_cnt2   < $rtoi($itor((ps_res*clk2_div)-1)))    ps_cnt2 <= ps_cnt2 + 1;
        else                                                  ps_cnt2 <= 0;
        if (ps_cnt3   < $rtoi($itor((ps_res*clk3_div)-1)))    ps_cnt3 <= ps_cnt3 + 1;
        else                                                  ps_cnt3 <= 0;
        if (ps_cnt4   < $rtoi($itor((ps_res*clk4_div)-1)))    ps_cnt4 <= ps_cnt4 + 1;
        else                                                  ps_cnt4 <= 0;
        if (ps_cnt5   < $rtoi($itor((ps_res*clk5_div)-1)))    ps_cnt5 <= ps_cnt5 + 1;
        else                                                  ps_cnt5 <= 0;
        if (ps_cnt6   < $rtoi($itor((ps_res*clk6_div)-1)))    ps_cnt6 <= ps_cnt6 + 1;
        else                                                  ps_cnt6 <= 0;
        if (ps_cnt_fb < $rtoi($itor((ps_res*divclk_div)-1)))  ps_cnt_fb <= ps_cnt_fb + 1;
        else                                                  ps_cnt_fb <= 0;
        
        ps_lock <= 1;
      end
      else if (PSINCDEC_in == 0) begin
        if ( ps_cnt0 > ((-1)*(ps_res-1)))    ps_cnt0   <= ps_cnt0 - 1; 
        else                                 ps_cnt0   <= 0;
        if ( ps_cnt1 > ((-1)*(ps_res-1)))    ps_cnt1   <= ps_cnt1 - 1; 
        else                                 ps_cnt1   <= 0;           
        if ( ps_cnt2 > ((-1)*(ps_res-1)))    ps_cnt2   <= ps_cnt2 - 1; 
        else                                 ps_cnt2   <= 0;
        if ( ps_cnt3 > ((-1)*(ps_res-1)))    ps_cnt3   <= ps_cnt3 - 1; 
        else                                 ps_cnt3   <= 0;           
        if ( ps_cnt4 > ((-1)*(ps_res-1)))    ps_cnt4   <= ps_cnt4 - 1; 
        else                                 ps_cnt4   <= 0;           
        if ( ps_cnt5 > ((-1)*(ps_res-1)))    ps_cnt5   <= ps_cnt5 - 1; 
        else                                 ps_cnt5   <= 0;           
        if ( ps_cnt6 > ((-1)*(ps_res-1)))    ps_cnt6   <= ps_cnt6 - 1; 
        else                                 ps_cnt6   <= 0;           
        if ( ps_cnt_fb > ((-1)*(ps_res-1)))  ps_cnt_fb <= ps_cnt_fb - 1;
        else                                 ps_cnt_fb <= 0;           

        ps_lock <= 1;
       end
      end //PSEN_in
     else
        psen_w <= 0;

    if ( PSDONE == 1'b1) 
      ps_lock <= 0;
  end


  always @(posedge ps_lock)
    if (fps_en == 1) begin
      @(posedge clkpll_dly);//ps_wr_to_max will rise. Synching
      #1;
      //repeat(4) begin
      repeat(11) begin
        @(posedge PSCLK_in);
      end
      psdone_real = 1'b1;
      @(posedge PSCLK_in);
      psdone_real = 1'b0;
    end

  // RTL simulation shows that the 1st PSDONE pulse comes out after 
  // 12 psclk cycles when psen pulse shows; 
  // then if psen is flat low, psdone pulse repeats every 32 psclk cycles.
  always @(posedge PSCLK_in or posedge rst_int) begin
    if (rst_int) 
      psdone_repeat_on <= 1'b0;
    else if (PSDONE_out)
      psdone_repeat_on <= 1'b1;
    else if (PSEN_in)
      psdone_repeat_on <= 1'b0;
  end
  
  always @(posedge PSCLK_in or posedge rst_int) begin
    if (rst_int) 
      psdone_repeat_cnt <= 'd0;
    else if (psdone_repeat_on)
      psdone_repeat_cnt <= psdone_repeat_cnt +1;
    else 
      psdone_repeat_cnt <= 'd0;
  end

  assign PSDONE_out = psdone_real || (psdone_repeat_on && psdone_repeat_cnt==5'd31);
  

  always @(posedge ps_lock) begin
    if(dig_deskew_en1) begin
      ps_deskew1_rst = 1;
      repeat (2) @(posedge PSCLK_in); 
      //repeat (6) @(negedge clkin1_deskew_in_dly); //might change this w.r.t. spec
      repeat (1) @(negedge clkin1_deskew_in_dly); //might change this w.r.t. spec
      ps_deskew1_rst = 0;    
      ps_deskew1_detected = 1;
      //@(posedge ps_deskew1_delay_found_tmp);
      @(negedge ps_deskew_lock);
      ps_deskew1_detected = 0;
    end
  end

  always @(posedge ps_lock) begin
    if(dig_deskew_en2) begin
      ps_deskew2_rst = 1;
      repeat (2) @(posedge PSCLK_in); 
      repeat (1) @(negedge clkin2_deskew_in_dly);
      ps_deskew2_rst = 0;
      ps_deskew2_detected = 1;
      @(negedge ps_deskew_lock);
      ps_deskew2_detected = 0;
    end
  end


  always @(*) clk0_delay_next = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay) + (clk0_pd2_en * pd2_clk0_applied_det_delay);
  always @(*) clk1_delay_next = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay) + (clk1_pd2_en * pd2_clk1_applied_det_delay);
  always @(*) clk2_delay_next = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay) + (clk2_pd2_en * pd2_clk2_applied_det_delay);
  always @(*) clk3_delay_next = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay) + (clk3_pd2_en * pd2_clk3_applied_det_delay);
  always @(*) clk4_delay_next = ((clk4_pi * period_vco_rl) / pi_res) + (clk4_fps_en * period_ps4) + (clk4_pd1_en * pd1_clk4_applied_det_delay) + (clk4_pd2_en * pd2_clk4_applied_det_delay);
  always @(*) clk5_delay_next = ((clk5_pi * period_vco_rl) / pi_res) + (clk5_fps_en * period_ps5) + (clk5_pd1_en * pd1_clk5_applied_det_delay) + (clk5_pd2_en * pd2_clk5_applied_det_delay);
  always @(*) clk6_delay_next = ((clk6_pi * period_vco_rl) / pi_res) + (clk6_fps_en * period_ps6) + (clk6_pd1_en * pd1_clk6_applied_det_delay) + (clk6_pd2_en * pd2_clk6_applied_det_delay);
  always @(*) clkfbout_delay_next = ((clkfbout_pi * period_vco_rl) / pi_res) + (clkfbout_fps_en*period_ps_fb);


  always @ (posedge clkpll_dly) begin
    if (ps_lock ) begin
      if ((period_ps0 - period_ps_old0) > period_vco_rl_half)
        ps_wr_to_max0 <= 1'b1;
      else
        ps_wr_to_max0 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps1 - period_ps_old1) > period_vco_rl_half)
        ps_wr_to_max1 <= 1'b1;
      else
        ps_wr_to_max1 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps2 - period_ps_old2) > period_vco_rl_half)
        ps_wr_to_max2 <= 1'b1;
      else
        ps_wr_to_max2 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps3 - period_ps_old3) > period_vco_rl_half)
        ps_wr_to_max3 <= 1'b1;
      else
        ps_wr_to_max3 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps4 - period_ps_old4) > period_vco_rl_half)
        ps_wr_to_max4 <= 1'b1;
      else
        ps_wr_to_max4 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps5 - period_ps_old5) > period_vco_rl_half)
        ps_wr_to_max5 <= 1'b1;
      else
        ps_wr_to_max5 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps6 - period_ps_old6) > period_vco_rl_half)
        ps_wr_to_max6 <= 1'b1;
      else
        ps_wr_to_max6 <= 1'b0;
    end
  end
  
  always @ (clkpll_dly) begin
    clk0_delay <= clk0_delay_next;
    clk1_delay <= clk1_delay_next;
    clk2_delay <= clk2_delay_next;
    clk3_delay <= clk3_delay_next;
    clk4_delay <= clk4_delay_next;
    clk5_delay <= clk5_delay_next;
    clk6_delay <= clk6_delay_next;
    clkfbout_delay <= clkfbout_delay_next;
  end

  always @ (clkvco) begin
    if (clk0_dly_cnt > clk0_dt_int) begin
      if (clk0_delay == 0) begin clk0in = clkvco;
      end else if (clk0_fps_en && ps_wr_to_max0 && ~clkvco) begin
        clk0in <= #clk0_delay 1'b0;
      end else begin
        clk0in <= #clk0_delay clkvco;
      end
    end else clk0in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk1_dly_cnt > clk1_dt_int) begin
      if (clk1_delay == 0) clk1in = clkvco;
      else if (clk1_fps_en && ps_wr_to_max1 && ~clkvco) begin
        clk1in <= #clk1_delay 1'b0;
      end else begin
        clk1in <= #clk1_delay clkvco;
      end
    end else clk1in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk2_dly_cnt > clk2_dt_int)
      if (clk2_delay == 0) clk2in = clkvco;
      else if (clk2_fps_en && ps_wr_to_max2 && ~clkvco) begin
        clk2in <= #clk2_delay 1'b0;
      end else begin
        clk2in <= #clk2_delay clkvco;
      end
    else clk2in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk3_dly_cnt > clk3_dt_int)
      if (clk3_delay == 0) clk3in = clkvco;
      else if (clk3_fps_en && ps_wr_to_max3 && ~clkvco) begin
        clk3in <= #clk3_delay 1'b0;
      end else begin
        clk3in <= #clk3_delay clkvco;
      end
    else clk3in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk4_dly_cnt > clk4_dt_int)
      if (clk4_delay == 0) clk4in = clkvco;
      else if (clk4_fps_en && ps_wr_to_max4 && ~clkvco) begin
        clk4in <= #clk4_delay 1'b0;
      end else begin
        clk4in <= #clk4_delay clkvco;
      end
    else clk4in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk5_dly_cnt > clk5_dt_int)
      if (clk5_delay == 0) clk5in = clkvco;
      else if (clk5_fps_en && ps_wr_to_max5 && ~clkvco) begin
        clk5in <= #clk5_delay 1'b0;
      end else begin
        clk5in <= #clk5_delay clkvco;
      end
    else clk5in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk6_dly_cnt > clk6_dt_int)
      if (clk6_delay == 0) clk6in = clkvco;
      else if (clk6_fps_en && ps_wr_to_max6 && ~clkvco) begin
        clk6in <= #clk6_delay 1'b0;
      end else begin
        clk6in <= #clk6_delay clkvco;
      end
    else clk6in = 1'b0;
  end

  always @ (clkpll_dly) begin
    if (~fb_delay_found)
      clkfboutin = ~clkfboutin;
    else if (clkfb_en && clkfbout_en)
      clkfboutin = clkpll_dly;
    else clkfboutin = 1'b0;
  end


  assign clk0ps_en = clkout_en;
  assign clk1ps_en = clkout_en;
  assign clk2ps_en = clkout_en;
  assign clk3ps_en = clkout_en;
  assign clk4ps_en = clkout_en;
  assign clk5ps_en = clkout_en;
  assign clk6ps_en = clkout_en;
  assign clkfbps_en = clkout_en;

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk0_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk0_en == 1) begin
     if (clk0_dly_cnt <= clk0_dt_int)
       clk0_dly_cnt <= clk0_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk1_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk1_en == 1) begin
     if (clk1_dly_cnt <= clk1_dt_int)
       clk1_dly_cnt <= clk1_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk2_dly_cnt <= 'd0;
   else if (clkout_en == 1'b1 && clk2_en == 1'b1) begin
     if (clk2_dly_cnt <= clk2_dt_int)
       clk2_dly_cnt <= clk2_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk3_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk3_en == 1) begin
     if (clk3_dly_cnt <= clk3_dt_int)
       clk3_dly_cnt <= clk3_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk4_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk4_en == 1) begin
     if (clk4_dly_cnt <= clk4_dt_int)
       clk4_dly_cnt <= clk4_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk5_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk5_en == 1) begin
     if (clk5_dly_cnt <= clk5_dt_int)
       clk5_dly_cnt <= clk5_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk6_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk6_en == 1) begin
     if (clk6_dly_cnt <= clk6_dt_int)
       clk6_dly_cnt <= clk6_dly_cnt + 1;
   end

  always @(posedge clkfboutin or negedge clkfboutin or posedge rst_in_o)
    if (~fb_delay_found) CLKFBOUT_out = ~CLKFBOUT_out;
    else if (rst_in_o || ~clkfbps_en) begin
      divclk_cnt <= 8'd0;
      CLKFBOUT_out = 0;
    end
    else if(divclk_div==1'b1)
        CLKFBOUT_out = ~CLKFBOUT_out;
    else begin
      if (divclk_cnt < divclk_cnt_ht)  CLKFBOUT_out = 1;
      else                             CLKFBOUT_out = 0;
      if (divclk_cnt < divclk_cnt_max) divclk_cnt <= divclk_cnt + 1;
      else                             divclk_cnt <= 8'd0;
    end


  always @(posedge ps_wr_to_max0 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk0_fps_en) 
      psdec_adj0      = 1'b0;
    else begin
      psdec_adj0      = 1'b1;
      if(clk0_cnt>=clk0_cnt_max-2) //if already at CLKOUT posedge, wait for another cycle, it is too late to shorten this one. Synching
        @(posedge CLKOUT0_out);
      @(posedge psdec_adj0_done);
      psdec_adj0      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max1 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk1_fps_en) 
      psdec_adj1      = 1'b0;
    else begin
      psdec_adj1      = 1'b1;
      if(clk1_cnt>=clk1_cnt_max-2) 
        @(posedge CLKOUT1_out);
      @(posedge psdec_adj1_done);
      psdec_adj1      = 1'b0;
    end
  end

  always @(posedge ps_wr_to_max2 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk2_fps_en) 
      psdec_adj2      = 1'b0;
    else begin
      psdec_adj2      = 1'b1;
      if(clk2_cnt>=clk2_cnt_max-2) 
        @(posedge CLKOUT2_out);
      @(posedge psdec_adj2_done);
      psdec_adj2      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max3 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk3_fps_en) 
      psdec_adj3      = 1'b0;
    else begin
      psdec_adj3      = 1'b1;
      if(clk3_cnt>=clk3_cnt_max-2) 
        @(posedge CLKOUT3_out);
      @(posedge psdec_adj3_done);
      psdec_adj3      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max4 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk4_fps_en) 
      psdec_adj4      = 1'b0;
    else begin
      psdec_adj4      = 1'b1;
      if(clk4_cnt>=clk4_cnt_max-2) 
        @(posedge CLKOUT4_out);
      @(posedge psdec_adj4_done);
      psdec_adj4      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max5 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk5_fps_en) 
      psdec_adj5      = 1'b0;
    else begin
      psdec_adj5      = 1'b1;
      if(clk5_cnt>=clk5_cnt_max-2) 
        @(posedge CLKOUT5_out);
      @(posedge psdec_adj5_done);
      psdec_adj5      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max6 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk6_fps_en) 
      psdec_adj6      = 1'b0;
    else begin
      psdec_adj6      = 1'b1;
      if(clk6_cnt>=clk6_cnt_max-2) 
        @(posedge CLKOUT6_out);
      @(posedge psdec_adj6_done);
      psdec_adj6      = 1'b0;
    end
  end
  
  always @(posedge clk0in or negedge clk0in or posedge rst_in_o)
    if (rst_in_o || ~clk0ps_en) begin
      clk0_cnt <= 'd0;
      CLKOUT0_out = 0;
      psdec_adj0_done<=1'b0;
    end
    else if(clk0_div==1'b1) begin
      CLKOUT0_out = ~CLKOUT0_out;
      psdec_adj0_done<=1'b0;
    end
    else begin
      if (clk0_cnt < clk0_cnt_max-(psdec_adj0*2)) begin
        clk0_cnt <= clk0_cnt + 1;
        psdec_adj0_done<=1'b0;
      end
      else begin
        clk0_cnt <= 'd0; 
        if(psdec_adj0)
          psdec_adj0_done<=1'b1;
      end
      if (clk0_cnt < clk0_cnt_ht)
        CLKOUT0_out = 1;
      else
        CLKOUT0_out = 0;
    end

  always @(posedge clk1in or negedge clk1in or posedge rst_in_o)
    if (rst_in_o || ~clk1ps_en || ~pll_locked) begin
      clk1_cnt <= 'd0;
      CLKOUT1_out = 0;
      psdec_adj1_done<=1'b0;
    end
    else if(clk1_div==1'b1) begin
      CLKOUT1_out = ~CLKOUT1_out;
      psdec_adj1_done<=1'b0;
    end
    else begin
      if (clk1_cnt < clk1_cnt_max-(psdec_adj1*2)) begin
        clk1_cnt <= clk1_cnt + 1;
        psdec_adj1_done<=1'b0;
      end
      else begin
        clk1_cnt <= 'd0; 
        if(psdec_adj1)
          psdec_adj1_done<=1'b1;
      end
      if (clk1_cnt < clk1_cnt_ht)
        CLKOUT1_out = 1;
      else
        CLKOUT1_out = 0;
    end

  always @(posedge clk2in or negedge clk2in or posedge rst_in_o)
    if (rst_in_o || ~clk2ps_en || ~pll_locked) begin
      clk2_cnt <= 'd0;
      CLKOUT2_out = 0;
      psdec_adj2_done<=1'b0;
    end
    else if(clk2_div==1'b1) begin
      CLKOUT2_out = ~CLKOUT2_out;
      psdec_adj2_done<=1'b0;
    end
    else begin
      if (clk2_cnt < clk2_cnt_max-(psdec_adj2*2)) begin
        clk2_cnt <= clk2_cnt + 1;
        psdec_adj2_done<=1'b0;
      end
      else begin
        clk2_cnt <= 'd0; 
        if(psdec_adj2)
          psdec_adj2_done<=1'b1;
      end
      if (clk2_cnt < clk2_cnt_ht)
        CLKOUT2_out = 1;
      else
        CLKOUT2_out = 0;
    end

  always @(posedge clk3in or negedge clk3in or posedge rst_in_o)
    if (rst_in_o || ~clk3ps_en || ~pll_locked) begin
      clk3_cnt <= 'd0;
      CLKOUT3_out = 0;
      psdec_adj3_done<=1'b0;
    end
    else if(clk3_div==1'b1) begin
      CLKOUT3_out = ~CLKOUT3_out;
      psdec_adj3_done<=1'b0;
    end
    else begin
      if (clk3_cnt < clk3_cnt_max-(psdec_adj3*2)) begin
        clk3_cnt <= clk3_cnt + 1;
        psdec_adj3_done<=1'b0;
      end
      else begin
        clk3_cnt <= 'd0; 
        if(psdec_adj3)
          psdec_adj3_done<=1'b1;
      end
      if (clk3_cnt < clk3_cnt_ht)
        CLKOUT3_out = 1;
      else
        CLKOUT3_out = 0;
    end

  always @(posedge clk4in or negedge clk4in or posedge rst_in_o)
    if (rst_in_o || ~clk4ps_en || ~pll_locked) begin
      clk4_cnt <= 'd0;
      CLKOUT4_out = 0;
      psdec_adj4_done<=1'b0;
    end
    else if(clk4_div==1'b1) begin
      CLKOUT4_out = ~CLKOUT4_out;
      psdec_adj4_done<=1'b0;
    end
    else begin
      if (clk4_cnt < clk4_cnt_max-(psdec_adj4*2)) begin
        clk4_cnt <= clk4_cnt + 1;
        psdec_adj4_done<=1'b0;
      end
      else begin
        clk4_cnt <= 'd0; 
        if(psdec_adj4)
          psdec_adj4_done<=1'b1;
      end
      if (clk4_cnt < clk4_cnt_ht)
        CLKOUT4_out = 1;
      else
        CLKOUT4_out = 0;
    end

  always @(posedge clk5in or negedge clk5in or posedge rst_in_o)
    if (rst_in_o || ~clk5ps_en || ~pll_locked) begin
      clk5_cnt <= 'd0;
      CLKOUT5_out = 0;
      psdec_adj5_done<=1'b0;
    end
    else if(clk5_div==1'b1) begin
      CLKOUT5_out = ~CLKOUT5_out;
      psdec_adj5_done<=1'b0;
    end
    else begin
      if (clk5_cnt < clk5_cnt_max-(psdec_adj5*2)) begin
        clk5_cnt <= clk5_cnt + 1;
        psdec_adj5_done<=1'b0;
      end
      else begin
        clk5_cnt <= 'd0; 
        if(psdec_adj5)
          psdec_adj5_done<=1'b1;
      end
      if (clk5_cnt < clk5_cnt_ht)
        CLKOUT5_out = 1;
      else
        CLKOUT5_out = 0;
    end

  always @(posedge clk6in or negedge clk6in or posedge rst_in_o)
    if (rst_in_o || ~clk6ps_en || ~pll_locked) begin
      clk6_cnt <= 'd0;
      CLKOUT6_out = 0;
      psdec_adj6_done<=1'b0;
    end
    else if(clk6_div==1'b1) begin
      CLKOUT6_out = ~CLKOUT6_out;
      psdec_adj6_done<=1'b0;
    end
    else begin
      if (clk6_cnt < clk6_cnt_max-(psdec_adj6*2)) begin
        clk6_cnt <= clk6_cnt + 1;
        psdec_adj6_done<=1'b0;
      end
      else begin
        clk6_cnt <= 'd0; 
        if(psdec_adj6)
          psdec_adj6_done<=1'b1;
      end
      if (clk6_cnt < clk6_cnt_ht)
        CLKOUT6_out = 1;
      else
        CLKOUT6_out = 0;
    end

  always @( posedge CLKFBOUT_out or posedge rst_int)
    if (rst_int)
      delay_edge  <= 0;
    else if (~fb_delay_found)
      delay_edge <= $time;

  assign clkfbin_sel = ((COMPENSATION_BIN == COMPENSATION_INTERNAL) ||
                        ((COMPENSATION_BIN == COMPENSATION_AUTO) && (CLKFBIN === 1'bz)));

  assign anlg_deskew_en = ~clkfbin_sel;
  
  assign CLKFBIN_int = clkfbin_sel && CLKFBOUT_out || ~clkfbin_sel && CLKFBIN_in;

  always @(posedge CLKFBIN_int )
    if (clkfbin_sel == 1 ) begin
      fb_delay <= 0;
      fb_delay_found_tmp <=  1'b1;
    end else if (fb_delay_found_tmp == 1'b0 ) begin
      if ( delay_edge != 0) begin
        fb_delay <= ($time - delay_edge);
        fb_delay_found_tmp <=  1'b1;
      end else begin
        fb_delay <= 0;
        fb_delay_found_tmp <=  1'b0;
      end
    end

  always @(negedge CLKFBOUT_out or negedge fb_delay_found_tmp)
       fb_delay_found <= fb_delay_found_tmp;

  always @(*) clkpll_stopped <= #(period_avg/2) (clkinstopped_out1 || CLKINSTOPPED) && ~clkpll_stopped;
  always #(2*period_avg/3+250) clkin_osc = ~rst_int && ~clkin_osc;
  always #(2*period_avg*divclk_div/3+250) clkfbin_osc = ~rst_int && ~clkfbin_osc;

  always @(posedge clkpll or negedge clkpll) begin
      clkin_p <= 1;
      clkin_p <= #100 0;
  end

  always @(posedge CLKFBIN_int or negedge CLKFBIN_int) begin
      clkfbin_p <= 1;
      clkfbin_p <= #100 0;
  end

  always @(posedge clkin_osc or posedge rst_int or posedge clkin_p)
      if ((rst_int == 1) || (LOCKED == 1'b0)) begin
        clkinstopped_out1 <= 0;
        clkin_lost_cnt <= 0;
      end
      else if (clkin_p == 1) begin
        if (clkinstopped_out1 == 1) begin
          @(posedge clkpll) begin
          clkinstopped_out1 <= 0;
          clkin_lost_cnt <= 0;
          end
        end
        else begin
           clkinstopped_out1 <= 0;
           clkin_lost_cnt <= 0;
        end
      end
      else if (lock_period) begin
        if (clkin_lost_cnt < clkin_lost_val) begin
           clkin_lost_cnt <= clkin_lost_cnt + 1;
           clkinstopped_out1 <= 0;
        end
        else
           clkinstopped_out1 <= 1;
      end

  always @(posedge clkfbin_osc or posedge rst_int or posedge clkfbin_p)
      if (rst_int == 1 || clkfbin_p == 1) begin
        clkfbstopped_out1 <= 0;
        clkfbin_lost_cnt <= 0;
      end
      else if (clkout_en) begin
        if (clkfbin_lost_cnt < clkfbin_lost_val) begin
           clkfbin_lost_cnt <= clkfbin_lost_cnt + 1;
           clkfbstopped_out1 <= 0;
        end
        else
           clkfbstopped_out1 <= 1;
      end


  assign pll_unlock = (CLKINSTOPPED_out === 1) || (clkfbstopped_out1 === 1) || (clkpll_jitter_unlock === 1) || (unlock_recover === 1);

  //
  // DIGITAL DESKEW
  //
  
  // Averaging deskew clk references
  integer ii1,ii2;
  always @(posedge CLKIN1_DESKEW_in or posedge rst_int) begin
    if (rst_int) begin
      for( ii1=0;ii1<5; ii1=ii1+1)
        clkin1_d_period[ii1] <= period_clkin1_d;
    end 
    else begin
      clkin1_d_edge <= $time;
      if (clkin1_d_edge != 0 && CLKINSTOPPED_out == 0) begin 
        clkin1_d_period[0] <= $time - clkin1_d_edge;
        for( ii1=0;ii1<4; ii1=ii1+1)
         clkin1_d_period[ii1+1] <= clkin1_d_period[ii1];
      end
    end
  end

  always @(clkin1_d_edge) begin
   //  if(clkin1_d_cnt>5) begin
    if (clkin1_d_period[0] > clkin1_d_period[1])
      clkin1_d_period_tmp = clkin1_d_period[0] - clkin1_d_period[1];
    else
      clkin1_d_period_tmp = clkin1_d_period[1] - clkin1_d_period[0];
    //    end
    if ( (clkin1_d_period[0] != period_avg_clkin1_d) && (clkin1_d_period[0] < 1.5 * period_avg_clkin1_d || clkin1_d_period_tmp <= 300) ) 
    //if(clkin1_d_period_tmp != 0)
      period_avg_clkin1_d = (clkin1_d_period[0] + clkin1_d_period[1] + clkin1_d_period[2]
                           + clkin1_d_period[3] + clkin1_d_period[4])/5;
  end

  always @(clkin1_d_edge or posedge rst_int) begin
    if(rst_int) begin
      clkin1_d_cnt = 0;
      period_avg_clkin1_d_d <= 0;
      period_avg_clkin1_d_stable <=0;
    end
    else if (ps_deskew_lock) begin
      //clkin1_d_cnt = 0; //keep
      period_avg_clkin1_d_d <= period_avg_clkin1_d; //keep updating
      period_avg_clkin1_d_stable <=1;
    end
    else begin
      clkin1_d_cnt = clkin1_d_cnt +1;
      period_avg_clkin1_d_d <= period_avg_clkin1_d;
      if((clkin1_d_cnt>5) && ((period_avg_clkin1_d_d-period_avg_clkin1_d)<=2 && (period_avg_clkin1_d_d-period_avg_clkin1_d)>=-2))
        period_avg_clkin1_d_stable <= 1;
      else 
        period_avg_clkin1_d_stable <=0;
    end
  end

  always @(posedge CLKIN2_DESKEW_in or posedge rst_int) begin
    if (rst_int) begin
      for( ii2=0;ii2<5; ii2=ii2+1)
        clkin2_d_period[ii2] <= period_clkin2_d;
    end 
    else begin
      clkin2_d_edge <= $time;
      if (clkin2_d_edge != 0 && CLKINSTOPPED_out == 0) begin 
        clkin2_d_period[0] <= $time - clkin2_d_edge;
        for( ii2=0;ii2<4; ii2=ii2+1)
         clkin2_d_period[ii2+1] <= clkin2_d_period[ii2];
      end
    end
  end

  always @(clkin2_d_edge) begin
    if (clkin2_d_period[0] > clkin2_d_period[1])
        clkin2_d_period_tmp = clkin2_d_period[0] - clkin2_d_period[1];
    else
        clkin2_d_period_tmp = clkin2_d_period[1] - clkin2_d_period[0];
    if ( (clkin2_d_period[0] != period_avg_clkin2_d) && (clkin2_d_period[0] < 1.5 * period_avg_clkin2_d || clkin2_d_period_tmp <= 300) ) 
      period_avg_clkin2_d = (clkin2_d_period[0] + clkin2_d_period[1] + clkin2_d_period[2]
                 + clkin2_d_period[3] + clkin2_d_period[4])/5;
  end

  always @(clkin2_d_edge or posedge rst_int) begin
    if(rst_int) begin
      clkin2_d_cnt = 0;
      period_avg_clkin2_d_d <= 0;
      period_avg_clkin2_d_stable <=0;
    end
    else if (ps_deskew_lock) begin
      period_avg_clkin2_d_d <= period_avg_clkin2_d; //keep updating
      period_avg_clkin2_d_stable <=1;
    end
    else begin
      clkin2_d_cnt = clkin2_d_cnt +1;
      period_avg_clkin2_d_d <= period_avg_clkin2_d;
      if((clkin2_d_cnt>5) && ((period_avg_clkin2_d_d-period_avg_clkin2_d)<=2 && (period_avg_clkin2_d_d-period_avg_clkin2_d)>=-2))
        period_avg_clkin2_d_stable <= 1;
      else 
        period_avg_clkin2_d_stable <=0;
    end
  end


  //
  // Add programmable deskew to inputs
  //
  always @(posedge CLKIN1_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_i <= 0;
    else
      period_avg_clkin1_d_stable_i <= period_avg_clkin1_d_stable;
  end

  always @(posedge CLKFB1_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_f <= 0;
    else
      period_avg_clkin1_d_stable_f <= period_avg_clkin1_d_stable;
  end

  always @(posedge CLKIN2_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin2_d_stable_i <= 0;
    else
      period_avg_clkin2_d_stable_i <= period_avg_clkin2_d_stable;
  end

  always @(posedge CLKFB2_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin2_d_stable_f <= 0;
    else
      period_avg_clkin2_d_stable_f <= period_avg_clkin2_d_stable;
  end


  always @(CLKIN1_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_i) 
      clkin1_deskew_in_dly <=  #clkin1_deskew_prg_dly CLKIN1_DESKEW_in;
    else
      clkin1_deskew_in_dly <=  0;
  end

  always @(CLKFB1_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_f) 
      clkfb1_deskew_in_dly <=  #clkfb1_deskew_prg_dly CLKFB1_DESKEW_in;
    else
      clkfb1_deskew_in_dly <=  0;
    end
  
  always @(CLKIN2_DESKEW_in) begin
    if(period_avg_clkin2_d_stable_i)
      clkin2_deskew_in_dly <=  #clkin2_deskew_prg_dly CLKIN2_DESKEW_in;
    else
      clkin2_deskew_in_dly <=  0;
    end

  always @(CLKFB2_DESKEW_in) begin
    if(period_avg_clkin2_d_stable_f) 
      clkfb2_deskew_in_dly <=  #clkfb2_deskew_prg_dly CLKFB2_DESKEW_in;
    else
      clkfb2_deskew_in_dly <=  0;
  end

  always @(posedge clkin1_deskew_in_dly or posedge rst_int or posedge ps_deskew1_rst) begin
    if (rst_int ||  ps_deskew1_rst)
      delay_edge_d1  <= 0;
    else if (~d1_delay_found || ps_deskew1_detected ) //in ps, wait until average is calculated
      delay_edge_d1 <= $time;
  end

  always @(negedge clkfb1_deskew_in_dly or negedge d1_delay_found_tmp)
    d1_delay_found <= d1_delay_found_tmp;

  always @(negedge clkfb1_deskew_in_dly or negedge ps_deskew1_delay_found_tmp )
    ps_deskew1_delay_found <= ps_deskew1_delay_found_tmp;

  always @(posedge clkfb1_deskew_in_dly or posedge rst_int)
    if (dig_deskew_en1 == 0 || rst_int==1) begin
      fb_d1_det_delay <= 0;
      d1_delay_found_tmp <=  1'b0;
      ps_deskew1_delay_found_tmp    <= 1'b0;
    end else if (d1_delay_found_tmp == 1'b0  || (ps_deskew1_detected && ~ps_deskew1_delay_found_tmp)) begin 
      if ( delay_edge_d1 != 0) begin
        fb_d1_det_delay             <= fb_d1_det_delay + ($time - delay_edge_d1);
        d1_delay_found_tmp <=  1'b1;
        if(ps_deskew1_detected && ~ps_deskew1_delay_found_tmp ) 
          ps_deskew1_delay_found_tmp  <= 1'b1;
        else
          ps_deskew1_delay_found_tmp  <= 1'b0;
      end else begin
        //fb_d1_det_delay             <= 0;
        d1_delay_found_tmp <=  1'b0;
        ps_deskew1_delay_found_tmp  <= 1'b0;
      end
    end
    else if (ps_deskew1_delay_found_tmp && ~ps_deskew_lock)
      ps_deskew1_delay_found_tmp  <= 1'b0;

  always @( posedge clkin2_deskew_in_dly or posedge rst_int or posedge ps_deskew2_rst)
    if (rst_int||  ps_deskew2_rst)
      delay_edge_d2  <= 0;
    else if (~d2_delay_found || ps_deskew2_detected)
      delay_edge_d2 <= $time;

  always @(negedge clkfb2_deskew_in_dly or negedge d2_delay_found_tmp)
       d2_delay_found <= d2_delay_found_tmp;

  always @(negedge clkfb2_deskew_in_dly or negedge ps_deskew2_delay_found_tmp )
    ps_deskew2_delay_found <= ps_deskew2_delay_found_tmp;

  always @(negedge clkfb2_deskew_in_dly or negedge ps_deskew2_delay_found_tmp)
    ps_deskew2_delay_found <= ps_deskew2_delay_found_tmp;

  always @(posedge clkfb2_deskew_in_dly or posedge rst_int)
    if (dig_deskew_en2 == 0 || rst_int==1) begin
      fb_d2_det_delay <= 0;
      d2_delay_found_tmp <=  1'b0;
      ps_deskew2_delay_found_tmp    <= 1'b0;
    end else if (d2_delay_found_tmp == 1'b0 || (ps_deskew2_detected && ~ps_deskew2_delay_found_tmp)) begin
      if ( delay_edge_d2 != 0) begin
        fb_d2_det_delay             <= fb_d2_det_delay + ($time - delay_edge_d2);
        d2_delay_found_tmp <=  1'b1;
      if(ps_deskew2_detected && ~ps_deskew2_delay_found_tmp )
        ps_deskew2_delay_found_tmp  <= 1'b1;
      else 
        ps_deskew2_delay_found_tmp  <= 1'b0;
      end else begin
        //fb_d2_det_delay             <= 0;
        d2_delay_found_tmp <=  1'b0;
        ps_deskew2_delay_found_tmp  <= 1'b0;
      end
    end
    else if (ps_deskew2_delay_found_tmp && ~ps_deskew_lock)
      ps_deskew2_delay_found_tmp  <= 1'b0;


    always @(clk0_div or clk1_div or clk2_div or clk3_div or clk4_div or
             clk5_div or clk6_div or fb_d1_det_delay or fb_d2_det_delay or 
             period_vco_rl or d1_delay_found or d2_delay_found or rst_in_o or
             ps_deskew1_delay_found or ps_deskew2_delay_found) begin
      if(rst_in_o==1) begin
        pd1_applied_delay = 0;
        pd2_applied_delay = 0;
        pd1_clk0_applied_det_delay = 0;
        pd1_clk1_applied_det_delay = 0;
        pd1_clk2_applied_det_delay = 0;
        pd1_clk3_applied_det_delay = 0;
        pd1_clk4_applied_det_delay = 0;
        pd1_clk5_applied_det_delay = 0;
        pd1_clk6_applied_det_delay = 0;
        pd2_clk0_applied_det_delay = 0;
        pd2_clk1_applied_det_delay = 0;
        pd2_clk2_applied_det_delay = 0;
        pd2_clk3_applied_det_delay = 0;
        pd2_clk4_applied_det_delay = 0;
        pd2_clk5_applied_det_delay = 0;
        pd2_clk6_applied_det_delay = 0;
      end
      else begin
        if(dig_deskew_en1 && d1_delay_found) begin
          pd1_applied_delay = 0;
          calc_dly_to_apply(fb_d1_det_delay,clk0_div,pd1_clk0_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk1_div,pd1_clk1_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk2_div,pd1_clk2_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk3_div,pd1_clk3_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk4_div,pd1_clk4_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk5_div,pd1_clk5_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk6_div,pd1_clk6_applied_det_delay,1);
        end
        if(dig_deskew_en2 && d2_delay_found) begin
          pd2_applied_delay = 0;
          calc_dly_to_apply(fb_d2_det_delay,clk0_div,pd2_clk0_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk1_div,pd2_clk1_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk2_div,pd2_clk2_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk3_div,pd2_clk3_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk4_div,pd2_clk4_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk5_div,pd2_clk5_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk6_div,pd2_clk6_applied_det_delay,0);
        end
      end
    end

    always @(posedge d1_delay_found or posedge rst_int) begin
      if(rst_int)
        pd1_locked = 0;
      else begin
        #1;
        #pd1_applied_delay;
        pd1_locked = 1;
      end
    end
  
    always @(posedge d2_delay_found or posedge rst_int) begin
      if(rst_int)
        pd2_locked = 0;
      else begin
        #1;
        #pd2_applied_delay;
        pd2_locked = 1;
      end
    end

      
    always @(posedge PSCLK_in or posedge rst_in_o) 
      if(rst_in_o)
        ps_deskew_state <= ST_PSDK_IDLE;
      else 
        ps_deskew_state <= ps_deskew_state_next;

    always @(*) begin
      case (ps_deskew_state)
        ST_PSDK_IDLE:
          if(PSEN_in && (dig_deskew_en1 || dig_deskew_en2))
            ps_deskew_state_next <= ST_PSDK_LOCK;
        ST_PSDK_LOCK:
          if(ps_deskew1_delay_found && dig_deskew_en2)
            ps_deskew_state_next <= ST_PSDK_RLOCK1;
          else if (ps_deskew2_delay_found && dig_deskew_en1)
            ps_deskew_state_next <= ST_PSDK_RLOCK2;
          else if (ps_deskew1_delay_found || ps_deskew2_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
        ST_PSDK_RLOCK1:
          if (ps_deskew2_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
        ST_PSDK_RLOCK2:
          if (ps_deskew1_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
      endcase
    end

    assign ps_deskew_lock = (ps_deskew_state==ST_PSDK_IDLE)? 0 :1;

    always @(posedge ps_deskew_lock or posedge pll_unlock or posedge rst_in_o) begin
      if(rst_in_o)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (pll_unlock)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (ps_deskew_lock)
        ps_deskew_stop_upd_avg <= 1'b1;
        
    end
    

  //
  // SLIP DETECTION
  //
  assign slip_det_en = 0; //not supporting SLIP DETECT.

  //assign slip_det_en = ( COMPENSATION_BIN == COMPENSATION_INTERNAL || 
  //                       COMPENSATION_BIN == COMPENSATION_BUF_IN   || 
  //                       COMPENSATION_BIN == COMPENSATION_EXTERNAL   );

  //calculate clkfbin posedge time and clkfbin period
  integer ii3;
  always @(posedge CLKFBIN_int or posedge rst_int) begin
    if (rst_int) begin
      clkfbin_edge <= 0;
      for( ii3=0;ii3<5; ii3=ii3+1)
        clkfbin_period[ii3] <= period_fbout;
    end 
    else begin
      clkfbin_edge <= $time;
      if (clkfbin_edge != 0 && CLKFBSTOPPED_out == 0) begin 
        clkfbin_period[0] <= $time - clkfbin_edge;
        for( ii3=0;ii3<4; ii3=ii3+1)
         clkfbin_period[ii3+1] <= clkfbin_period[ii3];
      end
    end
  end

  always @(clkfbin_edge) begin
    if (clkfbin_period[0] > clkfbin_period[1])
      clkfbin_period_tmp = clkfbin_period[0] - clkfbin_period[1];
    else
      clkfbin_period_tmp = clkfbin_period[1] - clkfbin_period[0];
    if ( (clkfbin_period[0] != period_avg_clkin1_d) && (clkfbin_period[0] < 1.5 * period_avg_clkin1_d || clkfbin_period_tmp <= 300) ) 
    period_avg_clkfbin = (clkfbin_period[0] + clkfbin_period[1] + clkfbin_period[2]
                         + clkfbin_period[3] + clkfbin_period[4])/5;
  end

  always @(posedge clkpll or posedge rst_int) begin
    if(rst_int) 
      slip_avg_in_cnt <=0;
    else if(LOCKED_FB_out && period_avg>=period_avg_clkfbin && slip_avg_in_cnt<6) begin
      slip_avg_in_cnt <= slip_avg_in_cnt +1;
    end
  end
  
  always @(posedge CLKFBIN_int or posedge rst_int) begin
    if(rst_int) 
      slip_avg_fb_cnt <=0;
    else if(LOCKED_FB_out && period_avg_clkfbin>period_avg && slip_avg_fb_cnt<6) begin
      slip_avg_fb_cnt <= slip_avg_fb_cnt +1;
    end
  end

  assign slip_avg_rdy = (slip_avg_in_cnt==6) || (slip_avg_fb_cnt==6);
  
  always @(posedge slip_avg_rdy or posedge rst_int) begin
    if(rst_int) begin
      period_clkin_at_lock   <= 0;
      period_clkfbin_at_lock <= 0;
    end
    else if(LOCKED_FB_out) begin
      period_clkin_at_lock   <= period_avg;
      period_clkfbin_at_lock <= period_avg_clkfbin;
    end
  end


  assign  slip = slip_clkin || slip_clkfb;

  always @(posedge clkpll  or posedge rst_int) begin
    if (rst_int) begin
      slip_clkin <= 1'b0;
      slip_warn_displayed_clkin <=1'b0;
    end
    else begin
      if( slip_det_en ) begin
        if((!LOCKED_FB_out && !slip) || period_clkin_at_lock==0)
          slip_clkin <= 1'b0;
        else if((period_avg > ((1.0+SLIP_TOLERANCE)*$itor(period_clkin_at_lock) )) || 
                (period_avg < ((1.0-SLIP_TOLERANCE)*$itor(period_clkin_at_lock) ))  ) begin
          slip_clkin <= 1'b1;
          if(~slip_warn_displayed_clkin) begin
            $display("Warning: [Unisim %s-31] CLKIN has slipped at time %0t. Instance %0m. \n\
              Only %0d%% tolerance is allowed CLKIN period is now %0d ps. MMCME5 might need a reset and a change in setup to lock again.",
              MODULE_NAME, $time, (SLIP_TOLERANCE*100), clkin_period[0] );
            slip_warn_displayed_clkin <= 1'b1;
          end

        end
      end
      else
        slip_clkin <= 1'b0;
    end
  end


  always @(posedge CLKFBIN_int  or posedge rst_int) begin
    if (rst_int) begin
      slip_clkfb <= 1'b0;
      slip_warn_displayed_clkfbin <=1'b0;
    end
    else begin
      if( slip_det_en ) begin
        if((!LOCKED_FB_out && !slip) || period_clkfbin_at_lock==0) 
          slip_clkfb <= 1'b0;
        else if((period_avg_clkfbin > ((1.0+SLIP_TOLERANCE)*$itor(period_clkfbin_at_lock) )) || 
                (period_avg_clkfbin < ((1.0-SLIP_TOLERANCE)*$itor(period_clkfbin_at_lock) ))  ) begin
          slip_clkfb <= 1'b1;
          if(~slip_warn_displayed_clkfbin) begin
            $display("Warning: [Unisim %s-32] CLKFB has slipped at time %0t. Instance %0m. \n\
              Only %0d%% tolerance is allowed. CLKFB period is now %0d ps. MMCME5 might need a reset and a change in setup to lock again.",
              MODULE_NAME, $time, (SLIP_TOLERANCE*100), clkfbin_period[0]);
            slip_warn_displayed_clkfbin <= 1'b1;
          end
        end
      end
      else 
        slip_clkfb <= 1'b0;
    end
  end




// -----------------------------------------------------------
// ----     TASKS --------------------------------------------
// -----------------------------------------------------------

task ht_calc; 
  input  integer   div;
  input real       duty;
  input reg  [7:0] dt; //output counter delay setting
  input reg        start_h;
  output integer   cnt_ht;
  output integer   cnt_max;
  output reg [9:0] dt_int;

begin

  cnt_ht  = 2*div*duty;
  cnt_max = 2*div - 1;
  dt_int  = dt*2 + start_h;

  
end
endtask //ht_calc




// mc_to_attr ( input [160:1] clkout_name, input reg [4:0] pi, input reg       nc, input reg [9:0] dt, input reg [9:0] ht, input reg [9:0] lt, output integer div, output real phase, output real duty);
task mc_to_attr;
    input reg [160:1] clkout_name;

    input reg         prediv2;
    input  reg [4:0]  pi;
    input  reg [7:0]  dt;
    input  reg [7:0]  ht;
    input  reg [7:0]  lt;
    input  reg        edg;  // edge. 
    input  reg        p5_fedge;
    input  reg        p5_en;
    input  reg        start_h;
    
    output integer    div;
    output real       phase;
    output real       duty;

begin
  
  if ((ht + lt + edg) == 0)
    div = $rtoi((prediv2 +1) * (1 + $itor(prediv2*p5_en)/2.0 ));
  else 
    div = $rtoi((prediv2 +1) *(ht + lt + edg + $itor(prediv2*p5_en)/2.0 ));

  if (div<=2)
    duty = 0.5;
  else
    duty =  ($itor(ht) + ($itor(edg)/2.0) + ($itor(prediv2*p5_fedge)/4.0))
           / $itor(ht + lt + edg + $itor(prediv2*p5_en)/2.0); 

  phase = 360.0 * ($itor(dt + prediv2*start_h*0.5) * (1+prediv2) + $itor(pi)/pi_res) 
          / $itor(div); 

end
endtask //mc_to_attr

task mc_to_attr_fbout;
  input  reg [4:0]  pi;
  input  reg [7:0]  dt;
  input  reg [7:0]  ht;
  input  reg [7:0]  lt;
  input  reg        edg;
  input  reg [31:0] fbout_fract;
  input  reg        fbout_fract_en;

  output integer    fbout_mult; //div
  output real       phase;

begin

  if ((ht + lt + edg) == 0)
    fbout_mult = 1;
  else
    fbout_mult = ht + lt + edg;
  
  phase = 360.0 * ($itor(dt) + $itor(pi)/pi_res)
          / ($itor(fbout_mult) + $itor(fbout_fract_en*fbout_fract/64.0)); 


end
endtask //mc_to_attr_fbout

task mc_to_attr_div;
  input  reg [7:0]  ht;
  input  reg [7:0]  lt;
  input  reg        edg;

  output integer    div;

begin

  if ((ht + lt + edg) == 0)
    div = 1;
  else
    div = ht + lt + edg;

end
endtask //mc_to_attr_div

task attr_to_mc_fb;
    input integer    div;
    input real       phase;
    input integer    fract;
    output reg [4:0] pi; // Interpolator control
    output reg [7:0] dt; //output counter delay setting

    real fdiv;
    real dt_rl;

begin

  fdiv = (div*1.0) + fract/64.0;
  dt_rl = fdiv*(phase/360.0); //delay time in real
  get_int_frac_parts(dt_rl, 8, dt, pi );
  pi=pi*4;

end
endtask 

task attr_to_mc;
    input reg [160:1]       clkout_name;
    input integer           div;
    input real              phase;
    input real              duty;
    input reg               prediv2;

    output reg [4:0] pi; // Interpolator control
    output reg       edg;  // edge.
    output reg [7:0] dt; //output counter delay setting
    output reg [7:0] ht; //high time
    output reg [7:0] lt; //low time
    output reg       p5_fedge;
    output reg       p5_en;
    output reg       start_h;

    real dt_rl;
    real pi_rl;
    reg [9:0] ht_int; //high time internal
    integer  val_edge;
    integer  dt_check;
    integer  pi_check;

begin

  start_h = 0;
  p5_en = 0;
  p5_fedge = 0; 
  val_edge = 0;

  dt_rl = 1.0*div*(phase/360.0); //Put phase in terms of decimal number of VCO clock cycles.
  get_int_frac_parts(dt_rl, 8, dt, pi );
  pi=pi*4;

  get_int_frac_parts(dt_rl, 8, dt_check, pi_check );
  //pi_check=pi_check*4;
  if(dt_check>255)
    $display("Error: [Unisim %s-29] Illegal value for %s_phase=%0d.\
      The maximum phase for %sDIV=%0d has been exceeded; causing DT exceed maximum value of 127.",
      MODULE_NAME, clkout_name, phase, clkout_name, div);

  get_int_frac_parts((duty*div),2,ht_int,edg );
  ht = ht_int;

  if(prediv2==1'b1) begin
    get_int_frac_parts((duty*div/2.0), 4, ht, val_edge);
    edg       = val_edge/2;
    p5_fedge  = val_edge%2;
    start_h   = dt%2;
    p5_en     = div%2;
    div       = div/2; // notes: change nDiv value to divided by 2.
    dt        = dt/2;
  end
  

  // The following two conditional stmts are for when the nearest 0.5 value 
  // is not allowed because of h/w limitations
  // HT cannot be 0
  if (ht == 0 && div>1)
  begin
    ht       = 1;
    edg      = 0;
    p5_fedge = 0;
  end

  // HT and edge cannot be equal to DIVIDE because then LT would need to be 0, fix this 
  if (ht + edg == div) 
  begin
    ht       = div-1;
    edg      = 0; 
    p5_fedge = 0;
   
    if(prediv2==1'b1) begin
      if(div==1 && p5_en==1 && duty>=0.5 ) p5_fedge = 1;
      if(div==1 && p5_en==0 && duty>=0.75) p5_fedge = 1;
    
      if(div>1 && p5_en==1 && duty>=((ht+0.25)/(div+0.5))) p5_fedge = 1;
      if(div>1 && p5_en==0 && duty>=((ht+0.25)/(div+0.0))) p5_fedge = 1;
    end
     
end

   if(div==1) 
   begin
     ht  = 0;
     edg = 0;
     lt  = 0;
   end 
   else 
     lt = div - ht - edg;


end
endtask 


task get_int_frac_parts;
  input real fDec;
  input integer nPrec;
  output integer nInt;
  output integer nFrac;

  real       dDecPrec;
  integer    nDecPrecInt;
begin
 
   // this task takes a decimal number and splits it into its integer part and
   //  fractional part after rounding it to the nearest 1/precision
   // the fractional part is represented as an integer which when divided by
   //  the precision gives the decimal version of the fractional part
   // ie. int_part and frac_part calculated such that
   //  (int_part + frac_part / precision) is closest possible to input decimal

  dDecPrec = fDec * nPrec;//0.5*3 *2=3
  nDecPrecInt = $rtoi(dDecPrec); //3
  if ((dDecPrec - nDecPrecInt) >= 0.5) begin //3-3=0
    nDecPrecInt = nDecPrecInt + 1; //3
  end

  nInt = nDecPrecInt / nPrec; // 3/2=1
  nFrac = nDecPrecInt - (nInt * nPrec);//3-1*2=1
end
endtask

task mod_phase;
  
  input real phase_reg;
  output real clk_phase;

begin

  // Make sure phase is positive.
  if (phase_reg > 360.0)
    clk_phase = phase_reg - 360.0;
  else if (phase_reg < 0.0)
    clk_phase = phase_reg + 360.0;
  else 
    clk_phase = phase_reg;

end
endtask


task GetMultVal (
  input integer fClkFbOutMultF, 
  input integer nBandwidth, 
  output reg [3:0] cp, 
  output reg [3:0] res);
 begin
   if ((nBandwidth == BANDWIDTH_HIGH) || (nBandwidth == BANDWIDTH_OPTIMIZED))
      case (fClkFbOutMultF) 
         4: begin
              cp = 4'd5; res = 4'd15;
            end
         5: begin
              cp = 4'd6; res = 4'd15;
            end
         6: begin
              cp = 4'd7; res = 4'd15;
            end
         7: begin
              cp = 4'd13; res = 4'd15;
            end
         8: begin
              cp = 4'd14; res = 4'd15;
            end
         9: begin
              cp = 4'd15; res = 4'd15;
            end
         10: begin
              cp = 4'd14; res = 4'd7;
            end
         11: begin
              cp = 4'd15; res = 4'd7;
            end
         12,13: begin
              cp = 4'd15; res = 4'd11;
            end
         14: begin
              cp = 4'd15; res = 4'd13;
            end
         15: begin
              cp = 4'd15; res = 4'd3;
            end
         16,17: begin
              cp = 4'd14; res = 4'd5;
            end
         18,19: begin
              cp = 4'd15; res = 4'd5;
            end
         20,21: begin
              cp = 4'd15; res = 4'd9;
            end
         22,23: begin
              cp = 4'd14; res = 4'd14;
            end
         24,25,26: begin
              cp = 4'd15; res = 4'd14;
            end
         27,28: begin
              cp = 4'd14; res = 4'd1;
            end
         29,30,31,32,33: begin
              cp = 4'd15; res = 4'd1;
            end
         34,35,36,37: begin
              cp = 4'd14; res = 4'd6;
            end
         38,39,40,41,42,43,44: begin
              cp = 4'd15; res = 4'd6;
            end
         45,46,47,48,49,50,51,52,53,4,55,56,57: begin
              cp = 4'd15; res = 4'd10;
            end
         58,59,60,61,62,63: begin
              cp = 4'd13; res = 4'd12;
            end
         64,65,66,67,68,69,70: begin
              cp = 4'd14; res = 4'd12;
            end
         71,72,73,74,75,76,77,78,79,
         80,81,82,83,84,85,86: begin
              cp = 4'd15; res = 4'd12;
            end
         87,88,89,90,91,92,93: begin
              cp = 4'd14; res = 4'd2;
            end
         94: begin
              cp = 4'd5; res = 4'd15;
            end
         95: begin
              cp = 4'd6; res = 4'd15;
            end
         96: begin
              cp = 4'd7; res = 4'd15;
            end
         97: begin
              cp = 4'd13; res = 4'd15;
            end
         98: begin
              cp = 4'd14; res = 4'd15;
            end
         99: begin
              cp = 4'd15; res = 4'd15;
            end
         100: begin
              cp = 4'd14; res = 4'd7;
            end
         101: begin
              cp = 4'd15; res = 4'd7;
            end
         102,103: begin
              cp = 4'd15; res = 4'd11;
            end
         104: begin
              cp = 4'd15; res = 4'd13;
            end
         105: begin
              cp = 4'd15; res = 4'd3;
            end
         106,107: begin
              cp = 4'd14; res = 4'd5;
            end
         108,109: begin
              cp = 4'd15; res = 4'd5;
            end
         110,111: begin
              cp = 4'd15; res = 4'd9;
            end 
         112,113: begin
              cp = 4'd14; res = 4'd14;
            end
         114,115,116: begin
              cp = 4'd15; res = 4'd14;
            end
         117,118: begin
              cp = 4'd14; res = 4'd1;
            end
         119,120,121,122,123: begin
              cp = 4'd15; res = 4'd1;
            end
         124,125,126,127: begin
              cp = 4'd14; res = 4'd6;
            end
         128,129,130,131,132,133,134: begin
              cp = 4'd15; res = 4'd6;
            end
         135,136,137,138,139,
         140,141,142,143,144,145,146,147: begin
              cp = 4'd15; res = 4'd10;
            end
         148,149,150,151,152,153: begin
              cp = 4'd13; res = 4'd12;
            end
         154,155,156,157,158,159,160: begin
              cp = 4'd14; res = 4'd12;
            end
         161,162,163,164,165,166,167,168,169,
         170,171,172,173,174,175,176: begin
              cp = 4'd15; res = 4'd12;
            end
         177,178,179,180,181,182,183: begin
              cp = 4'd14; res = 4'd2;
            end
         184,185,186,187,188,189,
         190,191,192,193,194,195,196,197,198,199,
         200: begin
              cp = 4'd14; res = 4'd4;
            end
         201,202,203,204,205,206,207,208,209,
         210,211,212,213,214,215,216,217,218,219,
         220,221,222,223,224,225,226,227,228,229,
         230,231,232,233,234,235,236,237,238,239,
         240,241,242,243,244,245,246,247,248,249,
         250,251,252,253,254,255,256,257,258,259,
         260,261,262,263,264,265,266,267,268,269,
         270,271,272,273: begin
              cp = 4'd15; res = 4'd4;
            end
         274,275,276,277,278,279,
         280,281,282,283,284,285,286,287,288,289,
         290,291,292,293,294,295,296,297,298,299,
         300: begin
              cp = 4'd13; res = 4'd8;
            end
         301,302,303,304,305,306,307,308,309,
         310,311,312,313,314,315,316,317,318,319,
         320,321,322,323,324,325: begin
              cp = 4'd14; res = 4'd8;
            end
         326,327,328,329,
         330,331,332,333,334,335,336,337,338,339,
         340,341,342,343,344,345,346,347,348,349,
         350,351,352,353,354,355,356,357,358,359,
         360,361,362,363,364,365,366,367,368,369,
         370,371,372,373,374,375,376,377,378,379,
         380,381,382,383,384,385,386,387,388,389,
         390,391,392,393,394,395,396,397,398,399,
         400,401,402,403,404,405,406,407,408,409,
         410,411,412,413,414,415,416,417,418,419,
         420,421,422,423,424,425,426,427,428,429,
         430,431,432: begin
              cp = 4'd15; res = 4'd8;
            end
     default:
           begin
              cp = 4'd13; res = 4'd8;
           end
      endcase
   else if (nBandwidth == BANDWIDTH_LOW) begin
      case (fClkFbOutMultF)
         4,5,6,7,8: begin
              cp = 4'd3; res = 4'd15;
            end
         9,10: begin
              cp = 4'd3; res = 4'd7;
            end
         11,12: begin
              cp = 4'd3; res = 4'd11;
            end
         13,14: begin
              cp = 4'd3; res = 4'd13;
            end
         15,16: begin
              cp = 4'd3; res = 4'd3;
            end
         17,18,19,20: begin
              cp = 4'd3; res = 4'd5;
            end
         21,22,23: begin
              cp = 4'd3; res = 4'd9;
            end
         24,25,26,27,28,29,30: begin
              cp = 4'd3; res = 4'd14;
            end
         31,32,33,34,35,36,37: begin
              cp = 4'd3; res = 4'd1;
            end
         38,39,
         40,41,42,43,44,45,46,47,48,49,
         50: begin
              cp = 4'd3; res = 4'd6;
            end
         51,52,53,54,55,56,57,58,59,
         60,61: begin
              cp = 4'd3; res = 4'd10;
            end
         62,63,64,65,66,67: begin
              cp = 4'd4; res = 4'd6;
            end
         68,69,
         70,71,72,73,74,75,76,77,78,79,
         80,81,82,83,84,85,86,87,88,89,
         90,91,92,93: begin
              cp = 4'd3; res = 4'd12;
            end
         94,95,96,97,98: begin
              cp = 4'd3; res = 4'd15;
            end
         99,100: begin
              cp = 4'd3; res = 4'd7;
            end
         101,102: begin
              cp = 4'd3; res = 4'd11;
            end
         103,104: begin
              cp = 4'd3; res = 4'd13;
            end
         105,106: begin
              cp = 4'd3; res = 4'd3;
            end
         107,108,109,110: begin
              cp = 4'd3; res = 4'd5;
            end
         111,112,113: begin
              cp = 4'd3; res = 4'd9;
            end
         114,115,116,117,118,119,120: begin
              cp = 4'd3; res = 4'd14;
            end
         121,122,123,124,125,126,127: begin
              cp = 4'd3; res = 4'd1;
            end
         128,129,
         130,131,132,133,134,135,136,137,138,139,
         140: begin
              cp = 4'd3; res = 4'd6;
            end
         141,142,143,144,145,146,147,148,149,
         150,151: begin
              cp = 4'd3; res = 4'd10;
            end
         152,153,154,155,156,157: begin
              cp = 4'd4; res = 4'd6;
            end
         158,159,
         160,161,162,163,164,165,166,167,168,169,
         170,171,172,173,174,175,176,177,178,179,
         180,181,182,183: begin
              cp = 4'd3; res = 4'd12;
            end
         184,185,186,187,188,189,
         190,191,192,193,194,195,196,197,198,199,
         200,201,202,203,204,205,206,207,208,209,
         210,211,212,213,214,215,216,217,218,219,
         220,221,222,223,224,225,226,227,228,229,
         230,231,232,233,234,235,236,237,238,239,
         240,241,242,243,244,245,246,247,248,249,
         250,251,252,253,254,255,256,257,258,259,
         260: begin
              cp = 4'd3; res = 4'd4;
            end
         261,262,263,264,265,266,267,268,269,
         270,271,272,273,274,275,276,277,278,279,
         280,281,282,283,284,285,286,287,288,289,
         290,291,292,293,294,295,296,297,298,299,
         300,301,302,303,304,305,306,307,308,309,
         310,311,312,313,314,315,316,317,318,319,
         320,321,322,323,324,325,326,327,328,329,
         330,331,332,333,334,335,336,337,338,339,
         340,341,342,343,344,345,346,347,348,349,
         350,351,352,353,354,355,356,357,358,359,
         360,361,362,363,364,365,366,367,368,369,
         370,371,372,373,374,375,376,377,378,379,
         380,381,382,383,384,385,386,387,388,389,
         390,391,392,393,394,395,396,397,398,399,
         400,401,402,403,404: begin
              cp = 4'd3; res = 4'd8;
            end
         405,406,407,408,409,
         410,411,412,413,414,415: begin
              cp = 4'd5; res = 4'd4;
            end
         416,417,418,419,
         420,421,422,423,424,425,426,427,428,429,
         430,431,432: begin
              cp = 4'd4; res = 4'd8;
            end
         default:
           begin
              cp = 4'd4; res = 4'd8;
           end
      endcase
   end
 end
endtask

task GetLockDetSettings (
  input integer fClkFbOutMultF, 
  output reg [4:0] lock_ref_dly, 
  output reg [4:0] lock_fb_dly, 
  output reg [9:0] lock_cnt, 
  output reg [9:0] lock_sat_high, 
  output reg [9:0] unlock_cnt);
begin
  lock_sat_high = 10'd1001;
  unlock_cnt = 10'd1;
  case (fClkFbOutMultF) 
    4:
    begin
      lock_ref_dly = 4;
      lock_fb_dly = 4;
      lock_cnt = 1000;
    end
    5:
    begin
      lock_ref_dly = 6;
      lock_fb_dly = 6;
      lock_cnt = 1000;
    end
    6,7,8:
    begin
      lock_ref_dly = 7;
      lock_fb_dly = 7;
      lock_cnt = 1000;
    end
    9,10,11,12:
    begin
      lock_ref_dly = 8;
      lock_fb_dly = 8;
      lock_cnt = 1000;
    end
    13:
    begin
      lock_ref_dly = 10;
      lock_fb_dly = 10;
      lock_cnt = 1000;
    end
    14,15,16:
    begin
      lock_ref_dly = 13;
      lock_fb_dly = 13;
      lock_cnt = 1000;
    end
    17:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 825;
    end
    18:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 750;
    end
    19,20:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 700;
    end
    21:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 650;
    end
    22,23:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 625;
    end
    24:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 575;
    end
    25:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 550;
    end
    26,27,28:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 525;
    end
    29,30:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 475;
    end
    31:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 450;
    end
    32,33:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 425;
    end
    34,35,36:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 400;
    end
    37:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 375;
    end
    38,39,40:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 350;
    end
    41,42,43:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 325;
    end
    44,45,46,47:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 300;
    end
    48,49,50,51:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 275;
    end
    52,53,54,55,56,57,58,59,
    60,61,62,63,64,65,66,67,68,69,
    70,71,72,73,74,75,76,77,78,79,
    80,81,82,83,84,85,86,87,88,89,
    90,91,92,93,94,95,96,97,98,99,
    100,101,102,103,104,105,106,107,108,109,
    110,111,112,113,114,115,116,117,118,119,
    120,121,122,123,124,125,126,127,128,129,
    130,131,132,133,134,135,136,137,138,139,
    140,141,142,143,144,145,146,147,148,149,
    150,151,152,153,154,155,156,157,158,159,
    160,161,162,163,164,165,166,167,168,169,
    170,171,172,173,174,175,176,177,178,179,
    180,181,182,183,184,185,186,187,188,189,
    190,191,192,193,194,195,196,197,198,199,
    200,201,202,203,204,205:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 250;
    end
    206,207,208,209,
    210,211,212,213,214,215,216,217,218,219,
    220,221,222,223,224,225,226,227,228,229,
    230,231,232,233,234,235,236,237,238,239,
    240,241,242,243,244,245,246,247,248,249,
    250,251,252,253,254,255,256,257,258,259,
    260,261,262,263,264,265,266,267,268,269,
    270,271,272,273,274,275,276,277,278,279,
    280,281,282,283,284,285,286,287,288,289,
    290,291,292,293,294,295,296,297,298,299,
    300,301,302,303,304,305,306,307,308,309,
    310,311,312,313,314,315,316,317,318,319,
    320,321,322,323,324,325,326,327,328,329,
    330,331,332,333,334,335,336,337,338,339,
    340,341,342,343,344,345,346,347,348,349,
    350,351,352,353,354,355,356,357,358,359,
    360,361,362,363,364,365,366,367,368,369,
    370,371,372,373,374,375,376,377,378,379,
    380,381,382,383,384,385,386,387,388,389,
    390,391,392,393,394,395,396,397,398,399,
    400,401,402,403,404,405,406,407,408,409,
    410,411,412,413,414,415,416,417,418,419,
    420,421,422,423,424,425,426,427,428,429,
    430,431,432:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 225;
    end
    default:
    begin
      lock_ref_dly = 16;
      lock_fb_dly = 16;
      lock_cnt = 250;
    end
  endcase
end
endtask

task GetLockDetSettings_fract (
  input integer fClkFbOutMultF, 
  output reg[4:0] lock_ref_dly, 
  output reg[4:0] lock_fb_dly, 
  output reg[9:0] lock_cnt, 
  output reg[9:0] lock_sat_high, 
  output reg[9:0] unlock_cnt
);
begin
  lock_sat_high = 10'd1001;
  unlock_cnt = 10'd1;
  case (fClkFbOutMultF) 
    4,5,6,7,8,9,
    10,11,12,13,14,15,16,17,18,19,
    20,21,22,23,24,25,26,27,28,29,
    30,31,32,33,34,35,36,37,38,39,
    40,41,42,43,44,45,46,47,48,49,
    50,51,52,53,54: begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 1000;
    end
    55:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 975;
    end
    56:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 950;
    end
    57,58:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 925;
    end
    59,60:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 900;
    end
    61:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 875;
    end
    62,63:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 850;
    end
    64,65:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 825;
    end
    66,67:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 800;
    end
    68,69:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 775;
    end
    70,71,72:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 750;
    end
    73,74:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 725;
    end
    75,76,77:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 700;
    end
    78,79,80:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 675;
    end
    81,82,83:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 650;
    end
    84,85,86:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 625;
    end
    87,88,89,
    90,91,92,93,94,95,96,97,98,99,
    100,101,102,103,104,105,106,107,108,109,
    110,111,112,113,114,115,116,117,118,119,
    120,121,122,123,124,125,126,127,128,129,
    130,131,132,133,134,135,136,137,138,139,
    140,141,142,143,144,145,146,147,148,149,
    150,151,152,153,154,155,156,157,158,159,
    160,161,162,163,164,165,166,167,168,169,
    170,171,172,173,174,175,176,177,178,179,
    180,181,182,183,184,185,186,187:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 600;
    end
    188,189,
    190,191,192:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 575;
    end
    193,194,195,196,197,198,199,
    200:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 550;
    end
    201,202,203,204,205,206,207,208,209,
    210:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 525;
    end
    211,212,213,214,215,216,217,218,219,
    220,221:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 500;
    end
    222,223,224,225,226,227,228,229,
    230,231,232,233:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 475;
    end
    234,235,236,237,238,239,
    240,241,242,243,244,245,246:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 450;
    end
    247,248,249,
    250,251,252,253,254,255,256,257,258,259,
    260,261:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 425;
    end
    262,263,264,265,266,267,268,269,
    270,271,272,273,274,275,276,277,278:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 400;
    end
    279,
    280,281,282,283,284,285,286,287,288,289,
    290,291,292,293,294,295,296,297:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 375;
    end
    298,299,
    300,301,302,303,304,305,306,307,308,309,
    310,311,312,313,314,315,316,317,318,319,
    320:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 350;
    end
    321,322,323,324,325,326,327,328,329,
    330,331,332,333,334,335,336,337,338,339,
    340,341,342,343,344,345:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 325;
    end
    346,347,348,349,
    350,351,352,353,354,355,356,357,358,359,
    360,361,362,363,364,365,366,367,368,369,
    370,371,372,373,374,375:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 300;
    end
    376,377,378,379,
    380,381,382,383,384,385,386,387,388,389,
    390,391,392,393,394,395,396,397,398,399,
    400,401,402,403,404,405,406,407,408,409,
    410,411:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 275;
    end
    412,413,414,415,416,417,418,419,
    420,421,422,423,424,425,426,427,428,429,
    430,431,432:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 250;
    end
    default:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 250;
    end
  endcase
end
endtask

task calc_dly_to_apply;
  input time        pd_delay;
  input reg [9:0]   clk_div;
  output time       pd1_clk_app_delay;
  input reg         pd_idx;

  real              clk_period;
  reg signed[63:0]  pd_dly_mod_clkp; // (pd_delay%clk_period)
  
begin
  clk_period = period_vco_rl*clk_div;
  if(clk_period >= pd_delay)
    pd1_clk_app_delay = clk_period - pd_delay;
  else begin
    pd_dly_mod_clkp   = (pd_delay -$rtoi(($itor($rtoi(pd_delay*1.0/clk_period))*clk_period))); //(pd_delay%clk_period)
    //This part is to correct rounding errors:
    if(pd_dly_mod_clkp > clk_period)
      pd_dly_mod_clkp = pd_dly_mod_clkp - clk_period;
    else if (pd_dly_mod_clkp < 0)
      pd_dly_mod_clkp = pd_dly_mod_clkp + clk_period;
       
    pd1_clk_app_delay = clk_period - pd_dly_mod_clkp; //clk_period - (pd_delay%clk_period)
  end
  
  // also calculate the maximum
  if(pd_idx==1)
    pd1_applied_delay = (pd1_applied_delay>pd1_clk_app_delay)? pd1_applied_delay : pd1_clk_app_delay;
  else
    pd2_applied_delay = (pd2_applied_delay>pd1_clk_app_delay)? pd2_applied_delay : pd1_clk_app_delay;
end
endtask

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLKIN1 => CLKFBOUT) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT3) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT4) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT5) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT6) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKFBOUT) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT3) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT4) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT5) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT6) = (0:0:0, 0:0:0);
    (DCLK => DO[0]) = (100:100:100, 100:100:100);
    (DCLK => DO[10]) = (100:100:100, 100:100:100);
    (DCLK => DO[11]) = (100:100:100, 100:100:100);
    (DCLK => DO[12]) = (100:100:100, 100:100:100);
    (DCLK => DO[13]) = (100:100:100, 100:100:100);
    (DCLK => DO[14]) = (100:100:100, 100:100:100);
    (DCLK => DO[15]) = (100:100:100, 100:100:100);
    (DCLK => DO[1]) = (100:100:100, 100:100:100);
    (DCLK => DO[2]) = (100:100:100, 100:100:100);
    (DCLK => DO[3]) = (100:100:100, 100:100:100);
    (DCLK => DO[4]) = (100:100:100, 100:100:100);
    (DCLK => DO[5]) = (100:100:100, 100:100:100);
    (DCLK => DO[6]) = (100:100:100, 100:100:100);
    (DCLK => DO[7]) = (100:100:100, 100:100:100);
    (DCLK => DO[8]) = (100:100:100, 100:100:100);
    (DCLK => DO[9]) = (100:100:100, 100:100:100);
    (DCLK => DRDY) = (100:100:100, 100:100:100);
    (PSCLK => PSDONE) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (CLKFBSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (CLKINSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CLKFBSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CLKINSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (CLKFBSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (CLKINSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CLKFBSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CLKINSTOPPED +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLKFB1_DESKEW, 0:0:0, notifier);
    $period (negedge CLKFB2_DESKEW, 0:0:0, notifier);
    $period (negedge CLKFBIN, 0:0:0, notifier);
    $period (negedge CLKFBOUT, 0:0:0, notifier);
    $period (negedge CLKIN1, 0:0:0, notifier);
    $period (negedge CLKIN1_DESKEW, 0:0:0, notifier);
    $period (negedge CLKIN2, 0:0:0, notifier);
    $period (negedge CLKIN2_DESKEW, 0:0:0, notifier);
    $period (negedge CLKOUT0, 0:0:0, notifier);
    $period (negedge CLKOUT1, 0:0:0, notifier);
    $period (negedge CLKOUT2, 0:0:0, notifier);
    $period (negedge CLKOUT3, 0:0:0, notifier);
    $period (negedge CLKOUT4, 0:0:0, notifier);
    $period (negedge CLKOUT5, 0:0:0, notifier);
    $period (negedge CLKOUT6, 0:0:0, notifier);
    $period (negedge DCLK, 0:0:0, notifier);
    $period (negedge PSCLK, 0:0:0, notifier);
    $period (posedge CLKFB1_DESKEW, 0:0:0, notifier);
    $period (posedge CLKFB2_DESKEW, 0:0:0, notifier);
    $period (posedge CLKFBIN, 0:0:0, notifier);
    $period (posedge CLKFBOUT, 0:0:0, notifier);
    $period (posedge CLKIN1, 0:0:0, notifier);
    $period (posedge CLKIN1_DESKEW, 0:0:0, notifier);
    $period (posedge CLKIN2, 0:0:0, notifier);
    $period (posedge CLKIN2_DESKEW, 0:0:0, notifier);
    $period (posedge CLKOUT0, 0:0:0, notifier);
    $period (posedge CLKOUT1, 0:0:0, notifier);
    $period (posedge CLKOUT2, 0:0:0, notifier);
    $period (posedge CLKOUT3, 0:0:0, notifier);
    $period (posedge CLKOUT4, 0:0:0, notifier);
    $period (posedge CLKOUT5, 0:0:0, notifier);
    $period (posedge CLKOUT6, 0:0:0, notifier);
    $period (posedge DCLK, 0:0:0, notifier);
    $period (posedge PSCLK, 0:0:0, notifier);
    $setuphold (posedge DCLK, negedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, negedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, negedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, negedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, negedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, negedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, negedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, negedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, negedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, negedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, negedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, negedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, negedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, negedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, negedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, negedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, negedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, negedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, negedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, negedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, negedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, negedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, negedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, negedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, negedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge DCLK, posedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, posedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, posedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, posedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, posedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, posedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, posedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, posedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, posedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, posedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, posedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, posedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, posedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, posedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, posedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, posedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, posedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, posedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, posedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, posedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, posedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, posedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, posedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, posedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, posedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $width (negedge CLKFB1_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKFB2_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKFBIN, 0:0:0, 0, notifier);
    $width (negedge CLKIN1, 0:0:0, 0, notifier);
    $width (negedge CLKIN1_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKIN2, 0:0:0, 0, notifier);
    $width (negedge CLKIN2_DESKEW, 0:0:0, 0, notifier);
    $width (negedge DCLK, 0:0:0, 0, notifier);
    $width (negedge PSCLK, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKFB1_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKFB2_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKFBIN, 0:0:0, 0, notifier);
    $width (posedge CLKIN1, 0:0:0, 0, notifier);
    $width (posedge CLKIN1_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKIN2, 0:0:0, 0, notifier);
    $width (posedge CLKIN2_DESKEW, 0:0:0, 0, notifier);
    $width (posedge DCLK, 0:0:0, 0, notifier);
    $width (posedge PSCLK, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
