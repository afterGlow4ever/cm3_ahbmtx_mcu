///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Differential Input Buffer with Offset Calibration
// /___/   /\      Filename    : IBUFDSE3.v
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

module IBUFDSE3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter SIM_DEVICE = "ULTRASCALE",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  input I,
  input IB,
  input IBUFDISABLE,
  input [3:0] OSC,
  input [1:0] OSC_EN
);

// define constants
  localparam MODULE_NAME = "IBUFDSE3";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
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
  localparam [40:1] DIFF_TERM_REG = DIFF_TERM;
  localparam [40:1] DQS_BIAS_REG = DQS_BIAS;
  localparam [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  localparam [56:1] IOSTANDARD_REG = IOSTANDARD;
  localparam integer SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  localparam [72:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;
  localparam [144:1] SIM_DEVICE_REG = SIM_DEVICE;

`ifdef XIL_XECLIB
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire IBUF_LOW_PWR_BIN;
  wire [4:0] SIM_DEVICE_BIN;
  wire [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  wire [1:0] USE_IBUFDISABLE_BIN;
`else
  reg DIFF_TERM_BIN;
  reg DQS_BIAS_BIN;
  reg IBUF_LOW_PWR_BIN;
  reg [4:0] SIM_DEVICE_BIN;
  reg [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  reg [1:0] USE_IBUFDISABLE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
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

  reg O_out;
  reg O_OSC_in;

  wire O_delay;

  wire IBUFDISABLE_in;
  wire IB_in;
  wire I_in;
  wire [1:0] OSC_EN_in;
  wire [3:0] OSC_in;

  wire IBUFDISABLE_delay;
  wire IB_delay;
  wire I_delay;
  wire [1:0] OSC_EN_delay;
  wire [3:0] OSC_delay;

  assign #(out_delay) O = O_delay;


// inputs with no timing checks
  assign #(in_delay) IBUFDISABLE_delay = IBUFDISABLE;
  assign #(in_delay) IB_delay = IB;
  assign #(in_delay) I_delay = I;
  assign #(in_delay) OSC_EN_delay = OSC_EN;
  assign #(in_delay) OSC_delay = OSC;

  assign IBUFDISABLE_in = IBUFDISABLE_delay;
  assign IB_in = IB_delay;
  assign I_in = I_delay;
  assign OSC_EN_in = OSC_EN_delay;
  assign OSC_in = OSC_delay;

`ifdef XIL_XECLIB  
  assign DIFF_TERM_BIN =
    (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
    (DIFF_TERM_REG == "TRUE")  ? DIFF_TERM_TRUE  :
     DIFF_TERM_FALSE;

  assign DQS_BIAS_BIN =
    (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
    (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
     DQS_BIAS_FALSE;

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
 
  assign USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
       USE_IBUFDISABLE_FALSE;

`else
  always @ (trig_attr) begin
  #1;
  DIFF_TERM_BIN =
      (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
      (DIFF_TERM_REG == "TRUE")  ? DIFF_TERM_TRUE  :
       DIFF_TERM_FALSE;
  
  DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
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
        ((DIFF_TERM_REG != "FALSE") &&
         (DIFF_TERM_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] DIFF_TERM attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_TERM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-103] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
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
      $display("Error: [Unisim %s-106] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are ULTRASCALE, ULTRASCALE_PLUS, VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME or VERSAL_PRIME_ES1. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-107] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "T_CONTROL") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-108] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE, T_CONTROL or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  integer OSC_int = 0;
  wire versal_or_later;
  wire [1:0] OSC_EN_in_muxed;
  wire [3:0] OSC_in_muxed;


  assign versal_or_later = ( SIM_DEVICE_BIN == SIM_DEVICE_ULTRASCALE || 
                             SIM_DEVICE_BIN == SIM_DEVICE_ULTRASCALE_PLUS ) ? 1'b0 : 1'b1;

  assign OSC_in_muxed    = versal_or_later ? 4'd0 : OSC_in;
  assign OSC_EN_in_muxed = versal_or_later ? 2'd0 : OSC_EN_in;


  assign O_delay = (OSC_EN_in_muxed === 2'b11) ? O_OSC_in : 
                   (OSC_EN_in_muxed === 2'b10 || OSC_EN_in_muxed === 2'b01) ? 1'bx : 
                   O_out;

  always @ (OSC_in_muxed or OSC_EN_in_muxed) begin
     OSC_int = OSC_in_muxed[2:0] * 5;
     if (OSC_in_muxed[3] == 1'b0 )
     OSC_int =  -1*OSC_int;

   if(OSC_EN_in_muxed == 2'b11) begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= ~O_OSC_in;
   end
  end
  

  initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= 1'bx;
  end 



  always @(I_in or IB_in or DQS_BIAS_BIN or IBUFDISABLE_in or USE_IBUFDISABLE_BIN) begin
     if (USE_IBUFDISABLE_BIN == 2'b01 && IBUFDISABLE_in == 1'b1) 
         O_out <= 1'b0;
     else if ((USE_IBUFDISABLE_BIN == 2'b01 && IBUFDISABLE_in == 1'b0) || (USE_IBUFDISABLE_BIN == 2'b00) || (USE_IBUFDISABLE_BIN == 2'b10)) begin
        if (I_in == 1'b1 && IB_in == 1'b0)
          O_out <= 1'b1;
        else if (I_in == 1'b0 && IB_in == 1'b1)
          O_out <= 1'b0;
        else if ((I_in === 1'bz || I_in == 1'b0) && (IB_in === 1'bz || IB_in == 1'b1))
          if (DQS_BIAS_BIN == 1'b1)
            O_out <= 1'b0;
          else
            O_out <= 1'bx;
        else if ((I_in === 1'bx) || (IB_in === 1'bx))
          O_out <= 1'bx;
     end
     else begin
          O_out <= 1'bx;
      end
   end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (I => O) = (0:0:0, 0:0:0);
    (IB => O) = (0:0:0, 0:0:0);
    (IBUFDISABLE => O) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
