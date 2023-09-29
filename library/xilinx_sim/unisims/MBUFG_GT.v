///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        MBUFG_GT
// /___/   /\      Filename    : MBUFG_GT.v
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

module MBUFG_GT #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter MODE = "PERFORMANCE",
  parameter SIM_DEVICE = "VERSAL_AI_CORE",
  parameter STARTUP_SYNC = "TRUE"
)(
  output O1,
  output O2,
  output O3,
  output O4,

  input CE,
  input CEMASK,
  input CLR,
  input CLRB_LEAF,
  input CLRMASK,
  input [2:0] DIV,
  input I
);

// define constants
  localparam MODULE_NAME = "MBUFG_GT";
  
// Parameter encodings and registers
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
  `include "MBUFG_GT_dr.v"
`else
  reg [88:1] MODE_REG = MODE;
  reg [144:1] SIM_DEVICE_REG = SIM_DEVICE;
  reg [40:1] STARTUP_SYNC_REG = STARTUP_SYNC;
`endif

`ifdef XIL_XECLIB
  wire MODE_BIN;
  wire [4:0] SIM_DEVICE_BIN;
  wire STARTUP_SYNC_BIN;
`else
  reg MODE_BIN;
  reg [4:0] SIM_DEVICE_BIN;
  reg STARTUP_SYNC_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CEMASK_in;
  wire CE_in;
  wire CLRB_LEAF_in;
  wire CLRMASK_in;
  wire CLR_in;
  wire I_in;
  wire [2:0] DIV_in;

  assign CEMASK_in = (CEMASK !== 1'bz) && CEMASK; // rv 0
  assign CE_in = (CE === 1'bz) || CE; // rv 1
  assign CLRB_LEAF_in = CLRB_LEAF;
  assign CLRMASK_in = (CLRMASK !== 1'bz) && CLRMASK; // rv 0
  assign CLR_in = (CLR !== 1'bz) && CLR; // rv 0
  assign DIV_in[0] = (DIV[0] !== 1'bz) && DIV[0]; // rv 0
  assign DIV_in[1] = (DIV[1] !== 1'bz) && DIV[1]; // rv 0
  assign DIV_in[2] = (DIV[2] !== 1'bz) && DIV[2]; // rv 0
  assign I_in = I;

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
        ((MODE_REG != "PERFORMANCE") &&
         (MODE_REG != "POWER"))) begin
      $display("Error: [Unisim %s-101] MODE attribute is set to %s.  Legal values for this attribute are PERFORMANCE or POWER. Instance: %m", MODULE_NAME, MODE_REG);
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
      $display("Error: [Unisim %s-102] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME or VERSAL_PRIME_ES1. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_SYNC_REG != "FALSE") &&
         (STARTUP_SYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] STARTUP_SYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_SYNC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  integer   clk_count;
  integer   first_toggle_count;
  integer   second_toggle_count;
  reg       first_rise;
  reg       first_half_period;
  reg       O_bufg_gt;
  reg       O_int_sel;
  reg       O2_out;
  reg       O3_out;
  reg       O4_out;
  wire      ce_masked;
  wire      clr_masked;
  wire      clrmask_inv;
  reg       ce_en;
  reg [2:0] gwe_sync;
  wire      gsr_muxed_sync;
  reg       sim_device_versal_or_later;

  wire I_int;
  time clk_edge;
  integer HALF_PERIOD = 1000;
  integer HALF_PERIOD_NEXT = 1500;
  reg done;

`ifndef XIL_XECLIB
  initial begin
    clk_count=1;
    first_toggle_count=1;
    second_toggle_count=1;
    first_rise = 1'b0;
    first_half_period = 1'b0;
    O_bufg_gt = 1'b0;
    O_int_sel = 1'b0;
    O2_out     = 1'b0;
    O3_out     = 1'b0;
    O4_out     = 1'b0;
    ce_en = 1'b0;
    clk_edge = 0;
    done = 1'b0;
    gwe_sync   = 3'b000;
    sim_device_versal_or_later = 1'b0;
  end
