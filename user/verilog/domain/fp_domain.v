//===============================================
//
//	File: fp_domain.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 07302023
//	Version: v1.0
//
// 	This is top for full power functions domain.
//	This domain is including:
//	1. Cortex-M3 CPU Core
//	2. AHB bus matrix
//
//===============================================

module fp_domain 
(
	input						sys_root_clk,
	input						apb0_root_clk,
	input						apb1_root_clk,
	input						apb2_root_clk,
	input						sys_root_rstn,
	input						apb0_root_rstn,
	input						apb1_root_rstn,
	input						apb2_root_rstn,
	input						power_on_rstn,
	
	// pins
	output 						uart0_tx,
	output 						uart0_tx_oen,
	input    					uart0_rx,
	output 						uart0_rx_oen,
	output 						uart1_tx,
	output 						uart1_tx_oen,
	input    					uart1_rx,
	output 						uart1_rx_oen,
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,

`ifdef GPIO
	output						psel0_gpioa,
	output						penable0_o,
	output	[31:0]			 	paddr0_gpioa, 
	output	      				pwrite0_o,
	output	[31:0]			 	pwdata0_o, 
	input	[31:0]			 	prdata0_gpioa, 
`endif

	input      					gpioa_int,

	// Debug port swd/jlink
	input						TDI,                  // JTAG TDI
	input						TCK,                  // SWD Clk / JTAG TCK
	inout						TMS,                  // SWD I/O / JTAG TMS
	output						TDO,                  // SWV     / JTAG TDO
	input						TRST                  // SWD Clk / JTAG TCK
);

wire	[239:0] 				irq;

//===============================================
// AMBA AHB bus matrix
//===============================================
   
// CPU I-Code bus
wire	[31:0]					haddri;
wire	[ 1:0]					htransi;
wire	[ 2:0]					hsizei;
wire	[ 2:0]					hbursti;
wire	[ 3:0]					hproti;
wire	[ 1:0]					hmemattri;
wire	      					hreadyi;
wire	[31:0]					hrdatai;
wire	[ 1:0]					hrespi;

// CPU D-Code bus
wire	[31:0]					haddrd;
wire	[ 1:0]					htransd;
wire	[ 2:0]					hsized;
wire	      					hwrited;
wire	[ 2:0]					hburstd;
wire	[ 3:0]					hprotd;
wire	[ 1:0]					hmemattrd;
wire	[ 1:0]					hmasterd;
wire	[31:0]					hwdatad;
wire	      					hexreqd;
wire	      					hreadyd;
wire	[31:0]					hrdatad;
wire	[ 1:0]					hrespd;
wire	      					hexrespd;

// CPU System bus
wire	[31:0]				 	haddrs; 
wire	[ 1:0]				 	htranss; 
wire	[ 2:0]				 	hsizes; 
wire	      					hwrites; 
wire	[ 2:0]					hbursts; 
wire	[ 3:0]				 	hprots; 
wire	      					hmastlocks; 
wire	[ 1:0]					hmemattrs;
wire	[ 1:0]					hmasters;
wire	[31:0]				 	hwdatas; 
wire	      					hexreqs;
wire	      					hreadys; 
wire	[31:0]				 	hrdatas; 
wire	[ 1:0]				 	hresps;
wire	      					hexresps;

// ITCM 
wire							hsel_itcm;
wire	[31:0]				 	haddr_itcm; 
wire	[ 1:0]				 	htrans_itcm; 
wire	[ 2:0]				 	hsize_itcm; 
wire	      					hwrite_itcm; 
wire	[ 2:0]					hburst_itcm; 
wire	[ 3:0]				 	hprot_itcm; 
wire	      					hmastlock_itcm; 
wire	[ 1:0]					hmemattr_itcm;
wire	[ 3:0]					hmaster_itcm;
wire	[31:0]				 	hwdata_itcm; 
wire	      					hexreq_itcm;
wire	      					hready_itcm; 
wire	[31:0]				 	hrdata_itcm; 
wire	      					hreadyout_itcm; 
wire	[ 1:0]				 	hresp_itcm;
wire	      					hexresp_itcm;

// DTCM 
wire							hsel_dtcm;
wire	[31:0]				 	haddr_dtcm; 
wire	[ 1:0]				 	htrans_dtcm; 
wire	[ 2:0]				 	hsize_dtcm; 
wire	      					hwrite_dtcm; 
wire	[ 2:0]					hburst_dtcm; 
wire	[ 3:0]				 	hprot_dtcm; 
wire	      					hmastlock_dtcm; 
wire	[ 1:0]					hmemattr_dtcm;
wire	[ 3:0]					hmaster_dtcm;
wire	[31:0]				 	hwdata_dtcm; 
wire	      					hexreq_dtcm;
wire	      					hready_dtcm; 
wire	[31:0]				 	hrdata_dtcm; 
wire	      					hreadyout_dtcm; 
wire	[ 1:0]				 	hresp_dtcm;
wire	      					hexresp_dtcm;

