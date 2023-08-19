//===============================================
//
//	File: sram_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08122023
//	Version: v1.0
//
// 	This is top for any sram in fp domainn.
//	This sram top is including:
//	1. ITCM 32k 0x00000000~0x00008000
//	2. DTCM  8k 0x00010000~0x00012000
//
//===============================================

module sram_top
(
	input						sys_root_clk,
	input						sys_root_rstn,

	input						hsel_itcm,
	input						hready_itcm,
	input	[ 1:0]				htrans_itcm,
	input	[ 2:0]				hsize_itcm,
	input						hwrite_itcm,
	input	[31:0]				haddr_itcm,
	input	[ 3:0]				hprot_itcm,
	input	[31:0]				hwdata_itcm,
	output						hreadyout_itcm,
	output	[ 1:0]				hresp_itcm,
	output	[31:0]				hrdata_itcm,

	input						hsel_dtcm,
	input						hready_dtcm,
	input	[ 1:0]				htrans_dtcm,
	input	[ 2:0]				hsize_dtcm,
	input						hwrite_dtcm,
	input	[31:0]				haddr_dtcm,
	input	[ 3:0]				hprot_dtcm,
	input	[31:0]				hwdata_dtcm,
	output						hreadyout_dtcm,
	output	[ 1:0]				hresp_dtcm,
	output	[31:0]				hrdata_dtcm
);

//===============================================
// ITCM 32k
// 0x00000000~0x00008000
//===============================================

wire	[12:0]					itcm_addr;
wire	[31:0]					itcm_wdata;
wire	[ 3:0]					itcm_wen;
wire							itcm_cs;
wire	[31:0]					itcm_rdata;

assign hresp_itcm[1] = 1'b0;

cmsdk_ahb_to_sram
#(
	.AW							(15)	
)
u_ahb_to_itcm 
(
	.HCLK						(sys_root_clk),
	.HRESETn					(sys_root_rstn),

	.HSEL						(hsel_itcm),
	.HREADY						(hready_itcm),
	.HTRANS						(htrans_itcm),
	.HSIZE						(hsize_itcm),
	.HWRITE						(hwrite_itcm),
	.HADDR						(haddr_itcm[14:0]),
//	.HPROT						(hprot_itcm),
	.HWDATA						(hwdata_itcm),
	.HREADYOUT					(hreadyout_itcm),
	.HRESP						(hresp_itcm[0]),
	.HRDATA						(hrdata_itcm),

	.SRAMRDATA					(32'h0),
//	.SRAMRDATA					(itcm_rdata),
	.SRAMADDR					(itcm_addr),
	.SRAMWEN					(itcm_wen),
	.SRAMWDATA					(itcm_wdata),
	.SRAMCS						(itcm_cs)
);

`ifdef FPGA_SRAM

ram_32k	u_itcm
(
	.address					(itcm_addr),
	.byteena					(itcm_wen),
	.clock						(sys_root_clk),
	.data						(itcm_wdata),
	.rden						((itcm_cs && !itcm_wen)),
	.wren						(|itcm_wen),
	.q							(itcm_rdata)
);
	

`else

cmsdk_fpga_sram
#(
	.AW							(13)
)
u_itcm
(
	.CLK						(sys_root_clk),
	.ADDR						(itcm_addr),
	.WDATA						(itcm_wdata),
	.WREN						(itcm_wen),
	.CS							(itcm_cs),

	.RDATA						(itcm_rdata)
);

`endif

//===============================================
// DTCM 8k
// 0x00010000~0x00012000
//===============================================

wire	[12:0]					dtcm_addr;
wire	[31:0]					dtcm_wdata;
wire	[ 3:0]					dtcm_wen;
wire							dtcm_cs;
wire	[31:0]					dtcm_rdata;

assign hresp_dtcm[1] = 1'b0;

cmsdk_ahb_to_sram
#(
	.AW							(15)	
)
u_ahb_to_dtcm 
(
	.HCLK						(sys_root_clk),
	.HRESETn					(sys_root_rstn),

	.HSEL						(hsel_dtcm),
	.HREADY						(hready_dtcm),
	.HTRANS						(htrans_dtcm),
	.HSIZE						(hsize_dtcm),
	.HWRITE						(hwrite_dtcm),
	.HADDR						(haddr_dtcm[14:0]),
//	.HPROT						(hprot_dtcm),
	.HWDATA						(hwdata_dtcm),
	.HREADYOUT					(hreadyout_dtcm),
	.HRESP						(hresp_dtcm[0]),
	.HRDATA						(hrdata_dtcm),

	.SRAMRDATA					(dtcm_rdata),
	.SRAMADDR					(dtcm_addr),
	.SRAMWEN					(dtcm_wen),
	.SRAMWDATA					(dtcm_wdata),
	.SRAMCS						(dtcm_cs)
);

`ifdef FPGA_SRAM

ram_8k	u_dtcm
(
	.address					(dtcm_addr),
	.byteena					(dtcm_wen),
	.clock						(sys_root_clk),
	.data						(dtcm_wdata),
	.rden						((dtcm_cs && !dtcm_wen)),
	.wren						(|dtcm_wen),
	.q							(dtcm_rdata)
);
	
`else

cmsdk_fpga_sram
#(
	.AW							(13)
)
u_dtcm
(
	.CLK						(sys_root_clk),
	.ADDR						(dtcm_addr),
	.WDATA						(dtcm_wdata),
	.WREN						(dtcm_wen),
	.CS							(dtcm_cs),

	.RDATA						(dtcm_rdata)
);

`endif

endmodule

