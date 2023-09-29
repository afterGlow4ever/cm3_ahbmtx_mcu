///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Bidirectional I/O Buffer with Offset Calibration and VREF Tuning
// /___/   /\      Filename    : IOBUFE3.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//    10/22/14 - Added #1 to $finish (CR 808642).
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module IOBUFE3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DRIVE = 12,
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter SIM_DEVICE = "ULTRASCALE",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  inout IO,

  input DCITERMDISABLE,
  input I,
  input IBUFDISABLE,
  input [3:0] OSC,
  input OSC_EN,
  input T,
  input VREF
);

// define constants
  localparam MODULE_NAME = "IOBUFE3";
  
// Parameter encodings and registers
  localparam IBUF_LOW_PWR_FALSE = 1;
  localparam IBUF_LOW_PWR_TRUE = 0;
  localparam SIM_DEVICE_ULTRASCALE = 0;
  localparam SIM_DEVICE_ULTRASCALE_PLUS = 1;
  localparam SIM_DEVICE_VERSAL_AI_CORE = 2;
  localparam SIM_DEVICE_VERSAL_AI_CORE_ES1 = 3;
  localparam SIM_DEVICE_VERSAL_AI_EDGE = 4;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES1 = 5;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES2 = 6;
  localparam SIM_DEVICE_VERSAL_AI_RF = 7;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES1 = 8;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES2 = 9;
  localparam SIM_DEVICE_VERSAL_HBM = 10;
  localparam SIM_DEVICE_VERSAL_HBM_ES1 = 11;
  localparam SIM_DEVICE_VERSAL_HBM_ES2 = 12;
  localparam SIM_DEVICE_VERSAL_PREMIUM = 13;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES1 = 14;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES2 = 15;
  localparam SIM_DEVICE_VERSAL_PRIME = 16;
  localparam SIM_DEVICE_VERSAL_PRIME_ES1 = 17;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;
  localparam USE_IBUFDISABLE_T_CONTROL = 2;

  
// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  localparam integer DRIVE_REG = DRIVE;
  localparam [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  localparam [56:1] IOSTANDARD_REG = IOSTANDARD;
  localparam [144:1] SIM_DEVICE_REG = SIM_DEVICE;
  localparam integer SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  localparam [72:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

`ifdef XIL_XECLIB
  wire [4:0] DRIVE_BIN;
  wire IBUF_LOW_PWR_BIN;
  wire [4:0] SIM_DEVICE_BIN;
  wire [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  wire [1:0] USE_IBUFDISABLE_BIN;
`else
  reg [4:0] DRIVE_BIN;
  reg IBUF_LOW_PWR_BIN;
  reg [4:0] SIM_DEVICE_BIN;
  reg [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  reg [1:0] USE_IBUFDISABLE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
reg glblGTS = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
tri0 glblGTS = glbl.GTS;
`endif

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
  assign DRIVE_BIN = DRIVE_REG;
  
  assign IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
       IBUF_LOW_PWR_TRUE;
  
  assign SIM_DEVICE_BIN =
      (SIM_DEVICE_REG == "ULTRASCALE") ? SIM_DEVICE_ULTRASCALE :
      (SIM_DEVICE_REG == "ULTRASCALE_PLUS") ? SIM_DEVICE_ULTRASCALE_PLUS :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE") ? SIM_DEVICE_VERSAL_AI_CORE :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE_ES1") ? SIM_DEVICE_VERSAL_AI_CORE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE") ? SIM_DEVICE_VERSAL_AI_EDGE :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES1") ? SIM_DEVICE_VERSAL_AI_EDGE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES2") ? SIM_DEVICE_VERSAL_AI_EDGE_ES2 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF") ? SIM_DEVICE_VERSAL_AI_RF :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES1") ? SIM_DEVICE_VERSAL_AI_RF_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES2") ? SIM_DEVICE_VERSAL_AI_RF_ES2 :
      (SIM_DEVICE_REG == "VERSAL_HBM") ? SIM_DEVICE_VERSAL_HBM :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES1") ? SIM_DEVICE_VERSAL_HBM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES2") ? SIM_DEVICE_VERSAL_HBM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM") ? SIM_DEVICE_VERSAL_PREMIUM :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES1") ? SIM_DEVICE_VERSAL_PREMIUM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES2") ? SIM_DEVICE_VERSAL_PREMIUM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PRIME") ? SIM_DEVICE_VERSAL_PRIME :
      (SIM_DEVICE_REG == "VERSAL_PRIME_ES1") ? SIM_DEVICE_VERSAL_PRIME_ES1 :
       SIM_DEVICE_ULTRASCALE;
  
  assign SIM_INPUT_BUFFER_OFFSET_BIN = SIM_INPUT_BUFFER_OFFSET_REG;
  
  assign USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
       USE_IBUFDISABLE_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  DRIVE_BIN = DRIVE_REG;
  
  IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
       IBUF_LOW_PWR_TRUE;
  
  SIM_DEVICE_BIN =
      (SIM_DEVICE_REG == "ULTRASCALE") ? SIM_DEVICE_ULTRASCALE :
      (SIM_DEVICE_REG == "ULTRASCALE_PLUS") ? SIM_DEVICE_ULTRASCALE_PLUS :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE") ? SIM_DEVICE_VERSAL_AI_CORE :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE_ES1") ? SIM_DEVICE_VERSAL_AI_CORE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE") ? SIM_DEVICE_VERSAL_AI_EDGE :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES1") ? SIM_DEVICE_VERSAL_AI_EDGE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES2") ? SIM_DEVICE_VERSAL_AI_EDGE_ES2 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF") ? SIM_DEVICE_VERSAL_AI_RF :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES1") ? SIM_DEVICE_VERSAL_AI_RF_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES2") ? SIM_DEVICE_VERSAL_AI_RF_ES2 :
      (SIM_DEVICE_REG == "VERSAL_HBM") ? SIM_DEVICE_VERSAL_HBM :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES1") ? SIM_DEVICE_VERSAL_HBM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES2") ? SIM_DEVICE_VERSAL_HBM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM") ? SIM_DEVICE_VERSAL_PREMIUM :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES1") ? SIM_DEVICE_VERSAL_PREMIUM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES2") ? SIM_DEVICE_VERSAL_PREMIUM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PRIME") ? SIM_DEVICE_VERSAL_PRIME :
      (SIM_DEVICE_REG == "VERSAL_PRIME_ES1") ? SIM_DEVICE_VERSAL_PRIME_ES1 :
       SIM_DEVICE_ULTRASCALE;
  
  SIM_INPUT_BUFFER_OFFSET_BIN = SIM_INPUT_BUFFER_OFFSET_REG;
  
  USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
       USE_IBUFDISABLE_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DRIVE_REG < 2) || (DRIVE_REG > 24))) begin
      $display("Error: [Unisim %s-101] DRIVE attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-102] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_DEVICE_REG != "ULTRASCALE") &&
         (SIM_DEVICE_REG != "ULTRASCALE_PLUS") &&
         (SIM_DEVICE_REG != "VERSAL_AI_CORE") &&
         (SIM_DEVICE_REG != "VERSAL_AI_CORE_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_HBM") &&
         (SIM_DEVICE_REG != "VERSAL_HBM_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_HBM_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_PRIME") &&
         (SIM_DEVICE_REG != "VERSAL_PRIME_ES1"))) begin
      $display("Error: [Unisim %s-104] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are ULTRASCALE, ULTRASCALE_PLUS, VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME or VERSAL_PRIME_ES1. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-105] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "T_CONTROL") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE, T_CONTROL or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire not_t_or_ibufdisable;
  wire versal_or_later;
  wire OSC_EN_in_muxed;
  wire [3:0] OSC_in_muxed;
  wire ts;

  integer OSC_int = 0;
  reg O_OSC_in;


  or O1 (ts, glblGTS, T);
  bufif0 T1 (IO, I, ts);


  assign versal_or_later = ( SIM_DEVICE_BIN == SIM_DEVICE_ULTRASCALE || 
                             SIM_DEVICE_BIN == SIM_DEVICE_ULTRASCALE_PLUS ) ? 1'b0 : 1'b1;

  assign OSC_in_muxed    = versal_or_later ? 4'd0 : OSC;
  assign OSC_EN_in_muxed = versal_or_later ? 1'b0 : OSC_EN;


  initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int)< 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= 1'bx;
  end 

  assign not_t_or_ibufdisable = ~T || IBUFDISABLE;

  generate
       case (USE_IBUFDISABLE)
          "TRUE" :  begin
              assign O = (not_t_or_ibufdisable == 0)? (OSC_EN_in_muxed) ? O_OSC_in : IO : (not_t_or_ibufdisable == 1 && OSC_EN_in_muxed != 1)? 1'b0  : 1'bx;
              end
          "FALSE"  : begin
  	      assign O = (OSC_EN_in_muxed) ? O_OSC_in : IO;
              end
	   "T_CONTROL" : begin
	      assign O = (T == 1'b1) ? IO : (T == 1'b0) ? 1'b0 : 1'bx;
	      end
       endcase
  endgenerate
 
  always @ (OSC_in_muxed or OSC_EN_in_muxed) begin
      OSC_int = OSC_in_muxed[2:0] * 5;
  if (OSC_in_muxed[3] == 1'b0 )
      OSC_int =  -1*OSC_int;
  
   if(OSC_EN_in_muxed == 1'b1) begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= ~O_OSC_in;
   end
  end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (DCITERMDISABLE => IO) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (I => IO) = (0:0:0, 0:0:0);
    (IBUFDISABLE => O) = (0:0:0, 0:0:0);
    (IO => O) = (0:0:0, 0:0:0);
    (T => IO) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (VREF => IO) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
