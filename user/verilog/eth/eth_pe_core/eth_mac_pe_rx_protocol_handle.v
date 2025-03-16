//===============================================
//
//	File: eth_mac_pe_rx_protocol_handle.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01052025
//	Version: v1.0
//
// 	This is rx protocol engine for ethernet.
//	This core is including:
//	rx data handle
//	rx protocol handle
//
//	Rx data handle only has 1 mode:
// 	bypass mode: 
//
//===============================================

module eth_mac_pe_rx_protocol_handle
(
	input  						pe_rx_clk,  
	input  						pe_rx_rstn,

	// data
	output reg					rxdb_pe2fifo_we,
	output reg					rxdb_pe2fifo_we_done,
	output		[31:0]			rxdb_pe2fifo_wdata,
//	input						rxdb_fifo_full,
	input						rxdb_fifo_done,
//	input						rxdb_fifo2pe_burst_process_done,
	input						rxdb_fifo_ready,
	input		[ 7:0]			rx_frame_byte_data,
	input						rx_frame_byte_data_we,
	input						rx_frame_byte_data_done,

	// control
	input						pe_rx_logic_clr,
	output reg					rx_handle_done,// handle done

	// config from regs
	input		[47:0]			r_sa_macaddr,
	input						r_cs_rm,
	input						r_pc_rm,

	// config from descriptors
	input		[11:0]			r_rx_payload_byte_length,
	output		[11:0]			r_rx_payload_byte_real_length
);

//===============================================
// eth mac rx rcc control
//===============================================

wire							pe_rx_logic_clr_by_rx_done;
wire							pe_rx_logic_clr_by_handle_done;
wire							pe_rx_precache_clr;

//===============================================
// rx protocol detect
//===============================================

wire							rx_frame_de_mac_valid;
reg								rx_frame_sa_macaddr_valid;
reg								rx_frame_type_valid;
reg								rx_frame_arp_payload_valid;
reg								rx_frame_ip_header_valid;
reg								rx_frame_ip_payload_length_valid;
reg								rx_frame_ip_src_ip_valid;
reg								rx_frame_ip_des_ip_valid;
reg								rx_frame_ip_header_cs_valid;
reg								rx_frame_tcp_payload_valid;
reg								rx_frame_tcp_length_valid;
reg								rx_frame_tcp_header_length_valid;
reg								rx_frame_tcp_header_cs_valid;
reg								rx_frame_udp_payload_valid;
reg								rx_frame_udp_length_valid;
reg								rx_frame_udp_header_cs_valid;
reg								rx_frame_icmp_payload_valid;
reg								rx_frame_icmp_header_cs_valid;
reg				[ 7:0]			rx_frame_header[13:0];// including de mac, sr mac & type
reg				[15:0]			rx_frame_type;
reg								rx_frame_arp_type;
reg								rx_frame_ip_type;
reg								rx_frame_ip_tcp_type;
reg								rx_frame_ip_udp_type;
reg								rx_frame_ip_icmp_type;
wire							rx_frame_ip_tcp_icmp_udp_type;
reg				[ 5:0]			rx_frame_ip_header_length;
reg				[ 7:0]			rx_frame_ip_payload_type;
reg				[15:0]			rx_frame_ip_payload_length;
reg				[31:0]			rx_frame_ip_src_ip;
reg				[31:0]			rx_frame_ip_des_ip;
reg				[15:0]			rx_frame_tcp_length;
reg				[15:0]			rx_frame_udp_length;
reg				[ 3:0]			rx_frame_tcp_header_length;
reg				[ 3:0]			rx_frame_udp_header_length;
reg				[ 7:0]			rx_payload_header[15:0];// including arp or ip header
reg				[15:0]			rx_payload_checksum0;// including ip checksum
reg				[15:0]			rx_payload_checksum1;// including icmp, tcp or udp checksum
reg				[31:0]			rx_payload_crc;// including frame crc

//===============================================
// rx handle pre-cache signals
//===============================================

reg				[11:0]			precache_address;
wire							precache_rstn;
wire			[31:0]			precache_data_in;
wire			[ 7:0]			precache_data_out;
wire							precache_we;
wire							precache_re;
wire							precache_full;
wire							precache_empty;
wire			[ 4:0]			precache_num;

//===============================================
// rx handle pre-cache
//===============================================

fifo_sync_n2w 
#(
	.ADDR_WIDTH					(4),//??? 
	.DATA_IN_WIDTH				(8),
	.DATA_OUT_WIDTH				(32)
)          
u_rx_precache
(                                           
	.clk						(pe_rx_clk),
	.rstn						(pe_rx_precache_clr),
                                       
	.wr_req						(precache_we),
	.rd_req						(precache_re),
	.rd_empty					(precache_empty),
	.wr_full					(precache_full),
	.fifo_num					(precache_num),                                

	.data						(precache_data_in),
	.q							(precache_data_out)
);

//===============================================
// eth mac rx data pre-cache
// 
// If rx data buffer is ready, word data will write
// to rx fifo in rx data buffer.
//
// Only when pre-cache is not empty, data are needed
// to be writen to rx data buffer in order to 
// avoid being underflow.
//
//	rx precache cannot be overflow so that
//	ahb datarate must be higher than eth clk.
//
//	rxdb_pe2fifo_we_done means rx precache data done.
//	Because the byte number is not pure divided by 4,
//	last transfer is ....???
//
//===============================================

assign precache_we = rx_frame_byte_data_we;// ahb clk 
assign precache_data_in = rx_frame_byte_data;
assign precache_re = rxdb_pe2fifo_we;
assign rxdb_pe2fifo_wdata = precache_data_out;

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rxdb_pe2fifo_we <= 1'b0;
	end
	else if(~precache_empty && rxdb_fifo_ready)
	begin
		rxdb_pe2fifo_we <= 1'b1;
	end
	else
	begin
		rxdb_pe2fifo_we <= 1'b0;
	end
end

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rxdb_pe2fifo_we_done <= 1'b0;	
	end
	else if(pe_rx_logic_clr || rxdb_fifo_done)
	begin
		rxdb_pe2fifo_we_done <= 1'b0;	
	end
	// remaining data bytes in last transfer
	else if(rx_frame_byte_data_done)
	begin
		if(precache_empty && |precache_num)
		begin
			rxdb_pe2fifo_we_done <= 1'b0;	
		end
		else
		begin
			rxdb_pe2fifo_we_done <= 1'b1;	
		end
	end
	else
	begin
		rxdb_pe2fifo_we_done <= 1'b0;	
	end
end

//===============================================
// eth mac rx data handle processing
//===============================================

wire							rx_processing_finish;
wire							rx_processing_valid;
assign rx_processing_valid = (rx_cache_address != r_rx_payload_byte_real_length - 12'h1) && ~precache_full && rx_byte_data_we;
assign rx_processing_finish = rx_cache_address != r_rx_payload_byte_real_length - 12'h1;

//===============================================
// eth mac rx data precache address
//===============================================

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_cache_address <= 12'hfff;
	end
	else if(pe_rx_logic_clr || rx_processing_finish)
	begin
		rx_cache_address <= 12'hfff;
	end
	else if(rx_processing_valid)
	begin
		rx_cache_address <= rx_cache_address + 1'b1;
	end
	else
	begin
		rx_cache_address <= rx_cache_address;
	end
end









//===============================================
// eth mac rx data mux
//===============================================

assign precache_data_in = rx_byte_data;

endmodule



