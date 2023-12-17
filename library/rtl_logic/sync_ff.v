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
// 	2 steps delay sync;
// 	3 steps delay sync;
//
//	Date: 12072022
//	Version: v1.1
//
// 	Initial value can be defined.
// 	Enable control for 1 step delay.
//
//===============================================

//===============================================
// Sync singal module with one step
//===============================================

module sync_ff
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		Y <= DEFAULT_VAL;
	else
		Y <= A;
end

endmodule

module sync_ff_en
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 									en,
	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		Y <= DEFAULT_VAL;
	else if(en)
		Y <= A;
	else
		Y <= Y;
end

endmodule

//===============================================
// Sync singal module with two steps
//===============================================

module sync_ff_2d
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

reg 			[WIDTH-1:0]					A_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		A_d <= DEFAULT_VAL;
		Y <= DEFAULT_VAL;
	end
	else
	begin
		A_d <= A;
		Y <= A_d;
	end
end

endmodule

module sync_ff_2d_en
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 									en,
	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

reg 			[WIDTH-1:0]					A_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		A_d <= DEFAULT_VAL;
		Y <= DEFAULT_VAL;
	end
	else if(en)
	begin
		A_d <= A;
		Y <= A_d;
	end
	else
	begin
		A_d <= A_d;
		Y <= Y;
	end
end

endmodule

//===============================================
// Sync singal module with three steps
//===============================================

module sync_ff_3d
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

reg 			[WIDTH-1:0]					A_d;
reg 			[WIDTH-1:0]					A_2d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		A_d <= DEFAULT_VAL;
		A_2d <= DEFAULT_VAL;
		Y <= DEFAULT_VAL;
	end
	else
	begin
		A_d <= A;
		A_2d <= A_d;
		Y <= A_2d;
	end
end

endmodule

module sync_ff_3d_en
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									clk,
	input									rstn,

	input 									en,
	input 		[WIDTH-1:0]					A,
	output reg 	[WIDTH-1:0]					Y
);

reg 			[WIDTH-1:0]					A_d;
reg 			[WIDTH-1:0]					A_2d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		A_d <= DEFAULT_VAL;
		A_2d <= DEFAULT_VAL;
		Y <= DEFAULT_VAL;
	end
	else if(en)
	begin
		A_d <= A;
		A_2d <= A_d;
		Y <= A_2d;
	end
	else
	begin
		A_d <= A_d;
		A_2d <= A_2d;
		Y <= Y;
	end
end

endmodule

