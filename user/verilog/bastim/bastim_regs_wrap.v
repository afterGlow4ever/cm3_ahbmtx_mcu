//===============================================
//
//	File: bastim_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01212024
//	Version: v1.0
//
// 	This is regs wrap for basic timer.
//
//===============================================

module bastim_regs_wrap 
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

	//control
	output		[ 3:0]			r_auto_reload,
	output		[ 3:0]			r_tim_enable,

	//configs
	output reg	[63:0]			r_psc,
	output reg	[63:0]			r_arr,
	output reg	[63:0]			r_startcnt,

	// interrupt control & status
	output		[ 3:0]			r_int_en,
	output		[ 3:0]			r_int_clr,
	input		[ 3:0]			r_int_sta
);

wire							r_ch0_update;
wire							r_ch1_update;
wire							r_ch2_update;
wire							r_ch3_update;
wire			[15:0]			r_ch0_psc_shadow;
wire			[15:0]			r_ch0_arr_shadow;
wire			[15:0]			r_ch0_startcnt_shadow;
wire			[15:0]			r_ch1_psc_shadow;
wire			[15:0]			r_ch1_arr_shadow;
wire			[15:0]			r_ch1_startcnt_shadow;
wire			[15:0]			r_ch2_psc_shadow;
wire			[15:0]			r_ch2_arr_shadow;
wire			[15:0]			r_ch2_startcnt_shadow;
wire			[15:0]			r_ch3_psc_shadow;
wire			[15:0]			r_ch3_arr_shadow;
wire			[15:0]			r_ch3_startcnt_shadow;

wire							r_ch0_auto_reload;
wire							r_ch1_auto_reload;
wire							r_ch2_auto_reload;
wire							r_ch3_auto_reload;
wire							r_ch0_tim_enable;
wire							r_ch1_tim_enable;
wire							r_ch2_tim_enable;
wire							r_ch3_tim_enable;

assign r_auto_reload = {r_ch3_auto_reload, r_ch2_auto_reload, r_ch1_auto_reload, r_ch0_auto_reload};
assign r_tim_enable = {r_ch3_tim_enable, r_ch2_tim_enable, r_ch1_tim_enable, r_ch0_tim_enable};

//===============================================
// bastim regs shadow update
// some static config update only by writing update bit 
//===============================================

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r_psc[15:0] <= 16'h000a;
		r_arr[15:0] <= 16'h0028;
		r_startcnt[15:0] <= 16'h0;
	end
	else if(r_ch0_update == 1'b1)
	begin
			r_psc[15:0] <= r_ch0_psc_shadow;
			r_arr[15:0] <= r_ch0_arr_shadow;
			r_startcnt[15:0] <= r_ch0_startcnt_shadow;
	end
	else
	begin
			r_psc[15:0] <= r_psc[15:0];
			r_arr[15:0] <= r_arr[15:0];
			r_startcnt[15:0] <= r_startcnt[15:0];
	end
end

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r_psc[31:16] <= 16'h000a;
		r_arr[31:16] <= 16'h0028;
		r_startcnt[31:16] <= 16'h0;
	end
	else if(r_ch1_update == 1'b1)
	begin
			r_psc[31:16] <= r_ch1_psc_shadow;
			r_arr[31:16] <= r_ch1_arr_shadow;
			r_startcnt[31:16] <= r_ch1_startcnt_shadow;
	end
	else
	begin
			r_psc[31:16] <= r_psc[31:16];
			r_arr[31:16] <= r_arr[31:16];
			r_startcnt[31:16] <= r_startcnt[31:16];
	end
end

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r_psc[47:32] <= 16'h000a;
		r_arr[47:32] <= 16'h0028;
		r_startcnt[47:32] <= 16'h0;
	end
	else if(r_ch2_update == 1'b1)
	begin
			r_psc[47:32] <= r_ch2_psc_shadow;
			r_arr[47:32] <= r_ch2_arr_shadow;
			r_startcnt[47:32] <= r_ch2_startcnt_shadow;
	end
	else
	begin
			r_psc[47:32] <= r_psc[47:32];
			r_arr[47:32] <= r_arr[47:32];
			r_startcnt[47:32] <= r_startcnt[47:32];
	end
end

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r_psc[63:48] <= 16'h000a;
		r_arr[63:48] <= 16'h0028;
		r_startcnt[63:48] <= 16'h0;
	end
	else if(r_ch3_update == 1'b1)
	begin
			r_psc[63:48] <= r_ch3_psc_shadow;
			r_arr[63:48] <= r_ch3_arr_shadow;
			r_startcnt[63:48] <= r_ch3_startcnt_shadow;
	end
	else
	begin
			r_psc[63:48] <= r_psc[63:48];
			r_arr[63:48] <= r_arr[63:48];
			r_startcnt[63:48] <= r_startcnt[63:48];
	end
end

//===============================================
// bastim regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================


//===============================================
// bastim regs
//===============================================

bastim_apb_cfg u_bastim_apb_cfg 
(
	.clk						(reg_clk),
	.rst_n						(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),
	.r_ch0_auto_reload			(r_ch0_auto_reload),
	.r_ch0_tim_enable			(r_ch0_tim_enable),
	.r_ch0_update				(r_ch0_update),
	.r_ch0_psc					(r_ch0_psc_shadow),
	.r_ch0_arr					(r_ch0_arr_shadow),
	.r_ch0_startcnt				(r_ch0_startcnt_shadow),
	.r_ch1_auto_reload			(r_ch1_auto_reload),
	.r_ch1_tim_enable			(r_ch1_tim_enable),
	.r_ch1_update				(r_ch1_update),
	.r_ch1_psc					(r_ch1_psc_shadow),
	.r_ch1_arr					(r_ch1_arr_shadow),
	.r_ch1_startcnt				(r_ch1_startcnt_shadow),
	.r_ch2_auto_reload			(r_ch2_auto_reload),
	.r_ch2_tim_enable			(r_ch2_tim_enable),
	.r_ch2_update				(r_ch2_update),
	.r_ch2_psc					(r_ch2_psc_shadow),
	.r_ch2_arr					(r_ch2_arr_shadow),
	.r_ch2_startcnt				(r_ch2_startcnt_shadow),
	.r_ch3_auto_reload			(r_ch3_auto_reload),
	.r_ch3_tim_enable			(r_ch3_tim_enable),
	.r_ch3_update				(r_ch3_update),
	.r_ch3_psc					(r_ch3_psc_shadow),
	.r_ch3_arr					(r_ch3_arr_shadow),
	.r_ch3_startcnt				(r_ch3_startcnt_shadow),
	.r_int3_en					(r_int_en[3]),
	.r_int2_en					(r_int_en[2]),
	.r_int1_en					(r_int_en[1]),
	.r_int0_en					(r_int_en[0]),
	.r_int3_clr					(r_int_clr[3]),
	.r_int2_clr					(r_int_clr[2]),
	.r_int1_clr					(r_int_clr[1]),
	.r_int0_clr					(r_int_clr[0]),
	.r_int3_sta					(r_int_sta[3]),
	.r_int2_sta					(r_int_sta[2]),
	.r_int1_sta					(r_int_sta[1]),
	.r_int0_sta					(r_int_sta[0])
);

endmodule

