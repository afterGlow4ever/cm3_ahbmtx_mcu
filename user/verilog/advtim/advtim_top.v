//===============================================
//
//	File: advtim_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11172024
//	Version: v1.0
//
// 	This is top for advance timer.
//	This top is including:
//	advanve timer channel core
//	advanve timer enable control
//	advanve timer interrupt management
//	advanve timer regs wrap: shadow regs update
//
//===============================================

module advtim_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,// used sync reset in module_clk domain

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
	output						advtim_gen_int_line,
	output						advtim_cap_int_line,
	output						advtim_fault_int_line
);

wire							r0_gen_enable;
wire							r0_gen_enable_af;
wire							r0_logic_clr;
wire							advtim_pe_gen_hw_update;
wire 							advtim_pe_gen_running;

wire		[15:0]				r0_psc;
wire		[15:0]				r0_arr;
wire		[15:0]				r0_rcr;
wire		[ 1:0]				r0_cms;
wire							r0_dir;
wire		[15:0]				r0_cc1;
wire							r0_go1;	 
wire							r0_go1n; 
wire							r0_ss1;	 
wire							r0_ss1n; 
wire							r0_moe1; 
wire							r0_moe1n;
wire							r0_dze1;
wire							r0_cc1p;
wire							r0_cc1np;
wire							r0_cc1e;
wire							r0_cc1ne;
wire		[ 3:0]				r0_oc1m;
wire		[15:0]				r0_cc2;
wire							r0_go2;	 
wire							r0_go2n; 
wire							r0_ss2;	 
wire							r0_ss2n; 
wire							r0_moe2; 
wire							r0_moe2n;
wire							r0_dze2;
wire							r0_cc2p;
wire							r0_cc2np;
wire							r0_cc2e;
wire							r0_cc2ne;
wire		[ 3:0]				r0_oc2m;
wire		[15:0]				r0_cc3;
wire							r0_go3;	 
wire							r0_go3n; 
wire							r0_ss3;	 
wire							r0_ss3n; 
wire							r0_moe3; 
wire							r0_moe3n;
wire							r0_dze3;
wire							r0_cc3p;
wire							r0_cc3np;
wire							r0_cc3e;
wire							r0_cc3ne;
wire		[ 3:0]				r0_oc3m;
wire		[15:0]				r0_cc4;
wire							r0_ss4;	 
wire							r0_cc4p;
wire							r0_cc4e;
wire		[ 3:0]				r0_oc4m;
wire		[15:0]				r0_cc5;
wire							r0_cc5c3;
wire							r0_cc5c2;
wire							r0_cc5c1;
wire							r0_ss5;	 
wire							r0_cc5p;
wire							r0_cc5e;
wire		[ 3:0]				r0_oc5m;
wire		[15:0]				r0_cc6;
wire							r0_ss6;	 
wire							r0_cc6p;
wire							r0_cc6e;
wire		[ 3:0]				r0_oc6m;
wire							r0_bk2p;
wire							r0_bk2e;
wire							r0_bk1p;
wire							r0_bk1e;
wire		[ 9:0]				r0_dtg;

wire		[ 1:0]				int0_en;
wire		[ 1:0]				int0_clr;
wire		[ 1:0]				int0_sta;
wire		[ 1:0]				int0_tgr;
wire		[ 1:0]				int0_pos;
wire		[ 1:0]				int0_line;

//===============================================
// advtim regs wrap
//===============================================

