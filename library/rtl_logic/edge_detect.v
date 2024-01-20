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
//	Date: 01012024
//	Version: v1.1
//
// 	Supoort multiple bit.
// 	
//===============================================

//===============================================
// Positive edge detect module
//===============================================

module posedge_detect
#(
	parameter						WIDTH = 1
)
(
	input							clk,
	input							rstn,

	input 		[WIDTH-1:0]			A,
	output  	[WIDTH-1:0]			Y
);

reg				[WIDTH-1:0]			A_d;

genvar								i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin: EDGE_DET
		assign Y[i] = A[i] & ~A_d[i];
	end
endgenerate

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= {WIDTH{1'b0}};
	else
		A_d <= A;
end

endmodule

//===============================================
// Negative edge detect module
//===============================================

module negedge_detect
#(
	parameter						WIDTH = 1
)
(
	input							clk,
	input							rstn,

	input 		[WIDTH-1:0]			A,
	output  	[WIDTH-1:0]			Y
);

reg				[WIDTH-1:0]			A_d;

genvar								i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin: EDGE_DET
		assign Y[i] = ~A[i] & A_d[i];
	end
endgenerate

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= {WIDTH{1'b0}};
	else
		A_d <= A;
end

endmodule

//===============================================
// Both edge detect module
//===============================================

module edge_detect
#(
	parameter						WIDTH = 1
)
(
	input							clk,
	input							rstn,

	input 		[WIDTH-1:0]			A,
	output  	[WIDTH-1:0]			Y
);

reg				[WIDTH-1:0]			A_d;

genvar								i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin: EDGE_DET
		assign Y[i] = A[i] ^ A_d[i];
	end
endgenerate

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		A_d <= {WIDTH{1'b0}};
	else
		A_d <= A;
end

endmodule

