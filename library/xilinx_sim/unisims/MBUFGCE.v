///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        General Clock Buffer with Clock Enable
// /___/   /\      Filename    : MBUFGCE.v
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

module MBUFGCE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CE_TYPE = "SYNC",
  parameter [0:0] IS_CE_INVERTED = 1'b0,
  parameter [0:0] IS_I_INVERTED = 1'b0,
  parameter MODE = "PERFORMANCE",
  parameter SIM_DEVICE = "VERSAL_AI_CORE",
  parameter STARTUP_SYNC = "TRUE"
)(
  output O1,
  output O2,
  output O3,
  output O4,

  input CE,
  input CLRB_LEAF,
  input I
);

// define constants
  localparam MODULE_NAME = "MBUFGCE";
  
// Parameter encodings and registers
  localparam CE_TYPE_ASYNC = 1;
  localparam CE_TYPE_HARDSYNC = 2;
  localparam CE_TYPE_SYNC = 0;
  localparam MODE_PERFORMANCE = 0;
  localparam MODE_POWER = 1;
  localparam SIM_DEVICE_VERSAL_AI_CORE = 0;
  localparam SIM_DEVICE_VERSAL_AI_CORE_ES1 = 1;
  localparam SIM_DEVICE_VERSAL_AI_EDGE = 3;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES1 = 4;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES2 = 5;
  localparam SIM_DEVICE_VERSAL_AI_RF = 6;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES1 = 7;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES2 = 8;
  localparam SIM_DEVICE_VERSAL_HBM = 9;
  localparam SIM_DEVICE_VERSAL_HBM_ES1 = 10;
  localparam SIM_DEVICE_VERSAL_HBM_ES2 = 11;
  localparam SIM_DEVICE_VERSAL_PREMIUM = 12;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES1 = 13;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES2 = 14;
  localparam SIM_DEVICE_VERSAL_PRIME = 15;
  localparam SIM_DEVICE_VERSAL_PRIME_ES1 = 16;
  localparam STARTUP_SYNC_FALSE = 0;
  localparam STARTUP_SYNC_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "MBUFGCE_dr.v"
`else
  reg [64:1] CE_TYPE_REG = CE_TYPE;
  reg [0:0] IS_CE_INVERTED_REG = IS_CE_INVERTED;
  reg [0:0] IS_I_INVERTED_REG = IS_I_INVERTED;
  reg [88:1] MODE_REG = MODE;
  reg [144:1] SIM_DEVICE_REG = SIM_DEVICE;
  reg [40:1] STARTUP_SYNC_REG = STARTUP_SYNC;
`endif

`ifdef XIL_XECLIB
  wire [1:0] CE_TYPE_BIN;
  wire MODE_BIN;
  wire [4:0] SIM_DEVICE_BIN;
  wire STARTUP_SYNC_BIN;
`else
  reg [1:0] CE_TYPE_BIN;
  reg MODE_BIN;
  reg [4:0] SIM_DEVICE_BIN;
  reg STARTUP_SYNC_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CE_in;
  wire CLRB_LEAF_in;
  wire I_in;

`ifdef XIL_TIMING
  wire CE_delay;
  wire I_delay;
`endif

