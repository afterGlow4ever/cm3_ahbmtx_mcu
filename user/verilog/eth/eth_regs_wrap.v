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
	input		[ 5:0]			r0_int_sta
);

wire							r0_update;
wire			[ 7:0]			r0_clkdiv_shadow;
wire			[ 4:0]			r0_phyadr_shadow;
wire			[ 7:0]			r0_interval_bit_shadow;

//===============================================
// eth regs shadow update
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
	.r0_rx_data_rd				(r0_rx_data_rd)// add fifo re
);

endmodule