// sram0 
//wire							hsel_sram0;
//wire	[31:0]				 	haddr_sram0; 
//wire	[ 1:0]				 	htrans_sram0; 
//wire	[ 2:0]				 	hsize_sram0; 
//wire	      					hwrite_sram0; 
//wire	[ 2:0]					hburst_sram0; 
//wire	[ 3:0]				 	hprot_sram0; 
//wire	      					hmastlock_sram0; 
//wire	[ 1:0]					hmemattr_sram0;
//wire	[ 3:0]					hmaster_sram0;
//wire	[31:0]				 	hwdata_sram0; 
//wire	      					hexreq_sram0;
//wire	      					hready_sram0; 
//wire	[31:0]				 	hrdata_sram0; 
//wire	      					hreadyout_sram0; 
//wire	[ 1:0]				 	hresp_sram0;
//wire	      					hexresp_sram0;

// apb0 sync
wire							hsel_apb0;
wire	[31:0]				 	haddr_apb0; 
wire	[ 1:0]				 	htrans_apb0; 
wire	[ 2:0]				 	hsize_apb0; 
wire	      					hwrite_apb0; 
wire	[ 2:0]					hburst_apb0; 
wire	[ 3:0]				 	hprot_apb0; 
wire	      					hmastlock_apb0; 
wire	[ 1:0]					hmemattr_apb0;
wire	[ 3:0]					hmaster_apb0;
wire	[31:0]				 	hwdata_apb0; 
wire	      					hexreq_apb0;
wire	      					hready_apb0; 
wire	[31:0]				 	hrdata_apb0; 
wire	      					hreadyout_apb0; 
wire	[ 1:0]				 	hresp_apb0;
wire	      					hexresp_apb0;

// apb1 async
wire							hsel_apb1;
wire	[31:0]				 	haddr_apb1; 
wire	[ 1:0]				 	htrans_apb1; 
wire	[ 2:0]				 	hsize_apb1; 
wire	      					hwrite_apb1; 
wire	[ 2:0]					hburst_apb1; 
wire	[ 3:0]				 	hprot_apb1; 
wire	      					hmastlock_apb1; 
wire	[ 1:0]					hmemattr_apb1;
wire	[ 3:0]					hmaster_apb1;
wire	[31:0]				 	hwdata_apb1; 
wire	      					hexreq_apb1;
wire	      					hready_apb1; 
wire	[31:0]				 	hrdata_apb1; 
wire	      					hreadyout_apb1; 
wire	[ 1:0]				 	hresp_apb1;
wire	      					hexresp_apb1;

// apb2 async
wire							hsel_apb2;
wire	[31:0]				 	haddr_apb2; 
wire	[ 1:0]				 	htrans_apb2; 
wire	[ 2:0]				 	hsize_apb2; 
wire	      					hwrite_apb2; 
wire	[ 2:0]					hburst_apb2; 
wire	[ 3:0]				 	hprot_apb2; 
wire	      					hmastlock_apb2; 
wire	[ 1:0]					hmemattr_apb2;
wire	[ 3:0]					hmaster_apb2;
wire	[31:0]				 	hwdata_apb2; 
wire	      					hexreq_apb2;
wire	      					hready_apb2; 
wire	[31:0]				 	hrdata_apb2; 
wire	      					hreadyout_apb2; 
wire	[ 1:0]				 	hresp_apb2;
wire	      					hexresp_apb2;

