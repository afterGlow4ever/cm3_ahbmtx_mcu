//===============================================
//
//	File: crc.v
//	Author: afterGlow,4ever
//	Date: 08072024
//	Version: v1.0
//
// 	This lib is used to calculate crc.
// 	Generated from crctools web.    
//
//===============================================

//===============================================
// CRC32D4
// polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + 
// x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
// input reverse & output reverse
//===============================================

module crc32d4
(
	input									clk,
	input									rstn,

    input 			[ 3:0] 					data,
	input									clr,
	input									en,
    output  		[31:0]					newcrc_result
);

wire				[31:0]					c;
wire				[ 3:0]					d;
reg					[31:0]					crc;
wire				[31:0]					newcrc;
assign c = crc;

genvar										i;

generate
	for(i = 0; i < 4; i = i + 1)
	begin: crc_input_swap
		assign d[i] = en ? data[3 - i] : 1'b0; 
	end
endgenerate


assign newcrc[0] = d[0] ^ c[28];
assign newcrc[1] = d[1] ^ d[0] ^ c[28] ^ c[29];
assign newcrc[2] = d[2] ^ d[1] ^ d[0] ^ c[28] ^ c[29] ^ c[30];
assign newcrc[3] = d[3] ^ d[2] ^ d[1] ^ c[29] ^ c[30] ^ c[31];
assign newcrc[4] = d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[28] ^ c[30] ^ c[31];
assign newcrc[5] = d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[28] ^ c[29] ^ c[31];
assign newcrc[6] = d[2] ^ d[1] ^ c[2] ^ c[29] ^ c[30];
assign newcrc[7] = d[3] ^ d[2] ^ d[0] ^ c[3] ^ c[28] ^ c[30] ^ c[31];
assign newcrc[8] = d[3] ^ d[1] ^ d[0] ^ c[4] ^ c[28] ^ c[29] ^ c[31];
assign newcrc[9] = d[2] ^ d[1] ^ c[5] ^ c[29] ^ c[30];
assign newcrc[10] = d[3] ^ d[2] ^ d[0] ^ c[6] ^ c[28] ^ c[30] ^ c[31];
assign newcrc[11] = d[3] ^ d[1] ^ d[0] ^ c[7] ^ c[28] ^ c[29] ^ c[31];
assign newcrc[12] = d[2] ^ d[1] ^ d[0] ^ c[8] ^ c[28] ^ c[29] ^ c[30];
assign newcrc[13] = d[3] ^ d[2] ^ d[1] ^ c[9] ^ c[29] ^ c[30] ^ c[31];
assign newcrc[14] = d[3] ^ d[2] ^ c[10] ^ c[30] ^ c[31];
assign newcrc[15] = d[3] ^ c[11] ^ c[31];
assign newcrc[16] = d[0] ^ c[12] ^ c[28];
assign newcrc[17] = d[1] ^ c[13] ^ c[29];
assign newcrc[18] = d[2] ^ c[14] ^ c[30];
assign newcrc[19] = d[3] ^ c[15] ^ c[31];
assign newcrc[20] = c[16];
assign newcrc[21] = c[17];
assign newcrc[22] = d[0] ^ c[18] ^ c[28];
assign newcrc[23] = d[1] ^ d[0] ^ c[19] ^ c[28] ^ c[29];
assign newcrc[24] = d[2] ^ d[1] ^ c[20] ^ c[29] ^ c[30];
assign newcrc[25] = d[3] ^ d[2] ^ c[21] ^ c[30] ^ c[31];
assign newcrc[26] = d[3] ^ d[0] ^ c[22] ^ c[28] ^ c[31];
assign newcrc[27] = d[1] ^ c[23] ^ c[29];
assign newcrc[28] = d[2] ^ c[24] ^ c[30];
assign newcrc[29] = d[3] ^ c[25] ^ c[31];
assign newcrc[30] = c[26];
assign newcrc[31] = c[27];

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		crc <= 32'hffff_ffff;
	else if(clr)
		crc <= 32'hffff_ffff;
	else if(en)
		crc <= newcrc;
	else
		crc <= crc;
end

genvar										j;

generate
	for(j = 0; j < 32; j = j + 1)
	begin: crc_output_swap
		assign newcrc_result[j] = ~crc[31 - j]; 
	end
endgenerate

endmodule

