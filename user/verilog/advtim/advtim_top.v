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

	// pins
	output						advtmr_pwm_ch1p,
	output						advtmr_pwm_ch1n,
	output						advtmr_pwm_ch2p,
	output						advtmr_pwm_ch2n,
	output						advtmr_pwm_ch3p,
	output						advtmr_pwm_ch3n,
	output						advtmr_pwm_ch4,
	output						advtmr_pwm_ch5,
	output						advtmr_pwm_ch6,
	output						advtmr_pwm_ch1p_oen,
	output						advtmr_pwm_ch1n_oen,
	output						advtmr_pwm_ch2p_oen,
	output						advtmr_pwm_ch2n_oen,
	output						advtmr_pwm_ch3p_oen,
	output						advtmr_pwm_ch3n_oen,
	output						advtmr_pwm_ch4_oen,
	output						advtmr_pwm_ch5_oen,
	output						advtmr_pwm_ch6_oen,
	input						advtmr_bk1,
	input						advtmr_bk2,
	output						advtmr_bk1_oen,
	output						advtmr_bk2_oen,
	input						advtmr_cap_ch1p,
	input						advtmr_cap_ch1n,
	output						advtmr_cap_ch1p_oen,
	output						advtmr_cap_ch1n_oen,
	input						advtmr_enc_ch1p,
	input						advtmr_enc_ch1n,
	output						advtmr_enc_ch1p_oen,
	output						advtmr_enc_ch1n_oen,

	// event
	input						system_failure,

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
	output						advtim_enc_int_line
);

wire							r0_gen_enable;
wire							r0_gen_enable_af;
wire							r0_logic_clr;
wire							advtim_pe_gen_hw_update;
wire 							advtim_pe_gen_running;
wire							advtim_pe_fault_detected;
wire							r1_cap_enable;
wire							r1_cap_enable_af;
wire							r1_logic_clr;
wire							advtim_pe_cap_hw_update;
wire 							advtim_pe_cap_running;
wire							r2_enc_enable;
wire							r2_enc_enable_af;
wire							r2_enc_enable_af_r;
wire							r2_enc_enable_af_f;
wire							r2_logic_clr;
wire							advtim_pe_enc_hw_update;
wire 							advtim_pe_enc_running;

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
wire		[ 3:0]				r0_bt;
wire							r0_bk2p;
wire							r0_bk2e;
wire							r0_bk1p;
wire							r0_bk1e;
wire		[ 9:0]				r0_dtg;

wire		[ 2:0]				int0_en;
wire		[ 2:0]				int0_clr;
wire		[ 2:0]				int0_sta;
wire		[ 2:0]				int0_tgr;
wire		[ 2:0]				int0_pos;
wire		[ 2:0]				int0_line;

wire		[15:0]				r1_psc;
wire		[15:0]				r1_arr;
wire		[15:0]				r1_rcr;
wire		[ 3:0]				r1_bt;
wire							r1_ic1m;
wire							r1_cc1p;
wire							r1_cc1np;
wire							r1_cc1e;
wire							r1_cc1ne;
wire		[15:0]				r1_ifr;
wire		[15:0]				r1_ilr;
wire		[15:0]				r1_ifc;
wire		[15:0]				r1_ilc;

wire		[ 1:0]				int1_en;
wire		[ 1:0]				int1_clr;
wire		[ 1:0]				int1_sta;
wire		[ 1:0]				int1_tgr;
wire		[ 1:0]				int1_pos;
wire		[ 1:0]				int1_line;

wire		[23:0]				r2_arr;
wire		[ 3:0]				r2_bt;
wire							r2_ec1m;
wire							r2_ec1p;
wire							r2_ec1np;
wire							r2_ec1e;
wire							r2_ec1ne;
wire		[15:0]				r2_ec;
wire							r2_ed;

