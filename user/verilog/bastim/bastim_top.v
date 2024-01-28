//===============================================
//
//	File: bastim_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01212024
//	Version: v1.0
//
// 	This is top for basic timer.
//	This top is including:
//	basic timer channel core: basic timer counter
//	basic timer enable control
//	basic timer interrupt management
//	basic timer regs wrap: shadow regs update
//
//===============================================

module bastim_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// regs interface
	input  						reg_clk,  
	input  						reg_rstn,
	input 	[31:0]				paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 	[31:0]				pwdata, 
	output	[31:0]				prdata,
	
	// interrupt
	output	[ 3:0]				bastim_int_line
);

wire		[ 3:0]				r_auto_reload;
wire		[ 3:0]				r_tim_enable;

wire		[63:0]				r_psc;
wire		[63:0]				r_arr;
wire		[63:0]				r_startcnt;

wire		[ 3:0]				int_en;
wire		[ 3:0]				int_clr;
wire		[ 3:0]				int_sta;
wire		[ 3:0]				int_tgr;
wire		[ 3:0]				int_pos;
wire		[ 3:0]				int_line;

//===============================================
// bastim regs wrap
//===============================================

bastim_regs_wrap u_bastim_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.r_auto_reload				(r_auto_reload),
	.r_tim_enable				(r_tim_enable),

	.r_psc						(r_psc),
	.r_arr						(r_arr),
	.r_startcnt					(r_startcnt),

	.r_int_en					(int_en),
	.r_int_clr					(int_clr),
	.r_int_sta					(int_sta)
);

//===============================================
// enable control
// sync operation
// Thus, this timer can be used in async.
//===============================================

wire		[ 3:0]				ch_auto_reload;
wire		[ 3:0]				ch_tim_enable;

// using 2d is
// 1d 70% ~80%
// 2d 99%%
// following: fixed issue reset_sync04 report from spyglass
// async reset signal should not more than once
sync_ff
#(
	.WIDTH						(4),
	.DEFAULT_VAL				(0)
)
u_sync_ff_inst0
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(r_auto_reload),
	.Y							(ch_auto_reload)
);

sync_ff
#(
	.WIDTH						(4),
	.DEFAULT_VAL				(0)
)
u_sync_ff_inst1
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(r_tim_enable),
	.Y							(ch_tim_enable)
);

//===============================================
// basic timer channel core
//===============================================

bastim_ch_core u_bastim_ch_core 
(
	.ch_clk						(module_clk),  
	.ch_rstn					(module_rstn),
                                                
	.ch_auto_reload				(ch_auto_reload),
	.ch_tim_enable				(ch_tim_enable),

	.r_psc						(r_psc),
	.r_arr						(r_arr),
	.r_startcnt					(r_startcnt),

	.int_status_ch_reload		(int_tgr)
);

//===============================================
// bastim interrupt management
// each channel module has 1 interrupt line
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign bastim_int_line = int_line;

posedge_detect 
#(
	.WIDTH						(4)
)
u_int_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(int_tgr),
	.Y							(int_pos)
);

interrupt_gen 
#(
	.WIDTH						(4)
)
u_interrupt_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int_en),
	.int_tgr					(int_pos),
	.int_clr					(int_clr),
	.int_sta					(int_sta),
	.int_line					(int_line)	
);

endmodule

