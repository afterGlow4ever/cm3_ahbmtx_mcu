//===============================================
//
//	File: eth_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02272024
//	Version: v1.0
//
// 	This is regs wrap for eth.
//
//===============================================

module eth_regs_wrap 
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
	input						pe_tx_clk,
	input						pe_tx_rstn,
	input						pe_rx_clk,
	input						pe_rx_rstn,
	input						ahb_hclk,
	input						ahb_hrstn,

	// for sma
	//control
	output		[22:0]			r0_tx_data,
	input		[15:0]			r0_rx_data,
	output reg					r0_tx_data_fifo_wr,
	output						r0_rx_data_fifo_rd,
	output						r0_tx_fifo_clr,
	output						r0_rx_fifo_clr,
	output						r0_master_logic_clr,
	input		[ 2:0]			r0_tx_fifo_num,
	input		[ 2:0]			r0_rx_fifo_num,
	output		[ 2:0]			r0_tx_fifo_watermark,
	output		[ 2:0]			r0_rx_fifo_watermark,

	//configs
	output reg	[ 7:0]			r0_clkdiv,
	output reg	[ 4:0]			r0_phyadr,
	output reg	[ 7:0]			r0_interval_bit,

	// interrupt control & status
	output		[ 5:0]			r0_int_en,
	output		[ 5:0]			r0_int_clr,
	input		[ 5:0]			r0_int_sta,

	// for mac
	// control
	output						r1_dma_clr,
    output						r1_tx_data_clr,
    output						r1_rx_data_clr,
    output						r1_tx_logic_clr,
    output						r1_rx_logic_clr,
    output						r1_tx_enable,
    output						r1_rx_enable,
    output						r1_tx_trans_enable,
    output						r1_rx_trans_enable,

	// configs
	output reg	[ 3:0]			r1_hready_tothres,	
	output reg	[ 2:0]			r1_priority_ratio,	
	output reg					r1_txrx_priority,	
	output reg					r1_arb_scheme,	
	output reg	[31:0]			r1_sa_macaddrl,
	output reg	[15:0]			r1_sa_macaddrh,
	output reg					r1_arp_offload,
	output reg					r1_sa_filter,	
	output reg					r1_ipc_filter,	
	output reg					r1_db_filter,	
	output reg					r1_2kp_en,	
	output reg					r1_duplex,
	output reg					r1_crsfd, 
	output reg	[ 1:0]			r1_pre_byte,
	output reg	[ 5:0]			r1_interval_byte,

	// descriptor
	output		[ 1:0]			r1_tdes_num,
	output		[ 1:0]			r1_rdes_num,
	output		[31:0]			r1_tdes00,
	output		[31:0]			r1_tdes02,
	output		[31:0]			r1_tdes03,
	output		[31:0]			r1_tdes10,
	output		[31:0]			r1_tdes12,
	output		[31:0]			r1_tdes13,
	output		[31:0]			r1_tdes20,
	output		[31:0]			r1_tdes22,
	output		[31:0]			r1_tdes23,
	output		[31:0]			r1_tdes30,
	output		[31:0]			r1_tdes32,
	output		[31:0]			r1_tdes33,
	output		[31:0]			r1_rdes00,
	output		[31:0]			r1_rdes03,
	output		[31:0]			r1_rdes10,
	output		[31:0]			r1_rdes13,
	output		[31:0]			r1_rdes20,
	output		[31:0]			r1_rdes23,
	output		[31:0]			r1_rdes30,
	output		[31:0]			r1_rdes33,

	// interrupt control & status
	output		[ 0:0]			r1_int0_en,
	output		[ 0:0]			r1_int0_clr,
	input		[ 0:0]			r1_int0_sta,
	output		[ 0:0]			r1_int1_en,
	output		[ 0:0]			r1_int1_clr,
	input		[ 0:0]			r1_int1_sta,
	output		[ 2:0]			r1_int2_en,
	output		[ 2:0]			r1_int2_clr,
	input		[ 2:0]			r1_int2_sta
);

//===============================================
// eth sma related
//===============================================

wire							r0_update;
wire			[ 7:0]			r0_clkdiv_shadow;
wire			[ 4:0]			r0_phyadr_shadow;
wire			[ 7:0]			r0_interval_bit_shadow;

