//===============================================
//
//	File: advtim_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11172024
//	Version: v1.0
//
// 	This is regs wrap for advance timer.
//
//===============================================

module advtim_regs_wrap 
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

	// different clk domain
	input						pe_clk,
	input						pe_rstn,

	//control
	output						r0_logic_clr,
	output						r1_logic_clr,
	output						r0_gen_enable,
	input						advtim_pe_gen_hw_update,
	input						advtim_pe_gen_running,

	//configs
	output reg	[15:0]			r0_psc,
	output reg	[15:0]			r0_arr,
	output reg	[15:0]			r0_rcr,
	output reg	[ 1:0]			r0_cms,
	output reg					r0_dir,
	output reg	[15:0]			r0_cc1,
	output reg					r0_go1, 
	output reg					r0_go1n, 
	output reg					r0_ss1,	 
	output reg					r0_ss1n, 
	output reg					r0_moe1, 
	output reg					r0_moe1n,
	output reg					r0_dze1,
	output reg					r0_cc1p,
	output reg					r0_cc1np,
	output reg					r0_cc1e,
	output reg					r0_cc1ne,
	output reg	[ 3:0]			r0_oc1m,
	output reg	[15:0]			r0_cc2,
	output reg					r0_go2, 
	output reg					r0_go2n, 
	output reg					r0_ss2,	 
	output reg					r0_ss2n, 
	output reg					r0_moe2, 
	output reg					r0_moe2n,
	output reg					r0_dze2,
	output reg					r0_cc2p,
	output reg					r0_cc2np,
	output reg					r0_cc2e,
	output reg					r0_cc2ne,
	output reg	[ 3:0]			r0_oc2m,
	output reg	[15:0]			r0_cc3,
	output reg					r0_go3, 
	output reg					r0_go3n, 
	output reg					r0_ss3,	 
	output reg					r0_ss3n, 
	output reg					r0_moe3, 
	output reg					r0_moe3n,
	output reg					r0_dze3,
	output reg					r0_cc3p,
	output reg					r0_cc3np,
	output reg					r0_cc3e,
	output reg					r0_cc3ne,
	output reg	[ 3:0]			r0_oc3m,
	output reg	[15:0]			r0_cc4,
	output reg					r0_ss4,	 
	output reg					r0_cc4p,
	output reg					r0_cc4e,
	output reg	[ 3:0]			r0_oc4m,
	output reg	[15:0]			r0_cc5,
	output reg					r0_cc5c3,
	output reg					r0_cc5c2,
	output reg					r0_cc5c1,
	output reg					r0_ss5,	 
	output reg					r0_cc5p,
	output reg					r0_cc5e,
	output reg	[ 3:0]			r0_oc5m,
	output reg	[15:0]			r0_cc6,
	output reg					r0_ss6,	 
	output reg					r0_cc6p,
	output reg					r0_cc6e,
	output reg	[ 3:0]			r0_oc6m,
	output reg	[ 3:0]			r0_bt,
	output reg					r0_bk2p,
	output reg					r0_bk2e,
	output reg					r0_bk1p,
	output reg					r0_bk1e,
	output reg	[ 9:0]			r0_dtg,

	// interrupt control & status
	output		[ 1:0]			r0_int_en,
	output		[ 1:0]			r0_int_clr,
	input		[ 1:0]			r0_int_sta
);

