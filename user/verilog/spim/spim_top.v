//===============================================
//
//	File: spim_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09202025
//	Version: v1.0
//
// 	This is top for spim.
//	This top is including:
//	spim pe core: spim protocol implementation
//	spim enable control
//	spim interrupt management
//	spim regs wrap: shaodow regs update
//	spim data buffer: buffer for data
//
//===============================================

module spim_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// pin
	output 						spim_sck,
	output 						spim_sck_oen,
	output 						spim_mosi_o,
	output 						spim_mosi_oen,
	input						spim_miso_i,
	output 						spim_miso_oen,
	output 						spim_cs_o,
	output 						spim_cs_oen,

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
	output						spim_int_line
);

wire							r_tx_fifo_clear;
wire							r_rx_fifo_clear;
wire							r_trans_logic_clear;
wire							r_trans_enable;
wire							r_trans_enable_af;
wire							r_trans_enable_af_r;
wire							r_trans_enable_af_f;
wire							r_rx_msblsb;		
wire							r_tx_msblsb;		
wire		[ 7:0]				r_tx_num;	
wire		[ 7:0]				r_trans_num;	
wire							r_pause_continue;	
wire							r_pause_enable;		

wire		[ 7:0]				r_clkdiv;
wire		[ 1:0]				r_mode;	
wire			  		  		r_tm;			
wire			  		  		r_fm_en;			
wire			  	  			r_txm;			
wire			  	  			r_rxm;			
wire		[ 3:0]				r_tls;		
wire		[ 3:0]				r_tle;		
wire		[ 3:0]				r_ti;		

wire							tx_fifo_we;		
wire							tx_fifo_re;		
wire		[ 7:0]				tx_fifo_wdata;	
wire		[ 7:0]				tx_fifo_rdata;	
wire		[ 4:0]				tx_fifo_we_num;
wire		[ 4:0]				tx_fifo_re_num;
wire							tx_fifo_empty;	
wire							tx_fifo_full;	
wire							rx_fifo_we;	
wire							rx_fifo_re;		
wire		[ 7:0]				rx_fifo_wdata;	
wire		[ 7:0]				rx_fifo_rdata;	
wire		[ 4:0]				rx_fifo_we_num;
wire		[ 4:0]				rx_fifo_re_num;
wire							rx_fifo_empty;	
wire							rx_fifo_full;	
wire		[ 4:0]				r_tx_fifo_watermark;
wire		[ 4:0]				r_rx_fifo_watermark;

wire		[ 5:0]				int_en;
wire		[ 5:0]				int_clr;
wire		[ 5:0]				int_sta;
wire		[ 5:0]				int_tgr;
wire		[ 5:0]				int_pos;
wire		[ 5:0]				int_line;

//===============================================
// spim regs wrap
//===============================================

spim_regs_wrap u_spim_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.pe_clk						(module_clk),
	.pe_rstn					(module_rstn),

	.r_tx_data					(tx_fifo_wdata),
	.r_rx_data					(rx_fifo_rdata),
	.r_tx_data_fifo_wr			(tx_fifo_we),
	.r_rx_data_fifo_rd			(rx_fifo_re),
	.r_tx_fifo_clear			(r_tx_fifo_clear),
	.r_rx_fifo_clear			(r_rx_fifo_clear),
	.r_trans_logic_clear		(r_trans_logic_clear),
	.r_trans_enable				(r_trans_enable),
	.r_tx_fifo_num				(tx_fifo_we_num),
	.r_rx_fifo_num				(rx_fifo_re_num),
	.r_tx_fifo_watermark		(r_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r_rx_fifo_watermark),
	.r_tx_num					(r_tx_num),
	.r_trans_num				(r_trans_num),
	.r_rx_msblsb				(r_rx_msblsb),
	.r_tx_msblsb				(r_tx_msblsb),	
	.r_pause_continue			(r_pause_continue),
	.r_pause_enable				(r_pause_enable),

	.r_clkdiv					(r_clkdiv),
	.r_mode						(r_mode),
    .r_tm						(r_tm),
    .r_fm_en					(r_fm_en),
	.r_txm						(r_rts),
	.r_rxm						(r_cts),
	.r_tls						(r_tls),
	.r_tle						(r_tle),
	.r_ti						(r_ti),

	.r_int_en					(int_en),
	.r_int_clr					(int_clr),
	.r_int_sta					(int_sta)
);

//===============================================
// spim data buffer
//===============================================

spim_data_buffer u_spim_data_buffer
(
	.tx_fifo_wclk				(reg_clk),
	.tx_fifo_rclk				(module_clk),
	.tx_fifo_wrst				(reg_rstn),
	.tx_fifo_rrst				(module_rstn),
	.tx_fifo_clear				(r_tx_fifo_clear),
	.rx_fifo_wclk				(module_clk),
	.rx_fifo_rclk				(reg_clk),
	.rx_fifo_wrst				(module_rstn),
	.rx_fifo_rrst				(reg_rstn),
	.rx_fifo_clear				(r_rx_fifo_clear),

	.tx_fifo_we					(tx_fifo_we),
	.tx_fifo_re					(tx_fifo_re),
	.tx_fifo_wdata				(tx_fifo_wdata),
	.tx_fifo_rdata				(tx_fifo_rdata),
	.tx_fifo_we_num				(tx_fifo_we_num),
	.tx_fifo_re_num				(tx_fifo_re_num),
	.tx_fifo_empty				(tx_fifo_empty),
	.tx_fifo_full				(),
	.rx_fifo_we					(rx_fifo_we),
	.rx_fifo_re					(rx_fifo_re),
	.rx_fifo_wdata				(rx_fifo_wdata),
	.rx_fifo_rdata				(rx_fifo_rdata),
	.rx_fifo_we_num				(rx_fifo_we_num),
	.rx_fifo_re_num				(rx_fifo_re_num),
	.rx_fifo_empty				(),
	.rx_fifo_full				(rx_fifo_full),

    .r_tx_fifo_watermark		(r_tx_fifo_watermark),
    .r_rx_fifo_watermark		(r_rx_fifo_watermark),
	.r_rx_msblsb				(r_rx_msblsb),
	.r_tx_msblsb				(r_tx_msblsb),

	.int_status_rx_fifo_noempty	(int_tgr[3]),
	.int_status_rx_fifo_warning	(int_tgr[2]),
	.int_status_tx_fifo_empty	(int_tgr[1]),
	.int_status_tx_fifo_warning	(int_tgr[0])
);

