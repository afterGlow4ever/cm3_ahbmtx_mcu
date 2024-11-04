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

module gray_to_bin_gen
#(
	parameter					DATA_WIDTH = 8
)
(
	input [DATA_WIDTH:0]		gray_code,
	output reg [DATA_WIDTH:0]	bin_code
);

integer							i;

always @(*)
begin
	for(i = 0; i <= DATA_WIDTH; i = i + 1)
	begin
		bin_code[i] = ^ (gray_code >> i);
	end
end

endmodule

module bin_to_gray_gen
#(
	parameter					DATA_WIDTH = 8
)
(
	input [DATA_WIDTH:0]		bin_code,
	output [DATA_WIDTH:0]		gray_code
);

assign gray_code = bin_code ^ (bin_code >> 1);

endmodule



