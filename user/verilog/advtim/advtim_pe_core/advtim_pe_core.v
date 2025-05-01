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
//	4. Timing base counter & encoder input.
//	5. Sensor input.
//	6. Other detection issue.
//
//===============================================

module advtim_pe_core
(
	input  						pe_clk,  
	input  						pe_rstn,

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

	// control
	input						advtim_pe_gen_tim_enable,
	output						advtim_pe_gen_tim_end,
	input						advtim_pe_gen_logic_clr,
	output						advtim_pe_gen_hw_update,
	output						advtim_pe_gen_running,
	output						advtim_pe_fault_detected,
	input						advtim_pe_cap_tim_enable,
	output						advtim_pe_cap_tim_end,
	input						advtim_pe_cap_logic_clr,
	output						advtim_pe_cap_hw_update,
	output						advtim_pe_cap_running,
	input						advtim_pe_enc_tim_enable,
	input						advtim_pe_enc_logic_clr,
	output						advtim_pe_enc_hw_update,
	output						advtim_pe_enc_running,

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
	input 		[ 3:0]			r0_bt,
	input 						r0_bk2p,
	input 						r0_bk2e,
	input 						r0_bk1p,
	input 						r0_bk1e,
	input 		[ 9:0]			r0_dtg,
	input 		[15:0]			r1_psc,
	input 		[15:0]			r1_arr,
	input 		[15:0]			r1_rcr,
	input						r1_ic1m,
	input		[ 3:0]			r1_bt,
	input						r1_cc1p,
	input						r1_cc1np,
	input						r1_cc1e,
	input						r1_cc1ne,
	output		[15:0]			r1_ifr,
	output		[15:0]			r1_ilr,
	output		[15:0]			r1_ifc,
	output		[15:0]			r1_ilc,
	input		[23:0]			r2_arr,
	input		[ 3:0]			r2_bt,
	input						r2_ec1m,
	input						r2_ec1p,
	input						r2_ec1np,
	input						r2_ec1e,
	input						r2_ec1ne,
	output		[15:0]			r2_ec,
	output						r2_ed,

	// interrupt status
	output						int0_status_gen_fault_detected,
	output						int0_status_gen_end,
	output						int0_status_gen_reloaded,
	output						int1_status_cap_end,
	output						int1_status_cap_reloaded,
	output						int2_status_enc_detected,
	output						int2_status_enc_reloaded
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

wire							fault_detected;
assign advtim_pe_fault_detected = fault_detected;

wire							ic1prefc;
wire							ic1nrefc;
wire							ic1prefc_d;
wire							ic1nrefc_d;

wire							ic1prefc_first_detected;
wire							ic1prefc_second_detected;
wire							ic1nrefc_first_detected;
wire							ic1nrefc_second_detected;
wire							ic1prefc_first_valid;
wire							ic1prefc_second_valid;
wire							ic1nrefc_first_valid;
wire							ic1nrefc_second_valid;
wire							ic1prefc_first_capturing;
wire							ic1prefc_second_capturing;
wire							ic1nrefc_first_capturing;
wire							ic1nrefc_second_capturing;

wire							cap_cnt_pre_end;
wire							cap_cnt_enable;
assign advtim_pe_cap_running = cap_cnt_enable;// for config lock

wire							ec1prefc;
wire							ec1nrefc;

wire							ec1prefc_first_detected;
wire							ec1prefc_second_detected;
wire							ec1nrefc_first_detected;
wire							ec1nrefc_second_detected;
wire							ec1prefc_first_valid;
wire							ec1prefc_second_valid;
wire							ec1nrefc_first_valid;
wire							ec1nrefc_second_valid;
wire							ec1prefc_first_capturing;
wire							ec1prefc_second_capturing;
wire							ec1nrefc_first_capturing;
wire							ec1nrefc_second_capturing;

wire							enc_cnt_pre_end;
wire							enc_cnt_enable;
assign advtim_pe_enc_running = enc_cnt_enable;// for config lock

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
	.fault_detected				(fault_detected),

	.int_status_gen_end			(int0_status_gen_end),
	.int_status_gen_reloaded	(int0_status_gen_reloaded)
);

