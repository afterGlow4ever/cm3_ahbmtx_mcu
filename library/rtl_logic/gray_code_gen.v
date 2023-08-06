//===============================================
//
//	File: gray_code_gen.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This lib is used to transform between gray code
// 	and binary code.
// 	
//===============================================

module gray_code_gen
#(
	parameter								DIR,
	parameter								DATA_WIDTH
)
(
	input [DATA_WIDTH:0]		bin_code,
	input [DATA_WIDTH:0]		gray_code,
	output [DATA_WIDTH:0]		q
);

// Dir = 1, bin to gray
// Dir = 0, gray to bin
assign q = DIR ? B2G(bin_code) : G2B(gray_code);

function [DATA_WIDTH:0] B2G;
input	[DATA_WIDTH:0] B;
	B2G = B ^ (B >> 1);
endfunction

function [DATA_WIDTH:0] G2B;
input	[DATA_WIDTH:0] G;
integer										i;
	for(i = 0; i <= DATA_WIDTH; i = i + 1)
		G2B[i] = ^ (G >> i);
endfunction

endmodule

