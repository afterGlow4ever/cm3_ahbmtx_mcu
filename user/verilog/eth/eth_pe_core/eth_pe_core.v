//===============================================
//
//	File: eth_pe_core.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02272024
//	Version: v1.0
//
// 	This is protocol engine core for ethernet.
//	This core is including:
//	eth sma protocol implementation
//	eth status management
//	eth pin control
//
//===============================================

module eth_pe_core
(
	input  						pe_clk,  
	input  						pe_rstn,
	input  						pe_tx_clk,  
	input  						pe_tx_rstn,

	// eth sma interface
	// pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,

	// data
	output						eth_sma_tx_fifo_re,
	input		[22:0]			eth_sma_tx_fifo_data,
	input		[ 2:0]			eth_sma_tx_fifo_num,
	output						eth_sma_rx_fifo_we,
	output		[15:0]			eth_sma_rx_fifo_data,
	input		[ 2:0]			eth_sma_rx_fifo_num,

	// control
	input						eth_sma_pe_master_logic_clr,
	input						eth_sma_pe_master_enable,
	output						eth_sma_pe_master_end,

	// config
	input		[ 7:0]			r0_clkdiv,
	input		[ 4:0]			r0_phyadr,
	input 		[ 7:0]			r0_interval_bit,

	// interrupt status
	output						int0_status_rx_turn_nack,
	output						int0_status_master_frame_done,

	// eth mac interface
	// pin
	output 		[ 3:0]			eth_tx,
	output 		[ 3:0]			eth_tx_oen,
	output 						eth_tx_ctrl,
	output 						eth_tx_ctrl_oen,
	output						eth_tx_clk,	
	output						eth_tx_clk_oen,	
	input 		[ 3:0]			eth_rx,
	output 		[ 3:0]			eth_rx_oen,
	input 						eth_rx_ctrl,
	output 						eth_rx_ctrl_oen,
	input						eth_rx_clk,
	output						eth_rx_clk_oen,

	// data
	output 						eth_mac_txdb_pe2fifo_rdreq,		
	output 						eth_mac_txdb_pe2fifo_rdreq_done,		
	input 		[31:0]			eth_mac_txdb_fifo2pe_rdata,	
	input 						eth_mac_txdb_fifo2pe_empty,	
	input 						eth_mac_txdb_fifo2pe_done,	
	input 						eth_mac_txdb_fifo2pe_burst_process_done,	
	input 						eth_mac_txdb_fifo2pe_single_process_done,	
	input 						eth_mac_txdb_data_ready,  	
	input 						eth_mac_rxdb_pe2fifo_wrreq,
	output 						eth_mac_rxdb_pe2fifo_we_done,
	output		[31:0]			eth_mac_rxdb_pe2fifo_wdata,
//	input						eth_mac_rxdb_fifo_full,
	input						eth_mac_rxdb_fifo_done,
//	input						eth_mac_rxdb_fifo2pe_burst_process_done,
//	input						eth_mac_rxdb_fifo_ready,	




	// control
	input						eth_mac_pe_tx_logic_clr,
	input						eth_mac_pe_rx_logic_clr,
	input						eth_mac_pe_tx_clk_enable,
	input						eth_mac_pe_tx_data_enable,
	input						eth_mac_pe_rx_clk_enable,
	input						eth_mac_pe_rx_data_enable,
	output						eth_mac_pe_tx_data_end,
	output						eth_mac_pe_rx_end,

	// config from regs
	input		[31:0]			r1_sa_macaddrl,
	input		[15:0]			r1_sa_macaddrh,
	input						r1_arp_offload,
	input						r1_sa_filter,	
	input						r1_ipc_filter,	
	input						r1_db_filter,	
	input						r1_2kp_en,	
	input						r1_duplex,
	input						r1_crsfd, 
	input		[ 1:0]			r1_pre_byte,
	input		[ 5:0]			r1_interval_byte,
	input						r1_cs_rm,
	input						r1_pc_rm,

	// config from descriptors
	input		[11:0]			r1_tx_length1,
	output		[11:0]			r1_rx_length1,
	input		[ 1:0]			r1_tx_cpc,	
	input		[ 1:0]			r1_tx_saic,
	input		[ 1:0]			r1_tx_cic,

	// interrupt status
	output						int1_status_tx_done
);

//===============================================
// eth sma status management
//===============================================

wire							r0_interval_en;
assign r0_interval_en = (r0_interval_bit != 8'h0) ? 1'b1 : 1'b0;

//===============================================
// eth sma status control
//===============================================

wire							eth_sma_pe_master_enable_r;

posedge_detect u_sma_pe_master_enable_detect 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),
	.A							(eth_sma_pe_master_enable),
	.Y							(eth_sma_pe_master_enable_r)
);

