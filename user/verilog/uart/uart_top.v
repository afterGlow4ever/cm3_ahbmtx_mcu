//===============================================
//
//	File: uart_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is top for uart.
//	This top is including:
//	uart pe core: uart protocol implementation
//	uart enable control
//	uart interrupt management
//	uart regs wrap: shaodow regs update
//	uart data buffer: buffer for data
//
//===============================================

module uart_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// pin
	output 						uart_tx,
	output 						uart_tx_oen,
	input    					uart_rx,
	output 						uart_rx_oen,

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
	output						uart_int_line
);

wire							r_tx_fifo_clear;
wire							r_rx_fifo_clear;
wire							r_tx_logic_clear;
wire							r_rx_logic_clear;
wire							r_rx_enable;

wire		[ 3:0]				r_oversampling;
wire		[11:0]				r_clkdiv;
wire		[ 3:0]				r_interval_bit;	
wire							r_error_ignore;
wire							r_rts;			
wire							r_cts;			
wire							r_stop_bit;		
wire							r_parity_en;		
wire		[ 1:0]				r_parity;		
wire		[ 1:0]				r_data_bit;	

wire							tx_fifo_we;		
wire							tx_fifo_re;		
wire		[ 9:0]				tx_fifo_wdata;	
wire		[ 9:0]				tx_fifo_rdata;	
wire		[ 4:0]				tx_fifo_num;
wire							tx_fifo_empty;	
wire							tx_fifo_full;	
wire							rx_fifo_we;	
wire							rx_fifo_re;		
wire		[ 9:0]				rx_fifo_wdata;	
wire		[ 9:0]				rx_fifo_rdata;	
wire		[ 4:0]				rx_fifo_num;
wire							rx_fifo_empty;	
wire							rx_fifo_full;	
wire		[ 4:0]				r_tx_fifo_watermark;
wire		[ 4:0]				r_rx_fifo_watermark;

wire		[ 8:0]				int_en;
wire		[ 8:0]				int_clr;
wire		[ 8:0]				int_sta;
wire		[ 8:0]				int_tgr;
wire		[ 8:0]				int_line;

//===============================================
// uart regs wrap
//===============================================

uart_regs_wrap u_uart_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.r_tx_data					(tx_fifo_wdata),
	.r_rx_data					(rx_fifo_rdata),
	.r_tx_data_fifo_wr			(tx_fifo_we),
	.r_rx_data_fifo_rd			(rx_fifo_re),
	.r_tx_fifo_clear			(r_tx_fifo_clear),
	.r_rx_fifo_clear			(r_rx_fifo_clear),
	.r_tx_logic_clear			(r_tx_logic_clear),
	.r_rx_logic_clear			(r_rx_logic_clear),
	.r_rx_enable				(r_rx_enable),
	.r_tx_fifo_num				(tx_fifo_num),
	.r_rx_fifo_num				(rx_fifo_num),
	.r_tx_fifo_watermark		(r_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r_rx_fifo_watermark),

	.r_oversampling				(r_oversampling),
	.r_clkdiv					(r_clkdiv),
	.r_interval_bit				(r_interval_bit),
	.r_error_ignore				(r_error_ignore),
	.r_rts						(r_rts),
	.r_cts						(r_cts),
	.r_stop_bit					(r_stop_bit),
	.r_parity_en				(r_parity_en),
	.r_parity					(r_parity),
	.r_data_bit					(r_data_bit),

	.r_int_en					(int_en),
	.r_int_clr					(int_clr),
	.r_int_sta					(int_sta)
);

//===============================================
// uart data buffer
//===============================================

uart_data_buffer u_uart_data_buffer
(
	.tx_fifo_clk				(reg_clk),
	.tx_fifo_rst				(r_tx_fifo_clear),
	.rx_fifo_clk				(module_clk),
	.rx_fifo_rst				(r_rx_fifo_clear),

	.tx_fifo_we					(tx_fifo_we),
	.tx_fifo_re					(tx_fifo_re),
	.tx_fifo_wdata				(tx_fifo_wdata),
	.tx_fifo_rdata				(tx_fifo_rdata),
	.tx_fifo_num				(tx_fifo_num),
	.tx_fifo_empty				(),
	.tx_fifo_full				(),
	.rx_fifo_we					(rx_fifo_we),
	.rx_fifo_re					(rx_fifo_re),
	.rx_fifo_wdata				(rx_fifo_wdata),
	.rx_fifo_rdata				(rx_fifo_rdata),
	.rx_fifo_num				(rx_fifo_num),
	.rx_fifo_empty				(),
	.rx_fifo_full				(),

    .r_tx_fifo_watermark		(r_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r_rx_fifo_watermark),

	.int_status_rx_fifo_empty	(int_tgr[3]),
	.int_status_rx_fifo_warning	(int_tgr[2]),
	.int_status_tx_fifo_empty	(int_tgr[1]),
	.int_status_tx_fifo_warning	(int_tgr[0])
);