wire		[ 1:0]				int2_en;
wire		[ 1:0]				int2_clr;
wire		[ 1:0]				int2_sta;
wire		[ 1:0]				int2_tgr;
wire		[ 1:0]				int2_pos;
wire		[ 1:0]				int2_line;

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
	.r0_gen_enable				(r0_gen_enable),
	.advtim_pe_gen_hw_update	(advtim_pe_gen_hw_update),
	.advtim_pe_gen_running		(advtim_pe_gen_running),
	.r1_logic_clr				(r1_logic_clr),
	.r1_cap_enable				(r1_cap_enable),
	.advtim_pe_cap_hw_update	(advtim_pe_cap_hw_update),
	.advtim_pe_cap_running		(advtim_pe_cap_running),
	.r2_logic_clr				(r2_logic_clr),
	.r2_enc_enable				(r2_enc_enable),
	.advtim_pe_enc_hw_update	(advtim_pe_enc_hw_update),
	.advtim_pe_enc_running		(advtim_pe_enc_running),

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
	.r0_bt						(r0_bt),
	.r0_bk2p					(r0_bk2p),
	.r0_bk2e					(r0_bk2e),
	.r0_bk1p					(r0_bk1p),
	.r0_bk1e					(r0_bk1e),
	.r0_dtg						(r0_dtg),

	.r0_int_en					(int0_en),
	.r0_int_clr					(int0_clr),
	.r0_int_sta					(int0_sta),

	.r1_psc						(r1_psc),
	.r1_arr						(r1_arr),
	.r1_rcr						(r1_rcr),
	.r1_bt						(r1_bt),
	.r1_ic1m					(r1_ic1m),
	.r1_cc1p					(r1_cc1p),
	.r1_cc1np					(r1_cc1np),
	.r1_cc1e					(r1_cc1e),
	.r1_cc1ne					(r1_cc1ne),
	.r1_ifr						(r1_ifr),
	.r1_ilr						(r1_ilr),
	.r1_ifc						(r1_ifc),
	.r1_ilc						(r1_ilc),

	.r1_int_en					(int1_en),
	.r1_int_clr					(int1_clr),
	.r1_int_sta					(int1_sta),

	.r2_arr						(r2_arr),
	.r2_bt						(r2_bt),
	.r2_ec1m					(r2_ec1m),
	.r2_ec1p					(r2_ec1p),
	.r2_ec1np					(r2_ec1np),
	.r2_ec1e					(r2_ec1e),
	.r2_ec1ne					(r2_ec1ne),
	.r2_ec						(r2_ec),
	.r2_ed						(r2_ed),

	.r2_int_en					(int2_en),
	.r2_int_clr					(int2_clr),
	.r2_int_sta					(int2_sta)
);

//===============================================
// advance timer pwm generator enable control
// sync operation
// Thus, this timer can be used in async.
//
// Spyglass Ac_conv01
// If logic clear signal occuring with enable_af(pulse),
// enable operation will miss.
//
// enable conditions:
// 1. enable pulse from regs
//
// disable conditions:
// 1. disable after rcr reload finish
// 2. logic clear
// 3. fault detected
//===============================================