//===============================================
// enable control
// enable is generated from regs
// until current operation ends
// tx fifo data number & logic clear are not necessary
// only determined by reg
//===============================================

reg								pe_trans_enable;
reg								pe_trans_enable_temp;
wire							pe_trans_end;
wire							pe_trans_logic_clr;
assign pe_trans_logic_clr = r_trans_logic_clear;

//sync_ff_2d u_spim_trans_enable_sync
//(
//	.clk						(module_clk),
//	.rstn						(module_rstn),
//
//	.A							(r_trans_enable),
//	.Y							(r_trans_enable_af)
//);
//
//always @(posedge module_clk or negedge module_rstn)
//begin
//	if(!module_rstn)
//		pe_trans_enable <= 1'b0;
//	else if(~r_trans_enable_af || pe_trans_end)
//		pe_trans_enable <= 1'b0;
////	else if((pe_trans_enable_lat == 1'b0) && (tx_fifo_num > 5'h0))
//	else if(~pe_trans_enable && r_trans_enable_af)
//		pe_trans_enable <= 1'b1;
//	else
//		pe_trans_enable <= pe_trans_enable;
//end

posedge_pulse_sync u_spim_trans_enable_sync
(
	.src_clk					(reg_clk),
	.src_rstn					(reg_rstn),
	.des_clk 					(module_clk),
	.des_rstn					(module_rstn),

	.src_A	 					(r_trans_enable),
	.des_Y	 					(r_trans_enable_af)
);

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		pe_trans_enable_temp <= 1'b0;
	else if(r_trans_enable_af)
		pe_trans_enable_temp <= 1'b1;
	else if(pe_trans_enable)
		pe_trans_enable_temp <= 1'b0;
	else
		pe_trans_enable_temp <= pe_trans_enable_temp;
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
		pe_trans_enable <= 1'b0;
	else if((pe_trans_enable && pe_trans_end) || pe_trans_logic_clr)
		pe_trans_enable <= 1'b0;
	else if(~pe_trans_enable && pe_trans_enable_temp)
		pe_trans_enable <= 1'b1;
	else
		pe_trans_enable <= pe_trans_enable;
end

//===============================================
// spim protocol engine core
//===============================================

spim_pe_core u_spim_pe_core
(
	.pe_clk						(module_clk),  
	.pe_rstn					(module_rstn),
                                                
	.spim_sck					(spim_sck),
	.spim_sck_oen				(spim_sck_oen),
	.spim_mosi_o				(spim_mosi_o),
	.spim_mosi_oen				(spim_mosi_oen),
	.spim_miso_i				(spim_miso_i),
	.spim_miso_oen				(spim_miso_oen),
	.spim_cs_o					(spim_cs_o),
	.spim_cs_oen				(spim_cs_oen),
                                                
	.tx_fifo_re					(tx_fifo_re),
	.tx_fifo_data				(tx_fifo_rdata),
	.tx_fifo_num				(tx_fifo_re_num),
	.tx_fifo_empty				(tx_fifo_empty),
	.rx_fifo_we					(rx_fifo_we),
	.rx_fifo_data				(rx_fifo_wdata),
	.rx_fifo_num				(rx_fifo_we_num),
	.rx_fifo_full				(rx_fifo_full),
                                                
	.pe_trans_logic_clr			(pe_trans_logic_clr),
	.pe_trans_enable			(pe_trans_enable),
	.pe_trans_end				(pe_trans_end),
	.r_tx_num					(r_tx_num),
	.r_trans_num				(r_trans_num),
	.r_pause_continue			(r_pause_continue),
	.r_pause_enable				(r_pause_enable),

	.r_mode						(r_mode),
    .r_tm						(r_tm),
    .r_fm_en					(r_fm_en),
	.r_txm						(r_rts),
	.r_rxm						(r_cts),
	.r_clkdiv					(r_clkdiv),
	.r_tls						(r_tls),
	.r_tle						(r_tle),
	.r_ti						(r_ti),

	.int_status_trans_pending	(int_tgr[4]),
	.int_status_trans_done		(int_tgr[5])
);

//===============================================
// spim interrupt management
// each spim module has 1 interrupt line
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign spim_int_line = |int_line;

pos_step_sync2pulse
#(
	.WIDTH						(6)
)
u_int0_detect 
(
	.src_clk					(module_clk),
	.src_rstn					(module_rstn),
	.des_clk					(reg_clk),
	.des_rstn					(reg_rstn),
	.src_A						(int_tgr),
	.des_Y						(int_pos)
);

interrupt_gen 
#(
	.WIDTH						(6)
)
u_interrupt_gen
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),

	.int_en						(int_en),
	.int_tgr					(int_pos),
	.int_clr					(int_clr),
	.int_sta					(int_sta),
	.int_line					(int_line)	
);

endmodule

