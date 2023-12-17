//===============================================
//
//	File: interrupt_gen.v
//	Author: afterGlow,4ever
//	Date: 12102023
//	Version: v1.0
//
// 	This lib is used to handle and generate interrupt.
//
//===============================================

//===============================================
// interrupt generation
//===============================================

module interrupt_gen
#(
	parameter								WIDTH = 31
)
(
	input									clk,
	input									rstn,

	input 		[WIDTH-1:0]					int_en,
	input 		[WIDTH-1:0]					int_tgr,
	input 		[WIDTH-1:0]					int_clr,
	output 		[WIDTH-1:0]					int_sta,
	output  	[WIDTH-1:0]					int_line
);

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin: INT_GEN
		interrupt_bit_gen u_int_bit_gen
		(
			.clk							(clk),
			.rstn							(rstn),

			.int_en							(int_en[i]),
			.int_tgr						(int_tgr[i]),
			.int_clr						(int_clr[i]),
			.int_sta						(int_sta[i]),
			.int_line						(int_line[i])
		);
	end
endgenerate

endmodule

module interrupt_bit_gen
(
	input									clk,
	input									rstn,

	input 									int_en,
	input 									int_tgr,
	input 									int_clr,
	output reg								int_sta,
	output  								int_line
);

//always @(posedge clk or negedge rstn)
//begin
//	if(!rstn)
//		int_sta <= 1'b0;
//	else
//		int_sta <= int_tgr;
//end

//always @(posedge clk or negedge rstn)
//begin
//	if(!rstn)
//		int <= 1'b0;
//	else if((int == 1'b0) && (int_en == 1'b1))
//		int <= int_tgr;
//	else if((int == 1'b1) && (int_clr == 1'b1))
//		int <= 1'b0;
//	else
//		int <= int;
//end

assign int_line = int_sta && int_en;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		int_sta <= 1'b0;
	else if(int_sta == 1'b0)
		int_sta <= int_tgr;
	else if((int_sta == 1'b1) && (int_clr == 1'b1))
		int_sta <= 1'b0;
	else
		int_sta <= int_sta;
end

endmodule

