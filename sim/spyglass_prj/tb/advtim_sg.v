//===============================================
//
//	File: advtim_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 11172024
//	Version: v1.0
//
//	This is used for advance timer spyglass analysis.
//
//===============================================

module advtim_sg 
(
	// module interface
	input  						apb2_root_clk,  
	input  						apb2_root_rstn,
	input  						advtim_clk,  
	input  						advtim_rstn,

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

wire							advtim_rstn_af;
wire							apb2_root_rstn_af;

rstn_sync u_rstn_sync0
(
	.clk						(advtim_clk),
	.rstn						(advtim_rstn),

	.sync_rstn					(advtim_rstn_af)
);

rstn_sync u_rstn_sync1
(
	.clk						(apb2_root_clk),
	.rstn						(apb2_root_rstn),

	.sync_rstn					(apb2_root_rstn_af)
);

advtim_top u_advtim
(
	.module_clk					(advtim_clk),  
	.module_rstn				(advtim_rstn_af),
	
	.reg_clk					(apb2_root_clk),
	.reg_rstn					(apb2_root_rstn_af),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

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
	.advtmr_bk1					(advtmr_bk1),
	.advtmr_bk2					(advtmr_bk2),
	.advtmr_bk1_oen				(advtmr_bk1_oen),
	.advtmr_bk2_oen				(advtmr_bk2_oen),
	.advtmr_cap_ch1p			(advtmr_cap_ch1p),
	.advtmr_cap_ch1n			(advtmr_cap_ch1n),
	.advtmr_cap_ch1p_oen		(advtmr_cap_ch1p_oen),
	.advtmr_cap_ch1n_oen		(advtmr_cap_ch1n_oen),
	.advtmr_enc_ch1p			(advtmr_enc_ch1p),
	.advtmr_enc_ch1n			(advtmr_enc_ch1n),
	.advtmr_enc_ch1p_oen		(advtmr_enc_ch1p_oen),
	.advtmr_enc_ch1n_oen		(advtmr_enc_ch1n_oen),

	.system_failure				(system_failure),

	.advtim_gen_int_line		(advtim_gen_int_line),
	.advtim_cap_int_line		(advtim_cap_int_line),
	.advtim_enc_int_line		(advtim_enc_int_line)
);

endmodule