wire							r0_sw_update;
wire							r0_hw_update_en;
wire							r0_update;
wire							r0_update_by_lock;
wire			[15:0]			r0_psc_shadow;
wire			[15:0]			r0_arr_shadow;
wire			[15:0]			r0_rcr_shadow;
wire			[ 1:0]			r0_cms_shadow;
wire							r0_dir_shadow;
wire			[15:0]			r0_cc1_shadow;
wire							r0_go1_shadow;	 
wire							r0_go1n_shadow; 
wire							r0_ss1_shadow;	 
wire							r0_ss1n_shadow; 
wire							r0_moe1_shadow; 
wire							r0_moe1n_shadow;
wire							r0_dze1_shadow;
wire							r0_cc1p_shadow;
wire							r0_cc1np_shadow;
wire							r0_cc1e_shadow;
wire							r0_cc1ne_shadow;
wire			[ 3:0]			r0_oc1m_shadow;
wire			[15:0]			r0_cc2_shadow;
wire							r0_go2_shadow;	 
wire							r0_go2n_shadow; 
wire							r0_ss2_shadow;	 
wire							r0_ss2n_shadow; 
wire							r0_moe2_shadow; 
wire							r0_moe2n_shadow;
wire							r0_dze2_shadow;
wire							r0_cc2p_shadow;
wire							r0_cc2np_shadow;
wire							r0_cc2e_shadow;
wire							r0_cc2ne_shadow;
wire			[ 3:0]			r0_oc2m_shadow;
wire			[15:0]			r0_cc3_shadow;
wire							r0_go3_shadow;	 
wire							r0_go3n_shadow; 
wire							r0_ss3_shadow;	 
wire							r0_ss3n_shadow; 
wire							r0_moe3_shadow; 
wire							r0_moe3n_shadow;
wire							r0_dze3_shadow;
wire							r0_cc3p_shadow;
wire							r0_cc3np_shadow;
wire							r0_cc3e_shadow;
wire							r0_cc3ne_shadow;
wire			[ 3:0]			r0_oc3m_shadow;
wire			[15:0]			r0_cc4_shadow;
wire							r0_ss4_shadow;	 
wire							r0_cc4p_shadow;
wire							r0_cc4e_shadow;
wire			[ 3:0]			r0_oc4m_shadow;
wire			[15:0]			r0_cc5_shadow;
wire							r0_cc5c3_shadow;
wire							r0_cc5c2_shadow;
wire							r0_cc5c1_shadow;
wire							r0_ss5_shadow;	 
wire							r0_cc5p_shadow;
wire							r0_cc5e_shadow;
wire			[ 3:0]			r0_oc5m_shadow;
wire			[15:0]			r0_cc6_shadow;
wire							r0_ss6_shadow;	 
wire							r0_cc6p_shadow;
wire							r0_cc6e_shadow;
wire			[ 3:0]			r0_oc6m_shadow;
wire			[ 3:0]			r0_bt_shadow;
wire							r0_bk2p_shadow;
wire							r0_bk2e_shadow;
wire							r0_bk1p_shadow;
wire							r0_bk1e_shadow;
wire			[ 9:0]			r0_dtg_shadow;

//===============================================
// advtim regs shadow update
// some static config update only by update bit 
// including software control and hardware control
//===============================================

wire							r0_sw_update_af;
assign r0_update = r0_sw_update_af || (advtim_pe_gen_hw_update && r0_hw_update_en);

pos_step_sync2pulse u_sw_update_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r0_sw_update),
	.des_Y	 					(r0_sw_update_af)
);

// ???????? whether need a async fifo????
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		r0_psc <= 16'h0002;
		r0_arr <= 16'h0032;
		r0_rcr <= 16'h0;
		r0_cms <= 2'h0;
		r0_dir <= 1'b0;
		r0_cc1 <= 16'h0;
		r0_go1 <= 1'b0;
		r0_go1n <= 1'b0;
		r0_oc1m <= 4'h0;
		r0_cc2 <= 16'h0;
		r0_go2 <= 1'b0;
		r0_go2n <= 1'b0;
		r0_oc2m <= 4'h0;
		r0_cc3 <= 16'h0;
		r0_go3 <= 1'b0;
		r0_go3n <= 1'b0;
		r0_oc3m <= 4'h0;
		r0_cc4 <= 16'h0;
		r0_oc4m <= 4'h0;
		r0_cc5 <= 16'h0;
		r0_cc5c3 <= 1'b0;
		r0_cc5c2 <= 1'b0;
		r0_cc5c1 <= 1'b0;
		r0_oc5m <= 4'h0;
		r0_cc6 <= 16'h0;
		r0_oc6m <= 4'h0;
	end
	else if(r0_update)
	begin
		r0_psc <= r0_psc_shadow;
		r0_arr <= r0_arr_shadow;
		r0_rcr <= r0_rcr_shadow;
		r0_cms <= r0_cms_shadow;
		r0_dir <= r0_dir_shadow;
		r0_cc1 <= r0_cc1_shadow;
		r0_go1 <= r0_go1_shadow;
		r0_go1n <= r0_go1n_shadow;
		r0_oc1m <= r0_oc1m_shadow; 
		r0_cc2 <= r0_cc2_shadow;
		r0_go2 <= r0_go2_shadow;
		r0_go2n <= r0_go2n_shadow;
		r0_oc2m <= r0_oc2m_shadow; 
		r0_cc3 <= r0_cc3_shadow;
		r0_go3 <= r0_go3_shadow;
		r0_go3n <= r0_go3n_shadow;
		r0_oc3m <= r0_oc3m_shadow; 
		r0_cc4 <= r0_cc4_shadow;
		r0_oc4m <= r0_oc4m_shadow; 
		r0_cc5 <= r0_cc5_shadow;
		r0_cc5c3 <= r0_cc5c3_shadow;
		r0_cc5c2 <= r0_cc5c2_shadow;
		r0_cc5c1 <= r0_cc5c1_shadow;
		r0_oc5m <= r0_oc5m_shadow; 
		r0_cc6 <= r0_cc6_shadow;
		r0_oc6m <= r0_oc6m_shadow; 
	end
	else
	begin
		r0_psc <= r0_psc;
		r0_arr <= r0_arr;
		r0_rcr <= r0_rcr;
		r0_cms <= r0_cms;
		r0_dir <= r0_dir;
		r0_cc1 <= r0_cc1;
		r0_go1 <= r0_go1;
		r0_go1n <= r0_go1n;
		r0_oc1m <= r0_oc1m; 
		r0_cc2 <= r0_cc2;
		r0_go2 <= r0_go2;
		r0_go2n <= r0_go2n;
		r0_oc2m <= r0_oc2m; 
		r0_cc3 <= r0_cc3;
		r0_go3 <= r0_go3;
		r0_go3n <= r0_go3n;
		r0_oc3m <= r0_oc3m;
		r0_cc4 <= r0_cc4;
		r0_oc4m <= r0_oc4m;
		r0_cc5 <= r0_cc5;
		r0_cc5c3 <= r0_cc5c3;
		r0_cc5c2 <= r0_cc5c2;
		r0_cc5c1 <= r0_cc5c1;
		r0_oc5m <= r0_oc5m;
		r0_cc6 <= r0_cc6;
		r0_oc6m <= r0_oc6m;
	end
