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
	output						int0_status_master_frame_done
);

//===============================================
// eth status management
//===============================================

wire							r0_interval_en;
assign r0_interval_en = (r0_interval_bit != 8'h0) ? 1'b1 : 1'b0;

//===============================================
// eth status control
//===============================================

wire							eth_sma_pe_master_enable_r;

posedge_detect u_posedge_detect 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),
	.A							(eth_sma_pe_master_enable),
	.Y							(eth_sma_pe_master_enable_r)
);


//// guarantee rx signal is align with bit timing
//sync_ff_en
//#(
//	WIDTH						(1),
//	DEFAULT_VAL					(0)
//)u_sync_ff_inst0
//(
//	.clk						(pe_clk),
//	.rstn						(pe_rstn),	
//
//	.en							(pe_rx_enable)
//	.A							(uart_rx),
//	.Y							(uart_rx_d)
//);
//
//wire							pe_rx_enable_2d;
//
//// due to the input uart rx signal need to be synced by 2 ff
//// in acccord with this signal
//sync_ff_2d
//#(
//	WIDTH						(1),
//	DEFAULT_VAL					(1)
//)u_sync_ff_2d_inst0
//(
//	.clk						(pe_clk),
//	.rstn						(pe_rstn),	
//
//	.A							(pe_rx_enable),
//	.Y							(pe_rx_enable_2d)
//);

//===============================================
// uart pin control (reserved)
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

endmodule