`endif

  always @ (trig_attr) begin
    #1;
    if ((SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_CORE      ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_CORE_ES1  ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_EDGE      ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_EDGE_ES1  ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_EDGE_ES2  ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_RF        ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_RF_ES1    ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_AI_RF_ES2    ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_HBM          ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_HBM_ES1      ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_HBM_ES2      ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_PREMIUM      ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_PREMIUM_ES1  ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_PREMIUM_ES2  ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_PRIME        ) ||
        (SIM_DEVICE_BIN == SIM_DEVICE_VERSAL_PRIME_ES1    ))
      sim_device_versal_or_later <= 1'b1;
    else 
      sim_device_versal_or_later <= 1'b0;
  end //always

  always @(posedge I_in) begin
    if(I_in==1'b1)
      gwe_sync <= {gwe_sync[1:0], ~glblGSR};
  end

  assign gsr_muxed_sync = (STARTUP_SYNC_BIN == STARTUP_SYNC_TRUE) ? ~gwe_sync[2] :  glblGSR;

  always@(DIV_in) begin
    case (DIV_in)
      3'b000 : begin
                 first_toggle_count = 1;
                 second_toggle_count = 1;
               end
      3'b001 : begin
                 first_toggle_count = 2;
                 second_toggle_count = 2;
               end
      3'b010 : begin
                 first_toggle_count = 2;
                 second_toggle_count = 4;
               end
      3'b011 : begin
                 first_toggle_count = 4;
                 second_toggle_count = 4;
               end
      3'b100 : begin
                 first_toggle_count = 4;
                 second_toggle_count = 6;
               end
      3'b101 : begin
                 first_toggle_count = 6;
                 second_toggle_count = 6;
               end
      3'b110 : begin
                 first_toggle_count = 6;
                 second_toggle_count = 8;
               end
      3'b111 : begin
                 first_toggle_count = 8;
                 second_toggle_count = 8;
               end
    endcase // case(BUFG_GT)

  end 

  always begin
    if (gsr_muxed_sync == 1'b1) begin
      assign O_bufg_gt = 1'b0;
      assign clk_count = 0;
      assign first_rise = 1'b1;
      assign first_half_period = 1'b0;
    end
    else if (gsr_muxed_sync == 1'b0) begin
      deassign O_bufg_gt;
      deassign clk_count;
      deassign first_rise;
      deassign first_half_period;
    end
    @(gsr_muxed_sync);
  end


  assign clrmask_inv = ~CLRMASK_in;
  assign ce_masked = CE_in | CEMASK_in;
  assign clr_masked = CLR_in & clrmask_inv;

  always @(I_in, gsr_muxed_sync, ce_masked, clr_masked)
  begin
    if (gsr_muxed_sync || clr_masked)
      ce_en <= 1'b0;
    else if (~I_in)
      ce_en <= ce_masked;
  end

  assign i_ce = I_in & ce_en;

  always @(i_ce or posedge gsr_muxed_sync or posedge clr_masked) begin
    if (first_toggle_count == 1) begin
      O_bufg_gt = i_ce;
    end
    else begin
      if(clr_masked == 1'b1 || gsr_muxed_sync == 1'b1) begin
        O_bufg_gt = 1'b0;
        clk_count = 1;
        first_half_period = 1'b1;
        first_rise = 1'b1;
      end
      else if(clr_masked == 1'b0 && gsr_muxed_sync == 1'b0) begin
        if (i_ce == 1'b1 && first_rise == 1'b1) begin
          O_bufg_gt = 1'b1;
          clk_count = 1;
          first_half_period = 1'b1;
          first_rise = 1'b0;
        end
        else if (clk_count == second_toggle_count && first_half_period == 1'b0) begin
          O_bufg_gt = ~O_bufg_gt;
          clk_count = 1;
          first_half_period = 1'b1;
        end
        else if (clk_count == first_toggle_count && first_half_period == 1'b1) begin
          O_bufg_gt = ~O_bufg_gt;
          clk_count = 1;
          first_half_period = 1'b0;
        end
        else if (first_rise == 1'b0) begin
          clk_count = clk_count + 1;
        end
      end
    end
  end


  //MODE="POWER" support
  always @(posedge O_bufg_gt) begin
    if (~done && (MODE_BIN == MODE_POWER)) begin
      if (clk_edge > 0) begin
        HALF_PERIOD_NEXT <= ($time - clk_edge) / 2;
        if (HALF_PERIOD_NEXT == HALF_PERIOD) 
          done <= 1'b1;
      end
      clk_edge <= $time;
    end
  end

  always @(O_bufg_gt) begin
    if (MODE_BIN == MODE_PERFORMANCE) begin
      O_int_sel = O_bufg_gt;
    end else if (O_bufg_gt == 1'b1) begin
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
    $width (negedge CLR, 0:0:0, 0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge CLR, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif

endmodule

`endcelldefine