reg								advtim_pe_gen_tim_enable;
reg								advtim_pe_gen_tim_enable_temp;
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
		advtim_pe_gen_tim_enable_temp <= 1'b0;
	else if(r0_gen_enable_af)
		advtim_pe_gen_tim_enable_temp <= 1'b1;
	else if(advtim_pe_gen_tim_enable)
		advtim_pe_gen_tim_enable_temp <= 1'b0;
	else
		advtim_pe_gen_tim_enable_temp <= advtim_pe_gen_tim_enable_temp;
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_gen_tim_enable <= 1'b0;
	else if(((advtim_pe_gen_tim_enable == 1'b1) && advtim_pe_gen_tim_end) || advtim_pe_gen_logic_clr || advtim_pe_fault_detected)
		advtim_pe_gen_tim_enable <= 1'b0;
	else if((advtim_pe_gen_tim_enable == 1'b0) && (advtim_pe_gen_tim_enable_temp))
		advtim_pe_gen_tim_enable <= 1'b1;
	else
		advtim_pe_gen_tim_enable <= advtim_pe_gen_tim_enable;
end

//===============================================
// advance timer input capture enable control
// sync operation
// Thus, this timer can be used in async.
//
// Spyglass Ac_conv01
// If logic clear signal occuring with enable_af(pulse),
// enable operation will miss.
//
// enable conditions:
// 1. enable pulse from regs
//
// disable conditions:
// 1. disable after rcr reload finish
// 2. logic clear
//===============================================

reg								advtim_pe_cap_tim_enable;
reg								advtim_pe_cap_tim_enable_temp;
wire							advtim_pe_cap_tim_end;
wire							advtim_pe_cap_logic_clr;
assign advtim_pe_cap_logic_clr = r1_logic_clr;

pos_step_sync2pulse u_advtim_cap_enable_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),	
	.des_clk					(module_clk),
	.des_rstn					(module_rstn),	

	.src_A						(r1_cap_enable),
	.des_Y						(r1_cap_enable_af)
);

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_cap_tim_enable_temp <= 1'b0;
	else if(r1_cap_enable_af)
		advtim_pe_cap_tim_enable_temp <= 1'b1;
	else if(advtim_pe_cap_tim_enable)
		advtim_pe_cap_tim_enable_temp <= 1'b0;
	else
		advtim_pe_cap_tim_enable_temp <= advtim_pe_cap_tim_enable_temp;
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_cap_tim_enable <= 1'b0;
	else if(((advtim_pe_cap_tim_enable == 1'b1) && advtim_pe_cap_tim_end) || advtim_pe_cap_logic_clr)
		advtim_pe_cap_tim_enable <= 1'b0;
	else if((advtim_pe_cap_tim_enable == 1'b0) && advtim_pe_cap_tim_enable_temp)
		advtim_pe_cap_tim_enable <= 1'b1;
	else
		advtim_pe_cap_tim_enable <= advtim_pe_cap_tim_enable;
end

//===============================================
// advance timer encoder input enable control
// sync operation
// Thus, this timer can be used in async.
//
// Spyglass Ac_conv01
// If logic clear signal occuring with enable_af(pulse),
// enable operation will miss.
//
// enable conditions:
// 1. enable from regs
//
// disable conditions:
// 1. disable from regs
// 2. logic clear
//===============================================

reg								advtim_pe_enc_tim_enable;
reg								advtim_pe_enc_tim_enable_temp;
wire							advtim_pe_enc_tim_end;
wire							advtim_pe_enc_logic_clr;
assign advtim_pe_enc_logic_clr = r2_logic_clr;

sync_ff_2d_2edge u_advtim_enc_enable_sync
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.A							(r2_enc_enable),
	.Y							(r2_enc_enable_af),
	.Y_r						(r2_enc_enable_af_r),
	.Y_f						(r2_enc_enable_af_f)
);

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_enc_tim_enable_temp <= 1'b0;
	else if(r2_enc_enable_af_r)
		advtim_pe_enc_tim_enable_temp <= 1'b1;
	else if(advtim_pe_enc_tim_enable)
		advtim_pe_enc_tim_enable_temp <= 1'b0;
	else
		advtim_pe_enc_tim_enable_temp <= advtim_pe_enc_tim_enable_temp;
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		advtim_pe_enc_tim_enable <= 1'b0;
	else if(r2_enc_enable_af_f || advtim_pe_enc_logic_clr)
		advtim_pe_enc_tim_enable <= 1'b0;
	else if((advtim_pe_enc_tim_enable == 1'b0) && advtim_pe_enc_tim_enable_temp)
		advtim_pe_enc_tim_enable <= 1'b1;
	else
		advtim_pe_enc_tim_enable <= advtim_pe_enc_tim_enable;
end

//===============================================
// advance timer input preprocess
//===============================================

wire							advtmr_bk1_afsync;
wire							advtmr_bk2_afsync;
wire							system_failure_afsync;

// using 3d is
// 1d 70% ~80%
// 2d 99%%
// 3d is used to detect negedge
sync_ff_2d u_sync_ff_2d_inst0
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_bk1),
	.Y							(advtmr_bk1_afsync)
);

sync_ff_2d u_sync_ff_2d_inst1
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_bk2),
	.Y							(advtmr_bk2_afsync)
);

sync_ff_2d u_sync_ff_2d_inst2
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(system_failure),
	.Y							(system_failure_afsync)
);

wire							advtmr_cap_ch1p_afsync;
wire							advtmr_cap_ch1n_afsync;

// using 3d is
// 1d 70% ~80%
// 2d 99%%
// 3d is used to detect negedge

sync_ff_2d u_sync_ff_2d_inst3
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_cap_ch1p),
	.Y							(advtmr_cap_ch1p_afsync)
);

sync_ff_2d u_sync_ff_2d_inst4
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_cap_ch1n),
	.Y							(advtmr_cap_ch1n_afsync)
);

