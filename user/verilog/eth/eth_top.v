//===============================================
//
//	File: eth_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02282024
//	Version: v1.0
//
// 	This is top for ethernet.
//	This top is including:
//	ethernet pe core: eth mac & sma core
//	ethernet enable control
//	ethernet interrupt management
//	ethernet regs wrap: shaodow regs update
//	ethernet data buffer: buffer for data and dma for special use
//
//===============================================

module eth_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,
	input  						pe_tx_clk,  
	input  						pe_tx_rstn,
	input  						pe_rx_clk,  
	input  						pe_rx_rstn,

	// pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,
	output 		[ 3:0]			eth_tx,
	output 		[ 3:0]			eth_tx_oen,
	output 						eth_tx_ctrl,
	output 						eth_tx_ctrl_oen,
	output						eth_tx_clk,	
	output						eth_tx_clk_oen,	

	// ahb master
	input						ahb_hclk,
	input						ahb_hrstn,
	output						ahb_hsel,
	output						ahb_hreadyout,
	output	[ 1:0]				ahb_htrans,
	output	[ 2:0]				ahb_hsize,
	output						ahb_hwrite,
	output	[ 2:0]				ahb_hburst,
	output	[31:0]				ahb_haddr,
	output	[ 3:0]				ahb_hprot,
	output	[31:0]				ahb_hwdata,
	input						ahb_hready,
	input	[ 1:0]				ahb_hresp,
	input	[31:0]				ahb_hrdata,	

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
	output						eth_sma_int_line,
	output						eth_mac_tx_int_line,
	output						eth_mac_rx_int_line,
	output						eth_mac_dma_int_line
);

//===============================================
// eth sma signal
//===============================================

wire							r0_tx_fifo_clr;
wire							r0_rx_fifo_clr;
wire							r0_master_logic_clr;
wire							r0_master_enable;

wire		[ 7:0]				r0_clkdiv;
wire		[ 4:0]				r0_phyadr;
wire		[ 7:0]				r0_interval_bit;	

wire							eth_sma_tx_fifo_we;		
wire							eth_sma_tx_fifo_re;		
wire		[22:0]				eth_sma_tx_fifo_wdata;	
wire		[22:0]				eth_sma_tx_fifo_rdata;	
wire		[ 2:0]				eth_sma_tx_fifo_num;
wire							eth_sma_tx_fifo_empty;	
wire							eth_sma_tx_fifo_full;	
wire							eth_sma_rx_fifo_we;	
wire							eth_sma_rx_fifo_re;		
wire		[15:0]				eth_sma_rx_fifo_wdata;	
wire		[15:0]				eth_sma_rx_fifo_rdata;	
wire		[ 2:0]				eth_sma_rx_fifo_num;
wire							eth_sma_rx_fifo_empty;	
wire							eth_sma_rx_fifo_full;	
wire		[ 2:0]				r0_tx_fifo_watermark;
wire		[ 2:0]				r0_rx_fifo_watermark;

wire		[ 5:0]				int0_en;
wire		[ 5:0]				int0_clr;
wire		[ 5:0]				int0_sta;
wire		[ 5:0]				int0_tgr;
wire		[ 5:0]				int0_pos;
wire		[ 5:0]				int0_line;

//===============================================
// eth mac signal
//===============================================

wire							r1_dma_clr;		
wire							r1_tx_data_clr;		
wire							r1_rx_data_clr;		
wire							r1_tx_logic_clr;		
wire							r1_rx_logic_clr;		
wire							r1_tx_enable;		
wire							r1_rx_enable;		
wire							r1_tx_trans_enable;		
wire							r1_rx_trans_enable;		

wire		[ 3:0]				r1_hready_tothres;	
wire		[ 2:0]				r1_priority_ratio;	
wire							r1_txrx_priority;	
wire							r1_arb_scheme;	
wire		[31:0]				r1_sa_macaddrl;
wire		[15:0]				r1_sa_macaddrh;
wire							r1_arp_offload;
wire							r1_sa_filter;	
wire							r1_ipc_filter;	
wire							r1_db_filter;	
wire							r1_s2kp;	
wire							r1_duplex;
wire							r1_crsfd; 
wire		[ 1:0]				r1_pre_byte;
wire		[ 5:0]				r1_interval_byte;