`ifdef XIL_TIMING
  assign CE_in = (CE === 1'bz) || (CE_delay ^ IS_CE_INVERTED_REG); // rv 1
  assign I_in = I_delay ^ IS_I_INVERTED_REG;
`else
  assign CE_in = (CE === 1'bz) || (CE ^ IS_CE_INVERTED_REG); // rv 1
  assign I_in = I ^ IS_I_INVERTED_REG;
`endif

  assign CLRB_LEAF_in = CLRB_LEAF;

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
  assign CE_TYPE_BIN =
      (CE_TYPE_REG == "SYNC") ? CE_TYPE_SYNC :
      (CE_TYPE_REG == "ASYNC") ? CE_TYPE_ASYNC :
      (CE_TYPE_REG == "HARDSYNC") ? CE_TYPE_HARDSYNC :
       CE_TYPE_SYNC;
  
  assign MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
  assign SIM_DEVICE_BIN =
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
       SIM_DEVICE_VERSAL_AI_CORE;
  
  assign STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
       STARTUP_SYNC_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  CE_TYPE_BIN =
      (CE_TYPE_REG == "SYNC") ? CE_TYPE_SYNC :
      (CE_TYPE_REG == "ASYNC") ? CE_TYPE_ASYNC :
      (CE_TYPE_REG == "HARDSYNC") ? CE_TYPE_HARDSYNC :
       CE_TYPE_SYNC;
  
  MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
  SIM_DEVICE_BIN =
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
       SIM_DEVICE_VERSAL_AI_CORE;
  
  STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
       STARTUP_SYNC_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CE_TYPE_REG != "SYNC") &&
         (CE_TYPE_REG != "ASYNC") &&
         (CE_TYPE_REG != "HARDSYNC"))) begin
      $display("Error: [Unisim %s-101] CE_TYPE attribute is set to %s.  Legal values for this attribute are SYNC, ASYNC or HARDSYNC. Instance: %m", MODULE_NAME, CE_TYPE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MODE_REG != "PERFORMANCE") &&
         (MODE_REG != "POWER"))) begin
      $display("Error: [Unisim %s-104] MODE attribute is set to %s.  Legal values for this attribute are PERFORMANCE or POWER. Instance: %m", MODULE_NAME, MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_DEVICE_REG != "VERSAL_AI_CORE") &&
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
      $display("Error: [Unisim %s-105] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME or VERSAL_PRIME_ES1. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_SYNC_REG != "FALSE") &&
         (STARTUP_SYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] STARTUP_SYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_SYNC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg       O_bufgce= 1'b0;
  reg       O_int_sel=1'b0;
  reg       O2_out;
  reg       O3_out;
  reg       O4_out;
  reg       enable_clk;
  reg [2:0] gwe_sync;
  wire      gwe_muxed_sync;
  reg [2:0] ce_sync;
  wire      ce_muxed_sync;
  wire      cb;

  integer   HALF_PERIOD = 1000;
  integer   HALF_PERIOD_NEXT = 1000;
  time      clk_edge;


  initial begin
    gwe_sync   = 3'b000;
    ce_sync    = 3'b000;
    enable_clk = 1'b0;
    clk_edge   = 0;
    O_bufgce   = 1'b0;
    O_int_sel  = 1'b0;
    O2_out     = 1'b0;
    O3_out     = 1'b0;
    O4_out     = 1'b0;
  end

  always @(posedge I_in ) begin
    if(I_in==1'b1)
      gwe_sync <= {gwe_sync[1:0], ~glblGSR};
  end

  assign gwe_muxed_sync = (STARTUP_SYNC_BIN == STARTUP_SYNC_TRUE) ? gwe_sync[2] :  ~glblGSR;


  always @(posedge I_in ) begin
    if(I_in==1'b1)
      ce_sync <= {ce_sync[1:0], CE_in};
  end

  assign ce_muxed_sync = (CE_TYPE_BIN == CE_TYPE_HARDSYNC) ? ce_sync[2] : CE_in;
 
  assign cb = ~( (~gwe_muxed_sync) || ((CE_TYPE_BIN !== CE_TYPE_ASYNC) && I_in));

  
  always @(*) begin
    if(cb)
      enable_clk <= ce_muxed_sync;
  end

  always @(*)
    O_bufgce = enable_clk && I_in;


  //MODE="POWER" support
  always @(posedge O_bufgce) begin
    if (glblGSR && (MODE_BIN == MODE_POWER)) begin
      if (clk_edge > 0) HALF_PERIOD_NEXT = ($time - clk_edge) / 2;
      clk_edge = $time;
    end
  end

  always @(O_bufgce) begin
    if (MODE_BIN == MODE_PERFORMANCE) begin
      O_int_sel = O_bufgce;
    end else if (O_bufgce == 1'b1) begin
      HALF_PERIOD = HALF_PERIOD_NEXT;
      O_int_sel = 1'b1;
      #(HALF_PERIOD/2);
      O_int_sel = 1'b0;
      #(HALF_PERIOD/2);
      O_int_sel = 1'b1;
      #(HALF_PERIOD/2);
      O_int_sel = 1'b0;
    end
  end
  //End of MODE="POWER" support


  always @(posedge O_int_sel or negedge CLRB_LEAF_in) begin
    if(~CLRB_LEAF_in)
      O2_out<=0;
    else
      O2_out <= ~O2_out;
  end
  
  always @(posedge O_int_sel or negedge CLRB_LEAF_in) begin
    if(~CLRB_LEAF_in)
      O3_out<=0;
    else
      O3_out <= (~O2_out) ^ O3_out;    
  end
 
  always @(posedge O_int_sel or negedge CLRB_LEAF_in) begin
    if(~CLRB_LEAF_in)
      O4_out<=0;
    else
      O4_out <= (~O2_out & ~O3_out) ^ O4_out;    
  end
  

  assign O1 = O_int_sel;
  assign O2 = O2_out;
  assign O3 = O3_out;
  assign O4 = O4_out;


// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  
  wire i_en_n;
  wire i_en_p;
  
  assign i_en_n =  IS_I_INVERTED_REG;
  assign i_en_p = ~IS_I_INVERTED_REG;

`endif

// Since I and O* are both clocks, no specify delay needed from I to O.
`ifdef XIL_TIMING
  specify
    (CE => O1) = (0:0:0, 0:0:0);
    (CE => O2) = (0:0:0, 0:0:0);
    (CE => O3) = (0:0:0, 0:0:0);
    (CE => O4) = (0:0:0, 0:0:0);
    (I => O1) = (0:0:0, 0:0:0);
    (I => O2) = (0:0:0, 0:0:0);
    (I => O3) = (0:0:0, 0:0:0);
    (I => O4) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $setuphold (negedge I, negedge CE, 0:0:0, 0:0:0, notifier, i_en_n, i_en_n, I_delay, CE_delay);
    $setuphold (negedge I, posedge CE, 0:0:0, 0:0:0, notifier, i_en_n, i_en_n, I_delay, CE_delay);
    $setuphold (posedge I, negedge CE, 0:0:0, 0:0:0, notifier, i_en_p, i_en_p, I_delay, CE_delay);
    $setuphold (posedge I, posedge CE, 0:0:0, 0:0:0, notifier, i_en_p, i_en_p, I_delay, CE_delay);
    $width (negedge CE, 0:0:0, 0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge CE, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
