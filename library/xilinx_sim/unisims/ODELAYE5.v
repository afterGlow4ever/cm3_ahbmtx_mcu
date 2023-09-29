///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Output Fixed or Variable Delay Element
// /___/   /\      Filename    : ODELAYE5.v
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

module ODELAYE5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CASCADE = "FALSE",
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0
)(
  output [4:0] CNTVALUEOUT,
  output DATAOUT,
  output TDATAOUT,

  input CASC_IN,
  input CE,
  input CLK,
  input [4:0] CNTVALUEIN,
  input INC,
  input LOAD,
  input ODATAIN,
  input RST,
  input TDATAIN
);

// define constants
  localparam MODULE_NAME = "ODELAYE5";
  
// Parameter encodings and registers
  localparam CASCADE_FALSE = 0;
  localparam CASCADE_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "ODELAYE5_dr.v"
`else
  reg [40:1] CASCADE_REG = CASCADE;
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
`endif

`ifdef XIL_XECLIB
  wire CASCADE_BIN;
`else
  reg CASCADE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CASC_IN_in;
  wire CE_in;
  wire CLK_in;
  wire INC_in;
  wire LOAD_in;
  wire ODATAIN_in;
  wire RST_in;
  wire TDATAIN_in;
  wire [4:0] CNTVALUEIN_in;

`ifdef XIL_TIMING
  wire CE_delay;
  wire CLK_delay;
  wire INC_delay;
  wire LOAD_delay;
  wire RST_delay;
  wire [4:0] CNTVALUEIN_delay;
`endif