wire		[ 1:0]				r1_tdes_num;
wire		[ 1:0]				r1_rdes_num;
wire		[31:0]				r1_tdes00;
wire		[31:0]				r1_tdes02;
wire		[31:0]				r1_tdes03;
wire		[31:0]				r1_tdes10;
wire		[31:0]				r1_tdes12;
wire		[31:0]				r1_tdes13;
wire		[31:0]				r1_tdes20;
wire		[31:0]				r1_tdes22;
wire		[31:0]				r1_tdes23;
wire		[31:0]				r1_tdes30;
wire		[31:0]				r1_tdes32;
wire		[31:0]				r1_tdes33;
wire		[31:0]				r1_rdes00;
wire		[31:0]				r1_rdes03;
wire		[31:0]				r1_rdes10;
wire		[31:0]				r1_rdes13;
wire		[31:0]				r1_rdes20;
wire		[31:0]				r1_rdes23;
wire		[31:0]				r1_rdes30;
wire		[31:0]				r1_rdes33;

wire 		[31:0]				r1_tx_address1;
wire 							r1_tx_ioc_int_en;
wire 		[11:0]				r1_tx_length1;
wire  		[27:26]				r1_tx_cpc;
wire  		[25:24]				r1_tx_saic;
wire  	 	[17:16]				r1_tx_cic;

wire  	 	[31:0]				r1_rx_address1;
wire			   				r1_rx_ioc_int_en;

wire							eth_mac_txdb_pe2fifo_rdreq;	
wire							eth_mac_txdb_pe2fifo_rdreq_done;	
wire		[31:0]				eth_mac_txdb_fifo2pe_rdata;	
wire							eth_mac_txdb_fifo2pe_empty;	
wire							eth_mac_txdb_fifo2pe_done;	
wire							eth_mac_txdb_fifo2pe_burst_process_done;	
wire							eth_mac_txdb_fifo2pe_single_process_done;	
wire							eth_mac_txdb_data_ready;
wire							eth_mac_txdb_processing_doing;
wire							eth_mac_dl_ahbmst_error;

wire		[ 0:0]				int1_tx_en;
wire							int1_tx_clr;
wire							int1_tx_sta;
wire		[ 0:0]				int1_tx_tgr;
wire							int1_tx_pos;
wire							int1_tx_line;
wire							int1_rx_en;
wire							int1_rx_clr;
wire							int1_rx_sta;
wire							int1_rx_tgr;
wire							int1_rx_pos;
wire		[ 2:0]				int1_dma_en;
wire		[ 2:0]				int1_dma_clr;
wire		[ 2:0]				int1_dma_sta;
wire		[ 2:0]				int1_dma_tgr;
wire		[ 2:0]				int1_dma_pos;
wire		[ 2:0]				int1_dma_line;

//===============================================
// eth regs wrap
//===============================================