//===============================================
// advance timer
// timing base counter
// input capture
//===============================================

advtim_cnt_cap u_advtim_cnt_cap 
(
	.pe_cap_clk					(pe_clk),  
	.pe_cap_rstn				(pe_rstn),

	.ic1prefc					(ic1prefc),
	.ic1nrefc					(ic1nrefc),
	.ic1prefc_d					(ic1prefc_d),
	.ic1nrefc_d					(ic1nrefc_d),
	
	.pe_cap_tim_enable			(advtim_pe_cap_tim_enable),
	.pe_cap_tim_end				(advtim_pe_cap_tim_end),
	.pe_cap_logic_clr			(advtim_pe_cap_logic_clr),
	.pe_cap_hw_update			(advtim_pe_cap_hw_update),

	.r_psc						(r1_psc),
	.r_arr						(r1_arr),
	.r_rcr						(r1_rcr),
	.r_ic1m						(r1_ic1m),

	.ic1prefc_first_detected	(ic1prefc_first_detected),
	.ic1prefc_second_detected	(ic1prefc_second_detected),
	.ic1nrefc_first_detected	(ic1nrefc_first_detected),
	.ic1nrefc_second_detected	(ic1nrefc_second_detected),
	.ic1prefc_first_valid		(ic1prefc_first_valid),
	.ic1prefc_second_valid		(ic1prefc_second_valid),
	.ic1nrefc_first_valid		(ic1nrefc_first_valid),
	.ic1nrefc_second_valid		(ic1nrefc_second_valid),
	.ic1prefc_first_capturing	(ic1prefc_first_capturing),
	.ic1prefc_second_capturing	(ic1prefc_second_capturing),
	.ic1nrefc_first_capturing	(ic1nrefc_first_capturing),
	.ic1nrefc_second_capturing	(ic1nrefc_second_capturing),

	.r_ifr						(r1_ifr),
	.r_ilr						(r1_ilr),
	.r_ifc						(r1_ifc),
	.r_ilc						(r1_ilc),
	
	.cap_cnt_pre_end			(cap_cnt_pre_end),
	.cap_cnt_enable				(cap_cnt_enable),

	.int_status_cap_end			(int1_status_cap_end),
	.int_status_cap_reloaded	(int1_status_cap_reloaded)
);

//===============================================
// advance timer
// timing base counter
// encoder input
//===============================================

advtim_cnt_enc u_advtim_cnt_enc 
(
	.pe_enc_clk					(pe_clk),  
	.pe_enc_rstn				(pe_rstn),

	.ec1prefc					(ec1prefc),
	.ec1nrefc					(ec1nrefc),
	
	.pe_enc_tim_enable			(advtim_pe_enc_tim_enable),
	.pe_enc_logic_clr			(advtim_pe_enc_logic_clr),
	.pe_enc_hw_update			(advtim_pe_enc_hw_update),

	.r_arr						(r2_arr),
	.r_ec1m						(r2_ec1m),
	.r_ec1p						(r2_ec1p),
	.r_ec1np					(r2_ec1np),
	.r_ec1e						(r2_ec1e),
	.r_ec1ne					(r2_ec1ne),

	.ec1prefc_first_detected	(ec1prefc_first_detected),
	.ec1prefc_second_detected	(ec1prefc_second_detected),
	.ec1nrefc_first_detected	(ec1nrefc_first_detected),
	.ec1nrefc_second_detected	(ec1nrefc_second_detected),
	.ec1prefc_first_valid		(ec1prefc_first_valid),
	.ec1prefc_second_valid		(ec1prefc_second_valid),
	.ec1nrefc_first_valid		(ec1nrefc_first_valid),
	.ec1nrefc_second_valid		(ec1nrefc_second_valid),
	.ec1prefc_first_capturing	(ec1prefc_first_capturing),
	.ec1prefc_second_capturing	(ec1prefc_second_capturing),
	.ec1nrefc_first_capturing	(ec1nrefc_first_capturing),
	.ec1nrefc_second_capturing	(ec1nrefc_second_capturing),

	.r_ec						(r2_ec),
	.r_ed						(r2_ed),
	
	.enc_cnt_pre_end			(enc_cnt_pre_end),
	.enc_cnt_enable				(enc_cnt_enable),

	.int_status_enc_detected	(int2_status_enc_detected),
	.int_status_enc_reloaded	(int2_status_enc_reloaded)
);