//===============================================
// eth pin control (reserved)
// full duplex
// half duplex
//===============================================


//===============================================
// eth sma master protocol engine
//===============================================

eth_sma_pe_master u_eth_sma_pe_master 
(
	.pe_clk							(pe_clk),  
	.pe_rstn						(pe_rstn),
                            	                    
	.eth_mdc						(eth_mdc),
	.eth_mdc_oen					(eth_mdc_oen),
	.eth_mdio_o						(eth_mdio_o),
	.eth_mdio_i						(eth_mdio_i),
	.eth_mdio_oen					(eth_mdio_oen),

	.tx_fifo_re						(eth_sma_tx_fifo_re),
	.tx_fifo_data					(eth_sma_tx_fifo_data),
	.tx_fifo_num					(eth_sma_tx_fifo_num),
	.rx_fifo_we						(eth_sma_rx_fifo_we),
	.rx_fifo_data					(eth_sma_rx_fifo_data),
	.rx_fifo_num					(eth_sma_rx_fifo_num),
                            	                    
	.pe_master_logic_clr			(eth_sma_pe_master_logic_clr),
	.pe_master_enable				(eth_sma_pe_master_enable),
	.pe_master_enable_r				(eth_sma_pe_master_enable_r),
	.pe_master_end					(eth_sma_pe_master_end),

	.r_clkdiv						(r0_clkdiv),
	.r_phyadr						(r0_phyadr),
	.r_interval_bit					(r0_interval_bit),
	.r_interval_en					(r0_interval_en),

	.int_status_rx_turn_nack		(int0_status_rx_turn_nack),
	.int_status_master_frame_done	(int0_status_master_frame_done)
);

//===============================================
// eth mac status management
//
// r1_tx_payload_byte_length is only payload length
// which is read from data buffer filled with sw.
// Hardware insertion section is not involved in.
// The real payload length will be calculated in tx pe
// considering sa mac and cs.
//===============================================