//===============================================
// enable control
// tx enable is generated from tx fifo data number
// rx enable is generated from regs
// when tx or rx disable, the remaining operation is still going on
// until current operation ends
// using logic clear can cease operation at once
//===============================================

reg								pe_tx_enable;
reg								pe_rx_enable;
wire							pe_tx_enable_lat;
wire							pe_rx_enable_lat;
wire							pe_tx_end;
wire							pe_rx_end;
wire							pe_tx_logic_clr;
wire							pe_rx_logic_clr;
assign pe_tx_logic_clr = r_tx_logic_clear;
assign pe_rx_logic_clr = r_rx_logic_clear;
assign pe_tx_enable_lat = (pe_tx_enable == 1'b1) ? 1'b1 : 1'b0;
assign pe_rx_enable_lat = (pe_rx_enable == 1'b1) ? 1'b1 : 1'b0;

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		pe_rx_enable <= 1'b0;
	else if(pe_rx_enable_lat == 1'b0)
		pe_rx_enable <= r_rx_enable;
	else if((pe_rx_enable_lat == 1'b1) && (r_rx_enable == 1'b0) && (pe_rx_end == 1'b1))// add a data rx end flag
		pe_rx_enable <= 1'b0;// reserved when rx end making to 0
	else
		pe_rx_enable <= pe_rx_enable;
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		pe_tx_enable <= 1'b0;
	else if((pe_tx_enable_lat == 1'b0) && (tx_fifo_num > 5'h0))
		pe_tx_enable <= 1'b1;
	else if((pe_tx_enable_lat == 1'b1) && (pe_tx_end == 1'b1))
		pe_tx_enable <= 1'b0;
	else
		pe_tx_enable <= pe_tx_enable;
end

//===============================================
// uart input preprocess
//===============================================

wire							uart_rx_afsync;

// using 3d is
// 1d 70% ~80%
// 2d 99%%
// 3d is used to detect negedge
sync_ff_3d_en
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_3d_en_inst0
(
	.clk						(module_clk),
	.rstn						(module_rstn),	

	.en							(pe_rx_enable),
	.A							(uart_rx),
	.Y							(uart_rx_afsync)
);

//===============================================
// uart protocol engine core
//===============================================

uart_pe_core u_uart_pe_core
(
	.pe_clk						(module_clk),  
	.pe_rstn					(module_rstn),
                                                
	.uart_tx					(uart_tx),
	.uart_tx_oen				(uart_tx_oen),
	.uart_rx					(uart_rx_afsync),
	.uart_rx_oen				(uart_rx_oen),
                                                
	.tx_fifo_re					(tx_fifo_re),
	.tx_fifo_data				(tx_fifo_rdata),
	.tx_fifo_num				(tx_fifo_num),
	.rx_fifo_we					(rx_fifo_we),
	.rx_fifo_data				(rx_fifo_wdata),
	.rx_fifo_num				(rx_fifo_num),
                                                
	.pe_tx_logic_clr			(pe_tx_logic_clr),
	.pe_rx_logic_clr			(pe_rx_logic_clr),
	.pe_tx_enable				(pe_tx_enable),
	.pe_rx_enable				(pe_rx_enable),
	.pe_tx_end					(pe_tx_end),
	.pe_rx_end					(pe_rx_end),
	.r_oversampling				(r_oversampling),
	.r_clkdiv					(r_clkdiv),
	.r_interval_bit				(r_interval_bit),
	.r_error_ignore				(r_error_ignore),
	.r_rts						(r_rts),
	.r_cts						(r_cts),
	.r_stop_bit					(r_stop_bit),
	.r_parity_en				(r_parity_en),
	.r_parity					(r_parity),
	.r_data_bit					(r_data_bit),

	.int_status_tx_done			(int_tgr[8]),
	.int_status_rx_parity_error	(int_tgr[7]),
	.int_status_rx_stop_error	(int_tgr[6]),
	.int_status_rx_stop_detect	(int_tgr[4]),
	.int_status_rx_noise_detect	(int_tgr[5])
);

//===============================================
// uart interrupt management
// each uart module has 1 interrupt line
//===============================================

assign uart_int_line = |int_line;

interrupt_gen 
#(
	.WIDTH						(9)
)
u_interrupt_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int_en),
	.int_tgr					(int_tgr),
	.int_clr					(int_clr),
	.int_sta					(int_sta),
	.int_line					(int_line)	
);

endmodule

