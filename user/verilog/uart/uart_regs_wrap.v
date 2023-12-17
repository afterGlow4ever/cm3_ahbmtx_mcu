//===============================================
//
//	File: uart_regs_wrap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is regs wrap for uart.
//
//===============================================

module uart_regs_wrap 
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

	//control
	output		[ 9:0]			r_tx_data,
	input		[ 9:0]			r_rx_data,
	output reg					r_tx_data_fifo_wr,
	output						r_rx_data_fifo_rd,
	output						r_tx_fifo_clear,
	output						r_rx_fifo_clear,
	output						r_tx_logic_clear,
	output						r_rx_logic_clear,
	output						r_rx_enable,
	input		[ 4:0]			r_tx_fifo_num,
	input		[ 4:0]			r_rx_fifo_num,
	output		[ 4:0]			r_tx_fifo_watermark,
	output		[ 4:0]			r_rx_fifo_watermark,

	//configs
	output reg	[ 3:0]			r_oversampling,
	output reg	[11:0]			r_clkdiv,
	output reg	[ 3:0]			r_interval_bit,
	output reg					r_error_ignore,
	output reg					r_rts,
	output reg					r_cts,
	output reg					r_stop_bit,
	output reg					r_parity_en,
	output reg	[ 1:0]			r_parity,
	output reg	[ 1:0]			r_data_bit,

	// interrupt control & status
	output		[ 8:0]			r_int_en,
	output		[ 8:0]			r_int_clr,
	input		[ 8:0]			r_int_sta
);

wire							r_update;
wire			[ 3:0]			r_oversampling_shadow;
wire			[11:0]			r_clkdiv_shadow;
wire			[ 3:0]			r_interval_bit_shadow;	
wire							r_error_ignore_shadow;			
wire							r_rts_shadow;			
wire							r_cts_shadow;			
wire							r_stop_bit_shadow;		
wire			[ 1:0]			r_parity_shadow;		
wire							r_parity_en_shadow;		
wire			[ 1:0]			r_data_bit_shadow;		

//===============================================
// uart regs shadow update
// some static config update only by writing update bit 
//===============================================

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
	begin
		r_oversampling <= r_oversampling;
		r_clkdiv <= r_clkdiv;
		r_interval_bit	<= r_interval_bit;	
		r_error_ignore <= r_error_ignore;
		r_rts <= r_rts;			
		r_cts <= r_cts;			
		r_stop_bit <= r_stop_bit;		
		r_parity_en <= r_parity_en;		
		r_parity <= r_parity;		
		r_data_bit <= r_data_bit;		
	end
	else if(r_update == 1'b1)
	begin
		r_oversampling <= r_oversampling_shadow;
		r_clkdiv <= r_clkdiv_shadow;
		r_interval_bit <= r_interval_bit_shadow;	
		r_error_ignore <= r_error_ignore_shadow;
		r_rts <= r_rts_shadow;			
		r_cts <= r_cts_shadow;			
		r_stop_bit <= r_stop_bit_shadow;		
		r_parity_en <= r_parity_en_shadow;		
		r_parity <= r_parity_shadow;		
		r_data_bit <= r_data_bit_shadow;		
	end
	else
	begin
		r_oversampling <= r_oversampling;
		r_clkdiv <= r_clkdiv;
		r_interval_bit <= r_interval_bit;	
		r_error_ignore <= r_error_ignore;
		r_rts <= r_rts;			
		r_cts <= r_cts;			
		r_stop_bit <= r_stop_bit;		
		r_parity_en <= r_parity_en;		
		r_parity <= r_parity;		
		r_data_bit <= r_data_bit;		
	end
end

//===============================================
// uart regs for fifo
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
reg			[ 9:0]				r_rx_data_d;
assign r_rx_data_fifo_rd = r_rx_data_rd;

always @(posedge reg_clk or negedge reg_rstn)
begin
	if(!reg_rstn)
		r_rx_data_d <= 1'b0;
	else
		r_rx_data_d <= r_rx_data;
end

//===============================================
// uart regs for clear signal
// following: fixed issue reset_check07 report from spyglass
//===============================================

wire							r_tx_fifo_clr_wc_clr;		
wire							r_rx_fifo_clr_wc_clr;		
wire							r_tx_logic_clr_wc_clr;		
wire							r_rx_logic_clr_wc_clr;		

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_inst0
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),	

	.A							(r_tx_fifo_clr_wc_clr),
	.Y							(r_tx_fifo_clear)
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

	.A							(r_rx_fifo_clr_wc_clr),
	.Y							(r_rx_fifo_clear)
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

	.A							(r_tx_logic_clr_wc_clr),
	.Y							(r_tx_logic_clear)
);

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(1)
)
u_sync_ff_inst3
(
	.clk						(reg_clk),
	.rstn						(reg_rstn),	

	.A							(r_rx_logic_clr_wc_clr),
	.Y							(r_rx_logic_clear)
);

