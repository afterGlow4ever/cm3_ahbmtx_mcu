//===============================================
//
//	File: edeg_detect.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This lib is used to detect level edge including:
// 	Positive edge detect;
// 	Negative edge detect;
// 	Both edge detect.
// 	
//===============================================

//===============================================
// Positive edge detect module
//===============================================
module posedge_detect
(
	input							clk,
	input							rstn,

	input							A,
	output						Y
);

reg									A_d;

assign Y = A & ~A_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= 1'd0;
	else
		A_d <= A;
end

endmodule

//===============================================
// Negative edge detect module
//===============================================
module negedge_detect
(
	input							clk,
	input							rstn,

	input							A,
	output						Y
);

reg									A_d;

assign Y = ~A & A_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= 1'd0;
	else
		A_d <= A;
end

endmodule

module edge_detect
(
	input							clk,
	input							rstn,

	input							A,
	output						Y
);

reg									A_d;

assign Y = A ^ A_d;

//===============================================
// Both edge detect module
//===============================================
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= 1'd0;
	else
		A_d <= A;
end

endmodule