end

//===============================================
// advtim regs protect in operation
// some static config update only by update bit 
// when operation is not running
//===============================================

assign r0_update_by_lock = r0_sw_update_af && ~advtim_pe_gen_running;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		r0_ss1 <= 1'b0;
		r0_ss1n <= 1'b0;
		r0_moe1 <= 1'b0;
		r0_moe1n <= 1'b0;
		r0_dze1 <= 1'h1;
		r0_cc1p <= 1'h0;
		r0_cc1np <= 1'h0;
		r0_cc1e <= 1'h0;
		r0_cc1ne <= 1'h0;
		r0_ss2 <= 1'b0;
		r0_ss2n <= 1'b0;
		r0_moe2 <= 1'b0;
		r0_moe2n <= 1'b0;
		r0_dze2 <= 1'h1;
		r0_cc2p <= 1'h0;
		r0_cc2np <= 1'h0;
		r0_cc2e <= 1'h0;
		r0_cc2ne <= 1'h0;
		r0_ss3 <= 1'b0;
		r0_ss3n <= 1'b0;
		r0_moe3 <= 1'b0;
		r0_moe3n <= 1'b0;
		r0_dze3 <= 1'h1;
		r0_cc3p <= 1'h0;
		r0_cc3np <= 1'h0;
		r0_cc3e <= 1'h0;
		r0_cc3ne <= 1'h0;
		r0_cc4p <= 1'h0;
		r0_ss4 <= 1'b0;
		r0_cc4e <= 1'h0;
		r0_cc5p <= 1'h0;
		r0_ss5 <= 1'b0;
		r0_cc5e <= 1'h0;
		r0_cc6p <= 1'h0;
		r0_ss6 <= 1'b0;
		r0_cc6e <= 1'h0;
		r0_bk2p <= 1'b0;
		r0_bk2e <= 1'b0;
		r0_bk1p <= 1'b0;
		r0_bk1e <= 1'b0;
		r0_dtg <= 10'h5;
	end
	else if(r0_update_by_lock)
	begin
		r0_ss1 <= r0_ss1_shadow;
		r0_ss1n <= r0_ss1n_shadow;
		r0_moe1 <= r0_moe1_shadow;
		r0_moe1n <= r0_moe1n_shadow;
		r0_dze1 <= r0_dze1_shadow;
		r0_cc1p <= r0_cc1p_shadow;
		r0_cc1np <= r0_cc1np_shadow;
		r0_cc1e <= r0_cc1e_shadow;
		r0_cc1ne <= r0_cc1ne_shadow;
		r0_ss2 <= r0_ss2_shadow;
		r0_ss2n <= r0_ss2n_shadow;
		r0_moe2 <= r0_moe2_shadow;
		r0_moe2n <= r0_moe2n_shadow;
		r0_dze2 <= r0_dze2_shadow;
		r0_cc2p <= r0_cc2p_shadow;
		r0_cc2np <= r0_cc2np_shadow;
		r0_cc2e <= r0_cc2e_shadow;
		r0_cc2ne <= r0_cc2ne_shadow;
		r0_ss3 <= r0_ss3_shadow;
		r0_ss3n <= r0_ss3n_shadow;
		r0_moe3 <= r0_moe3_shadow;
		r0_moe3n <= r0_moe3n_shadow;
		r0_dze3 <= r0_dze3_shadow;
		r0_cc3p <= r0_cc3p_shadow;
		r0_cc3np <= r0_cc3np_shadow;
		r0_cc3e <= r0_cc3e_shadow;
		r0_cc3ne <= r0_cc3ne_shadow;
		r0_ss4 <= r0_ss4_shadow;
		r0_cc4p <= r0_cc4p_shadow;
		r0_cc4e <= r0_cc4e_shadow;
		r0_ss5 <= r0_ss5_shadow;
		r0_cc5p <= r0_cc5p_shadow;
		r0_cc5e <= r0_cc5e_shadow;
		r0_ss6 <= r0_ss6_shadow;
		r0_cc6p <= r0_cc6p_shadow;
		r0_cc6e <= r0_cc6e_shadow;
		r0_bk2p <= r0_bk2p_shadow;
		r0_bk2e <= r0_bk2e_shadow;
		r0_bk1p <= r0_bk1p_shadow;
		r0_bk1e <= r0_bk1e_shadow;
		r0_dtg <= r0_dtg_shadow;
	end
	else
	begin
		r0_ss1 <= r0_ss1;
		r0_ss1n <= r0_ss1n;
		r0_moe1 <= r0_moe1;
		r0_moe1n <= r0_moe1n;
		r0_dze1 <= r0_dze1;
		r0_cc1p <= r0_cc1p;
		r0_cc1np <= r0_cc1np;
		r0_cc1e <= r0_cc1e;
		r0_cc1ne <= r0_cc1ne;
		r0_ss2 <= r0_ss2;
		r0_ss2n <= r0_ss2n;
		r0_moe2 <= r0_moe2;
		r0_moe2n <= r0_moe2n;
		r0_dze2 <= r0_dze2;
		r0_cc2p <= r0_cc2p;
		r0_cc2np <= r0_cc2np;
		r0_cc2e <= r0_cc2e;
		r0_cc2ne <= r0_cc2ne;
		r0_ss3 <= r0_ss3;
		r0_ss3n <= r0_ss3n;
		r0_moe3 <= r0_moe3;
		r0_moe3n <= r0_moe3n;
		r0_dze3 <= r0_dze3;
		r0_cc3p <= r0_cc3p;
		r0_cc3np <= r0_cc3np;
		r0_cc3e <= r0_cc3e;
		r0_cc3ne <= r0_cc3ne;
		r0_ss4 <= r0_ss4;
		r0_cc4p <= r0_cc4p;
		r0_cc4e <= r0_cc4e;
		r0_ss5 <= r0_ss5;
		r0_cc5p <= r0_cc5p;
		r0_cc5e <= r0_cc5e;
		r0_ss6 <= r0_ss6;
		r0_cc6p <= r0_cc6p;
		r0_cc6e <= r0_cc6e;
		r0_bk2p <= r0_bk2p;
		r0_bk2e <= r0_bk2e;
		r0_bk1p <= r0_bk1p;
		r0_bk1e <= r0_bk1e;
		r0_dtg <= r0_dtg;
	end
