//===============================================
//
//	File: advtim_pe_core.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11102024
//	Version: v1.0
//
// 	This is channel core for advance timer.
//	This core is including:
//	1. Main fsm
//	2. Timing base counter & pwm generator.
//	3. Timing base counter & input capture.
//	4. Sensor input.
//	5. Other detection issue.
//
//===============================================

module advtim_pe_core
(
	input  						pe_clk,  
	input  						pe_rstn,

	// control
	input						advtim_pe_gen_tim_enable,
	output						advtim_pe_gen_tim_end,
	input						advtim_pe_gen_logic_clr,
	output						advtim_pe_gen_hw_update,
	output						advtim_pe_gen_running,

	//configs
	input 		[15:0]			r0_psc,
	input 		[15:0]			r0_arr,
	input 		[15:0]			r0_rcr,
	input		[ 1:0]			r0_cms,
	input						r0_dir,
	input		[15:0]			r0_cc1,
	input						r0_go1, 
	input						r0_go1n, 
	input						r0_ss1,	 
	input						r0_ss1n, 
	input						r0_moe1, 
	input						r0_moe1n,
	input						r0_dze1,
	input						r0_cc1p,
	input						r0_cc1np,
	input						r0_cc1e,
	input						r0_cc1ne,
	input		[ 3:0]			r0_oc1m,
	input		[15:0]			r0_cc2,
	input						r0_go2, 
	input						r0_go2n, 
	input						r0_ss2,	 
	input						r0_ss2n, 
	input						r0_moe2, 
	input						r0_moe2n,
	input						r0_dze2,
	input						r0_cc2p,
	input						r0_cc2np,
	input						r0_cc2e,
	input						r0_cc2ne,
	input		[ 3:0]			r0_oc2m,
	input 		[15:0]			r0_cc3,
	input						r0_go3, 
	input						r0_go3n, 
	input						r0_ss3,	 
	input						r0_ss3n, 
	input						r0_moe3, 
	input						r0_moe3n,
	input						r0_dze3,
	input						r0_cc3p,
	input						r0_cc3np,
	input						r0_cc3e,
	input						r0_cc3ne,
	input 		[ 3:0]			r0_oc3m,
	input 		[15:0]			r0_cc4,
	input						r0_ss4,	 
	input						r0_cc4p,
	input						r0_cc4e,
	input 		[ 3:0]			r0_oc4m,
	input 		[15:0]			r0_cc5,
	input 						r0_cc5c3,
	input 						r0_cc5c2,
	input 						r0_cc5c1,
	input						r0_ss5,	 
	input						r0_cc5p,
	input						r0_cc5e,
	input 		[ 3:0]			r0_oc5m,
	input 		[15:0]			r0_cc6,
	input						r0_ss6,	 
	input						r0_cc6p,
	input						r0_cc6e,
	input 		[ 3:0]			r0_oc6m,
	input 						r0_bk2p,
	input 						r0_bk2e,
	input 						r0_bk1p,
	input 						r0_bk1e,
	input 		[ 9:0]			r0_dtg,

	// interrupt status
	output						int0_status_gen_end,
	output						int0_status_gen_reload
);

//===============================================
//
//===============================================

wire							oc1refc;
wire							oc2refc;
wire							oc3refc;
wire							oc4refc;
wire							oc5refc;
wire							oc6refc;
wire							oc5c1refc;
wire							oc5c2refc;
wire							oc5c3refc;

wire							oc1po;
wire							oc1no;
wire							oc2po;
wire							oc2no;
wire							oc3po;
wire							oc3no;

wire							gen_cnt_dir;
wire							gen_cnt_pre_end;
wire							gen_cnt_enable;

assign advtim_pe_gen_running = gen_cnt_enable;// for config lock

//===============================================
// advance timer main fsm
//===============================================


//===============================================
// advance timer
// timing base counter
// pwm generator
//===============================================