`ifdef XIL_TIMING
  assign CE_in = CE_delay;
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_REG;
  assign CNTVALUEIN_in[0] = (CNTVALUEIN[0] === 1'bz) || CNTVALUEIN_delay[0]; // rv 1
  assign CNTVALUEIN_in[1] = (CNTVALUEIN[1] === 1'bz) || CNTVALUEIN_delay[1]; // rv 1
  assign CNTVALUEIN_in[2] = (CNTVALUEIN[2] === 1'bz) || CNTVALUEIN_delay[2]; // rv 1
  assign CNTVALUEIN_in[3] = (CNTVALUEIN[3] === 1'bz) || CNTVALUEIN_delay[3]; // rv 1
  assign CNTVALUEIN_in[4] = (CNTVALUEIN[4] === 1'bz) || CNTVALUEIN_delay[4]; // rv 1
  assign INC_in = INC_delay;
  assign LOAD_in = LOAD_delay;
  assign RST_in = RST_delay ^ IS_RST_INVERTED_REG;
`else
  assign CE_in = CE;
  assign CLK_in = CLK ^ IS_CLK_INVERTED_REG;
  assign CNTVALUEIN_in[0] = (CNTVALUEIN[0] === 1'bz) || CNTVALUEIN[0]; // rv 1
  assign CNTVALUEIN_in[1] = (CNTVALUEIN[1] === 1'bz) || CNTVALUEIN[1]; // rv 1
  assign CNTVALUEIN_in[2] = (CNTVALUEIN[2] === 1'bz) || CNTVALUEIN[2]; // rv 1
  assign CNTVALUEIN_in[3] = (CNTVALUEIN[3] === 1'bz) || CNTVALUEIN[3]; // rv 1
  assign CNTVALUEIN_in[4] = (CNTVALUEIN[4] === 1'bz) || CNTVALUEIN[4]; // rv 1
  assign INC_in = INC;
  assign LOAD_in = LOAD;
  assign RST_in = RST ^ IS_RST_INVERTED_REG;
`endif

  assign CASC_IN_in = CASC_IN;
  assign ODATAIN_in = ODATAIN;
  assign TDATAIN_in = TDATAIN;

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
  assign CASCADE_BIN =
      (CASCADE_REG == "FALSE") ? CASCADE_FALSE :
      (CASCADE_REG == "TRUE") ? CASCADE_TRUE :
       CASCADE_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  CASCADE_BIN =
      (CASCADE_REG == "FALSE") ? CASCADE_FALSE :
      (CASCADE_REG == "TRUE") ? CASCADE_TRUE :
       CASCADE_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CASCADE_REG != "FALSE") &&
         (CASCADE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] CASCADE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam MAX_DELAY_COUNT = 31; 
  localparam MIN_DELAY_COUNT = 0;

  integer PER_BIT_DELAY;
  integer ODATAIN_INTRINSIC_DELAY;
  integer TDATAIN_INTRINSIC_DELAY;
  integer CASC_IN_INTRINSIC_DELAY;
  integer DATA_OUT_INTRINSIC_DELAY;
  integer TDATAOUT_INTRINSIC_DELAY;

  reg DATAOUT_out;
  reg TDATAOUT_out;
  reg [4:0] CNTVALUEOUT_out;

  reg [17:0] gen_mc_fixed_dly_ratio;
  reg tap_out;
  reg data_mux;
  reg data_mux_tdatain;
  reg data_mux_sync;
  reg data_mux_sync1;
  reg data_mux_sync2;
  reg data_mux_sync3;
  reg data_mux_sync4;
  reg data_mux_sync_tdata;
  reg data_mux_sync1_tdata;
  reg data_mux_sync2_tdata;
  reg data_mux_sync3_tdata;
  reg data_mux_sync4_tdata;
  reg [4:0] idelay_count_async;
  reg [4:0] cntvalue_updated;
  reg [4:0] cntvalue_updated_tdataout;
  reg [4:0] cntvalue_updated_sync;
  reg [4:0] cntvalue_updated_sync_tdataout;
  reg [4:0] cntvalue_updated_async;
  reg [4:0] idelay_count_pre;
  time delay_value;
  time delay_value_tdataout;

  initial begin
    PER_BIT_DELAY = 90;
    TDATAIN_INTRINSIC_DELAY = 30;
    ODATAIN_INTRINSIC_DELAY = 30;
    CASC_IN_INTRINSIC_DELAY = 30;
    DATA_OUT_INTRINSIC_DELAY = 90;
    TDATAOUT_INTRINSIC_DELAY = 90;
    CNTVALUEOUT_out = 5'b0;
    DATAOUT_out = 1'b0;
    TDATAOUT_out = 1'b0;
  end

  assign CNTVALUEOUT = CNTVALUEOUT_out;
  assign DATAOUT = DATAOUT_out;
  assign TDATAOUT = TDATAOUT_out;

  always @ (trig_attr) begin
    #1;
    idelay_count_pre = 0;
    cntvalue_updated = 0;
    cntvalue_updated_tdataout = 0;
  end

//----------------------------------------------------------------------
//-------------------------------  Output ------------------------------
//----------------------------------------------------------------------
  always @(tap_out) begin
    DATAOUT_out <= #(DATA_OUT_INTRINSIC_DELAY) tap_out;
  end

//----------------------------------------------------------------------
//-------------------------------  Input -------------------------------
//----------------------------------------------------------------------

//*** GLOBAL hidden GSR pin
  always @(glblGSR or RST_in) begin
    if (glblGSR == 1'b1 || RST_in == 1'b1) begin
//      assign idelay_count_sync = idelay_count_pre;
      assign idelay_count_async = idelay_count_pre;
      assign cntvalue_updated_sync = idelay_count_pre;
      assign cntvalue_updated_sync_tdataout = idelay_count_pre;
      assign cntvalue_updated_async = idelay_count_pre;
    end else if (glblGSR == 1'b0 || RST_in == 1'b0) begin
//      deassign idelay_count_sync;
      deassign idelay_count_async;
      deassign cntvalue_updated_sync;
      deassign cntvalue_updated_async;
      deassign cntvalue_updated_sync_tdataout;
    end
  end   

//----------------------------------------------------------------------
//------------------------      CNTVALUEOUT        ---------------------
//----------------------------------------------------------------------
  always @(*) begin
    CNTVALUEOUT_out = idelay_count_async;
    cntvalue_updated = cntvalue_updated_sync;
    cntvalue_updated_tdataout = cntvalue_updated_sync_tdataout;
  end

//----------------------------------------------------------------------
//--------------------------  DELAY_COUNT  ----------------------------
//----------------------------------------------------------------------
  always @(posedge CLK_in) begin
    if (RST_in == 1'b0) begin
      casex({LOAD_in, CE_in, INC_in})
        3'b000: ; //Do nothing.
        3'b001: ; //Do nothing.
        3'b010: begin //  CE DEC
                  if (idelay_count_async >  MIN_DELAY_COUNT) begin
                    idelay_count_async <= idelay_count_async-1;
                    cntvalue_updated_async <= idelay_count_async-1;
                  end else if (idelay_count_async <= MIN_DELAY_COUNT) begin
                    idelay_count_async <= MAX_DELAY_COUNT;
                    cntvalue_updated_async <= MAX_DELAY_COUNT;
                  end
                end
        3'b011: begin // CE INC
                  if (idelay_count_async < MAX_DELAY_COUNT) begin
                    idelay_count_async <= idelay_count_async + 1;
                    cntvalue_updated_async <= idelay_count_async + 1;
                  end else if (idelay_count_async >= MAX_DELAY_COUNT) begin
                    idelay_count_async <= MIN_DELAY_COUNT;
                    cntvalue_updated_async <= MIN_DELAY_COUNT;
                  end    
                end
           3'b100, 3'b101:
                begin // LOAD ~CE
                  idelay_count_async <= CNTVALUEIN_in;
                  cntvalue_updated_async <= CNTVALUEIN_in;
                end
           3'b110: 
               $display("Error: [Unisim %s-2] Invalid scenario. LOAD = 1, CE = 1 INC = 0 is not valid. Instance: %m", MODULE_NAME);
           3'b111: 
               $display("Error: [Unisim %s-3] Invalid scenario. LOAD = 1, CE = 1 INC = 1 is not valid. Instance: %m", MODULE_NAME);
           default: $display("Error: [Unisim %s-4] Invalid scenario. LOAD = %b, CE = %b INC = %b. Instance: %m", MODULE_NAME, LOAD_in, CE_in, INC_in);
      endcase
    end
  end

  always @(data_mux) begin
    data_mux_sync = data_mux_sync4;
    data_mux_sync4 = data_mux_sync3;
    data_mux_sync3 = data_mux_sync2;
    data_mux_sync2 = data_mux_sync1;
    data_mux_sync1 = data_mux;
  end

  always @(data_mux_sync) begin
    cntvalue_updated_sync = cntvalue_updated_async;
  end

  always @(data_mux_tdatain) begin
    data_mux_sync_tdata = data_mux_sync4_tdata;
    data_mux_sync4_tdata = data_mux_sync3_tdata;
    data_mux_sync3_tdata = data_mux_sync2_tdata;
    data_mux_sync2_tdata = data_mux_sync1_tdata;
    data_mux_sync1_tdata = data_mux_tdatain;
  end

  always @(data_mux_sync_tdata) begin
    cntvalue_updated_sync_tdataout = cntvalue_updated_async;
  end


//*********************************************************
//*** SELECT IDATA signal
//*********************************************************

  always @(*) begin
    if (CASCADE_BIN == CASCADE_TRUE) begin
      data_mux = CASC_IN_in;
    end else begin
      data_mux = ODATAIN_in;
    end
  end

  always @ (*) begin
    data_mux_tdatain = TDATAIN_in;
  end

  always @ (cntvalue_updated or data_mux or CASC_IN_in) begin
    delay_value = (cntvalue_updated*PER_BIT_DELAY);
    case (CASCADE_REG)
      "FALSE"  : begin
                 delay_value = delay_value + ODATAIN_INTRINSIC_DELAY;
                 end
       "TRUE"  : begin
                 delay_value = delay_value + CASC_IN_INTRINSIC_DELAY;
                 end
       default : begin
                 $display("Error: [Unisim %s-8] The attribute CASCADE is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, CASCADE_REG);
                 $finish;
                 end
    endcase 
  end
  
 always @ (cntvalue_updated_tdataout or data_mux_tdatain) begin
    delay_value_tdataout = (cntvalue_updated_tdataout*PER_BIT_DELAY) + TDATAIN_INTRINSIC_DELAY + TDATAOUT_INTRINSIC_DELAY;
 end

 always @ (*) begin
   tap_out <= #delay_value data_mux;
 end
 
 always @ (*) begin
    TDATAOUT_out <= #delay_value_tdataout data_mux_tdatain;
 end


// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  
  wire clk_en_n;
  wire clk_en_p;
  
  assign clk_en_n =  IS_CLK_INVERTED_REG;
  assign clk_en_p = ~IS_CLK_INVERTED_REG;

`endif

  specify
    (CASC_IN => DATAOUT) = (0:0:0, 0:0:0);
    (CLK => CNTVALUEOUT[0]) = (100:100:100, 100:100:100);
    (CLK => CNTVALUEOUT[1]) = (100:100:100, 100:100:100);
    (CLK => CNTVALUEOUT[2]) = (100:100:100, 100:100:100);
    (CLK => CNTVALUEOUT[3]) = (100:100:100, 100:100:100);
    (CLK => CNTVALUEOUT[4]) = (100:100:100, 100:100:100);
    (ODATAIN => DATAOUT) = (0:0:0, 0:0:0);
    (TDATAIN => TDATAOUT) = (0:0:0, 0:0:0);
    (negedge RST => (CNTVALUEOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CNTVALUEOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CNTVALUEOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CNTVALUEOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (CNTVALUEOUT[4] +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CNTVALUEOUT[0] +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CNTVALUEOUT[1] +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CNTVALUEOUT[2] +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CNTVALUEOUT[3] +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (CNTVALUEOUT[4] +: 0)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $recrem (negedge RST, negedge CLK, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, RST_delay, CLK_delay);
    $recrem (negedge RST, posedge CLK, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, RST_delay, CLK_delay);
    $recrem (posedge RST, negedge CLK, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, RST_delay, CLK_delay);
    $recrem (posedge RST, posedge CLK, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, RST_delay, CLK_delay);
    $setuphold (negedge CLK, negedge CE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CE_delay);
    $setuphold (negedge CLK, negedge CNTVALUEIN[0], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[0]);
    $setuphold (negedge CLK, negedge CNTVALUEIN[1], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[1]);
    $setuphold (negedge CLK, negedge CNTVALUEIN[2], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[2]);
    $setuphold (negedge CLK, negedge CNTVALUEIN[3], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[3]);
    $setuphold (negedge CLK, negedge CNTVALUEIN[4], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[4]);
    $setuphold (negedge CLK, negedge INC, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, INC_delay);
    $setuphold (negedge CLK, negedge LOAD, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, LOAD_delay);
    $setuphold (negedge CLK, posedge CE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CE_delay);
    $setuphold (negedge CLK, posedge CNTVALUEIN[0], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[0]);
    $setuphold (negedge CLK, posedge CNTVALUEIN[1], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[1]);
    $setuphold (negedge CLK, posedge CNTVALUEIN[2], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[2]);
    $setuphold (negedge CLK, posedge CNTVALUEIN[3], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[3]);
    $setuphold (negedge CLK, posedge CNTVALUEIN[4], 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CNTVALUEIN_delay[4]);
    $setuphold (negedge CLK, posedge INC, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, INC_delay);
    $setuphold (negedge CLK, posedge LOAD, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, LOAD_delay);
    $setuphold (posedge CLK, negedge CE, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CE_delay);
    $setuphold (posedge CLK, negedge CNTVALUEIN[0], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[0]);
    $setuphold (posedge CLK, negedge CNTVALUEIN[1], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[1]);
    $setuphold (posedge CLK, negedge CNTVALUEIN[2], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[2]);
    $setuphold (posedge CLK, negedge CNTVALUEIN[3], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[3]);
    $setuphold (posedge CLK, negedge CNTVALUEIN[4], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[4]);
    $setuphold (posedge CLK, negedge INC, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, INC_delay);
    $setuphold (posedge CLK, negedge LOAD, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, LOAD_delay);
    $setuphold (posedge CLK, posedge CE, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CE_delay);
    $setuphold (posedge CLK, posedge CNTVALUEIN[0], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[0]);
    $setuphold (posedge CLK, posedge CNTVALUEIN[1], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[1]);
    $setuphold (posedge CLK, posedge CNTVALUEIN[2], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[2]);
    $setuphold (posedge CLK, posedge CNTVALUEIN[3], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[3]);
    $setuphold (posedge CLK, posedge CNTVALUEIN[4], 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CNTVALUEIN_delay[4]);
    $setuphold (posedge CLK, posedge INC, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, INC_delay);
    $setuphold (posedge CLK, posedge LOAD, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, LOAD_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
