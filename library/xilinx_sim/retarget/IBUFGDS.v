// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /                  Differential Signaling Input Clock Buffer
// /___/   /\     Filename : IBUFGDS.v
// \   \  /  \    
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    07/26/07 - Add else to handle x case for o_out (CR 424214).
//    07/16/08 - Added IBUF_LOW_PWR attribute.
//    03/19/09 - CR 511590 - Added Z condition handling.
//    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/30/12 - 669140 - retarget to IBUF variant
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module IBUFGDS (O, I, IB);

    parameter CAPACITANCE = "DONT_CARE";   
    parameter DIFF_TERM = "FALSE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O;
    input  I, IB;

    wire O;

    IBUFDS # (
        .DQS_BIAS ("FALSE"),
        .CAPACITANCE(CAPACITANCE),
        .DIFF_TERM(DIFF_TERM),
        .IBUF_DELAY_VALUE(IBUF_DELAY_VALUE),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IFD_DELAY_VALUE("AUTO"),
        .IOSTANDARD(IOSTANDARD)
) B1 (
        .O (O),
        .I (I),
        .IB (IB)
);

endmodule

`endcelldefine
