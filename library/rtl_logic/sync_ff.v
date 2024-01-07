//===============================================
//
//	File: sync_ff.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This lib is used to synchrounize any async
// 	singal with steps delay including:
// 	1 step delay sync;
// 	Simple 2 port RAM(tp);
// 	True 2 port RAM(dp).
// 	
//===============================================

//===============================================
// Sync singal module with one step
//===============================================
module sync_ff
#(
	parameter								WIDTH
)
(
	input										clk,
	input										rstn,

	input [WIDTH-1:0]				A,
	output reg [WIDTH-1:0]	Y
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		Y <= 'b0;
	else
		Y <= A;
end

endmodule

//===============================================
// Sync singal module with two steps
//===============================================
module sync_ff_2d
#(
	parameter								WIDTH
)
(
	input										clk,
	input										rstn,

	input [WIDTH-1:0]				A,
	output reg [WIDTH-1:0]	Y
);

reg [WIDTH-1:0]						A_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= 'b0;
	else
		A_d <= A;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		Y <= 'b0;
	else
		Y <= A_d;
end

endmodule

//===============================================
// Sync singal module with three steps
//===============================================
module sync_ff_3d
#(
	parameter								WIDTH
)
(
	input										clk,
	input										rstn,

	input [WIDTH-1:0]				A,
	output reg [WIDTH-1:0]	Y
);

reg [WIDTH-1:0]						A_d;
reg [WIDTH-1:0]						A_2d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= 'b0;
	else
		A_d <= A;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_2d <= 'b0;
	else
		A_2d <= A_d;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		Y <= 'b0;
	else
		Y <= A_2d;
end

endmodule