ahb_bus_matrix u_ahb_bus_matrix 
(
	.HCLK						(sys_root_clk),
	.HRESETn					(sys_root_rstn),
	.REMAP						(4'b0),

	// CPU D-Code
	.HSELS0						(1'b1),
	.HADDRS0					(haddrd),
	.HTRANSS0					(htransd),
	.HWRITES0					(hwrited),
	.HSIZES0					(hsized),
	.HBURSTS0					(hburstd),
	.HPROTS0					(hprotd),
	.HMASTERS0					({2'b00, hmasterd}),//?
	.HWDATAS0					(hwdatad),
	.HMASTLOCKS0				(1'b0),
	.HREADYS0					(hreadyd),
	.HAUSERS0					(32'b0),
	.HWUSERS0					(32'b0),
	.HRDATAS0					(hrdatad),
	.HREADYOUTS0				(hreadyd),
	.HRESPS0					(hrespd),
	.HRUSERS0					(),

	// CPU I-Code
	.HSELS1						(1'b1),
	.HADDRS1					(haddri),
	.HTRANSS1					(htransi),
	.HWRITES1					(1'b0),
	.HSIZES1					(hsizei),
	.HBURSTS1					(hbursti),
	.HPROTS1					(hproti),
	.HMASTERS1					(4'b0),//?
	.HWDATAS1					(32'b0),
	.HMASTLOCKS1				(1'b0),
	.HREADYS1					(hreadyi),
	.HAUSERS1					(32'b0),
	.HWUSERS1					(32'b0),
	.HRDATAS1					(hrdatai),
	.HREADYOUTS1				(hreadyi),
	.HRESPS1					(hrespi),
	.HRUSERS1					(),

	// CPU System
	.HSELS2						(1'b1),
	.HADDRS2					(haddrs),
	.HTRANSS2					(htranss),
	.HWRITES2					(hwrites),
	.HSIZES2					(hsizes),
	.HBURSTS2					(hbursts),
	.HPROTS2					(hprots),
	.HMASTERS2					(4'b0),//?
	.HWDATAS2					(hwdatas),
	.HMASTLOCKS2				(hmastlocks),
	.HREADYS2					(hreadys),
	.HAUSERS2					(32'b0),
	.HWUSERS2					(32'b0),
	.HRDATAS2					(hrdatas),
	.HREADYOUTS2				(hreadys),
	.HRESPS2					(hresps),
	.HRUSERS2					(),

	// DTCM
	.HSELM0						(hsel_dtcm),
	.HADDRM0					(haddr_dtcm),
	.HTRANSM0					(htrans_dtcm),
	.HWRITEM0					(hwrite_dtcm),
	.HSIZEM0					(hsize_dtcm),
	.HBURSTM0					(hburst_dtcm),
	.HPROTM0					(hprot_dtcm),
	.HMASTERM0					(hmaster_dtcm),
	.HWDATAM0					(hwdata_dtcm),
	.HMASTLOCKM0				(hmastlock_dtcm),
	.HREADYMUXM0				(hready_dtcm),
	.HAUSERM0					(),
	.HWUSERM0					(),
	.HRDATAM0					(hrdata_dtcm),
	.HREADYOUTM0				(hreadyout_dtcm),
	.HRESPM0					(hresp_dtcm),
	.HRUSERM0					(32'b0),

	// ITCM
	.HSELM1						(hsel_itcm),
	.HADDRM1					(haddr_itcm),
	.HTRANSM1					(htrans_itcm),
	.HWRITEM1					(hwrite_itcm),
	.HSIZEM1					(hsize_itcm),
	.HBURSTM1					(hburst_itcm),
	.HPROTM1					(hprot_itcm),
	.HMASTERM1					(hmaster_itcm),
	.HWDATAM1					(hwdata_itcm),
	.HMASTLOCKM1				(hmastlock_itcm),
	.HREADYMUXM1				(hready_itcm),
	.HAUSERM1					(),
	.HWUSERM1					(),
	.HRDATAM1					(hrdata_itcm),
	.HREADYOUTM1				(hreadyout_itcm),
	.HRESPM1					(hresp_itcm),
	.HRUSERM1					(32'b0),

//	// sram0
//	.HSELM5						(hsel_sram0),
//	.HADDRM5					(haddr_sram0),
//	.HTRANSM5					(htrans_sram0),
//	.HWRITEM5					(hwrite_sram0),
//	.HSIZEM5					(hsize_sram0),
//	.HBURSTM5					(hburst_sram0),
//	.HPROTM5					(hprot_sram0),
//	.HMASTERM5					(hmaster_sram0),
//	.HWDATAM5					(hwdata_sram0),
//	.HMASTLOCKM5				(hmastlock_sram0),
//	.HREADYMUXM5				(hready_sram0),
//	.HAUSERM5					(),
//	.HWUSERM5					(),
//	.HRDATAM5					(hrdata_sram0),
//	.HREADYOUTM5				(hreadyout_sram0),
//	.HRESPM5					(hresp_sram0),
//	.HRUSERM5					(32'b0),

	// apb0 sync
	.HSELM6						(hsel_apb0),
	.HADDRM6					(haddr_apb0),
	.HTRANSM6					(htrans_apb0),
	.HWRITEM6					(hwrite_apb0),
	.HSIZEM6					(hsize_apb0),
	.HBURSTM6					(hburst_apb0),
	.HPROTM6					(hprot_apb0),
	.HMASTERM6					(hmaster_apb0),
	.HWDATAM6					(hwdata_apb0),
	.HMASTLOCKM6				(hmastlock_apb0),
	.HREADYMUXM6				(hready_apb0),
	.HAUSERM6					(),
	.HWUSERM6					(),
	.HRDATAM6					(hrdata_apb0),
	.HREADYOUTM6				(hreadyout_apb0),
	.HRESPM6					(hresp_apb0),
	.HRUSERM6					(32'b0),

	// apb1 async
	.HSELM7						(hsel_apb1),
	.HADDRM7					(haddr_apb1),
	.HTRANSM7					(htrans_apb1),
	.HWRITEM7					(hwrite_apb1),
	.HSIZEM7					(hsize_apb1),
	.HBURSTM7					(hburst_apb1),
	.HPROTM7					(hprot_apb1),
	.HMASTERM7					(hmaster_apb1),
	.HWDATAM7					(hwdata_apb1),
	.HMASTLOCKM7				(hmastlock_apb1),
	.HREADYMUXM7				(hready_apb1),
	.HAUSERM7					(),
	.HWUSERM7					(),
	.HRDATAM7					(hrdata_apb1),
	.HREADYOUTM7				(hreadyout_apb1),
	.HRESPM7					(hresp_apb1),
	.HRUSERM7					(32'b0),

	// apb2 async
	.HSELM8						(hsel_apb2),
	.HADDRM8					(haddr_apb2),
	.HTRANSM8					(htrans_apb2),
	.HWRITEM8					(hwrite_apb2),
	.HSIZEM8					(hsize_apb2),
	.HBURSTM8					(hburst_apb2),
	.HPROTM8					(hprot_apb2),
	.HMASTERM8					(hmaster_apb2),
	.HWDATAM8					(hwdata_apb2),
	.HMASTLOCKM8				(hmastlock_apb2),
	.HREADYMUXM8				(hready_apb2),
	.HAUSERM8					(),
	.HWUSERM8					(),
	.HRDATAM8					(hrdata_apb2),
	.HREADYOUTM8				(hreadyout_apb2),
	.HRESPM8					(hresp_apb2),
	.HRUSERM8					(32'b0),

	.SCANENABLE					(1'b0),
	.SCANINHCLK					(1'b0),
	.SCANOUTHCLK				()
);

//===============================================
// AMBA APB0 sync
// 0x40000000 ~ 0x4000FFFF 64k
//===============================================

wire							psel0;
wire							penable0;
wire	[31:0]				 	paddr0; 
wire	      					pwrite0; 
wire	[ 3:0]				 	pstrb0; 
wire	[ 2:0]				 	pprot0; 
wire	[31:0]				 	pwdata0; 
wire	      					pready0; 
wire	[31:0]				 	prdata0; 
wire	      					pslverr0; 
wire	      					pactive0; 

assign hresp_apb0[1] = 1'b0;

cmsdk_ahb_to_apb
#(
	.ADDRWIDTH					(32)	
)
u_apb0_sync 
(
	.HCLK						(apb0_root_clk),
	.HRESETn					(apb0_root_rstn),
	.PCLKEN						(1'b1),

	.HSEL						(hsel_apb0),
	.HADDR						(haddr_apb0),
	.HTRANS						(htrans_apb0),
	.HWRITE						(hwrite_apb0),
	.HSIZE						(hsize_apb0),
	.HPROT						(hprot_apb0),
	.HWDATA						(hwdata_apb0),
	.HREADY						(hready_apb0),
	.HRDATA						(hrdata_apb0),
	.HREADYOUT					(hreadyout_apb0),
	.HRESP						(hresp_apb0[0]),
	
	.PADDR						(paddr0),  
	.PENABLE					(penable0),
	.PSTRB						(pstrb0),  
	.PPROT						(pprot0),  
	.PWRITE						(pwrite0), 
	.PWDATA						(pwdata0), 
	.PSEL						(psel0),   
	.PRDATA						(prdata0), 
	.PREADY						(pready0),
	.PSLVERR					(pslverr0),
	
	.APBACTIVE					(pactive0)
);

//===============================================
// AMBA APB1 async
// 0x40010000 ~ 0x4001FFFF 64k
//===============================================

wire							psel1;
wire							penable1;
wire	[31:0]				 	paddr1; 
wire	      					pwrite1; 
wire	[ 3:0]				 	pstrb1; 
wire	[ 2:0]				 	pprot1; 
wire	[31:0]				 	pwdata1; 
wire	      					pready1; 
wire	[31:0]				 	prdata1; 
wire	      					pslverr1; 
wire	      					pactive1; 

assign hresp_apb1[1] = 1'b0;

cmsdk_ahb_to_apb_async
#(
	.ADDRWIDTH					(32)	
)
u_apb1_async 
(
	.HCLK						(sys_root_clk),
	.HRESETn					(sys_root_rstn),

	.HSEL						(hsel_apb1),
	.HADDR						(haddr_apb1),
	.HTRANS						(htrans_apb1),
	.HWRITE						(hwrite_apb1),
	.HSIZE						(hsize_apb1),
	.HPROT						(hprot_apb1),
	.HWDATA						(hwdata_apb1),
	.HREADY						(hready_apb1),
	.HRDATA						(hrdata_apb1),
	.HREADYOUT					(hreadyout_apb1),
	.HRESP						(hresp_apb1[0]),

	.PCLK						(apb1_root_clk),
	.PRESETn					(apb1_root_rstn),
	
	.PADDR						(paddr1),  
	.PENABLE					(penable1),
	.PSTRB						(pstrb1),  
	.PPROT						(pprot1),  
	.PWRITE						(pwrite1), 
	.PWDATA						(pwdata1), 
	.PSEL						(psel1),   
	.PRDATA						(prdata1), 
	.PREADY						(pready1),
	.PSLVERR					(pslverr1),
	
	.APBACTIVE					(pactive1)
);

//===============================================
// AMBA APB2 async
// 0x40020000 ~ 0x4002FFFF 64k
//===============================================

wire							psel2;
wire							penable2;
wire	[31:0]				 	paddr2; 
wire	      					pwrite2; 
wire	[ 3:0]				 	pstrb2; 
wire	[ 2:0]				 	pprot2; 
wire	[31:0]				 	pwdata2; 
wire	      					pready2; 
wire	[31:0]				 	prdata2; 
wire	      					pslverr2; 
wire	      					pactive2; 

assign hresp_apb2[1] = 1'b0;

cmsdk_ahb_to_apb_async
#(
	.ADDRWIDTH					(32)	
)
u_apb2_async 
(
	.HCLK						(sys_root_clk),
	.HRESETn					(sys_root_rstn),

	.HSEL						(hsel_apb2),
	.HADDR						(haddr_apb2),
	.HTRANS						(htrans_apb2),
	.HWRITE						(hwrite_apb2),
	.HSIZE						(hsize_apb2),
	.HPROT						(hprot_apb2),
	.HWDATA						(hwdata_apb2),
	.HREADY						(hready_apb2),
	.HRDATA						(hrdata_apb2),
	.HREADYOUT					(hreadyout_apb2),
	.HRESP						(hresp_apb2[0]),

	.PCLK						(apb2_root_clk),
	.PRESETn					(apb2_root_rstn),
	
	.PADDR						(paddr2),  
	.PENABLE					(penable2),
	.PSTRB						(pstrb2),  
	.PPROT						(pprot2),  
	.PWRITE						(pwrite2), 
	.PWDATA						(pwdata2), 
	.PSEL						(psel2),   
	.PRDATA						(prdata2), 
	.PREADY						(pready2),
	.PSLVERR					(pslverr2),
	
	.APBACTIVE					(pactive2)
);

//===============================================
// Cortex-M3 CPU Core
//===============================================

// CPU status
wire							lockup;											// Lockup signal from CPU
wire							sys_reset_req;              // System reset request from CPU or debug host

// Debug signals (TDO pin is used for SWV unless JTAG mode is active)
wire							dbg_tdo;                    // SWV / JTAG TDO
wire							dbg_tdo_nen;                // SWV / JTAG TDO tristate enable (active low)
wire							dbg_swdo;                   // SWD I/O 3-state output
wire							dbg_swdo_en;                // SWD I/O 3-state enable
wire							dbg_jtag_nsw;               // SWD in JTAG state (HIGH)
wire							dbg_swo;                    // Serial wire viewer/output
wire							tdo_enable;
wire							tdo_tms;

// TDO is only used in JTAG mode
assign tdo_enable = !dbg_tdo_nen | !dbg_jtag_nsw;	
assign tdo_tms = dbg_jtag_nsw ? dbg_tdo : dbg_swo;
assign TMS = dbg_swdo_en ? dbg_swdo : 1'bz;
assign TDO = tdo_enable ? tdo_tms : 1'bz;

// CoreSight requires a loopback from REQ to ACK for a minimal
// debug power control implementation
wire							cpu0cdbgpwrupreq;          // Debug Power Domain up request
wire							cpu0cdbgpwrupack;          // Debug Power Domain up acknowledge

assign cpu0cdbgpwrupack = cpu0cdbgpwrupreq;

// DesignStart simplified integration level
CORTEXM3INTEGRATIONDS u_CORTEXM3INTEGRATION 
(
   // Inputs
   .ISOLATEn       (1'b1),               // Active low to isolate core power domain
   .RETAINn        (1'b1),               // Active low to retain core state during power-down

   // Resets
   .PORESETn       (power_on_rstn),      // Power on reset - reset processor and debugSynchronous to FCLK and HCLK
   .SYSRESETn      (sys_root_rstn),      // System reset   - reset processor onlySynchronous to FCLK and HCLK
   .RSTBYPASS      (1'b0),               // Reset bypass - active high to disable internal generated reset for testing (e.gATPG)
   .CGBYPASS       (1'b0),               // Clock gating bypass - active high to disable internal clock gating for testing
   .SE             (1'b0),               // DFT is tied off in this example

   // Clocks
   .FCLK           (sys_root_clk),       // Free running clock - NVIC, SysTick, debug
   .HCLK           (sys_root_clk),       // System clock - AHB, processor
                                         // it is separated so that it can be gated off when no debugger is attached
   .TRACECLKIN     (sys_root_clk),       // Trace clock input.  REVISIT, does it want its own named signal as an input?
   // SysTick
   .STCLK          (1'b1),               // External reference clock for SysTick (Not really a clock, it is sampled by DFF)
                                         // Must be synchronous to FCLK or tied when no alternative clock source
   .STCALIB        ({1'b1,               // No alternative clock source
                     1'b0,               // Exact multiple of 10ms from FCLK
                     24'h03D08F}),       // Calibration value for SysTick for 25 MHz source

   .AUXFAULT       ({32{1'b0}}),         // Auxiliary Fault Status Register inputs: Connect to fault status generating logic
                                         // if required. Result appears in the Auxiliary Fault Status Register at address
                                         // 0xE000ED3C. A one-cycle pulse of information results in the information being stored
                                         // in the corresponding bit until a write-clear occurs.

   // Configuration - system
   .BIGEND         (1'b0),               // Select when exiting system reset - Peripherals in this system do not support BIGEND
   .DNOTITRANS     (1'b1),               // I-CODE & D-CODE merging configuration.
                                         // This disable I-CODE from generating a transfer when D-CODE bus need a transfer
                                         // Must be HIGH when using the Designstart system

   // SWJDAP signal for single processor mode
   .nTRST          (TRST),               // JTAG TAP Reset
   .SWCLKTCK       (TCK),                // SW/JTAG Clock
   .SWDITMS        (TMS),                // SW Debug Data In / JTAG Test Mode Select
   .TDI            (TDI),                // JTAG TAP Data In / Alternative input function
   .CDBGPWRUPACK   (cpu0cdbgpwrupack),   // Debug Power Domain up acknowledge.

   // IRQs
   .INTISR         (irq[239:0]),         // Interrupts
   .INTNMI         (1'b0),               // Non-maskable Interrupt
 	 
 	 // AHB I-Code bus
   .HADDRI         (haddri),             // I-CODE bus address
   .HTRANSI        (htransi),            // I-CODE bus transfer type
   .HSIZEI         (hsizei),             // I-CODE bus transfer size
   .HBURSTI        (hbursti),            // I-CODE bus burst length
   .HPROTI         (hproti),             // i-code bus protection
   .MEMATTRI       (hmemattri),          // I-CODE bus memory attributes
   .HREADYI        (hreadyi),            // I-CODE bus ready
   .HRDATAI        (hrdatai),            // I-CODE bus read data
   .HRESPI         (hrespi),             // I-CODE bus response
   .IFLUSH         (1'b0),               // Prefetch flush - fixed when using the Designstart system

   // AHB D-Code bus
   .HADDRD         (haddrd),             // D-CODE bus address
   .HTRANSD        (htransd),            // D-CODE bus transfer type
   .HSIZED         (hsized),             // D-CODE bus transfer size
   .HWRITED        (hwrited),            // D-CODE bus write not read
   .HBURSTD        (hburstd),            // D-CODE bus burst length
   .HPROTD         (hprotd),             // D-CODE bus protection
   .MEMATTRD       (hmemattrd),          // D-CODE bus memory attributes
   .HMASTERD       (hmasterd),           // D-CODE bus master
   .HWDATAD        (hwdatad),            // D-CODE bus write data
   .EXREQD         (hexreqd),            // D-CODE bus exclusive request
   .HREADYD        (hreadyd),            // D-CODE bus ready
   .HRDATAD        (hrdatad),            // D-CODE bus read data
   .HRESPD         (hrespd),             // D-CODE bus response
   .EXRESPD        (1'b0),            	 // D-CODE bus exclusive response

   // AHB System bus
   .HADDRS         (haddrs),             // System bus address
   .HTRANSS        (htranss),            // System bus transfer type
   .HSIZES         (hsizes),             // System bus transfer size
   .HWRITES        (hwrites),            // System bus write not read
   .HBURSTS        (hbursts),            // System bus burst length
   .HPROTS         (hprots),             // System bus protection
   .HMASTLOCKS     (hmastlocks),         // System bus lock
   .MEMATTRS       (),                   // System bus memory attributes
   .HMASTERS       (),                   // System bus master
   .HWDATAS        (hwdatas),            // System bus write data
   .EXREQS         (),                   // System bus exclusive request
   .HREADYS        (hreadys),            // System bus ready
   .HRDATAS        (hrdatas),            // System bus read data
   .HRESPS         (hresps),             // System bus response
   .EXRESPS        (1'b0),            	 // System bus exclusive response

   // Sleep
   .RXEV           (1'b0),               // Receive Event input
   .SLEEPHOLDREQn  (1'b1),               // Extend Sleep request

   // External Debug Request
   .EDBGRQ         (1'b0),               // External Debug request to CPU
   .DBGRESTART     (1'b0),               // Debug Restart request - Not needed in a single CPU system

   // DAP HMASTER override
   .FIXMASTERTYPE  (1'b0),               // Tie High to override HMASTER for AHB-AP accesses

   // WIC
   .WICENREQ       (1'b0),               // Active HIGH request for deep sleep to be WIC-based deep sleep
                                         // This should be driven from a PMU

   // Timestamp interface
   .TSVALUEB       ({48{1'b0}}),         // Binary coded timestamp value for trace - Trace is not used in this course
   // Timestamp clock ratio change is rarely used

   // Configuration - debug
   .DBGEN          (1'b1),               // Halting Debug Enable
   .NIDEN          (1'b1),               // Non-invasive debug enable for ETM
   .MPUDISABLE     (1'b0),               // Tie high to emulate processor with no MPU

   // SWJDAP signal for single processor mode
   .TDO            (dbg_tdo),            // JTAG TAP Data Out // REVISIT needs mux for SWV
   .nTDOEN         (dbg_tdo_nen),        // TDO enable
   .CDBGPWRUPREQ   (cpu0cdbgpwrupreq),   // Debug Power Domain up request
   .SWDO           (dbg_swdo),           // SW Data Out
   .SWDOEN         (dbg_swdo_en),        // SW Data Out Enable
   .JTAGNSW        (dbg_jtag_nsw),       // JTAG/not Serial Wire Mode

   // Single Wire Viewer
   .SWV            (dbg_swo),            // SingleWire Viewer Data

   // TPIU signals for single processor mode
   .TRACECLK       (),                   // TRACECLK output
   .TRACEDATA      (),                   // Trace Data

   // CoreSight AHB Trace Macrocell (HTM) bus capture interface
   // Connected here for visibility but usually not used in SoC.
   .HTMDHADDR      (),                   // HTM data HADDR
   .HTMDHTRANS     (),                   // HTM data HTRANS
   .HTMDHSIZE      (),                   // HTM data HSIZE
   .HTMDHBURST     (),                   // HTM data HBURST
   .HTMDHPROT      (),                   // HTM data HPROT
   .HTMDHWDATA     (),                   // HTM data HWDATA
   .HTMDHWRITE     (),                   // HTM data HWRITE
   .HTMDHRDATA     (),                   // HTM data HRDATA
   .HTMDHREADY     (),                   // HTM data HREADY
   .HTMDHRESP      (),                   // HTM data HRESP


   // Status
   .BRCHSTAT       (),                   // Branch State
   .HALTED         (),                   // The processor is halted
   .DBGRESTARTED   (),                   // Debug Restart interface handshaking
   .LOCKUP         (lockup),             // The processor is locked up
   .SLEEPING       (),                   // The processor is in sleep mdoe (sleep/deep sleep)
   .SLEEPDEEP      (),                   // The processor is in deep sleep mode
   .SLEEPHOLDACKn  (),                   // Acknowledge for SLEEPHOLDREQn
   .ETMINTNUM      (),                   // Current exception number
   .ETMINTSTAT     (),                   // Exception/Interrupt activation status
   .CURRPRI        (),                   // Current exception priority
   .TRCENA         (),                   // Trace Enable

   // Reset Request
   .SYSRESETREQ    (sys_reset_req),      // System Reset Request

   // Events
   .TXEV           (),                   // Transmit Event

   // Clock gating control
   .GATEHCLK       (),                   // when high, HCLK can be turned off

   .WAKEUP         (),                   // Active HIGH signal from WIC to the PMU that indicates a wake-up event has
                                         // occurred and the system requires clocks and power
   .WICENACK       ()                    // Acknowledge for WICENREQ - WIC operation deep sleep mode
);

//===============================================
// interrupt handle
// sync interrupt
// async interrrupt (should sync first)
//===============================================

wire	[ 7:0] 				sync_irq;
wire	[ 7:0] 				async_irq_bf;
wire	[ 7:0] 				async_irq_af;
wire						uart0_int;// No.0
wire						uart1_int;// No.1
//wire						gpioa_int;// No.5
wire	[ 3:0]				bastim_int;// No.8~11
wire						eth_sma_int;// No.12

assign sync_irq = {2'h0, gpioa_int, 1'b0, 1'b0, 1'b0, uart1_int, uart0_int};
assign async_irq_bf = {3'h0, eth_sma_int, bastim_int};

sync_ff_2d
#(
	.WIDTH						(8),
	.DEFAULT_VAL				(0)
)
u_sync_ff_2d_inst0
(
	.clk						(sys_root_clk),
	.rstn						(sys_root_rstn),	

	.A							(async_irq_bf),
	.Y							(async_irq_af)
);

assign irq = {234'h0, async_irq_af, sync_irq};

//===============================================
// sram top
// ITCM 32k 0x00000000~0x00008000
// DTCM  8k 0x00010000~0x00012000
//===============================================

sram_top u_sram_top
(
	.sys_root_clk				(sys_root_clk),
	.sys_root_rstn				(sys_root_rstn),
	        						
	.hsel_itcm  				(hsel_itcm),
	.hready_itcm				(hready_itcm),
	.htrans_itcm				(htrans_itcm),
	.hsize_itcm 				(hsize_itcm),
	.hwrite_itcm				(hwrite_itcm),
	.haddr_itcm 				(haddr_itcm),
	.hprot_itcm  				(hprot_itcm),
	.hwdata_itcm				(hwdata_itcm),
	.hreadyout_itcm				(hreadyout_itcm),
	.hresp_itcm 				(hresp_itcm),
	.hrdata_itcm				(hrdata_itcm),
	            				
	.hsel_dtcm  				(hsel_dtcm),
	.hready_dtcm				(hready_dtcm),
	.htrans_dtcm				(htrans_dtcm),
	.hsize_dtcm 				(hsize_dtcm),
	.hwrite_dtcm				(hwrite_dtcm),
	.haddr_dtcm 				(haddr_dtcm),
	.hprot_dtcm  				(hprot_dtcm),
	.hwdata_dtcm				(hwdata_dtcm),
	.hreadyout_dtcm				(hreadyout_dtcm),
	.hresp_dtcm 				(hresp_dtcm),
	.hrdata_dtcm 				(hrdata_dtcm)
);

//===============================================
// apb0 sync top
// 0x40000000~0x4000FFFF
//===============================================

apb0_top u_apb0_sync_top 
(
	.apb0_root_clk				(apb0_root_clk),
	.apb0_root_rstn				(apb0_root_rstn),
	
	.uart0_tx					(uart0_tx),
	.uart0_tx_oen				(uart0_tx_oen),
	.uart0_rx					(uart0_rx),
	.uart0_rx_oen				(uart0_rx_oen),
	.uart1_tx					(uart1_tx),
	.uart1_tx_oen				(uart1_tx_oen),
	.uart1_rx					(uart1_rx),
	.uart1_rx_oen				(uart1_rx_oen),

	.paddr						(paddr0),  
	.penable					(penable0),
	.pstrb						(pstrb0),  
	.pprot						(pprot0),  
	.pwrite						(pwrite0), 
	.pwdata						(pwdata0), 
	.psel						(psel0),   
	.prdata						(prdata0), 
	.pready						(pready0),
	.pslverr					(pslverr0),

`ifdef GPIO
	.psel_gpioa_o				(psel0_gpioa),
	.paddr_gpioa_o				(paddr0_gpioa),
	.prdata_gpioa_o				(prdata0_gpioa), 	
`endif

	.uart0_int					(uart0_int),
	.uart1_int					(uart1_int)
);

`ifdef GPIO
assign penable0_o = penable0;
assign pwrite0_o = pwrite0;
assign pwdata0_o = pwdata0;
`endif

//===============================================
// apb1 async top
// 0x40010000~0x4001FFFF
//===============================================

apb1_top u_apb1_async_top 
(
	.apb1_root_clk				(apb1_root_clk),
	.apb1_root_rstn				(apb1_root_rstn),

	.paddr						(paddr1),  
	.penable					(penable1),
	.pstrb						(pstrb1),  
	.pprot						(pprot1),  
	.pwrite						(pwrite1), 
	.pwdata						(pwdata1), 
	.psel						(psel1),   
	.prdata						(prdata1), 
	.pready						(pready1),
	.pslverr					(pslverr1),

	.bastim_int					(bastim_int)
);

//===============================================
// apb2 async top
// 0x40020000~0x4002FFFF
//===============================================

apb2_top u_apb2_async_top 
(
	.apb2_root_clk				(apb2_root_clk),
	.apb2_root_rstn				(apb2_root_rstn),

	.eth_mdc					(eth_mdc),
	.eth_mdc_oen				(eth_mdc_oen),
	.eth_mdio_o					(eth_mdio_o),
	.eth_mdio_i					(eth_mdio_i),
	.eth_mdio_oen				(eth_mdio_oen),

	.paddr						(paddr2),  
	.penable					(penable2),
	.pstrb						(pstrb2),  
	.pprot						(pprot2),  
	.pwrite						(pwrite2), 
	.pwdata						(pwdata2), 
	.psel						(psel2),   
	.prdata						(prdata2), 
	.pready						(pready2),
	.pslverr					(pslverr2),

	.eth_sma_int				(eth_sma_int)
);

endmodule

