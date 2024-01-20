//===============================================
//
//	File: gpio_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01082024
//	Version: v1.0
//
// 	This is regs wrap for gpio.
//
//===============================================

module gpio_regs_wrap 
(
	// regs interface
	input  						reg_clk,  
	input  						reg_rstn,
	input 		[31:0]			paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 		[31:0]			pwdata, 
	output		[31:0]			prdata,

	// regs
	output		[31:0]			r_mode,
	output		[15:0]			r_type,
	output		[31:0]			r_speed,
	output		[31:0]			r_pupd,
	output		[15:0]			r_od,
	output		[15:0]			r_toggle,
	output		[31:0]			r_af,
	output		[31:0]			r_inttrig,
	input		[15:0]			r_id,

	// interrupt control & status
	output		[15:0]			r_int_en,
	output		[15:0]			r_int_clr,
	input		[15:0]			r_int_sta
);

//===============================================
// gpio regs
//===============================================

gpio_apb_cfg u_gpio_apb_cfg
(
	.clk						(reg_clk),
	.rst_n						(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),
	.r_modex					(r_mode),	
	.r_typex					(r_type),
	.r_speedx					(r_speed),
	.r_pupdx					(r_pupd),	
	.r_odx						(r_od),
	.r_togglex					(r_toggle),
	.r_afx						(r_af),
	.r_inttrigx					(r_inttrig),
	.r_intx_en					(r_int_en),
	.r_intx_clr					(r_int_clr),
	.r_idx						(r_id),	
	.r_intx_sta					(r_int_sta)
);

endmodule