end

//===============================================
// advtim regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================

wire							r0_logic_clr_wc_clr;		

posedge_pulse_sync u_gen_logic_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r0_logic_clr_wc_clr),
	.des_Y	 					(r0_logic_clr)
);

wire							r1_logic_clr_wc_clr;		

posedge_pulse_sync u_cap_logic_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r1_logic_clr_wc_clr),
	.des_Y	 					(r1_logic_clr)
);

wire			[ 1:0]			r0_int_clr_wc_clr;

posedge_pulse_sync 
#(
	.WIDTH						(2),
	.DEFAULT_VAL				(0)
)
u_gen_int_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r0_int_clr_wc_clr),
	.des_Y	 					(r0_int_clr)
);

//===============================================
// advtim regs
//===============================================

advtim_apb_cfg u_advtim_apb_cfg 
(
	.clk						(reg_clk),
	.rst_n						(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),
	.r1_logic_clr				(r1_logic_clr_wc_clr),
	.r0_logic_clr				(r0_logic_clr_wc_clr),
	.r0_gen_enable				(r0_gen_enable),
	.r0_hw_update_en			(r0_hw_update_en),
	.r0_sw_update				(r0_sw_update),
	.r0_psc						(r0_psc_shadow),
	.r0_arr						(r0_arr_shadow),
	.r0_rcr						(r0_rcr_shadow),
	.r0_cms						(r0_cms_shadow),
	.r0_dir						(r0_dir_shadow),
	.r0_cc1						(r0_cc1_shadow),
	.r0_go1						(r0_go1_shadow),
	.r0_go1n					(r0_go1n_shadow),
	.r0_ss1						(r0_ss1_shadow),
	.r0_ss1n					(r0_ss1n_shadow),
	.r0_moe1					(r0_moe1_shadow),
	.r0_moe1n					(r0_moe1n_shadow),
	.r0_dze1					(r0_dze1_shadow),
	.r0_cc1p					(r0_cc1p_shadow),
	.r0_cc1np					(r0_cc1np_shadow),
	.r0_cc1e					(r0_cc1e_shadow),
	.r0_cc1ne					(r0_cc1ne_shadow),
	.r0_oc1m					(r0_oc1m_shadow),
	.r0_cc2						(r0_cc2_shadow),
	.r0_go2						(r0_go2_shadow),
	.r0_go2n					(r0_go2n_shadow),
	.r0_ss2						(r0_ss2_shadow),
	.r0_ss2n					(r0_ss2n_shadow),
	.r0_moe2					(r0_moe2_shadow),
	.r0_moe2n					(r0_moe2n_shadow),
	.r0_dze2					(r0_dze2_shadow),
	.r0_cc2p					(r0_cc2p_shadow),
	.r0_cc2np					(r0_cc2np_shadow),
	.r0_cc2e					(r0_cc2e_shadow),
	.r0_cc2ne					(r0_cc2ne_shadow),
	.r0_oc2m					(r0_oc2m_shadow),
	.r0_cc3						(r0_cc3_shadow),
	.r0_go3						(r0_go3_shadow),
	.r0_go3n					(r0_go3n_shadow),
	.r0_ss3						(r0_ss3_shadow),
	.r0_ss3n					(r0_ss3n_shadow),
	.r0_moe3					(r0_moe3_shadow),
	.r0_moe3n					(r0_moe3n_shadow),
	.r0_dze3					(r0_dze3_shadow),
	.r0_cc3p					(r0_cc3p_shadow),
	.r0_cc3np					(r0_cc3np_shadow),
	.r0_cc3e					(r0_cc3e_shadow),
	.r0_cc3ne					(r0_cc3ne_shadow),
	.r0_oc3m					(r0_oc3m_shadow),
	.r0_cc4						(r0_cc4_shadow),
	.r0_ss4						(r0_ss4_shadow),
	.r0_cc4p					(r0_cc4p_shadow),
	.r0_cc4e					(r0_cc4e_shadow),
	.r0_oc4m					(r0_oc4m_shadow),
	.r0_cc5						(r0_cc5_shadow),
	.r0_ss5						(r0_ss5_shadow),
	.r0_cc5p					(r0_cc5p_shadow),
	.r0_cc5e					(r0_cc5e_shadow),
	.r0_oc5m					(r0_oc5m_shadow),
	.r0_cc5c3					(r0_cc5c3_shadow),
	.r0_cc5c2					(r0_cc5c2_shadow),
	.r0_cc5c1					(r0_cc5c1_shadow),
	.r0_cc6						(r0_cc6_shadow),
	.r0_ss6						(r0_ss6_shadow),
	.r0_cc6p					(r0_cc6p_shadow),
	.r0_cc6e					(r0_cc6e_shadow),
	.r0_oc6m					(r0_oc6m_shadow),
	.r0_bt						(r0_bt_shadow),
	.r0_bk2p					(r0_bk2p_shadow),
	.r0_bk2e					(r0_bk2e_shadow),
	.r0_bk1p					(r0_bk1p_shadow),
	.r0_bk1e					(r0_bk1e_shadow),
	.r0_dtg						(r0_dtg_shadow),
	.r0_int1_en					(r0_int_en[1]),
	.r0_int0_en					(r0_int_en[0]),
	.r0_int1_clr				(r0_int_clr_wc_clr[1]),
	.r0_int0_clr				(r0_int_clr_wc_clr[0]),
	.r0_int1_sta				(r0_int_sta[1]),
	.r0_int0_sta				(r0_int_sta[0])
);

endmodule