advtim_regs_wrap u_advtim_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.pe_clk						(module_clk),
	.pe_rstn					(module_rstn),

	.r0_logic_clr				(r0_logic_clr),
	.r1_logic_clr				(r1_logic_clr),
	.r0_gen_enable				(r0_gen_enable),
	.advtim_pe_gen_hw_update	(advtim_pe_gen_hw_update),
	.advtim_pe_gen_running		(advtim_pe_gen_running),

	.r0_psc						(r0_psc),
	.r0_arr						(r0_arr),
	.r0_rcr						(r0_rcr),
	.r0_cms						(r0_cms),
	.r0_dir						(r0_dir),
	.r0_cc1						(r0_cc1),
	.r0_go1						(r0_go1),
	.r0_go1n					(r0_go1n),
	.r0_ss1						(r0_ss1),
	.r0_ss1n					(r0_ss1n),
	.r0_moe1					(r0_moe1),
	.r0_moe1n					(r0_moe1n),
	.r0_dze1					(r0_dze1),
	.r0_cc1p					(r0_cc1p),
	.r0_cc1np					(r0_cc1np),
	.r0_cc1e					(r0_cc1e),
	.r0_cc1ne					(r0_cc1ne),
	.r0_oc1m					(r0_oc1m),
	.r0_cc2						(r0_cc2),
	.r0_go2						(r0_go2),
	.r0_go2n					(r0_go2n),
	.r0_ss2						(r0_ss2),
	.r0_ss2n					(r0_ss2n),
	.r0_moe2					(r0_moe2),
	.r0_moe2n					(r0_moe2n),
	.r0_dze2					(r0_dze2),
	.r0_cc2p					(r0_cc2p),
	.r0_cc2np					(r0_cc2np),
	.r0_cc2e					(r0_cc2e),
	.r0_cc2ne					(r0_cc2ne),
	.r0_oc2m					(r0_oc2m),
	.r0_cc3						(r0_cc3),
	.r0_go3						(r0_go3),
	.r0_go3n					(r0_go3n),
	.r0_ss3						(r0_ss3),
	.r0_ss3n					(r0_ss3n),
	.r0_moe3					(r0_moe3),
	.r0_moe3n					(r0_moe3n),
	.r0_dze3					(r0_dze3),
	.r0_cc3p					(r0_cc3p),
	.r0_cc3np					(r0_cc3np),
	.r0_cc3e					(r0_cc3e),
	.r0_cc3ne					(r0_cc3ne),
	.r0_oc3m					(r0_oc3m),
	.r0_cc4						(r0_cc4),
	.r0_ss4						(r0_ss4),
	.r0_cc4p					(r0_cc4p),
	.r0_cc4e					(r0_cc4e),
	.r0_oc4m					(r0_oc4m),
	.r0_cc5						(r0_cc5),
	.r0_cc5c3					(r0_cc5c3),
	.r0_cc5c2					(r0_cc5c2),
	.r0_cc5c1					(r0_cc5c1),
	.r0_ss5						(r0_ss5),
	.r0_cc5p					(r0_cc5p),
	.r0_cc5e					(r0_cc5e),
	.r0_oc5m					(r0_oc5m),
	.r0_cc6						(r0_cc6),
	.r0_ss6						(r0_ss6),
	.r0_cc6p					(r0_cc6p),
	.r0_cc6e					(r0_cc6e),
	.r0_oc6m					(r0_oc6m),
	.r0_bk2p					(r0_bk2p),
	.r0_bk2e					(r0_bk2e),
	.r0_bk1p					(r0_bk1p),
	.r0_bk1e					(r0_bk1e),
	.r0_dtg						(r0_dtg),

	.r0_int_en					(int0_en),
	.r0_int_clr					(int0_clr),
	.r0_int_sta					(int0_sta)
);

//===============================================
// enable control
// sync operation
// Thus, this timer can be used in async.
//===============================================

reg								advtim_pe_gen_tim_enable;
wire							advtim_pe_gen_tim_end;
wire							advtim_pe_gen_logic_clr;
assign advtim_pe_gen_logic_clr = r0_logic_clr;

