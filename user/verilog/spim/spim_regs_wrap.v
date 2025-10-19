//===============================================
//
//	File: spim_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09142025
//	Version: v1.0
//
// 	This is regs wrap for spi master.
//
//===============================================

module spim_regs_wrap 
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
	output		[ 7:0]			r_tx_data,
	input		[ 7:0]			r_rx_data,
	output reg					r_tx_data_fifo_wr,
	output						r_rx_data_fifo_rd,
	output						r_tx_fifo_clear,
	output						r_rx_fifo_clear,
	output						r_trans_logic_clear,
	output						r_trans_enable,
	output		[ 7:0]			r_tx_num,
	output		[ 7:0]			r_trans_num,
	output		[ 4:0]			r_tx_fifo_watermark,
	output		[ 4:0]			r_rx_fifo_watermark,
	output						r_rx_msblsb,
	output						r_tx_msblsb,
	output						r_pause_continue,
	output						r_pause_enable,
	input		[ 4:0]			r_tx_fifo_num,
	input		[ 4:0]			r_rx_fifo_num,

	//configs
	output reg	[ 7:0]			r_clkdiv,
	output reg	[ 1:0]			r_mode,
	output reg					r_tm,
	output reg					r_fm_en,
	output reg					r_txm,
	output reg					r_rxm,
	output reg	[ 3:0]			r_tls,
	output reg	[ 3:0]			r_tle,
	output reg	[ 3:0]			r_ti,

	// interrupt control & status
	output		[ 5:0]			r_int_en,
	output		[ 5:0]			r_int_clr,
	input		[ 5:0]			r_int_sta
);

wire							r_update;
wire			[ 7:0]			r_clkdiv_shadow;
wire			[ 1:0]			r_mode_shadow;	
wire							r_tm_shadow;			
wire							r_fm_en_shadow;			
wire							r_txm_shadow;			
wire							r_rxm_shadow;			
wire			[ 3:0]			r_tls_shadow;		
wire			[ 3:0]			r_tle_shadow;		
wire			[ 3:0]			r_ti_shadow;		

//===============================================
// spim regs shadow update
// some static config update only by writing update bit 
//===============================================

wire							r_update_af;

pos_step_sync2pulse u_update_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r_update),
	.des_Y	 					(r_update_af)
);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		r_clkdiv <= 8'h1;
		r_mode <= 2'h0;	
		r_tm <= 1'b0;			
		r_fm_en <= 1'b0;
		r_txm <= 1'b0;			
		r_rxm <= 1'b0;			
		r_tls <= 4'h0;			
		r_tle <= 4'h0;			
		r_ti <= 4'h0;			
	end
	else if(r_update_af)
	begin
		r_clkdiv <= r_clkdiv_shadow;
		r_mode <= r_mode_shadow;
		r_tm <= r_tm_shadow;
		r_fm_en <= r_fm_en_shadow;
		r_txm <= r_txm_shadow;
		r_rxm <= r_rxm_shadow;
		r_tls <= r_tls_shadow;
		r_tle <= r_tle_shadow;
		r_ti <= r_ti_shadow;
	end
	else
	begin
		r_clkdiv <= r_clkdiv;
		r_mode <= r_mode;
		r_tm <= r_tm;
		r_fm_en <= r_fm_en;
		r_txm <= r_txm;	
		r_rxm <= r_rxm;
		r_tls <= r_tls;
		r_tle <= r_tle;
		r_ti <= r_ti; 
	end
end

//===============================================
// spim regs for fifo
//===============================================

wire							r_tx_data_wr;

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
		r_tx_data_fifo_wr <= 1'b0;
	else
		r_tx_data_fifo_wr <= r_tx_data_wr;
end

wire							r_rx_data_rd;
reg			[ 7:0]				r_rx_data_d;
assign r_rx_data_fifo_rd = r_rx_data_rd;

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
		r_rx_data_d <= 8'h0;
	else
		r_rx_data_d <= r_rx_data;
end

//===============================================
// spim regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================

wire							r_trans_logic_clr_wc_clr;		

posedge_pulse_sync u_trans_logic_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r_trans_logic_clr_wc_clr),
	.des_Y	 					(r_trans_logic_clear)
);

//===============================================
// spim regs for control
//===============================================

wire							r_pause_continue_bfsync;		

posedge_pulse_sync u_pause_continue_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_clk),
	.des_rstn					(pe_rstn),

	.src_A	 					(r_pause_continue_bfsync),
	.des_Y	 					(r_pause_continue)
);

wire							r_pause_enable_bfsync;		

sync_ff_2d u_pause_enable_sync
(
	.clk	 					(pe_clk),
	.rstn						(pe_rstn),

	.A							(r_pause_enable_bfsync),
	.Y							(r_pause_enable)
);

//===============================================
// spim regs
//===============================================

spim_apb_cfg u_spim_apb_cfg 
(
	.clk						(reg_clk),
	.rst_n						(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),
	.r_tx_data					(r_tx_data),
	.r_tx_data_wr				(r_tx_data_wr),// add fifo we
    .r_tx_fifo_watermark		(r_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r_rx_fifo_watermark),
	.r_tx_fifo_clr				(r_tx_fifo_clear),
	.r_rx_fifo_clr				(r_rx_fifo_clear),
	.r_trans_logic_clr			(r_trans_logic_clr_wc_clr),
	.r_trans_enable				(r_trans_enable),
	.r_update					(r_update),
	.r_clkdiv					(r_clkdiv_shadow),
	.r_mode						(r_mode_shadow),
    .r_tm						(r_tm_shadow),
    .r_fm_en					(r_fm_en_shadow),
	.r_txm						(r_txm_shadow),
	.r_rxm						(r_rxm_shadow),
	.r_tls						(r_tls_shadow),
	.r_tle						(r_tle_shadow),
	.r_ti						(r_ti_shadow),
	.r_rx_msblsb				(r_rx_msblsb),
	.r_tx_msblsb				(r_tx_msblsb),
	.r_pause_continue			(r_pause_continue_bfsync),
	.r_pause_enable				(r_pause_enable_bfsync),
	.r_tx_num					(r_tx_num),
	.r_trans_num				(r_trans_num),
    .r_int5_en					(r_int_en[5]),
    .r_int4_en					(r_int_en[4]),
    .r_int3_en					(r_int_en[3]),
    .r_int2_en					(r_int_en[2]),
    .r_int1_en					(r_int_en[1]),
    .r_int0_en					(r_int_en[0]),
    .r_int5_clr					(r_int_clr[5]),
    .r_int4_clr					(r_int_clr[4]),
    .r_int3_clr					(r_int_clr[3]),
    .r_int2_clr					(r_int_clr[2]),
    .r_int1_clr					(r_int_clr[1]),
    .r_int0_clr					(r_int_clr[0]),
    .r_tx_fifo_num				(r_tx_fifo_num),
    .r_rx_fifo_num				(r_rx_fifo_num),
    .r_int5_sta					(r_int_sta[5]),
    .r_int4_sta					(r_int_sta[4]),
    .r_int3_sta					(r_int_sta[3]),
    .r_int2_sta					(r_int_sta[2]),
    .r_int1_sta					(r_int_sta[1]),
    .r_int0_sta					(r_int_sta[0]),
    .r_rx_data					(r_rx_data_d),
	.r_rx_data_rd				(r_rx_data_rd)// add fifo re
);

endmodule

