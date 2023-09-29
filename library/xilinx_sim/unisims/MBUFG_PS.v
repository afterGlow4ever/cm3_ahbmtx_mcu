///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        MBUFG_PS
// /___/   /\      Filename    : MBUFG_PS.v
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

module MBUFG_PS #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter MODE = "PERFORMANCE",
  parameter STARTUP_SYNC = "FALSE"
)(
  output O1,
  output O2,
  output O3,
  output O4,

  input CLRB_LEAF,
  input I
);

// define constants
  localparam MODULE_NAME = "MBUFG_PS";
  
// Parameter encodings and registers
  localparam MODE_PERFORMANCE = 0;
  localparam MODE_POWER = 1;
  localparam STARTUP_SYNC_FALSE = 0;
  localparam STARTUP_SYNC_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "MBUFG_PS_dr.v"
`else
  reg [88:1] MODE_REG = MODE;
  reg [40:1] STARTUP_SYNC_REG = STARTUP_SYNC;
`endif

`ifdef XIL_XECLIB
  wire MODE_BIN;
  wire STARTUP_SYNC_BIN;
`else
  reg MODE_BIN;
  reg STARTUP_SYNC_BIN;
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

`ifdef XIL_XECLIB
  assign MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
  assign STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
       STARTUP_SYNC_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
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
        ((MODE_REG != "PERFORMANCE") &&
         (MODE_REG != "POWER"))) begin
      $display("Error: [Unisim %s-101] MODE attribute is set to %s.  Legal values for this attribute are PERFORMANCE or POWER. Instance: %m", MODULE_NAME, MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_SYNC_REG != "FALSE") &&
         (STARTUP_SYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] STARTUP_SYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_SYNC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg [2:0]     gwe_sync;
  wire          gwe_muxed_sync;
  reg           gwe_latch;
  wire          I_in;
  wire          CLRB_LEAF_in;
  wire          O_bufg_ps;
  reg           O_int_sel;
  reg           O2_out;
  reg           O3_out;
  reg           O4_out;
  time          clk_edge;
  integer       HALF_PERIOD = 1000;
  integer       HALF_PERIOD_NEXT = 1500;
  reg           done;



  assign    I_in = I;
  assign    CLRB_LEAF_in = CLRB_LEAF;

  initial begin
    gwe_sync   = 3'b000;
    O_int_sel  = 1'b0;
    O2_out     = 1'b0;
    O3_out     = 1'b0;
    O4_out     = 1'b0;
    done       = 1'b0;


  end

  always @(posedge I_in) begin
    if(I_in==1'b1)
      gwe_sync <= {gwe_sync[1:0], ~glblGSR};
  end

  assign gwe_muxed_sync = (STARTUP_SYNC_BIN == STARTUP_SYNC_TRUE) ? gwe_sync[2] :  ~glblGSR;

  always @(*) begin
    if(~I_in)
      gwe_latch <= gwe_muxed_sync;
  end

  assign O_bufg_ps = gwe_latch && I_in;

  //MODE="POWER" support
  always @(posedge O_bufg_ps) begin
    if (~done && (MODE_BIN == MODE_POWER)) begin
      if (clk_edge > 0) begin
        HALF_PERIOD_NEXT <= ($time - clk_edge) / 2;
        if (HALF_PERIOD_NEXT == HALF_PERIOD) 
          done <= 1'b1;
      end
      clk_edge <= $time;
    end
  end

  always @(O_bufg_ps) begin
    if (MODE_BIN == MODE_PERFORMANCE) begin
      O_int_sel = O_bufg_ps;
    end else if (O_bufg_ps == 1'b1) begin
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
      O2_out <= 1'b0;
    else
      O2_out <= ~O2_out;
  end
  
  always @(posedge O_int_sel or negedge CLRB_LEAF_in) begin
    if(~CLRB_LEAF_in)
      O3_out <= 1'b0;
    else
      O3_out <= (~O2_out) ^ O3_out;    
  end
 
  always @(posedge O_int_sel or negedge CLRB_LEAF_in) begin
    if(~CLRB_LEAF_in)
      O4_out <= 1'b0;
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
  specify
    (I => O1) = (0:0:0, 0:0:0);
    (I => O2) = (0:0:0, 0:0:0);
    (I => O3) = (0:0:0, 0:0:0);
    (I => O4) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