//===============================================
// eth sma regs shadow update
// some static config update only by writing update bit 
//===============================================

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r0_clkdiv <= 8'h4;
		r0_phyadr <= 5'h0;
		r0_interval_bit <= 8'h3;
	end
	else if(r0_update == 1'b1)
	begin
		r0_clkdiv <= r0_clkdiv_shadow;
		r0_phyadr <= r0_phyadr_shadow;
		r0_interval_bit <= r0_interval_bit_shadow;
	end
	else
	begin
		r0_clkdiv <= r0_clkdiv;
		r0_phyadr <= r0_phyadr;
		r0_interval_bit <= r0_interval_bit;
	end
end

//===============================================
// eth sma regs for fifo
//===============================================

wire							r0_tx_data_wr;

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
		r0_tx_data_fifo_wr <= 1'b0;
	else
		r0_tx_data_fifo_wr <= r0_tx_data_wr;
end

wire							r0_rx_data_rd;
reg			[15:0]				r0_rx_data_d;
assign r0_rx_data_fifo_rd = r0_rx_data_rd;

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
		r0_rx_data_d <= 1'b0;
	else
		r0_rx_data_d <= r0_rx_data;
end

//===============================================
// eth sma regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================

wire							r0_tx_fifo_clr_wc_clr;		
wire							r0_rx_fifo_clr_wc_clr;		
wire							r0_master_logic_clr_wc_clr;		

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_inst0
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),	

	.A							(r0_tx_fifo_clr_wc_clr),
	.Y							(r0_tx_fifo_clr)
);

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_inst1
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),	

	.A							(r0_rx_fifo_clr_wc_clr),
	.Y							(r0_rx_fifo_clr)
);

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_inst2
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),	

	.A							(r0_master_logic_clr_wc_clr),
	.Y							(r0_master_logic_clr)
);


//===============================================
// eth mac related
//===============================================

wire							r1_pe_update;
wire							r1_dma_update; 
wire			[ 3:0]			r1_hready_tothres_shadow;
wire			[ 2:0]			r1_priority_ratio_shadow;	
wire							r1_txrx_priority_shadow;	
wire							r1_arb_scheme_shadow;	
wire			[31:0]			r1_sa_macaddrl_shadow;
wire			[15:0]			r1_sa_macaddrh_shadow;
wire							r1_arp_offload_shadow;	
wire							r1_sa_filter_shadow;	
wire							r1_ipc_filter_shadow;	
wire							r1_db_filter_shadow;	
wire							r1_2kp_en_shadow;	
wire							r1_duplex_shadow;	
wire							r1_crsfd_shadow;	
wire			[ 1:0]			r1_pre_byte_shadow;	
wire			[ 5:0]			r1_interval_byte_shadow;	

//===============================================
// eth mac regs shadow update
// some static config update only by writing update bit 
// static configuration need not to sync
//===============================================

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r1_hready_tothres <= 4'h8;
		r1_priority_ratio <= 3'h0;
		r1_txrx_priority <= 1'b0;
		r1_arb_scheme <= 1'b0;
	end
	else if(r1_dma_update == 1'b1)
	begin
		r1_hready_tothres <= r1_hready_tothres_shadow;
		r1_priority_ratio <= r1_priority_ratio_shadow;
		r1_txrx_priority <= r1_txrx_priority_shadow;
		r1_arb_scheme <= r1_arb_scheme_shadow;
	end
	else
	begin
		r1_hready_tothres <= r1_hready_tothres;
		r1_priority_ratio <= r1_priority_ratio;
		r1_txrx_priority <= r1_txrx_priority;
		r1_arb_scheme <= r1_arb_scheme;
	end
end

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r1_sa_macaddrl <= 32'h0;
		r1_sa_macaddrh <= 16'h0;
		r1_arp_offload <= 1'b0;
		r1_sa_filter <= 1'b0;	
		r1_ipc_filter <= 1'b0;	
		r1_db_filter <= 1'b0;	
		r1_2kp_en <= 1'b0;	
		r1_duplex <= 1'b0;
		r1_crsfd <= 1'b0; 
		r1_pre_byte <= 2'h0;
		r1_interval_byte <= 6'h0;	
	end
	else if(r1_pe_update == 1'b1)
	begin
		r1_sa_macaddrl <= r1_sa_macaddrl_shadow;
		r1_sa_macaddrh <= r1_sa_macaddrh_shadow;
		r1_arp_offload <= r1_arp_offload_shadow;
		r1_sa_filter <= r1_sa_filter_shadow;	
		r1_ipc_filter <= r1_ipc_filter_shadow;	
		r1_db_filter <= r1_db_filter_shadow;	
		r1_2kp_en <= r1_2kp_en_shadow;	
		r1_duplex <= r1_duplex_shadow;
		r1_crsfd <= r1_crsfd_shadow; 
		r1_pre_byte <= r1_pre_byte_shadow;
		r1_interval_byte <= r1_interval_byte_shadow;		
	end
	else
	begin
		r1_sa_macaddrl <= r1_sa_macaddrl;
		r1_sa_macaddrh <= r1_sa_macaddrh;
		r1_arp_offload <= r1_arp_offload;
		r1_sa_filter <= r1_sa_filter;	
		r1_ipc_filter <= r1_ipc_filter;	
		r1_db_filter <= r1_db_filter;	
		r1_2kp_en <= r1_2kp_en;	
		r1_duplex <= r1_duplex;
		r1_crsfd <= r1_crsfd; 
		r1_pre_byte <= r1_pre_byte;
		r1_interval_byte <= r1_interval_byte;		
	end
end

//===============================================
// eth mac regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================

wire							r1_dma_clr_wc_clr;		
wire							r1_tx_data_clr_wc_clr;		
wire							r1_rx_data_clr_wc_clr;		
wire							r1_tx_logic_clr_wc_clr;		
wire							r1_rx_logic_clr_wc_clr;		
wire			[ 0:0]			r1_int0_clr_wc_clr;		
wire			[ 0:0]			r1_int1_clr_wc_clr;		
wire			[ 2:0]			r1_int2_clr_wc_clr;

posedge_pulse_sync u_dma_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(ahb_hclk),
	.des_rstn					(ahb_hrstn),

	.src_A	 					(r1_dma_clr_wc_clr),
	.des_Y	 					(r1_dma_clr)
);

posedge_pulse_sync u_tx_data_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(ahb_hclk),
	.des_rstn					(ahb_hrstn),

	.src_A	 					(r1_tx_data_clr_wc_clr),
	.des_Y	 					(r1_tx_data_clr)
);

