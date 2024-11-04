//===============================================
//
//	File: sp_sram_1k_256x32_wrapper.v
//	Author: afterGlow,4ever
//	Date: 05022024
//	Version: v1.0
//
// 	This lib is used to wrap sp sram including:
// 	altera sp ram;
// 	xilinx sp ram;
// 	asic ram;
// 	data width: 32bit=4bytes
// 	data depth: 1k bytes (4*2^8 = 1024)
// 	address width: 8 (4*2^8 = 1024)
//
//===============================================

//===============================================
// Sp ram wrapper
//===============================================

module sp_sram_1k_256x32_wrapper
(
	input									clk,
	input									rstn,
	input									wen,
	input									cs,
	input 	[ 7:0]							addr,
	input	[31:0]							data,
	output	[31:0]							q
);

`ifdef ASIC

`else
wire										we;
wire										be;
assign we = |be;
assign be = ~wen;

fpga_universal_sp_sram_gen
#(
	.ADDR_WIDTH 							(8),
	.DATA_WIDTH								(32),
	.BYTE_WIDTH								(32)
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