wire							advtmr_enc_ch1p_afsync;
wire							advtmr_enc_ch1n_afsync;

// using 3d is
// 1d 70% ~80%
// 2d 99%%
// 3d is used to detect negedge

sync_ff_2d u_sync_ff_2d_inst5
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_enc_ch1p),
	.Y							(advtmr_enc_ch1p_afsync)
);

sync_ff_2d u_sync_ff_2d_inst6
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.A							(advtmr_enc_ch1n),
	.Y							(advtmr_enc_ch1n_afsync)
);

//===============================================
// advance timer core
//===============================================

advtim_pe_core u_advtim_pe_core 
(
	.pe_clk						(module_clk),  
	.pe_rstn					(module_rstn),

	.advtmr_pwm_ch1p			(advtmr_pwm_ch1p),
	.advtmr_pwm_ch1n			(advtmr_pwm_ch1n),
	.advtmr_pwm_ch2p			(advtmr_pwm_ch2p),
	.advtmr_pwm_ch2n			(advtmr_pwm_ch2n),
	.advtmr_pwm_ch3p			(advtmr_pwm_ch3p),
	.advtmr_pwm_ch3n			(advtmr_pwm_ch3n),
	.advtmr_pwm_ch4				(advtmr_pwm_ch4),
	.advtmr_pwm_ch5				(advtmr_pwm_ch5),
	.advtmr_pwm_ch6				(advtmr_pwm_ch6),
	.advtmr_pwm_ch1p_oen		(advtmr_pwm_ch1p_oen),
	.advtmr_pwm_ch1n_oen		(advtmr_pwm_ch1n_oen),
	.advtmr_pwm_ch2p_oen		(advtmr_pwm_ch2p_oen),
	.advtmr_pwm_ch2n_oen		(advtmr_pwm_ch2n_oen),
	.advtmr_pwm_ch3p_oen		(advtmr_pwm_ch3p_oen),
	.advtmr_pwm_ch3n_oen		(advtmr_pwm_ch3n_oen),
	.advtmr_pwm_ch4_oen			(advtmr_pwm_ch4_oen),
	.advtmr_pwm_ch5_oen			(advtmr_pwm_ch5_oen),
	.advtmr_pwm_ch6_oen			(advtmr_pwm_ch6_oen),
	.advtmr_bk1					(advtmr_bk1_afsync),
	.advtmr_bk2					(advtmr_bk2_afsync),
	.advtmr_bk1_oen				(advtmr_bk1_oen),
	.advtmr_bk2_oen				(advtmr_bk2_oen),
	.advtmr_cap_ch1p			(advtmr_cap_ch1p_afsync),
	.advtmr_cap_ch1n			(advtmr_cap_ch1n_afsync),
	.advtmr_cap_ch1p_oen		(advtmr_cap_ch1p_oen),
	.advtmr_cap_ch1n_oen		(advtmr_cap_ch1n_oen),
	.advtmr_enc_ch1p			(advtmr_enc_ch1p_afsync),
	.advtmr_enc_ch1n			(advtmr_enc_ch1n_afsync),
	.advtmr_enc_ch1p_oen		(advtmr_enc_ch1p_oen),
	.advtmr_enc_ch1n_oen		(advtmr_enc_ch1n_oen),

	.system_failure				(system_failure_afsync),

	.advtim_pe_gen_tim_enable	(advtim_pe_gen_tim_enable),
	.advtim_pe_gen_tim_end		(advtim_pe_gen_tim_end),
	.advtim_pe_gen_logic_clr	(advtim_pe_gen_logic_clr),
	.advtim_pe_gen_hw_update	(advtim_pe_gen_hw_update),
	.advtim_pe_gen_running		(advtim_pe_gen_running),
	.advtim_pe_fault_detected	(advtim_pe_fault_detected),
	.advtim_pe_cap_tim_enable	(advtim_pe_cap_tim_enable),
	.advtim_pe_cap_tim_end		(advtim_pe_cap_tim_end),
	.advtim_pe_cap_logic_clr	(advtim_pe_cap_logic_clr),
	.advtim_pe_cap_hw_update	(advtim_pe_cap_hw_update),
	.advtim_pe_cap_running		(advtim_pe_cap_running),
	.advtim_pe_enc_tim_enable	(advtim_pe_enc_tim_enable),
	.advtim_pe_enc_logic_clr	(advtim_pe_enc_logic_clr),
	.advtim_pe_enc_hw_update	(advtim_pe_enc_hw_update),
	.advtim_pe_enc_running		(advtim_pe_enc_running),

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
	.r0_bt						(r0_bt),
	.r0_bk2p					(r0_bk2p),
	.r0_bk2e					(r0_bk2e),
	.r0_bk1p					(r0_bk1p),
	.r0_bk1e					(r0_bk1e),
	.r0_dtg						(r0_dtg),
	.r1_psc						(r1_psc),
	.r1_arr						(r1_arr),
	.r1_rcr						(r1_rcr),
	.r1_ic1m					(r1_ic1m),
	.r1_bt						(r1_bt),
	.r1_cc1p					(r1_cc1p),
	.r1_cc1np					(r1_cc1np),
	.r1_cc1e					(r1_cc1e),
	.r1_cc1ne					(r1_cc1ne),
	.r1_ifr						(r1_ifr),
	.r1_ilr						(r1_ilr),
	.r1_ifc						(r1_ifc),
	.r1_ilc						(r1_ilc),
	.r2_arr						(r2_arr),
	.r2_bt						(r2_bt),
	.r2_ec1m					(r2_ec1m),
	.r2_ec1p					(r2_ec1p),
	.r2_ec1np					(r2_ec1np),
	.r2_ec1e					(r2_ec1e),
	.r2_ec1ne					(r2_ec1ne),
	.r2_ec						(r2_ec),
	.r2_ed						(r2_ed),

	.int0_status_gen_fault_detected		(int0_tgr[2]),
	.int0_status_gen_end				(int0_tgr[1]),
	.int0_status_gen_reloaded			(int0_tgr[0]),
	.int1_status_cap_end				(int1_tgr[1]),
	.int1_status_cap_reloaded			(int1_tgr[0]),
	.int2_status_enc_detected			(int2_tgr[1]),
	.int2_status_enc_reloaded			(int2_tgr[0])
);

