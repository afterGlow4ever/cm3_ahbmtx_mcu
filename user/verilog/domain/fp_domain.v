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
	input  wire						sys_root_clk,
	input  wire						apb1_root_clk,
	input  wire						sys_root_rstn,
	input  wire						apb1_root_rstn,
	input  wire						power_on_rstn,
	
	// Debug port swd/jlink
	input  wire						TDI,                  // JTAG TDI
	input  wire						TCK,                  // SWD Clk / JTAG TCK
	inout  wire						TMS,                  // SWD I/O / JTAG TMS
	output wire						TDO,                  // SWV     / JTAG TDO
	input  wire						TRST                  // SWD Clk / JTAG TCK
);

wire		[239:0] 				irq = {240'b0000_0000_0000_0000};

//===============================================
// AMBA AHB bus matrix
//===============================================
   
// CPU I-Code bus
wire		[31:0]					haddri;
wire		[ 1:0]					htransi;
wire		[ 2:0]					hsizei;
wire		[ 2:0]					hbursti;
wire		[ 3:0]					hproti;
wire		[ 1:0]					hmemattri;
wire		      					hreadyi;
wire		[31:0]					hrdatai;
wire		[ 1:0]					hrespi;

// CPU D-Code bus
wire		[31:0]					haddrd;
wire		[ 1:0]					htransd;
wire		[ 2:0]					hsized;
wire		      					hwrited;
wire		[ 2:0]					hburstd;
wire		[ 3:0]					hprotd;
wire		[ 1:0]					hmemattrd;
wire		[ 3:0]					hmasterd;
wire		[31:0]					hwdatad;
wire		      					hexreqd;
wire		      					hreadyd;
wire		[31:0]					hrdatad;
wire		[ 1:0]					hrespd;
wire		      					hexrespd;

// CPU System bus
wire		[31:0]				 	haddrs; 
wire		[ 1:0]				 	htranss; 
wire		[ 2:0]				 	hsizes; 
wire		      					hwrites; 
wire		[ 2:0]					hbursts; 
wire		[ 3:0]				 	hprots; 
wire		      					hmastlocks; 
wire		[ 1:0]					hmemattrs;
wire		[ 1:0]					hmasters;
wire		[31:0]				 	hwdatas; 
wire		      					hexreqs;
wire		      					hreadys; 
wire		[31:0]				 	hrdatas; 
wire		[ 1:0]				 	hresps;
wire		      					hexresps;

// ITCM 
wire										hselitcm;
wire		[31:0]				 	haddritcm; 
wire		[ 1:0]				 	htransitcm; 
wire		[ 2:0]				 	hsizeitcm; 
wire		      					hwriteitcm; 
wire		[ 2:0]					hburstitcm; 
wire		[ 3:0]				 	hprotitcm; 
wire		      					hmastlockitcm; 
wire		[ 1:0]					hmemattritcm;
wire		[ 3:0]					hmasteritcm;
wire		[31:0]				 	hwdataitcm; 
wire		      					hexreqitcm;
wire		      					hreadyitcm; 
wire		[31:0]				 	hrdataitcm; 
wire		      					hreadyoutitcm; 
wire		[ 1:0]				 	hrespitcm;
wire		      					hexrespitcm;

// DTCM 
wire										hseldtcm;
wire		[31:0]				 	haddrdtcm; 
wire		[ 1:0]				 	htransdtcm; 
wire		[ 2:0]				 	hsizedtcm; 
wire		      					hwritedtcm; 
wire		[ 2:0]					hburstdtcm; 
wire		[ 3:0]				 	hprotdtcm; 
wire		      					hmastlockdtcm; 
wire		[ 1:0]					hmemattrdtcm;
wire		[ 3:0]					hmasterdtcm;
wire		[31:0]				 	hwdatadtcm; 
wire		      					hexreqdtcm;
wire		      					hreadydtcm; 
wire		[31:0]				 	hrdatadtcm; 
wire		      					hreadyoutdtcm; 
wire		[ 1:0]				 	hrespdtcm;
wire		      					hexrespdtcm;

// sram0 
wire										hselsram0;
wire		[31:0]				 	haddrsram0; 
wire		[ 1:0]				 	htranssram0; 
wire		[ 2:0]				 	hsizesram0; 
wire		      					hwritesram0; 
wire		[ 2:0]					hburstsram0; 
wire		[ 3:0]				 	hprotsram0; 
wire		      					hmastlocksram0; 
wire		[ 1:0]					hmemattrsram0;
wire		[ 3:0]					hmastersram0;
wire		[31:0]				 	hwdatasram0; 
wire		      					hexreqsram0;
wire		      					hreadysram0; 
wire		[31:0]				 	hrdatasram0; 
wire		      					hreadyoutsram0; 
wire		[ 1:0]				 	hrespsram0;
wire		      					hexrespsram0;


// apb1 async
wire										hselapb1;
wire		[31:0]				 	haddrapb1; 
wire		[ 1:0]				 	htransapb1; 
wire		[ 2:0]				 	hsizeapb1; 
wire		      					hwriteapb1; 
wire		[ 2:0]					hburstapb1; 
wire		[ 3:0]				 	hprotapb1; 
wire		      					hmastlockapb1; 
wire		[ 1:0]					hmemattrapb1;
wire		[ 3:0]					hmasterapb1;
wire		[31:0]				 	hwdataapb1; 
wire		      					hexreqapb1;
wire		      					hreadyapb1; 
wire		[31:0]				 	hrdataapb1; 
wire		      					hreadyoutapb1; 
wire		[ 1:0]				 	hrespapb1;
wire		      					hexrespapb1;

ahb_bus_matrix u_ahb_bus_matrix 
(
	.HCLK									(sys_root_clk),
	.HRESETn							(sys_root_rstn),
	.REMAP								(4'b0),

	// CPU D-Code
	.HSELS0								(1'b1),
	.HADDRS0							(haddrd),
	.HTRANSS0							(htransd),
	.HWRITES0							(hwrited),
	.HSIZES0							(hsized),
	.HBURSTS0							(hburstd),
	.HPROTS0							(hprotd),
	.HMASTERS0						(hmasterd),//?
	.HWDATAS0							(hwdatad),
	.HMASTLOCKS0					(1'b0),
	.HREADYS0							(hreadyd),
	.HAUSERS0							(32'b0),
	.HWUSERS0							(32'b0),
	.HRDATAS0							(hrdatad),
	.HREADYOUTS0					(hreadyd),
	.HRESPS0							(hrespd),
	.HRUSERS0							(),

	// CPU I-Code
	.HSELS1								(1'b1),
	.HADDRS1							(haddri),
	.HTRANSS1							(htransi),
	.HWRITES1							(1'b0),
	.HSIZES1							(hsizei),
	.HBURSTS1							(hbursti),
	.HPROTS1							(hproti),
	.HMASTERS1						(4'b0),//?
	.HWDATAS1							(32'b0),
	.HMASTLOCKS1					(1'b0),
	.HREADYS1							(hreadyi),
	.HAUSERS1							(32'b0),
	.HWUSERS1							(32'b0),
	.HRDATAS1							(hrdatai),
	.HREADYOUTS1					(hreadyi),
	.HRESPS1							(hrespi),
	.HRUSERS1							(),

	// CPU System
	.HSELS2								(1'b1),
	.HADDRS2							(haddrs),
	.HTRANSS2							(htranss),
	.HWRITES2							(hwrites),
	.HSIZES2							(hsizes),
	.HBURSTS2							(hbursts),
	.HPROTS2							(hprots),
	.HMASTERS2						(4'b0),//?
	.HWDATAS2							(hwdatas),
	.HMASTLOCKS2					(hmastlocks),
	.HREADYS2							(hreadys),
	.HAUSERS2							(32'b0),
	.HWUSERS2							(32'b0),
	.HRDATAS2							(hrdatas),
	.HREADYOUTS2					(hreadys),
	.HRESPS2							(hresps),
	.HRUSERS2							(),

	// ITCM
	.HSELM0								(hselitcm),
	.HADDRM0							(haddritcm),
	.HTRANSM0							(htransitcm),
	.HWRITEM0							(hwriteitcm),
	.HSIZEM0							(hsizeitcm),
	.HBURSTM0							(hburstitcm),
	.HPROTM0							(hprotitcm),
	.HMASTERM0						(hmasteritcm),
	.HWDATAM0							(hwdataitcm),
	.HMASTLOCKM0					(hmastlockitcm),
	.HREADYMUXM0					(hreadyitcm),
	.HAUSERM0							(),
	.HWUSERM0							(),
	.HRDATAM0							(hrdataitcm),
	.HREADYOUTM0					(hreadyoutitcm),
	.HRESPM0							(hrespitcm),
	.HRUSERM0							(32'b0),

	// DTCM
	.HSELM1								(hseldtcm),
	.HADDRM1							(haddrdtcm),
	.HTRANSM1							(htransdtcm),
	.HWRITEM1							(hwritedtcm),
	.HSIZEM1							(hsizedtcm),
	.HBURSTM1							(hburstdtcm),
	.HPROTM1							(hprotdtcm),
	.HMASTERM1						(hmasterdtcm),
	.HWDATAM1							(hwdatadtcm),
	.HMASTLOCKM1					(hmastlocks),
	.HREADYMUXM1					(hreadydtcm),
	.HAUSERM1							(),
	.HWUSERM1							(),
	.HRDATAM1							(hrdatadtcm),
	.HREADYOUTM1					(hreadyoutdtcm),
	.HRESPM1							(hrespdtcm),
	.HRUSERM1							(32'b0),

	// sram0
	.HSELM5								(hselsram0),
	.HADDRM5							(haddrsram0),
	.HTRANSM5							(htranssram0),
	.HWRITEM5							(hwritesram0),
	.HSIZEM5							(hsizesram0),
	.HBURSTM5							(hburstsram0),
	.HPROTM5							(hprotsram0),
	.HMASTERM5						(hmastersram0),
	.HWDATAM5							(hwdatasram0),
	.HMASTLOCKM5					(hmastlocksram0),
	.HREADYMUXM5					(hreadysram0),
	.HAUSERM5							(),
	.HWUSERM5							(),
	.HRDATAM5							(hrdatasram0),
	.HREADYOUTM5					(hreadyoutsram0),
	.HRESPM5							(hrespsram0),
	.HRUSERM5							(32'b0),

	// apb1 async
	.HSELM7								(hselapb1),
	.HADDRM7							(haddrapb1),
	.HTRANSM7							(htransapb1),
	.HWRITEM7							(hwriteapb1),
	.HSIZEM7							(hsizeapb1),
	.HBURSTM7							(hburstapb1),
	.HPROTM7							(hprotapb1),
	.HMASTERM7						(hmasterapb1),
	.HWDATAM7							(hwdataapb1),
	.HMASTLOCKM7					(hmastlockapb1),
	.HREADYMUXM7					(hreadyapb1),
	.HAUSERM7							(),
	.HWUSERM7							(),
	.HRDATAM7							(hrdataapb1),
//	.HREADYOUTM7					(hreadyoutapb1),
	.HREADYOUTM7					(1'b1),
	.HRESPM7							(hrespapb1),
	.HRUSERM7							(32'b0),

	.SCANENABLE						(1'b0),
	.SCANINHCLK						(1'b0),
	.SCANOUTHCLK					()
);

//===============================================
// AMBA APB1 async
// 0x40000000 ~ 0x40008000
// 32k addr:15bit
//===============================================

wire										psel1;
wire										penable1;
wire		[14:0]				 	paddr1; 
wire		      					pwrite1; 
wire		[ 3:0]				 	pstrb1; 
wire		[ 2:0]				 	pprot1; 
wire		[31:0]				 	pwdata1; 
wire		      					pready1; 
wire		[31:0]				 	prdata1; 
wire		      					pslverr1; 
wire		      					pactive1; 

assign hrespapb1[1] = 1'b0;

cmsdk_ahb_to_apb_async
#(
	.ADDRWIDTH						(15)	
)
u_apb1_async 
(
	.HCLK									(sys_root_clk),
	.HRESETn							(sys_root_rstn),

	.HSEL									(hselapb1),
	.HADDR								(haddrapb1[14:0]),
	.HTRANS								(htransapb1),
	.HWRITE								(hwriteapb1),
	.HSIZE								(hsizeapb1),
	.HPROT								(hprotapb1),
	.HWDATA								(hwdataapb1),
	.HREADY								(hreadyapb1),
	.HRDATA								(hrdataapb1),
	.HREADYOUT						(hreadyoutapb1),
	.HRESP								(hrespapb1[0]),

	.PCLK									(apb1_root_clk),
	.PRESETn							(apb1_root_rstn),
	
	.PADDR								(paddr1),  
	.PENABLE							(penable1),
	.PSTRB								(pstrb1),  
	.PPROT								(pprot1),  
	.PWRITE								(pwrite1), 
	.PWDATA								(pwdata1), 
	.PSEL									(psel1),   
	.PRDATA								(prdata1), 
	.PREADY								(pready1),
	.PSLVERR							(pslverr1),
	
	.APBACTIVE						(pactive1)
);

//===============================================
// Cortex-M3 CPU Core
//===============================================

// CPU status
wire										lockup;											// Lockup signal from CPU
wire										sys_reset_req;              // System reset request from CPU or debug host

// Debug signals (TDO pin is used for SWV unless JTAG mode is active)
wire										dbg_tdo;                    // SWV / JTAG TDO
wire										dbg_tdo_nen;                // SWV / JTAG TDO tristate enable (active low)
wire										dbg_swdo;                   // SWD I/O 3-state output
wire										dbg_swdo_en;                // SWD I/O 3-state enable
wire										dbg_jtag_nsw;               // SWD in JTAG state (HIGH)
wire										dbg_swo;                    // Serial wire viewer/output
wire										tdo_enable;
wire										tdo_tms;

// TDO is only used in JTAG mode
assign tdo_enable = !dbg_tdo_nen | !dbg_jtag_nsw;	
assign tdo_tms = dbg_jtag_nsw ? dbg_tdo : dbg_swo;
assign TMS = dbg_swdo_en ? dbg_swdo : 1'bz;
assign TDO = tdo_enable ? tdo_tms : 1'bz;

// CoreSight requires a loopback from REQ to ACK for a minimal
// debug power control implementation
wire										cpu0cdbgpwrupreq;          // Debug Power Domain up request
wire										cpu0cdbgpwrupack;          // Debug Power Domain up acknowledge

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
                     24'h003D08F}),      // Calibration value for SysTick for 25 MHz source

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
   .HREADYI        (1'b1),            	 // I-CODE bus ready
   .HRDATAI        (32'b0),            	 // I-CODE bus read data
   .HRESPI         (2'b0),               // I-CODE bus response
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
   .HREADYD        (1'b1),            	 // D-CODE bus ready
   .HRDATAD        (32'h0),              // D-CODE bus read data
   .HRESPD         (2'b0),               // D-CODE bus response
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
   .HREADYS        (hreadys),            	 // System bus ready
   .HRDATAS        (hrdatas),            	 // System bus read data
   .HRESPS         (hresps),             	 // System bus response
   .EXRESPS        (1'b0),            	 // System bus exclusive response

//     // I-CODE Bus
// 		 
//     .HREADYI        (hreadyi),            // I-CODE bus ready
//     .HRDATAI        (hrdatai),            // I-CODE bus read data
//     .HRESPI         (hrespi),             // I-CODE bus response
//     .IFLUSH         (1'b0),               // Prefetch flush - fixed when using the Designstart system
//
//     // D-CODE Bus
//     .HREADYD        (hreadyd),            // D-CODE bus ready
//     .HRDATAD        (hrdatad),            // D-CODE bus read data
//     .HRESPD         (hrespd),             // D-CODE bus response
//     .EXRESPD        (exrespd),            // D-CODE bus exclusive response
//
//     // System Bus
//     .HREADYS        (hreadys),            // System bus ready
//     .HRDATAS        (hrdatas),            // System bus read data
//     .HRESPS         (hresps),             // System bus response
//     .EXRESPS        (exresps),            // System bus exclusive response

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

endmodule