pos_step_sync2pulse u_advtim_gen_enable_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),	
	.des_clk					(module_clk),
	.des_rstn					(module_rstn),	

	.src_A						(r0_gen_enable),
	.des_Y						(r0_gen_enable_af)
);

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_gen_tim_enable <= 1'b0;
	else if(((advtim_pe_gen_tim_enable == 1'b1) && advtim_pe_gen_tim_end) || advtim_pe_gen_logic_clr)
		advtim_pe_gen_tim_enable <= 1'b0;
	else if((advtim_pe_gen_tim_enable == 1'b0) && (r0_gen_enable_af))
		advtim_pe_gen_tim_enable <= 1'b1;
	else
		advtim_pe_gen_tim_enable <= advtim_pe_gen_tim_enable;
end

//===============================================
// advance timer core
//===============================================

advtim_pe_core u_advtim_pe_core 
(
	.pe_clk						(module_clk),  
	.pe_rstn					(module_rstn),
                                                
	.advtim_pe_gen_tim_enable	(advtim_pe_gen_tim_enable),
	.advtim_pe_gen_tim_end		(advtim_pe_gen_tim_end),
	.advtim_pe_gen_logic_clr	(advtim_pe_gen_logic_clr),
	.advtim_pe_gen_hw_update	(advtim_pe_gen_hw_update),
	.advtim_pe_gen_running		(advtim_pe_gen_running),

	.r0_psc						(r0_psc),
	.r0_arr						(r0_arr),
	.r0_rcr						(r0_rcr),
	.r0_cms						(r0_cms),
	.r0_dir						(r0_dir),
	.r0_cc1						(r0_cc1),
	.r0_go1						(r0_go1),
	.r0_go1n					(r0_go1n),
	.r0_ss1						(r0_ss1),
	.r0_ss1n					(r0_ss1n),
	.r0_moe1					(r0_moe1),
	.r0_moe1n					(r0_moe1n),
	.r0_dze1					(r0_dze1),
	.r0_cc1p					(r0_cc1p),
	.r0_cc1np					(r0_cc1np),
	.r0_cc1e					(r0_cc1e),
	.r0_cc1ne					(r0_cc1ne),
	.r0_oc1m					(r0_oc1m),
	.r0_cc2						(r0_cc2),
	.r0_go2						(r0_go2),
	.r0_go2n					(r0_go2n),
	.r0_ss2						(r0_ss2),
	.r0_ss2n					(r0_ss2n),
	.r0_moe2					(r0_moe2),
	.r0_moe2n					(r0_moe2n),
	.r0_dze2					(r0_dze2),
	.r0_cc2p					(r0_cc2p),
	.r0_cc2np					(r0_cc2np),
	.r0_cc2e					(r0_cc2e),
	.r0_cc2ne					(r0_cc2ne),
	.r0_oc2m					(r0_oc2m),
	.r0_cc3						(r0_cc3),
	.r0_go3						(r0_go3),
	.r0_go3n					(r0_go3n),
	.r0_ss3						(r0_ss3),
	.r0_ss3n					(r0_ss3n),
	.r0_moe3					(r0_moe3),
	.r0_moe3n					(r0_moe3n),
	.r0_dze3					(r0_dze3),
	.r0_cc3p					(r0_cc3p),
	.r0_cc3np					(r0_cc3np),
	.r0_cc3e					(r0_cc3e),
	.r0_cc3ne					(r0_cc3ne),
	.r0_oc3m					(r0_oc3m),
	.r0_cc4						(r0_cc4),
	.r0_ss4						(r0_ss4),
	.r0_cc4p					(r0_cc4p),
	.r0_cc4e					(r0_cc4e),
	.r0_oc4m					(r0_oc4m),
	.r0_cc5						(r0_cc5),
	.r0_cc5c3					(r0_cc5c3),
	.r0_cc5c2					(r0_cc5c2),
	.r0_cc5c1					(r0_cc5c1),
	.r0_ss5						(r0_ss5),
	.r0_cc5p					(r0_cc5p),
	.r0_cc5e					(r0_cc5e),
	.r0_oc5m					(r0_oc5m),
	.r0_cc6						(r0_cc6),
	.r0_ss6						(r0_ss6),
	.r0_cc6p					(r0_cc6p),
	.r0_cc6e					(r0_cc6e),
	.r0_oc6m					(r0_oc6m),
	.r0_bk2p					(r0_bk2p),
	.r0_bk2e					(r0_bk2e),
	.r0_bk1p					(r0_bk1p),
	.r0_bk1e					(r0_bk1e),
	.r0_dtg						(r0_dtg),

	.int0_status_gen_end		(int0_tgr[1]),
	.int0_status_gen_reload		(int0_tgr[0])
);

//===============================================
// advtim interrupt management
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign advtim_gen_int_line = |int0_line;

posedge_detect 
#(
	.WIDTH						(2)
)
u_int0_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(int0_tgr),
	.Y							(int0_pos)
);

interrupt_gen 
#(
	.WIDTH						(2)
)
u_interrupt0_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int0_en),
	.int_tgr					(int0_pos),
	.int_clr					(int0_clr),
	.int_sta					(int0_sta),
	.int_line					(int0_line)	
);

assign advtim_cap_int_line = 1'b0;//??

endmodule