posedge_pulse_sync u_tx_logic_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_tx_clk),
	.des_rstn					(pe_tx_rstn),

	.src_A	 					(r1_tx_logic_clr_wc_clr),
	.des_Y	 					(r1_tx_logic_clr)
);

posedge_pulse_sync u_tx_int_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_tx_clk),
	.des_rstn					(pe_tx_rstn),

	.src_A	 					(r1_int0_clr_wc_clr),
	.des_Y	 					(r1_int0_clr)
);

posedge_pulse_sync u_rx_data_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(ahb_hclk),
	.des_rstn					(ahb_hrstn),

	.src_A	 					(r1_rx_data_clr_wc_clr),
	.des_Y	 					(r1_rx_data_clr)
);

posedge_pulse_sync u_rx_logic_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_rx_clk),
	.des_rstn					(pe_rx_rstn),

	.src_A	 					(r1_rx_logic_clr_wc_clr),
	.des_Y	 					(r1_rx_logic_clr)
);

posedge_pulse_sync u_rx_int_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_rx_clk),
	.des_rstn					(pe_rx_rstn),

	.src_A	 					(r1_int1_clr_wc_clr),
	.des_Y	 					(r1_int1_clr)
);

posedge_pulse_sync 
#(
	.WIDTH						(3),
	.DEFAULT_VAL				(0)
)
u_dma_int_clr_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(pe_rx_clk),
	.des_rstn					(pe_rx_rstn),

	.src_A	 					(r1_int2_clr_wc_clr),
	.des_Y	 					(r1_int2_clr)
);

//===============================================
// eth regs
// r0: sma regs
// r1: core regs
//===============================================