wire			[3:0]				r1_pre_byte_real;
assign r1_pre_byte_real = (r1_pre_byte  == 2'h0) ? 4'd8 : 
						  (r1_pre_byte  == 2'h1) ? 4'd6 :
						  (r1_pre_byte  == 2'h2) ? 4'd4 : 4'd2;// add the last byte 0xd5 

wire								r1_hw_sa_mac_en;
wire								r1_hw_sa_mac_replace_en;
wire								r1_hw_crc_en;
wire								r1_hw_crc_replace_en;
wire								r1_hw_padding_en;
wire								r1_hw_cs_en;
wire								r1_hw_cs_replace_en;

assign r1_hw_sa_mac_en = (r1_tx_saic == 2'h1) ? 1'b1 : 1'b0;
assign r1_hw_sa_mac_replace_en = (r1_tx_saic == 2'h2) ? 1'b1 : 1'b0;
assign r1_hw_crc_en = (r1_tx_cpc == 2'h0) ? 1'b1 :
					  (r1_tx_cpc == 2'h1) ? 1'b1 : 1'b0;
assign r1_hw_crc_replace_en = (r1_tx_cpc == 2'h3) ? 1'b1 : 1'b0;
assign r1_hw_padding_en = ((r1_tx_cpc == 2'h0) ? 1'b1 : 1'b0);
assign r1_hw_cs_en = (r1_tx_cic == 2'h1) ?  1'b1 : 1'b0;
assign r1_hw_cs_replace_en = (r1_tx_cic == 2'h2) ?  1'b1 : 1'b0;

wire			[11:0]				r1_tx_payload_byte_length;// real payload length that means excluding padding and crc
//assign r1_tx_payload_byte_length = r1_tx_length1 + (r1_hw_sa_mac_en ? 4'd6 : 4'd0) + (r1_hw_crc_replace_en ? 4'd4 : 4'd0);//ip cs determined by tx handle
assign r1_tx_payload_byte_length = r1_tx_length1 + (r1_hw_sa_mac_en ? 4'd6 : 4'd0);//ip cs determined by tx handle

wire			[47:0]				r1_sa_macaddr;
assign r1_sa_macaddr = {r1_sa_macaddrh, r1_sa_macaddrl};

//===============================================
// eth mac status control
//===============================================

wire							eth_mac_pe_tx_data_enable_r;

posedge_detect u_mac_pe_tx_enable_detect 
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),
	.A							(eth_mac_pe_tx_data_enable),
	.Y							(eth_mac_pe_tx_data_enable_r)
);

//===============================================
// eth mac tx protocol engine
//===============================================

eth_mac_pe_tx u_eth_mac_pe_tx 
(
	.pe_tx_clk							(pe_tx_clk),  
	.pe_tx_rstn							(pe_tx_rstn),

	.txdb_pe2fifo_re					(eth_mac_txdb_pe2fifo_rdreq),
	.txdb_pe2fifo_re_done				(eth_mac_txdb_pe2fifo_rdreq_done),
	.txdb_fifo2pe_rdata					(eth_mac_txdb_fifo2pe_rdata),
	.txdb_fifo_empty					(eth_mac_txdb_fifo2pe_empty),
	.txdb_fifo_done						(eth_mac_txdb_fifo2pe_done),
	.txdb_fifo2pe_burst_process_done	(eth_mac_txdb_fifo2pe_burst_process_done),
	.txdb_fifo2pe_single_process_done	(eth_mac_txdb_fifo2pe_single_process_done),
	.txdb_fifo_ready					(eth_mac_txdb_data_ready),

	.eth_tx								(eth_tx),
	.eth_tx_oen							(eth_tx_oen),
	.eth_tx_ctrl						(eth_tx_ctrl),
	.eth_tx_ctrl_oen					(eth_tx_ctrl_oen),
	.eth_tx_clk							(eth_tx_clk),
	.eth_tx_clk_oen						(eth_tx_clk_oen),

	.pe_tx_logic_clr					(eth_mac_pe_tx_logic_clr),
	.pe_tx_clk_enable					(eth_mac_pe_tx_clk_enable),
	.pe_tx_data_enable					(eth_mac_pe_tx_data_enable),
	.pe_tx_data_enable_r				(eth_mac_pe_tx_data_enable_r),
	.pe_tx_data_end						(eth_mac_pe_tx_data_end),

	.r_sa_macaddr						(r1_sa_macaddr),
	.r_pre_byte							(r1_pre_byte_real),
	.r_interval_byte					(r1_interval_byte),

	.r_tx_payload_byte_length			(r1_tx_payload_byte_length),
//	.r_tx_payload_byte_length			({r1_tx_payload_byte_length[11:2], 2'h0}),
	.r_hw_sa_mac_en						(r1_hw_sa_mac_en),
	.r_hw_sa_mac_replace_en				(r1_hw_sa_mac_replace_en),
	.r_hw_crc_en						(r1_hw_crc_en),
	.r_hw_crc_replace_en				(r1_hw_crc_replace_en),
	.r_hw_padding_en					(r1_hw_padding_en),
	.r_hw_cs_en							(r1_hw_cs_en),
	.r_hw_cs_replace_en					(r1_hw_cs_replace_en),
	.int_status_tx_done					(int1_status_tx_done)
);

//===============================================
// eth mac rx protocol engine
//===============================================

//eth_mac_pe_rx u_eth_mac_pe_rx 
//(
//	.pe_rx_clk							(pe_rx_clk),  
//	.pe_rx_rstn							(pe_rx_rstn),
//
//	.rxdb_pe2fifo_we					(eth_mac_rxdb_pe2fifo_wrreq),
//	.rxdb_pe2fifo_we_done				(eth_mac_rxdb_pe2fifo_we_done),
//	.rxdb_pe2fifo_wdata					(eth_mac_rxdb_pe2fifo_wdata),
////	.rxdb_fifo_full						(eth_mac_rxdb_fifo_full),
//	.rxdb_fifo_done						(eth_mac_rxdb_fifo_done),
////	.rxdb_fifo2pe_burst_process_done	(eth_mac_rxdb_fifo2pe_burst_process_done),
////	.rxdb_fifo_ready					(eth_mac_rxdb_fifo_ready),
//
//	.eth_rx								(eth_rx),
//	.eth_rx_oen							(eth_rx_oen),
//	.eth_rx_ctrl						(eth_rx_ctrl),
//	.eth_rx_ctrl_oen					(eth_rx_ctrl_oen),
//	.eth_rx_clk							(eth_rx_clk),
//	.eth_rx_clk_oen						(eth_rx_clk_oen),
//
//	.pe_rx_logic_clr					(eth_mac_pe_rx_logic_clr),
//	.pe_rx_clk_enable					(pe_rx_clk_enable),
//	.pe_rx_data_enable					(),
//	.pe_rx_data_enable_r				(),
//	.pe_rx_data_end						(),
//
//	.r_sa_macaddr						(r_sa_macaddr),
//	.r_cs_rm							(r_cs_rm),
//	.r_pc_rm							(r_pc_rm),
//
//	.r_rx_payload_byte_length			(r_rx_payload_byte_length),
//
//	.int_status_rx_done					(int_status_rx_done)
//);

assign eth_mac_pe_rx_end = 1'b0;//?????






endmodule