//===============================================
// advtim interrupt management
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign advtim_gen_int_line = |int0_line;

pos_step_sync2pulse
#(
	.WIDTH						(3)
)
u_int0_detect 
(
	.src_clk					(module_clk),
	.src_rstn					(module_rstn),
	.des_clk					(reg_clk),
	.des_rstn					(reg_rstn),
	.src_A						(int0_tgr),
	.des_Y						(int0_pos)
);

interrupt_gen 
#(
	.WIDTH						(3)
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

assign advtim_cap_int_line = |int1_line;

pos_step_sync2pulse
#(
	.WIDTH						(2)
)
u_int1_detect 
(
	.src_clk					(module_clk),
	.src_rstn					(module_rstn),
	.des_clk					(reg_clk),
	.des_rstn					(reg_rstn),
	.src_A						(int1_tgr),
	.des_Y						(int1_pos)
);

interrupt_gen 
#(
	.WIDTH						(2)
)
u_interrupt1_gen
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),

	.int_en						(int1_en),
	.int_tgr					(int1_pos),
	.int_clr					(int1_clr),
	.int_sta					(int1_sta),
	.int_line					(int1_line)	
);

assign advtim_enc_int_line = |int2_line;

pos_step_sync2pulse
#(
	.WIDTH						(2)
)
u_int2_detect 
(
	.src_clk					(module_clk),
	.src_rstn					(module_rstn),
	.des_clk					(reg_clk),
	.des_rstn					(reg_rstn),
	.src_A						(int2_tgr),
	.des_Y						(int2_pos)
);

interrupt_gen 
#(
	.WIDTH						(2)
)
u_interrupt2_gen
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),

	.int_en						(int2_en),
	.int_tgr					(int2_pos),
	.int_clr					(int2_clr),
	.int_sta					(int2_sta),
	.int_line					(int2_line)	
);

endmodule

