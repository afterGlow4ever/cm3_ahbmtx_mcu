//===============================================
//
//	File: eth_sma_data_buffer.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03092024
//	Version: v1.0
//
// 	This is data buffer for ethernet sma.
//
//===============================================

module eth_sma_data_buffer
(
	// clk & rst
//	input						tx_fifo_wclk,
//	input						tx_fifo_rclk,
	input						tx_fifo_clk,
	input						tx_fifo_rst,
//	input						rx_fifo_wclk,
//	input						rx_fifo_rclk,
	input						rx_fifo_clk,
	input						rx_fifo_rst,

	// data interface
	input						tx_fifo_we,
	input						tx_fifo_re,
	input		[22:0]			tx_fifo_wdata,
	output		[22:0]			tx_fifo_rdata,
	output		[ 2:0]			tx_fifo_num,
	output						tx_fifo_empty,
	output						tx_fifo_full,
	input						rx_fifo_we,
	input						rx_fifo_re,
	input		[15:0]			rx_fifo_wdata,
	output		[15:0]			rx_fifo_rdata,
	output		[ 2:0]			rx_fifo_num,
	output						rx_fifo_empty,
	output						rx_fifo_full,

	// watermark	
	input		[ 2:0]			r_tx_fifo_watermark,
	input		[ 2:0]			r_rx_fifo_watermark,

	// interrupt status
	output						int_status_rx_fifo_noempty,
	output						int_status_rx_fifo_warning,
	output						int_status_tx_fifo_empty,
	output						int_status_tx_fifo_warning
);

//===============================================
// eth sma tx fifo
// fifo write from regs
// fifo read from eth sma master protocol engine
//===============================================

fifo_sync 
#(
	.ADDR_WIDTH					(2), 
	.DATA_WIDTH					(23)
)          
u_tx_fifo
(                                           
	.clk						(tx_fifo_clk),
	.rstn						(~tx_fifo_rst),
                                       
	.wr_req						(tx_fifo_we),
	.rd_req						(tx_fifo_re),
	.rd_empty					(tx_fifo_empty),
	.wr_full					(tx_fifo_full),
	.fifo_num					(tx_fifo_num),                                

	.data						(tx_fifo_wdata),
	.q							(tx_fifo_rdata)
);

//===============================================
// eth sma rx fifo
// fifo write from eth sma master protocol engine
// fifo read from regs
//===============================================

fifo_sync 
#(
	.ADDR_WIDTH					(2), 
	.DATA_WIDTH					(16)
)          
u_rx_fifo
(                                           
	.clk						(rx_fifo_clk),
	.rstn						(~rx_fifo_rst),
                                       
	.wr_req						(rx_fifo_we),
	.rd_req						(rx_fifo_re),
	.rd_empty					(rx_fifo_empty),
	.wr_full					(rx_fifo_full),
	.fifo_num					(rx_fifo_num),                                

	.data						(rx_fifo_wdata),
	.q							(rx_fifo_rdata)
);

//===============================================
// fifo flag
//===============================================

assign int_status_rx_fifo_noempty = ~rx_fifo_empty;
assign int_status_tx_fifo_empty = tx_fifo_empty;
assign int_status_rx_fifo_warning = (rx_fifo_num >= r_rx_fifo_watermark) ? 1'b1 : 1'b0;
assign int_status_tx_fifo_warning = (tx_fifo_num >= r_tx_fifo_watermark) ? 1'b1 : 1'b0;

endmodule

