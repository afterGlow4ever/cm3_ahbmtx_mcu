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
//	input  						bus_clk,  
//	input  						bus_rstn,

	// pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,

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
	output						eth_sma_int_line
);

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
// eth regs wrap
//===============================================

eth_regs_wrap u_eth_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
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
	.r0_int_sta					(int0_sta)
);

//===============================================
// eth data buffer
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
	else if((eth_sma_pe_master_enable == 1'b0) && (eth_sma_tx_fifo_num > 3'h0))
		eth_sma_pe_master_enable <= 1'b1;
	else if((eth_sma_pe_master_enable  == 1'b1) && (eth_sma_pe_master_end == 1'b1))
		eth_sma_pe_master_enable <= 1'b0;
	else
		eth_sma_pe_master_enable <= eth_sma_pe_master_enable;
end

//===============================================
// eth input preprocess
//===============================================

//wire							uart_rx_afsync;
//
//// using 3d is
//// 1d 70% ~80%
//// 2d 99%%
//// 3d is used to detect negedge
//sync_ff_3d_en
//#(
//	.WIDTH						(1),
//	.DEFAULT_VAL				(1)
//)
//u_sync_ff_3d_en_inst0
//(
//	.clk						(module_clk),
//	.rstn						(module_rstn),	
//
//	.en							(pe_rx_enable),
//	.A							(uart_rx),
//	.Y							(uart_rx_afsync)
//);

//===============================================
// eth protocol engine core
// eth sma engine
// eth mac engine
//===============================================

eth_pe_core u_eth_pe_core
(
	.pe_clk							(module_clk),  
	.pe_rstn						(module_rstn),
                                	                
	.eth_mdc						(eth_mdc),
	.eth_mdc_oen					(eth_mdc_oen),
	.eth_mdio_o						(eth_mdio_o),
	.eth_mdio_i						(eth_mdio_i),
	.eth_mdio_oen					(eth_mdio_oen),
                                	                
	.eth_sma_tx_fifo_re				(eth_sma_tx_fifo_re),
	.eth_sma_tx_fifo_data			(eth_sma_tx_fifo_rdata),
	.eth_sma_tx_fifo_num			(eth_sma_tx_fifo_num),
	.eth_sma_rx_fifo_we				(eth_sma_rx_fifo_we),
	.eth_sma_rx_fifo_data			(eth_sma_rx_fifo_wdata),
	.eth_sma_rx_fifo_num			(eth_sma_rx_fifo_num),
                                	                
	.eth_sma_pe_master_logic_clr	(eth_sma_pe_master_logic_clr),
	.eth_sma_pe_master_enable		(eth_sma_pe_master_enable),
	.eth_sma_pe_master_end			(eth_sma_pe_master_end),
	.r0_clkdiv						(r0_clkdiv),
	.r0_phyadr						(r0_phyadr),
	.r0_interval_bit				(r0_interval_bit),

	.int0_status_rx_turn_nack		(int0_tgr[5]),
	.int0_status_master_frame_done	(int0_tgr[4])
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
u_int_detect 
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
u_interrupt_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int0_en),
	.int_tgr					(int0_pos),
	.int_clr					(int0_clr),
	.int_sta					(int0_sta),
	.int_line					(int0_line)	
);

endmodule

