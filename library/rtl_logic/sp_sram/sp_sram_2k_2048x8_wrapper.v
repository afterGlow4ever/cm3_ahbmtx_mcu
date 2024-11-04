//===============================================
//
//	File: sp_sram_2k_2048x8_wrapper.v
//	Author: afterGlow,4ever
//	Date: 07092024
//	Version: v1.0
//
// 	This lib is used to wrap sp sram including:
// 	altera sp ram;
// 	xilinx sp ram;
// 	asic ram;
// 	data width: 32bit=4bytes
// 	data depth: 2k bytes (4*2^9 = 1024)
// 	address width: 9 (4*2^9 = 1024)
//
//===============================================

//===============================================
// Sp ram wrapper
//===============================================

module sp_sram_2k_2048x8_wrapper
(
	input									clk,
	input									rstn,
	input									wen,
	input									cs,
	input 	[11:0]							addr,
	input	[ 7:0]							data,
	output	[ 7:0]							q
);

`ifdef ASIC

`else
wire										we;
wire										be;
assign we = |be;
assign be = ~wen;

fpga_universal_sp_sram_gen
#(
	.ADDR_WIDTH 							(11),
	.DATA_WIDTH								(8),
	.BYTE_WIDTH								(8)
)
u_fpga_universal_sp_sram_gen
(
	.clk									(clk),
	.rst									(~rstn),
	.be										(be),
	.we										(we),
	.cs										(cs),
	.addr									(addr),
	.data									(data),
	.q										(q)
);
`endif

endmodule