//===============================================
// channel control
//===============================================

channel_ctrl u_channel_ctrl
(
	.pe_gen_clk					(pe_clk),  
	.pe_gen_rstn				(pe_rstn),
	.pe_cap_clk					(pe_clk),  
	.pe_cap_rstn				(pe_rstn),
	.pe_enc_clk					(pe_clk),  
	.pe_enc_rstn				(pe_rstn),
	
	.r0_dze1					(r0_dze1),
	.r0_ss1						(r0_ss1),
	.r0_ss1n					(r0_ss1n),
	.r0_moe1					(r0_moe1),
	.r0_moe1n					(r0_moe1n),
	.r0_cc1p					(r0_cc1p),
	.r0_cc1np					(r0_cc1np),
	.r0_cc1e					(r0_cc1e),
	.r0_cc1ne					(r0_cc1ne),
	.r0_dze2					(r0_dze2),
	.r0_ss2						(r0_ss2),
	.r0_ss2n					(r0_ss2n),
	.r0_moe2					(r0_moe2),
	.r0_moe2n					(r0_moe2n),
	.r0_cc2p					(r0_cc2p),
	.r0_cc2np					(r0_cc2np),
	.r0_cc2e					(r0_cc2e),
	.r0_cc2ne					(r0_cc2ne),
	.r0_dze3					(r0_dze3),
	.r0_ss3						(r0_ss3),
	.r0_ss3n					(r0_ss3n),
	.r0_moe3					(r0_moe3),
	.r0_moe3n					(r0_moe3n),
	.r0_cc3p					(r0_cc3p),
	.r0_cc3np					(r0_cc3np),
	.r0_cc3e					(r0_cc3e),
	.r0_cc3ne					(r0_cc3ne),
	.r0_ss4						(r0_ss4),
	.r0_cc4p					(r0_cc4p),
	.r0_cc4e					(r0_cc4e),
	.r0_ss5						(r0_ss5),
	.r0_cc5p					(r0_cc5p),
	.r0_cc5e					(r0_cc5e),
	.r0_ss6						(r0_ss6),
	.r0_cc6p					(r0_cc6p),
	.r0_cc6e					(r0_cc6e),
	.r0_dtg						(r0_dtg),

	.pwm_channel_output_enable	(gen_cnt_enable),
	.fault_detected				(fault_detected),

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

	.pwm_channel1p				(advtmr_pwm_ch1p),
	.pwm_channel1n				(advtmr_pwm_ch1n),
	.pwm_channel2p				(advtmr_pwm_ch2p),
	.pwm_channel2n				(advtmr_pwm_ch2n),
	.pwm_channel3p				(advtmr_pwm_ch3p),
	.pwm_channel3n				(advtmr_pwm_ch3n),
	.pwm_channel4				(advtmr_pwm_ch4),
	.pwm_channel5				(advtmr_pwm_ch5),
	.pwm_channel6				(advtmr_pwm_ch6),
	.pwm_channel1p_oen			(advtmr_pwm_ch1p_oen),
	.pwm_channel1n_oen			(advtmr_pwm_ch1n_oen),
	.pwm_channel2p_oen			(advtmr_pwm_ch2p_oen),
	.pwm_channel2n_oen			(advtmr_pwm_ch2n_oen),
	.pwm_channel3p_oen			(advtmr_pwm_ch3p_oen),
	.pwm_channel3n_oen			(advtmr_pwm_ch3n_oen),
	.pwm_channel4_oen  			(advtmr_pwm_ch4_oen),
	.pwm_channel5_oen  			(advtmr_pwm_ch5_oen),
	.pwm_channel6_oen  			(advtmr_pwm_ch6_oen),

	.r1_bt						(r1_bt),
	.r1_cc1p					(r1_cc1p),
	.r1_cc1np					(r1_cc1np),
	.r1_cc1e					(r1_cc1e),
	.r1_cc1ne					(r1_cc1ne),

	.cap_channel_input_enable	(cap_cnt_enable),

	.ic1prefc					(ic1prefc),
	.ic1nrefc					(ic1nrefc),
	.ic1prefc_d					(ic1prefc_d),
	.ic1nrefc_d					(ic1nrefc_d),

	.ic1prefc_first_detected	(ic1prefc_first_detected),
	.ic1prefc_second_detected	(ic1prefc_second_detected),
	.ic1nrefc_first_detected	(ic1nrefc_first_detected),
	.ic1nrefc_second_detected	(ic1nrefc_second_detected),
	.ic1prefc_first_valid		(ic1prefc_first_valid),
	.ic1prefc_second_valid		(ic1prefc_second_valid),
	.ic1nrefc_first_valid		(ic1nrefc_first_valid),
	.ic1nrefc_second_valid		(ic1nrefc_second_valid),
	.ic1prefc_first_capturing	(ic1prefc_first_capturing),
	.ic1prefc_second_capturing	(ic1prefc_second_capturing),
	.ic1nrefc_first_capturing	(ic1nrefc_first_capturing),
	.ic1nrefc_second_capturing	(ic1nrefc_second_capturing),

	.cap_channel1p				(advtmr_cap_ch1p),
	.cap_channel1n				(advtmr_cap_ch1n),
	.cap_channel1p_oen			(advtmr_cap_ch1p_oen),
	.cap_channel1n_oen			(advtmr_cap_ch1n_oen),

	.r2_bt						(r2_bt),
	.r2_ec1p					(r2_ec1p),
	.r2_ec1np					(r2_ec1np),
	.r2_ec1e					(r2_ec1e),
	.r2_ec1ne					(r2_ec1ne),

	.enc_channel_input_enable	(enc_cnt_enable),

	.ec1prefc					(ec1prefc),
	.ec1nrefc					(ec1nrefc),

	.ec1prefc_first_detected	(ec1prefc_first_detected),
	.ec1prefc_second_detected	(ec1prefc_second_detected),
	.ec1nrefc_first_detected	(ec1nrefc_first_detected),
	.ec1nrefc_second_detected	(ec1nrefc_second_detected),
	.ec1prefc_first_valid		(ec1prefc_first_valid),
	.ec1prefc_second_valid		(ec1prefc_second_valid),
	.ec1nrefc_first_valid		(ec1nrefc_first_valid),
	.ec1nrefc_second_valid		(ec1nrefc_second_valid),
	.ec1prefc_first_capturing	(ec1prefc_first_capturing),
	.ec1prefc_second_capturing	(ec1prefc_second_capturing),
	.ec1nrefc_first_capturing	(ec1nrefc_first_capturing),
	.ec1nrefc_second_capturing	(ec1nrefc_second_capturing),

	.enc_channel1p				(advtmr_enc_ch1p),
	.enc_channel1n				(advtmr_enc_ch1n),
	.enc_channel1p_oen			(advtmr_enc_ch1p_oen),
	.enc_channel1n_oen			(advtmr_enc_ch1n_oen)
);

//===============================================
// advance timer fault detect
//===============================================

fault_detection u_fault_detection
(
	.pe_gen_clk							(pe_clk),  
	.pe_gen_rstn						(pe_rstn),

	.r_bt								(r0_bt),
	.r_bk2p								(r0_bk2p),
	.r_bk2e								(r0_bk2e),
	.r_bk1p								(r0_bk1p),
	.r_bk1e								(r0_bk1e),

	.advtmr_bk1							(advtmr_bk1),
	.advtmr_bk2							(advtmr_bk2),
	.advtmr_bk1_oen						(advtmr_bk1_oen),
	.advtmr_bk2_oen						(advtmr_bk2_oen),
	.system_failure						(system_failure),

	.fault_detected						(fault_detected),
	.int_status_gen_fault_detected		(int0_status_gen_fault_detected)
);


//===============================================
// sensor input
// encoder
//===============================================

//===============================================
// sensor input
// hall sensor
// zero detect senorless
//===============================================



endmodule

