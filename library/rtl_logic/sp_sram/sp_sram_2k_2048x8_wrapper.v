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
// 	data width: 8bit=1bytes
// 	data depth: 2k bytes (1*2^11 = 2048)
// 	address width: 11 (1*2^11 = 2048)
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
	input 	[10:0]							addr,
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

