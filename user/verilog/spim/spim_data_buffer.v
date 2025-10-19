//===============================================
//
//	File: spim_data_buffer.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is data buffer for spi master.
//
//===============================================

module spim_data_buffer
(
	// clk & rst
	input						tx_fifo_wclk,
	input						tx_fifo_rclk,
	input						tx_fifo_wrst,
	input						tx_fifo_rrst,
	input						tx_fifo_clear,
	input						rx_fifo_wclk,
	input						rx_fifo_rclk,
	input						rx_fifo_wrst,
	input						rx_fifo_rrst,
	input						rx_fifo_clear,

	// data interface
	input						tx_fifo_we,
	input						tx_fifo_re,
	input		[ 7:0]			tx_fifo_wdata,
	output		[ 7:0]			tx_fifo_rdata,
	output		[ 4:0]			tx_fifo_we_num,
	output		[ 4:0]			tx_fifo_re_num,
	output						tx_fifo_empty,
	output						tx_fifo_full,
	input						rx_fifo_we,
	input						rx_fifo_re,
	input		[ 7:0]			rx_fifo_wdata,
	output		[ 7:0]			rx_fifo_rdata,
	output		[ 4:0]			rx_fifo_we_num,
	output		[ 4:0]			rx_fifo_re_num,
	output						rx_fifo_empty,
	output						rx_fifo_full,

	// config
	input		[ 4:0]			r_tx_fifo_watermark,
	input		[ 4:0]			r_rx_fifo_watermark,
	input						r_tx_msblsb,
	input						r_rx_msblsb,

	// interrupt status
	output						int_status_rx_fifo_noempty,
	output						int_status_rx_fifo_warning,
	output						int_status_tx_fifo_empty,
	output						int_status_tx_fifo_warning
);

//===============================================
// data handle
//===============================================

wire		[ 7:0]				tx_fifo_data;	
wire		[ 7:0]				tx_fifo_msb_data;	
wire		[ 7:0]				tx_fifo_q;	

genvar							i;

generate
	for(i = 0; i < 8; i = i + 1)
	begin: swap_tx_data
		assign tx_fifo_msb_data[i] = tx_fifo_wdata[7 - i];
	end
endgenerate

assign tx_fifo_data = r_tx_msblsb ? tx_fifo_msb_data : tx_fifo_wdata;
assign tx_fifo_rdata = tx_fifo_q;

wire		[ 7:0]				rx_fifo_data;	
wire		[ 7:0]				rx_fifo_msb_q;	
wire		[ 7:0]				rx_fifo_q;	

genvar							j;

generate
	for(j = 0; j < 8; j = j + 1)
	begin: swap_rx_data
		assign rx_fifo_msb_q[j] = rx_fifo_q[7 - j];
	end
endgenerate

assign rx_fifo_data = rx_fifo_wdata;
assign rx_fifo_rdata = r_rx_msblsb ? rx_fifo_msb_q : rx_fifo_q;

//===============================================
// spim tx fifo
// fifo write from regs
// fifo read from trans protocol engine
//===============================================

fifo_async_f
#(
	.ADDR_WIDTH					(4), 
	.DATA_WIDTH					(8)
)          
u_tx_fifo
(                                           
	.wr_clk						(tx_fifo_wclk),
	.rd_clk						(tx_fifo_rclk),
	.wr_rstn					(tx_fifo_wrst),
	.rd_rstn					(tx_fifo_rrst),
	.wr_clear					(tx_fifo_clear),
	.rd_clear					(1'b0),
                                       
	.wr_req						(tx_fifo_we),
	.rd_req						(tx_fifo_re),
	.rd_empty					(tx_fifo_empty),
	.wr_full					(tx_fifo_full),
	.wr_fifo_num				(tx_fifo_we_num),
	.rd_fifo_num				(tx_fifo_re_num),        
	.wr_overflow				(),
	.rd_underflow				(),

	.data						(tx_fifo_data),
	.q							(tx_fifo_q)
);

//===============================================
// spim rx fifo
// fifo write from rx protocol engine
// fifo read from regs
//===============================================

fifo_async_f 
#(
	.ADDR_WIDTH					(4), 
	.DATA_WIDTH					(8)
)          
u_rx_fifo
(                                           
	.wr_clk						(rx_fifo_wclk),
	.rd_clk						(rx_fifo_rclk),
	.wr_rstn					(rx_fifo_wrst),
	.rd_rstn					(rx_fifo_rrst),
	.wr_clear					(1'b0),
	.rd_clear					(rx_fifo_clear),
                                       
	.wr_req						(rx_fifo_we),
	.rd_req						(rx_fifo_re),
	.rd_empty					(rx_fifo_empty),
	.wr_full					(rx_fifo_full),
	.wr_fifo_num				(rx_fifo_we_num),
	.rd_fifo_num				(rx_fifo_re_num),        
	.wr_overflow				(),
	.rd_underflow				(),

	.data						(rx_fifo_data),
	.q							(rx_fifo_q)
);

//===============================================
// fifo flag
//===============================================

assign int_status_rx_fifo_noempty = ~rx_fifo_empty;
assign int_status_tx_fifo_empty = tx_fifo_empty;
assign int_status_rx_fifo_warning = (rx_fifo_re_num >= r_rx_fifo_watermark) ? 1'b1 : 1'b0;
assign int_status_tx_fifo_warning = (tx_fifo_we_num >= r_tx_fifo_watermark) ? 1'b1 : 1'b0;

endmodule