//===============================================
// CRC32D8
// polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + 
// x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
// input reverse & output reverse
//===============================================

module crc32d8
(
	input									clk,
	input									rstn,

    input 			[ 7:0] 					data,
	input									clr,
	input									en,
    output  		[31:0]					newcrc_result
);

wire				[31:0]					c;
wire				[ 7:0]					d;
reg					[31:0]					crc;
wire				[31:0]					newcrc;
assign c = crc;

genvar										i;

generate
	for(i = 0; i < 8; i = i + 1)
	begin: crc_input_swap
		assign d[i] = en ? data[7 - i] : 1'b0; 
	end
endgenerate

assign newcrc[ 0] = d[6] ^ d[0] ^ c[24] ^ c[30];
assign newcrc[ 1] = d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[24] ^ c[25] ^ c[30] ^ c[31];
assign newcrc[ 2] = d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[24] ^ c[25] ^ c[26] ^ c[30] ^ c[31];
assign newcrc[ 3] = d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[25] ^ c[26] ^ c[27] ^ c[31];
assign newcrc[ 4] = d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[30];
assign newcrc[ 5] = d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[24] ^ c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
assign newcrc[ 6] = d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
assign newcrc[ 7] = d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
assign newcrc[ 8] = d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[24] ^ c[25] ^ c[27] ^ c[28];
assign newcrc[ 9] = d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[25] ^ c[26] ^ c[28] ^ c[29];
assign newcrc[10] = d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[2] ^ c[24] ^ c[26] ^ c[27] ^ c[29];
assign newcrc[11] = d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[3] ^ c[24] ^ c[25] ^ c[27] ^ c[28];
assign newcrc[12] = d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[4] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30];
assign newcrc[13] = d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[5] ^ c[25] ^ c[26] ^ c[27] ^ c[29] ^ c[30] ^ c[31];
assign newcrc[14] = d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[6] ^ c[26] ^ c[27] ^ c[28] ^ c[30] ^ c[31];
assign newcrc[15] = d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[7] ^ c[27] ^ c[28] ^ c[29] ^ c[31];
assign newcrc[16] = d[5] ^ d[4] ^ d[0] ^ c[8] ^ c[24] ^ c[28] ^ c[29];
assign newcrc[17] = d[6] ^ d[5] ^ d[1] ^ c[9] ^ c[25] ^ c[29] ^ c[30];
assign newcrc[18] = d[7] ^ d[6] ^ d[2] ^ c[10] ^ c[26] ^ c[30] ^ c[31];
assign newcrc[19] = d[7] ^ d[3] ^ c[11] ^ c[27] ^ c[31];
assign newcrc[20] = d[4] ^ c[12] ^ c[28];
assign newcrc[21] = d[5] ^ c[13] ^ c[29];
assign newcrc[22] = d[0] ^ c[14] ^ c[24];
assign newcrc[23] = d[6] ^ d[1] ^ d[0] ^ c[15] ^ c[24] ^ c[25] ^ c[30];
assign newcrc[24] = d[7] ^ d[2] ^ d[1] ^ c[16] ^ c[25] ^ c[26] ^ c[31];
assign newcrc[25] = d[3] ^ d[2] ^ c[17] ^ c[26] ^ c[27];
assign newcrc[26] = d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[18] ^ c[24] ^ c[27] ^ c[28] ^ c[30];
assign newcrc[27] = d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[19] ^ c[25] ^ c[28] ^ c[29] ^ c[31];
assign newcrc[28] = d[6] ^ d[5] ^ d[2] ^ c[20] ^ c[26] ^ c[29] ^ c[30];
assign newcrc[29] = d[7] ^ d[6] ^ d[3] ^ c[21] ^ c[27] ^ c[30] ^ c[31];
assign newcrc[30] = d[7] ^ d[4] ^ c[22] ^ c[28] ^ c[31];
assign newcrc[31] = d[5] ^ c[23] ^ c[29];

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		crc <= 32'hffff_ffff;
	else if(clr)
		crc <= 32'hffff_ffff;
	else if(en)
		crc <= newcrc;
	else
		crc <= crc;
end

genvar										j;

generate
	for(j = 0; j < 32; j = j + 1)
	begin: crc_output_swap
		assign newcrc_result[j] = ~crc[31 - j]; 
	end
endgenerate

endmodule