eth_regs_wrap u_eth_regs_wrap
(
	.pe_tx_clk					(pe_tx_clk),
	.pe_tx_rstn					(pe_tx_rstn),
	.pe_rx_clk					(pe_rx_clk),
	.pe_rx_rstn					(pe_rx_rstn),
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.ahb_hclk					(ahb_hclk),
	.ahb_hrstn					(ahb_hrstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.r0_tx_data					(eth_sma_tx_fifo_wdata),
	.r0_rx_data					(eth_sma_rx_fifo_rdata),
	.r0_tx_data_fifo_wr			(eth_sma_tx_fifo_we),
	.r0_rx_data_fifo_rd			(eth_sma_rx_fifo_re),
	.r0_tx_fifo_clr				(r0_tx_fifo_clr),
	.r0_rx_fifo_clr				(r0_rx_fifo_clr),
	.r0_master_logic_clr		(r0_master_logic_clr),
	.r0_tx_fifo_num				(eth_sma_tx_fifo_num),
	.r0_rx_fifo_num				(eth_sma_rx_fifo_num),
	.r0_tx_fifo_watermark		(r0_tx_fifo_watermark),
    .r0_rx_fifo_watermark		(r0_rx_fifo_watermark),

	.r0_clkdiv					(r0_clkdiv),
	.r0_phyadr					(r0_phyadr),
	.r0_interval_bit			(r0_interval_bit),

	.r0_int_en					(int0_en),
	.r0_int_clr					(int0_clr),
	.r0_int_sta					(int0_sta),

	.r1_dma_clr					(r1_dma_clr),
	.r1_tx_data_clr				(r1_tx_data_clr),
	.r1_rx_data_clr				(r1_rx_data_clr),
	.r1_tx_logic_clr			(r1_tx_logic_clr),
	.r1_rx_logic_clr			(r1_rx_logic_clr),
	.r1_tx_enable				(r1_tx_enable),
	.r1_rx_enable				(r1_rx_enable),
	.r1_tx_trans_enable			(r1_tx_trans_enable),
	.r1_rx_trans_enable			(r1_rx_trans_enable),

	.r1_hready_tothres			(r1_hready_tothres),	
	.r1_priority_ratio			(r1_priority_ratio),	
	.r1_txrx_priority			(r1_txrx_priority),	
	.r1_arb_scheme				(r1_arb_scheme),	
	.r1_sa_macaddrl				(r1_sa_macaddrl),
	.r1_sa_macaddrh				(r1_sa_macaddrh),
	.r1_arp_offload				(r1_arp_offload),
	.r1_sa_filter				(r1_sa_filter),	
	.r1_ipc_filter				(r1_ipc_filter),	
	.r1_db_filter				(r1_db_filter),	
	.r1_2kp_en					(r1_2kp_en),	
	.r1_duplex					(r1_duplex),
	.r1_crsfd					(r1_crsfd), 
	.r1_pre_byte				(r1_pre_byte),
	.r1_interval_byte			(r1_interval_byte),
	
	.r1_tdes_num				(r1_tdes_num),
	.r1_rdes_num				(r1_rdes_num),
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

	.r1_int0_en					(),
	.r1_int0_clr				(int1_tx_clr),
	.r1_int0_sta				(int1_tx_sta),
	.r1_int1_en					(),
	.r1_int1_clr				(int1_rx_clr),
	//.r1_int1_sta				(int1_rx_sta)
	.r1_int1_sta				(1'b0),//??????
	.r1_int2_en					(int1_dma_en),
	.r1_int2_clr				(int1_dma_clr),
	.r1_int2_sta				(int1_dma_sta)
);

//===============================================
// eth sma master enable control
// master enable is generated from tx fifo data number
// when tx disable, the remaining operation is still going on
// until current operation ends
// using logic clear can cease operation at once
//===============================================

reg								eth_sma_pe_master_enable;
wire							eth_sma_pe_master_end;
wire							eth_sma_pe_master_logic_clr;
assign eth_sma_pe_master_logic_clr = r0_master_logic_clr;

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		eth_sma_pe_master_enable <= 1'b0;
	else if(((eth_sma_pe_master_enable  == 1'b1) && (eth_sma_pe_master_end == 1'b1)) || eth_sma_pe_master_logic_clr)
		eth_sma_pe_master_enable <= 1'b0;
	else if((eth_sma_pe_master_enable == 1'b0) && (eth_sma_tx_fifo_num > 3'h0))
		eth_sma_pe_master_enable <= 1'b1;
	else
		eth_sma_pe_master_enable <= eth_sma_pe_master_enable;
end

//===============================================
// eth mac pe logic clear control
//
// Using logic clear or ahbmst error occuring 
// can cease operation at once.
//===============================================

wire							eth_mac_pe_tx_logic_clr;
wire							eth_mac_pe_rx_logic_clr;
wire							eth_mac_dl_ahbmst_error_af;
assign eth_mac_pe_tx_logic_clr = r1_tx_logic_clr || eth_mac_dl_ahbmst_error_af;
assign eth_mac_pe_rx_logic_clr = r1_rx_logic_clr || eth_mac_dl_ahbmst_error_af;

pos_step_sync2pulse u_eth_mac_dl_ahbmst_error_sync
(
	.src_clk						(ahb_hclk),
	.src_rstn						(ahb_hrstn),	
	.des_clk						(pe_tx_clk),
	.des_rstn						(pe_tx_rstn),	

	.src_A							(eth_mac_dl_ahbmst_error),
	.des_Y							(eth_mac_dl_ahbmst_error_af)
);

//===============================================
// eth mac datalink logic clear control
//
// Using logic clear or ahbmst error occuring 
// can cease operation at once.
//===============================================

wire							eth_mac_ahbmst_clr;
wire							eth_mac_txdb_clr;
wire							eth_mac_rxdb_clr;
assign eth_mac_ahbmst_clr = r1_dma_clr || eth_mac_dl_ahbmst_error;
assign eth_mac_txdb_clr = r1_tx_data_clr || eth_mac_dl_ahbmst_error;
assign eth_mac_rxdb_clr = r1_rx_data_clr || eth_mac_dl_ahbmst_error;

//===============================================
// eth mac tx enable control
//===============================================

wire							eth_mac_pe_tx_enable;
wire							eth_mac_pe_tx_enable_af_r;

pos_step_sync2step u_eth_mac_txdb_enable_sync
(
	.src_clk						(module_clk),
	.src_rstn						(module_rstn),	
	.des_clk						(pe_tx_clk),
	.des_rstn						(pe_tx_rstn),	

	.src_A							(r1_tx_enable),
	.des_Y							(eth_mac_pe_tx_enable)
);

pos_step_sync2pulse u_eth_mac_txdb_enable_sync_pulse
(
	.src_clk						(module_clk),
	.src_rstn						(module_rstn),	
	.des_clk						(ahb_hclk),
	.des_rstn						(ahb_hrstn),	

	.src_A							(r1_tx_trans_enable),
	.des_Y							(eth_mac_pe_tx_enable_af_r)
);

//===============================================
// eth mac datalink enable control
//
// Datalink enable is including tx and rx enable.
//
// Tx data buffer enable is generated from 
// tx data buffer data ready when tx disable.
//===============================================

reg								eth_mac_txdb_enable;
wire							eth_mac_txdb_enable_end;
wire							eth_mac_txdb_ready_af;

pos_step_sync2pulse u_eth_mac_txdb_ready_sync
(
	.src_clk						(ahb_hclk),
	.src_rstn						(ahb_hrstn),	
	.des_clk						(pe_tx_clk),
	.des_rstn						(pe_tx_rstn),	

	.src_A							(~eth_mac_txdb_processing_doing),
	.des_Y							(eth_mac_txdb_ready_af)
);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		eth_mac_txdb_enable <= 1'b0;
	else if(((eth_mac_txdb_enable == 1'b1) && (eth_mac_txdb_enable_end == 1'b1)) || eth_mac_txdb_clr)
		eth_mac_txdb_enable <= 1'b0;
	else if((eth_mac_txdb_enable == 1'b0) && (eth_mac_pe_tx_enable_af_r))
		eth_mac_txdb_enable <= 1'b1;
	else
		eth_mac_txdb_enable <= eth_mac_txdb_enable;
end

//===============================================
// eth mac pe tx enable control
//
// Tx enable is generated from tx data buffer data ready
// when tx disable, the remaining operation is still going on
// until current operation ends.
//===============================================

reg								eth_mac_pe_tx_trans_enable;
wire							eth_mac_pe_tx_trans_end;
reg								eth_mac_pe_tx_trans_ending;

// Using to keep tx ending state
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		eth_mac_pe_tx_trans_ending <= 1'b0;
	end
	else if(eth_mac_pe_tx_trans_end)
	begin
		eth_mac_pe_tx_trans_ending <= 1'b1;
	end
	else if(eth_mac_txdb_ready_af)
	begin
		eth_mac_pe_tx_trans_ending <= 1'b0;
	end
	else
	begin
		eth_mac_pe_tx_trans_ending <= eth_mac_pe_tx_trans_ending;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
		eth_mac_pe_tx_trans_enable <= 1'b0;
	else if(((eth_mac_pe_tx_trans_enable == 1'b1) && eth_mac_pe_tx_trans_end) || eth_mac_pe_tx_trans_ending || eth_mac_pe_tx_logic_clr)
		eth_mac_pe_tx_trans_enable <= 1'b0;
	else if((eth_mac_pe_tx_trans_enable == 1'b0) && (eth_mac_txdb_data_ready))// do not need sync
		eth_mac_pe_tx_trans_enable <= 1'b1;
	else
		eth_mac_pe_tx_trans_enable <= eth_mac_pe_tx_trans_enable;
end

//===============================================
// eth mac rx enable control
//===============================================

wire							eth_mac_pe_rx_enable;
wire							eth_mac_pe_rx_enable_af_r;

pos_step_sync2step u_eth_mac_rxdb_enable_sync
(
	.src_clk						(module_clk),
	.src_rstn						(module_rstn),	
	.des_clk						(pe_rx_clk),
	.des_rstn						(pe_rx_rstn),	

	.src_A							(r1_rx_enable),
	.des_Y							(eth_mac_pe_rx_enable)
);

pos_step_sync2pulse u_eth_mac_rxdb_enable_sync_pulse
(
	.src_clk						(module_clk),
	.src_rstn						(module_rstn),	
	.des_clk						(ahb_hclk),
	.des_rstn						(ahb_hrstn),	

	.src_A							(r1_rx_trans_enable),
	.des_Y							(eth_mac_pe_rx_enable_af_r)
);

//===============================================
// eth mac datalink enable control
//
// Datalink rx enable.
//
// Rx data buffer enable is generated from 
// rx data buffer data ready when rx disable.
//===============================================

reg								eth_mac_rxdb_enable;
wire							eth_mac_rxdb_enable_end;
wire							eth_mac_rxdb_ready_af;

pos_step_sync2pulse u_eth_mac_rxdb_ready_sync
(
	.src_clk						(ahb_hclk),
	.src_rstn						(ahb_hrstn),	
	.des_clk						(pe_rx_clk),
	.des_rstn						(pe_rx_rstn),	

	.src_A							(~eth_mac_rxdb_processing_doing),
	.des_Y							(eth_mac_rxdb_ready_af)
);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		eth_mac_rxdb_enable <= 1'b0;
	else if(((eth_mac_rxdb_enable == 1'b1) && (eth_mac_rxdb_enable_end == 1'b1)) || eth_mac_rxdb_clr)
		eth_mac_rxdb_enable <= 1'b0;
	else if((eth_mac_rxdb_enable == 1'b0) && (eth_mac_pe_rx_enable_af_r))
		eth_mac_rxdb_enable <= 1'b1;
	else
		eth_mac_rxdb_enable <= eth_mac_rxdb_enable;
end

//===============================================
// eth mac pe rx enable control
//
// Rx enable is generated from tx data buffer data ready
// when tx disable, the remaining operation is still going on
// until current operation ends.
//===============================================

reg								eth_mac_pe_rx_trans_enable;
wire							eth_mac_pe_rx_trans_end;
reg								eth_mac_pe_rx_trans_ending;

//// Using to keep rx ending state
//always @(posedge pe_rx_clk or negedge pe_rx_rstn)
//begin
//	if(!pe_rx_rstn)
//	begin
//		eth_mac_pe_rx_trans_ending <= 1'b0;
//	end
//	else if(eth_mac_pe_rx_trans_end)
//	begin
//		eth_mac_pe_rx_trans_ending <= 1'b1;
//	end
//	else if(eth_mac_rxdb_ready_af)
//	begin
//		eth_mac_pe_rx_trans_ending <= 1'b0;
//	end
//	else
//	begin
//		eth_mac_pe_tx_trans_ending <= eth_mac_pe_tx_trans_ending;
//	end
//end
//
//always @(posedge pe_tx_clk or negedge pe_tx_rstn)
//begin
//	if(!pe_tx_rstn)
//		eth_mac_pe_tx_trans_enable <= 1'b0;
//	else if(((eth_mac_pe_tx_trans_enable == 1'b1) && eth_mac_pe_tx_trans_end) || eth_mac_pe_tx_trans_ending || eth_mac_pe_tx_logic_clr)
//		eth_mac_pe_tx_trans_enable <= 1'b0;
//	else if((eth_mac_pe_tx_trans_enable == 1'b0) && (eth_mac_txdb_data_ready))// do not need sync
//		eth_mac_pe_tx_trans_enable <= 1'b1;
//	else
//		eth_mac_pe_tx_trans_enable <= eth_mac_pe_tx_trans_enable;
//end

//===============================================
// eth data buffer
// eth sma data buffer
// eth mac datalink: tx data buffer and rx data buffer
//===============================================

eth_sma_data_buffer u_eth_sma_data_buffer
(
	.tx_fifo_clk				(module_clk),
	.tx_fifo_rst				(r0_tx_fifo_clr),
	.rx_fifo_clk				(module_clk),
	.rx_fifo_rst				(r0_rx_fifo_clr),

	.tx_fifo_we					(eth_sma_tx_fifo_we),
	.tx_fifo_re					(eth_sma_tx_fifo_re),
	.tx_fifo_wdata				(eth_sma_tx_fifo_wdata),
	.tx_fifo_rdata				(eth_sma_tx_fifo_rdata),
	.tx_fifo_num				(eth_sma_tx_fifo_num),
	.tx_fifo_empty				(),
	.tx_fifo_full				(),
	.rx_fifo_we					(eth_sma_rx_fifo_we),
	.rx_fifo_re					(eth_sma_rx_fifo_re),
	.rx_fifo_wdata				(eth_sma_rx_fifo_wdata),
	.rx_fifo_rdata				(eth_sma_rx_fifo_rdata),
	.rx_fifo_num				(eth_sma_rx_fifo_num),
	.rx_fifo_empty				(),
	.rx_fifo_full				(),

    .r_tx_fifo_watermark		(r0_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r0_rx_fifo_watermark),

	.int_status_rx_fifo_noempty	(int0_tgr[3]),
	.int_status_rx_fifo_warning	(int0_tgr[2]),
	.int_status_tx_fifo_empty	(int0_tgr[1]),
	.int_status_tx_fifo_warning	(int0_tgr[0])
);

eth_mac_data_buffer u_eth_mac_data_buffer
(
	.pe_tx_clk							(pe_tx_clk),
	.pe_tx_rstn							(pe_tx_rstn),
	.pe_rx_clk							(pe_rx_clk),
	.pe_rx_rstn							(pe_rx_rstn),

	.txdb_pe2fifo_rdreq					(eth_mac_txdb_pe2fifo_rdreq),	
	.txdb_pe2fifo_rdreq_done			(eth_mac_txdb_pe2fifo_rdreq_done),	
	.txdb_fifo2pe_rdata					(eth_mac_txdb_fifo2pe_rdata),	
	.txdb_fifo2pe_empty					(eth_mac_txdb_fifo2pe_empty),	
	.txdb_fifo2pe_done					(eth_mac_txdb_fifo2pe_done),	
	.txdb_fifo2pe_burst_process_done	(eth_mac_txdb_fifo2pe_burst_process_done),	
	.txdb_fifo2pe_single_process_done	(eth_mac_txdb_fifo2pe_single_process_done),
	.txdb_pe_tx_end						(eth_mac_pe_tx_trans_end),
	.txdb_data_ready   					(eth_mac_txdb_data_ready),
	.txdb_process_doing					(eth_mac_txdb_processing_doing),
	.dl_ahbmst_error					(eth_mac_dl_ahbmst_error),

	.ahb_hclk							(ahb_hclk),
	.ahb_hrstn							(ahb_hrstn),
	.ahb_hsel							(ahb_hsel),
	.ahb_hreadyout						(ahb_hreadyout),
	.ahb_htrans							(ahb_htrans),
	.ahb_hsize							(ahb_hsize),
	.ahb_hwrite							(ahb_hwrite),
	.ahb_hburst							(ahb_hburst),
	.ahb_haddr							(ahb_haddr),
	.ahb_hprot							(ahb_hprot),
	.ahb_hwdata							(ahb_hwdata),
	.ahb_hready							(ahb_hready),
	.ahb_hresp							(ahb_hresp),
	.ahb_hrdata							(ahb_hrdata),	

	.txdb_enable						(eth_mac_txdb_enable),
	.txdb_enable_end					(eth_mac_txdb_enable_end),
	.ahbmst_logic_clr					(eth_mac_ahbmst_clr),
	.txdb_logic_clr						(eth_mac_txdb_clr),
	.rxdb_logic_clr						(eth_mac_rxdb_clr),

	.r_hready_tothres					(r1_hready_tothres),

	.r_priority_ratio					(r1_priority_ratio),
	.r_txrx_priority					(r1_txrx_priority),
	.r_arb_scheme						(r1_arb_scheme),

	.r_tdes_num							(r1_tdes_num),
	.r_rdes_num							(r1_rdes_num),
	.r_tdes00							(r1_tdes00),
	.r_tdes02							(r1_tdes02),
	.r_tdes03							(r1_tdes03),
	.r_tdes10							(r1_tdes10),
	.r_tdes12							(r1_tdes12),
	.r_tdes13							(r1_tdes13),
	.r_tdes20							(r1_tdes20),
	.r_tdes22							(r1_tdes22),
	.r_tdes23							(r1_tdes23),
	.r_tdes30							(r1_tdes30),
	.r_tdes32							(r1_tdes32),
	.r_tdes33							(r1_tdes33),
	.r_rdes00							(r1_rdes00),
	.r_rdes03							(r1_rdes03),
	.r_rdes10							(r1_rdes10),
	.r_rdes13							(r1_rdes13),
	.r_rdes20							(r1_rdes20),
	.r_rdes23							(r1_rdes23),
	.r_rdes30							(r1_rdes30),
	.r_rdes33							(r1_rdes33),

	.r_tx_address1						(r1_tx_address1),
	.r_tx_ioc_int_en					(int1_tx_en[0]),
	.r_tx_length1						(r1_tx_length1),
	.r_tx_cpc							(r1_tx_cpc),	
	.r_tx_saic							(r1_tx_saic),
	.r_tx_cic							(r1_tx_cic),
                            		                     
	.r_rx_address1						(r1_rx_address1),
	.r_rx_ioc_int_en					(r1_rx_ioc_int_en),

	.int_status_dma_hready_to			(int1_dma_tgr[1]),
	.int_status_dma_hresp_error			(int1_dma_tgr[2]), 
	.int_status_dma_process_finish		(int1_dma_tgr[0]) 
);

//===============================================
// eth protocol engine core
// eth sma engine
// eth mac engine
//===============================================

eth_pe_core u_eth_pe_core
(
	.pe_clk										(module_clk),  
	.pe_rstn									(module_rstn),
                                				                
	.eth_mdc									(eth_mdc),
	.eth_mdc_oen								(eth_mdc_oen),
	.eth_mdio_o									(eth_mdio_o),
	.eth_mdio_i									(eth_mdio_i),
	.eth_mdio_oen								(eth_mdio_oen),
                                				                
	.eth_sma_tx_fifo_re							(eth_sma_tx_fifo_re),
	.eth_sma_tx_fifo_data						(eth_sma_tx_fifo_rdata),
	.eth_sma_tx_fifo_num						(eth_sma_tx_fifo_num),
	.eth_sma_rx_fifo_we							(eth_sma_rx_fifo_we),
	.eth_sma_rx_fifo_data						(eth_sma_rx_fifo_wdata),
	.eth_sma_rx_fifo_num						(eth_sma_rx_fifo_num),
                                				                
	.eth_sma_pe_master_logic_clr				(eth_sma_pe_master_logic_clr),
	.eth_sma_pe_master_enable					(eth_sma_pe_master_enable),
	.eth_sma_pe_master_end						(eth_sma_pe_master_end),
	.r0_clkdiv									(r0_clkdiv),
	.r0_phyadr									(r0_phyadr),
	.r0_interval_bit							(r0_interval_bit),

	.int0_status_rx_turn_nack					(int0_tgr[5]),
	.int0_status_master_frame_done				(int0_tgr[4]),

	.pe_tx_clk									(pe_tx_clk),  
	.pe_tx_rstn									(pe_tx_rstn),

	.eth_tx										(eth_tx),
	.eth_tx_oen									(eth_tx_oen),
	.eth_tx_ctrl								(eth_tx_ctrl),
	.eth_tx_ctrl_oen							(eth_tx_ctrl_oen),
	.eth_tx_clk									(eth_tx_clk),
	.eth_tx_clk_oen								(eth_tx_clk_oen),

	.eth_mac_txdb_pe2fifo_rdreq					(eth_mac_txdb_pe2fifo_rdreq),
	.eth_mac_txdb_pe2fifo_rdreq_done			(eth_mac_txdb_pe2fifo_rdreq_done),
	.eth_mac_txdb_fifo2pe_rdata					(eth_mac_txdb_fifo2pe_rdata),
	.eth_mac_txdb_fifo2pe_empty					(eth_mac_txdb_fifo2pe_empty),
	.eth_mac_txdb_fifo2pe_done					(eth_mac_txdb_fifo2pe_done),
	.eth_mac_txdb_fifo2pe_burst_process_done	(eth_mac_txdb_fifo2pe_burst_process_done),
	.eth_mac_txdb_fifo2pe_single_process_done	(eth_mac_txdb_fifo2pe_single_process_done),
	.eth_mac_txdb_data_ready					(eth_mac_txdb_data_ready),

	.eth_mac_pe_tx_logic_clr					(eth_mac_pe_tx_logic_clr),
	.eth_mac_pe_rx_logic_clr					(eth_mac_pe_rx_logic_clr),
	.eth_mac_pe_tx_clk_enable					(eth_mac_pe_tx_enable),
	.eth_mac_pe_tx_data_enable					(eth_mac_pe_tx_trans_enable),
	.eth_mac_pe_rx_clk_enable					(eth_mac_pe_rx_enable),
	.eth_mac_pe_rx_data_enable					(eth_mac_pe_rx_trans_enable),
	.eth_mac_pe_tx_data_end						(eth_mac_pe_tx_trans_end),
	.eth_mac_pe_rx_end							(),

	.r1_sa_macaddrl								(r1_sa_macaddrl),
	.r1_sa_macaddrh								(r1_sa_macaddrh),
	.r1_arp_offload								(r1_arp_offload),
	.r1_pre_byte								(r1_pre_byte),
	.r1_interval_byte							(r1_interval_byte),

	.r1_sa_filter								(r1_sa_filter),	
	.r1_ipc_filter								(r1_ipc_filter),	
	.r1_db_filter								(r1_db_filter),	
	.r1_2kp_en									(r1_2kp_en),	
	.r1_duplex									(r1_duplex),
	.r1_crsfd									(r1_crsfd),	 
                                			                    
	.r1_tx_length1								(r1_tx_length1),
	.r1_tx_cpc									(r1_tx_cpc),	
	.r1_tx_saic									(r1_tx_saic),
	.r1_tx_cic									(r1_tx_cic),

	.int1_status_tx_done						(int1_tx_tgr[0])
);

//===============================================
// eth interrupt management
// each eth module has 4 interrupt line
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign eth_sma_int_line = |int0_line;

posedge_detect 
#(
	.WIDTH						(6)
)
u_sma_int_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(int0_tgr),
	.Y							(int0_pos)
);

interrupt_gen 
#(
	.WIDTH						(6)
)
u_sma_interrupt_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int0_en),
	.int_tgr					(int0_pos),
	.int_clr					(int0_clr),
	.int_sta					(int0_sta),
	.int_line					(int0_line)	
);

assign eth_mac_tx_int_line = |int1_tx_line;

posedge_detect 
#(
	.WIDTH						(1)
)
u_mac_tx_int_detect 
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),
	.A							(int1_tx_tgr),
	.Y							(int1_tx_pos)
);

interrupt_gen 
#(
	.WIDTH						(1)
)
u_mac_tx_interrupt_gen
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),

	.int_en						(int1_tx_en),
	.int_tgr					(int1_tx_pos),
	.int_clr					(int1_tx_clr),
	.int_sta					(int1_tx_sta),
	.int_line					(int1_tx_line)	
);

assign eth_mac_rx_int_line = 1'b0;//???

assign eth_mac_dma_int_line = |int1_dma_line;

posedge_detect 
#(
	.WIDTH						(3)
)
u_mac_dma_int_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(int1_dma_tgr),
	.Y							(int1_dma_pos)
);

interrupt_gen 
#(
	.WIDTH						(3)
)
u_mac_dma_interrupt_gen
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),

	.int_en						(int1_dma_en),
	.int_tgr					(int1_dma_pos),
	.int_clr					(int1_dma_clr),
	.int_sta					(int1_dma_sta),
	.int_line					(int1_dma_line)	
);

endmodule