advtim_cnt_gen u_advtim_cnt_gen
(
	.pe_gen_clk					(pe_clk),  
	.pe_gen_rstn				(pe_rstn),
                                              
	.pe_gen_tim_enable			(advtim_pe_gen_tim_enable),
	.pe_gen_tim_end				(advtim_pe_gen_tim_end),
	.pe_gen_logic_clr			(advtim_pe_gen_logic_clr),
	.pe_gen_hw_update			(advtim_pe_gen_hw_update),

	.r_psc						(r0_psc),
	.r_arr						(r0_arr),
	.r_rcr						(r0_rcr),
	.r_cms						(r0_cms),
	.r_dir						(r0_dir),
	.r_cc1						(r0_cc1),
	.r_oc1m						(r0_oc1m),
	.r_cc2						(r0_cc2),
	.r_oc2m						(r0_oc2m),
	.r_cc3						(r0_cc3),
	.r_oc3m						(r0_oc3m),
	.r_cc4						(r0_cc4),
	.r_oc4m						(r0_oc4m),
	.r_cc5						(r0_cc5),
	.r_cc5c3					(r0_cc5c3),
	.r_cc5c2					(r0_cc5c2),
	.r_cc5c1					(r0_cc5c1),
	.r_oc5m						(r0_oc5m),
	.r_cc6						(r0_cc6),
	.r_oc6m						(r0_oc6m),

	.oc1refc					(oc1refc),
	.oc2refc					(oc2refc),
	.oc3refc					(oc3refc),
	.oc4refc					(oc4refc),
	.oc5refc					(oc5refc),
	.oc6refc					(oc6refc),
	.oc5c1refc					(oc5c1refc),
	.oc5c2refc					(oc5c2refc),
	.oc5c3refc					(oc5c3refc),


	.gen_cnt_dir				(gen_cnt_dir),
	.gen_cnt_pre_end			(gen_cnt_pre_end),
	.gen_cnt_enable				(gen_cnt_enable),

	.int_status_gen_end			(int0_status_gen_end),
	.int_status_gen_reload		(int0_status_gen_reload)
);

//===============================================
// advance timer
// timing base counter
// input capture
//===============================================


//===============================================
// channel control
//===============================================

channel_ctrl u_channel_ctrl
(
	.pe_gen_clk					(pe_clk),  
	.pe_gen_rstn				(pe_rstn),
	
	.r_dze1						(r0_dze1),
	.r_ss1						(r0_ss1),
	.r_ss1n						(r0_ss1n),
	.r_moe1						(r0_moe1),
	.r_moe1n					(r0_moe1n),
	.r_cc1p						(r0_cc1p),
	.r_cc1np					(r0_cc1np),
	.r_cc1e						(r0_cc1e),
	.r_cc1ne					(r0_cc1ne),
	.r_dze2						(r0_dze2),
	.r_ss2						(r0_ss2),
	.r_ss2n						(r0_ss2n),
	.r_moe2						(r0_moe2),
	.r_moe2n					(r0_moe2n),
	.r_cc2p						(r0_cc2p),
	.r_cc2np					(r0_cc2np),
	.r_cc2e						(r0_cc2e),
	.r_cc2ne					(r0_cc2ne),
	.r_dze3						(r0_dze3),
	.r_ss3						(r0_ss3),
	.r_ss3n						(r0_ss3n),
	.r_moe3						(r0_moe3),
	.r_moe3n					(r0_moe3n),
	.r_cc3p						(r0_cc3p),
	.r_cc3np					(r0_cc3np),
	.r_cc3e						(r0_cc3e),
	.r_cc3ne					(r0_cc3ne),
	.r_ss4						(r0_ss4),
	.r_cc4p						(r0_cc4p),
	.r_cc4e						(r0_cc4e),
	.r_ss5						(r0_ss5),
	.r_cc5p						(r0_cc5p),
	.r_cc5e						(r0_cc5e),
	.r_ss6						(r0_ss6),
	.r_cc6p						(r0_cc6p),
	.r_cc6e						(r0_cc6e),
	.r_dtg						(r0_dtg),

	.channel_output_enable		(gen_cnt_enable),

	.oc1refc					(oc1refc),
	.oc2refc					(oc2refc),
	.oc3refc					(oc3refc),
	.oc4refc					(oc4refc),
	.oc5refc					(oc5refc),
	.oc6refc					(oc6refc),
	.oc5c1refc					(oc5c1refc),
	.oc5c2refc					(oc5c2refc),
	.oc5c3refc					(oc5c3refc),

	// ??? controlled by computation event
//	.oc1po						(oc1po),
//	.oc1no						(oc1no),
	.oc1po						(r0_go1),
	.oc1no						(r0_go1n),
	.oc2po						(r0_go2),
	.oc2no						(r0_go2n),
	.oc3po						(r0_go3),
	.oc3no						(r0_go3n),

	.channel1p_oen				(),
	.channel1n_oen				(),
	.channel2p_oen				(),
	.channel2n_oen				(),
	.channel3p_oen				(),
	.channel3n_oen				(),
	.channel4_oen				(),
	.channel5_oen				(),
	.channel6_oen				(),
	.channel1p					(),
	.channel1n					(),
	.channel2p					(),
	.channel2n					(),
	.channel3p					(),
	.channel3n					(),
	.channel4					(),
	.channel5					(),
	.channel6					()
);

//===============================================
// advance timer fault detect
//===============================================




//===============================================
// sensor input
// hall sensor
// zero detect senorless
//===============================================



endmodule