//===============================================
// uart regs
//===============================================

uart_apb_cfg u_uart_apb_cfg
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
	.r_tx_fifo_clr				(1'b0),
	.r_tx_fifo_clr_wc_clr		(r_tx_fifo_clr_wc_clr),
	.r_tx_fifo_clr_wc_clr_val	(),
	.r_rx_fifo_clr				(1'b0),
	.r_rx_fifo_clr_wc_clr		(r_rx_fifo_clr_wc_clr),
	.r_rx_fifo_clr_wc_clr_val	(),
	.r_tx_logic_clr				(1'b0),
	.r_tx_logic_clr_wc_clr		(r_tx_logic_clr_wc_clr),
	.r_tx_logic_clr_wc_clr_val	(),
	.r_rx_logic_clr				(1'b0),
	.r_rx_logic_clr_wc_clr		(r_rx_logic_clr_wc_clr),
	.r_rx_logic_clr_wc_clr_val	(),
	.r_rx_enable				(r_rx_enable),
	.r_update					(1'b0),
	.r_update_wc_clr			(r_update),
	.r_update_wc_clr_val		(),
	.r_clkdiv					(r_clkdiv_shadow),
	.r_oversampling				(r_oversampling_shadow),
	.r_interval_bit				(r_interval_bit_shadow),
    .r_error_ignore				(r_error_ignore_shadow),
	.r_rts						(r_rts_shadow),
	.r_cts						(r_cts_shadow),
	.r_stop_bit					(r_stop_bit_shadow),
	.r_parity_en				(r_parity_en_shadow),
	.r_parity					(r_parity_shadow),
	.r_data_bit					(r_data_bit_shadow),
    .r_int8_en					(r_int_en[8]),	
    .r_int7_en					(r_int_en[7]),	
    .r_int6_en					(r_int_en[6]),
    .r_int5_en					(r_int_en[5]),
    .r_int4_en					(r_int_en[4]),
    .r_int3_en					(r_int_en[3]),
    .r_int2_en					(r_int_en[2]),
    .r_int1_en					(r_int_en[1]),
    .r_int0_en					(r_int_en[0]),
    .r_int8_clr					(1'b0),
    .r_int8_clr_wc_clr			(r_int_clr[8]),
    .r_int8_clr_wc_clr_val		(),
    .r_int7_clr					(1'b0),
    .r_int7_clr_wc_clr			(r_int_clr[7]),
    .r_int7_clr_wc_clr_val		(),
    .r_int6_clr					(1'b0),
    .r_int6_clr_wc_clr			(r_int_clr[6]),
    .r_int6_clr_wc_clr_val		(),
    .r_int5_clr					(1'b0),
    .r_int5_clr_wc_clr			(r_int_clr[5]),
    .r_int5_clr_wc_clr_val		(),
    .r_int4_clr					(1'b0),
    .r_int4_clr_wc_clr			(r_int_clr[4]),
    .r_int4_clr_wc_clr_val		(),
    .r_int3_clr					(1'b0),
    .r_int3_clr_wc_clr			(r_int_clr[3]),
    .r_int3_clr_wc_clr_val		(),
    .r_int2_clr					(1'b0),
    .r_int2_clr_wc_clr			(r_int_clr[2]),
    .r_int2_clr_wc_clr_val		(),
    .r_int1_clr					(1'b0),
    .r_int1_clr_wc_clr			(r_int_clr[1]),
    .r_int1_clr_wc_clr_val		(),
    .r_int0_clr					(1'b0),
    .r_int0_clr_wc_clr			(r_int_clr[0]),
    .r_int0_clr_wc_clr_val		(),
    .r_tx_fifo_num				(r_tx_fifo_num),
    .r_rx_fifo_num				(r_rx_fifo_num),
    .r_int8_sta					(r_int_sta[8]),
    .r_int7_sta					(r_int_sta[7]),
    .r_int6_sta					(r_int_sta[6]),
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