eth_apb_cfg u_eth_apb_cfg
(
	.clk						(reg_clk),
	.rst_n						(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),
	.r0_tx_data					(r0_tx_data),
	.r0_tx_data_wr				(r0_tx_data_wr),// add fifo we
    .r0_tx_fifo_watermark		(r0_tx_fifo_watermark),
    .r0_rx_fifo_watermark		(r0_rx_fifo_watermark),
	.r0_tx_fifo_clr				(r0_tx_fifo_clr_wc_clr),
	.r0_rx_fifo_clr				(r0_rx_fifo_clr_wc_clr),
	.r0_master_logic_clr		(r0_master_logic_clr_wc_clr),
	.r0_update					(r0_update),
	.r0_clkdiv					(r0_clkdiv_shadow),
	.r0_phyadr					(r0_phyadr_shadow),
	.r0_interval_bit			(r0_interval_bit_shadow),
    .r0_int5_en					(r0_int_en[5]),
    .r0_int4_en					(r0_int_en[4]),
    .r0_int3_en					(r0_int_en[3]),
    .r0_int2_en					(r0_int_en[2]),
    .r0_int1_en					(r0_int_en[1]),
    .r0_int0_en					(r0_int_en[0]),
    .r0_int5_clr				(r0_int_clr[5]),
    .r0_int4_clr				(r0_int_clr[4]),
    .r0_int3_clr				(r0_int_clr[3]),
    .r0_int2_clr				(r0_int_clr[2]),
    .r0_int1_clr				(r0_int_clr[1]),
    .r0_int0_clr				(r0_int_clr[0]),
    .r0_tx_fifo_num				(r0_tx_fifo_num),
    .r0_rx_fifo_num				(r0_rx_fifo_num),
    .r0_int5_sta				(r0_int_sta[5]),
    .r0_int4_sta				(r0_int_sta[4]),
    .r0_int3_sta				(r0_int_sta[3]),
    .r0_int2_sta				(r0_int_sta[2]),
    .r0_int1_sta				(r0_int_sta[1]),
    .r0_int0_sta				(r0_int_sta[0]),
    .r0_rx_data					(r0_rx_data_d),
	.r0_rx_data_rd				(r0_rx_data_rd),// add fifo re
    .r1_dma_clr					(r1_dma_clr_wc_clr),
    .r1_tx_data_clr				(r1_tx_data_clr_wc_clr),
    .r1_rx_data_clr				(r1_rx_data_clr_wc_clr),
    .r1_tx_logic_clr			(r1_tx_logic_clr_wc_clr),
    .r1_rx_logic_clr			(r1_rx_logic_clr_wc_clr),
    .r1_tx_enable				(r1_tx_enable),
    .r1_rx_enable				(r1_rx_enable),
    .r1_tx_trans_enable			(r1_tx_trans_enable),
    .r1_rx_trans_enable			(r1_rx_trans_enable),
    .r1_pe_update				(r1_pe_update),
    .r1_dma_update				(r1_dma_update),
    .r1_hready_tothres			(r1_hready_tothres_shadow),
    .r1_priority_ratio			(r1_priority_ratio_shadow),
    .r1_txrx_priority			(r1_txrx_priority_shadow),	
    .r1_arb_scheme	 			(r1_arb_scheme_shadow),   
    .r1_tdes_addr	 			(),   
    .r1_tdes_num	 			(r1_tdes_num),   
    .r1_tdes_tail	 			(),   
    .r1_rdes_addr	 			(),   
    .r1_rdes_num	 			(r1_rdes_num),   
    .r1_rdes_tail	 			(),   
	.r1_tdes00					(r1_tdes00),
	.r1_tdes02					(r1_tdes02),
	.r1_tdes03					(r1_tdes03),
	.r1_tdes10					(r1_tdes10),
	.r1_tdes12					(r1_tdes12),
	.r1_tdes13					(r1_tdes13),
	.r1_tdes20					(r1_tdes20),
	.r1_tdes22					(r1_tdes22),
	.r1_tdes23					(r1_tdes23),
	.r1_tdes30					(r1_tdes30),
	.r1_tdes32					(r1_tdes32),
	.r1_tdes33					(r1_tdes33),
	.r1_rdes00					(r1_rdes00),
	.r1_rdes03					(r1_rdes03),
	.r1_rdes10					(r1_rdes10),
	.r1_rdes13					(r1_rdes13),
	.r1_rdes20					(r1_rdes20),
	.r1_rdes23					(r1_rdes23),
	.r1_rdes30					(r1_rdes30),
	.r1_rdes33					(r1_rdes33),	
    .r1_sa_macaddrl				(r1_sa_macaddrl_shadow),	
    .r1_sa_macaddrh				(r1_sa_macaddrh_shadow),	
    .r1_arp_offload				(r1_arp_offload_shadow),	
    .r1_sa_ctrl					(),	
    .r1_sa_filter				(r1_sa_filter_shadow),
    .r1_ipc_filter				(r1_ipc_filter_shadow),	
    .r1_db_filter				(r1_db_filter_shadow),	
    .r1_2kp_en					(r1_2kp_en_shadow),	
    .r1_cs_rm					(),	
    .r1_pc_rm					(),	
    .r1_fes						(),	
    .r1_duplex					(r1_duplex_shadow),
    .r1_crsfd					(r1_crsfd_shadow),
    .r1_pre_byte				(r1_pre_byte_shadow),
    .r1_interval_byte			(r1_interval_byte_shadow),
//    .r1_int00_en				(r1_int0_en[0]),
//    .r1_int10_en				(r1_int1_en[0]),
    .r1_int22_en				(r1_int2_en[2]),
    .r1_int21_en				(r1_int2_en[1]),
    .r1_int20_en				(r1_int2_en[0]),
    .r1_int00_clr				(r1_int0_clr_wc_clr[0]),
    .r1_int10_clr				(r1_int1_clr_wc_clr[0]),
    .r1_int22_clr				(r1_int2_clr_wc_clr[2]),
    .r1_int21_clr				(r1_int2_clr_wc_clr[1]),
    .r1_int20_clr				(r1_int2_clr_wc_clr[0]),
    .r1_int00_sta				(r1_int0_sta[0]),
    .r1_int10_sta				(r1_int1_sta[0]),
    .r1_int22_sta				(r1_int2_sta[2]),
    .r1_int21_sta				(r1_int2_sta[1]),
    .r1_int20_sta				(r1_int2_sta[0])
);

assign r1_int0_en=1'b0;//???????
assign r1_int1_en=1'b0;//???????

endmodule

