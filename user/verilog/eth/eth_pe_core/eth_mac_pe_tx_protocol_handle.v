//===============================================
//
//	File: eth_mac_pe_tx_protocol_handle.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 07062024
//	Version: v1.0
//
// 	This is tx protocol engine for ethernet.
//	This core is including:
//	tx data handle
//	tx protocol handle
//
//	Tx data handle has 2 modes:
//	cache mode: hardware checksum
// 	bypass mode: software checksum
//
//===============================================

module eth_mac_pe_tx_protocol_handle
(
	input  						pe_tx_clk,  
	input  						pe_tx_rstn,

	// data
	output 						txdb_pe2fifo_re,
	output 						txdb_pe2fifo_re_done,
	input		[31:0]			txdb_fifo2pe_rdata,
	input						txdb_fifo_empty,
	input						txdb_fifo_done,
	input						txdb_fifo2pe_burst_process_done,
	input						txdb_fifo_ready,
	output		[ 7:0]			tx_byte_data,
	input						tx_byte_data_re,

	// control
	input						pe_tx_logic_clr,
	input						tx_data_mode,// 1: cache mode 0: bypass mode
	input						tx_handle_enable,// cache enable
	output reg					tx_handle_done,// cache done
	input						tx_done,// tx frame done

	// config from regs
	input		[47:0]			r_sa_macaddr,
	input		[ 5:0]			r_interval_byte,

	// config from descriptors
	input		[11:0]			r_tx_payload_byte_length,
	output reg	[11:0]			r_tx_payload_byte_real_length,
	input						r_hw_sa_mac_en,
	input						r_hw_sa_mac_replace_en,
	input						r_hw_crc_en,
	input						r_hw_crc_replace_en,
	input						r_hw_padding_en,
	input						r_hw_cs_en,
	input						r_hw_cs_replace_en
);

//===============================================
// eth mac tx rcc control
//===============================================

wire							pe_tx_logic_clr_by_tx_done;
wire							pe_tx_logic_clr_by_handle_done;
wire							pe_tx_precache_clr;

//===============================================
// tx protocol handle fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						TX_HANDLE_IDLE = 7'b0000001;
localparam						TX_HANDLE_CACHEIN = 7'b0000010;
localparam						TX_HANDLE_CACHEWAIT = 7'b0000100;
localparam						TX_HANDLE_CACHECS = 7'b0001000;
localparam						TX_HANDLE_CACHEOUT = 7'b0010000;
localparam						TX_HANDLE_BYPASS = 7'b0100000;
localparam						TX_HANDLE_END = 7'b1000000;

reg				[ 6:0]			current_state;
reg				[ 6:0]			next_state;

wire							tx_handle_state_idle;
wire							tx_handle_state_cachein;
wire							tx_handle_state_cachewait;
wire							tx_handle_state_cachecs;
wire							tx_handle_state_cacheout;
wire							tx_handle_state_bypass;
wire							tx_handle_state_end;
wire							tx_handle_state_idle_to_cachein;
wire							tx_handle_state_idle_to_bypass;
wire							tx_handle_state_cachein_to_cachewait;
wire							tx_handle_state_cachein_to_cachecs; 
wire							tx_handle_state_cachein_to_cacheout;
wire							tx_handle_state_cachewait_to_cachecs;
wire							tx_handle_state_cachecs_to_cacheout;
wire							tx_handle_state_cacheout_to_end;
wire							tx_handle_state_bypass_to_end;
wire							tx_handle_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
		current_state <= TX_HANDLE_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// TX_HANDLE_IDLE :
// -> TX_HANDLE_CACHEIN: using hardware checksum & tx frame preparation state
// -> TX_HANDLE_BYPASS: using software checksum & tx frame preparation state
// -> TX_HANDLE_CACHEOUT: auto-retransmission (reserved)
// TX_HANDLE_CACHEIN:
// -> TX_HANDLE_CACHEOUT: all data has been read to tx cache 
// and there is no need to wait data process
// -> TX_HANDLE_CACHEWAIT: all data has been read to tx cache
// and process should wait hardware checksum in tcp, udp or icmp frame
// -> TX_HANDLE_CACHECS: all data has been read to tx cache
// and process need not wait hardware checksum in ip frame
// TX_HANDLE_CACHEWAIT:
// -> TX_HANDLE_CACHECS: all checksum has been calculated
// TX_HANDLE_CACHECS:
// -> TX_HANDLE_CACHEOUT: all checksum has been write to tx cache
// TX_HANDLE_CACHEOUT: 
// -> TX_HANDLE_END: all data has been read from pe tx mac
// TX_HANDLE_BYPASS:
// -> TX_HANDLE_END: all data has been read from pe tx mac
// TX_HANDLE_END: read data ended
// -> TX_HANDLE_IDLE: prepare for deinit (reserved)
// All state should transition to TX_HANDLE_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)

always @(*)
begin
	case (current_state)
	TX_HANDLE_IDLE:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_idle_to_cachein)
			next_state = TX_HANDLE_CACHEIN;
		else if(tx_handle_state_idle_to_bypass)
			next_state = TX_HANDLE_BYPASS;
		else
			next_state = TX_HANDLE_IDLE;
	TX_HANDLE_CACHEIN:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_cachein_to_cachewait)
			next_state = TX_HANDLE_CACHEWAIT;
		else if(tx_handle_state_cachein_to_cachecs)
			next_state = TX_HANDLE_CACHECS;
		else if(tx_handle_state_cachein_to_cacheout)
			next_state = TX_HANDLE_CACHEOUT;
		else
			next_state = TX_HANDLE_CACHEIN;
	TX_HANDLE_CACHEWAIT:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_cachewait_to_cachecs)
			next_state = TX_HANDLE_CACHECS;
		else
			next_state = TX_HANDLE_CACHEWAIT;
	TX_HANDLE_CACHECS:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_cachecs_to_cacheout)
			next_state = TX_HANDLE_CACHEOUT;
		else
			next_state = TX_HANDLE_CACHECS;
	TX_HANDLE_CACHEOUT:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_cacheout_to_end)
			next_state = TX_HANDLE_END;
		else
			next_state = TX_HANDLE_CACHEOUT;
	TX_HANDLE_BYPASS:
		if(pe_tx_logic_clr)
			next_state = TX_HANDLE_IDLE;
		else if(tx_handle_state_bypass_to_end)
			next_state = TX_HANDLE_END;
		else
			next_state = TX_HANDLE_BYPASS;
	TX_HANDLE_END:
		next_state = TX_HANDLE_IDLE;
	default:
		next_state = TX_HANDLE_IDLE;
	endcase
end

// state output: combinational logic circuit
assign tx_handle_state_idle = current_state == TX_HANDLE_IDLE;
assign tx_handle_state_cachein = current_state == TX_HANDLE_CACHEIN;
assign tx_handle_state_cachewait = current_state == TX_HANDLE_CACHEWAIT;
assign tx_handle_state_cachecs = current_state == TX_HANDLE_CACHECS;
assign tx_handle_state_cacheout = current_state == TX_HANDLE_CACHEOUT;
assign tx_handle_state_bypass = current_state == TX_HANDLE_BYPASS;
assign tx_handle_state_end = current_state == TX_HANDLE_END;

//===============================================
// tx protocol detect
//===============================================

// offset in header
localparam						HEADER_DE_MAC_OFFSET = 0;
localparam						HEADER_SR_MAC_OFFSET = 6;
localparam						HEADER_TYPE_OFFSET = 12;
localparam						HEADER_PAYLOAD_OFFSET = 14;
// offset in ip payload
localparam						IP_HEADER_VER_OFFSET = 5'h0;
localparam						IP_HEADER_HEADER_LENGTH_OFFSET = 0;
localparam						IP_HEADER_DATA_LENGTH_OFFSET = 2;
localparam						IP_HEADER_PAYLOAD_TYPE_OFFSET = 9;
localparam						IP_HEADER_CHECKSUM_OFFSET = 10;
localparam						IP_HEADER_SRC_IP_OFFSET = 12;
localparam						IP_HEADER_DES_IP_OFFSET = 16;
// offset in icmp payload
localparam						ICMP_HEADER_CHECKSUM_OFFSET = 2;
// offset in tcp payload
localparam						TCP_HEADER_SR_PORT_OFFSET = 0;
localparam						TCP_HEADER_DE_PORT_OFFSET = 2;
localparam						TCP_HEADER_HEADER_LENGTH_OFFSET = 12;
localparam						TCP_HEADER_CHECKSUM_OFFSET = 16;
// offset in icmp payload
localparam						UDP_HEADER_SR_PORT_OFFSET = 0;
localparam						UDP_HEADER_DE_PORT_OFFSET = 2;
localparam						UDP_HEADER_HEADER_LENGTH_OFFSET = 4;
localparam						UDP_HEADER_CHECKSUM_OFFSET = 6;

// content in header
localparam						HEADER_TYPE_IP = 16'h0800;
localparam						HEADER_TYPE_ARP = 16'h0806;

// content in ip payload
localparam						IP_HEADER_TYPE_ICMP = 8'h01;
localparam						IP_HEADER_TYPE_TCP = 8'h06;
localparam						IP_HEADER_TYPE_UDP = 8'h11;

// length in header
localparam						HEADER_SR_MAC_LENGTH = 6;
localparam						HEADER_TYPE_LENGTH = 2;

// length in payload
localparam						IP_HEADER_NORMAL_LENGTH = 20;
localparam						ICMP_HEADER_LENGTH = 8;
localparam						TCP_HEADER_NORMAL_LENGTH = 20;
localparam						UDP_HEADER_LENGTH = 8;

// length in ip payload
localparam						IP_HEADER_LENGTH_LENGTH = 1;
localparam						IP_HEADER_CHECKSUM_LENGTH = 2;
localparam						IP_HEADER_DATA_LENGTH = 2;
localparam						IP_HEADER_TYPE_LENGTH = 1;
localparam						IP_HEADER_SRC_IP_LENGTH = 4;
localparam						IP_HEADER_DES_IP_LENGTH = 4;

// length in icmp payload
localparam						ICMP_HEADER_CHECKSUM_LENGTH = 2;

// length in udp payload
localparam						UDP_HEADER_LENGTH_LENGTH  = 1;
localparam						UDP_HEADER_CHECKSUM_LENGTH = 2;

// length in tcp payload
localparam						TCP_HEADER_LENGTH_LENGTH  = 1;
localparam						TCP_HEADER_CHECKSUM_LENGTH = 2;

wire							tx_frame_de_mac_valid;
reg								tx_frame_sa_macaddr_valid;
reg								tx_frame_type_valid;
reg								tx_frame_arp_payload_valid;
reg								tx_frame_ip_header_valid;
reg								tx_frame_ip_payload_length_valid;
reg								tx_frame_ip_src_ip_valid;
reg								tx_frame_ip_des_ip_valid;
reg								tx_frame_ip_header_cs_valid;
reg								tx_frame_tcp_payload_valid;
reg								tx_frame_tcp_length_valid;
reg								tx_frame_tcp_header_length_valid;
reg								tx_frame_tcp_header_cs_valid;
reg								tx_frame_udp_payload_valid;
reg								tx_frame_udp_length_valid;
reg								tx_frame_udp_header_cs_valid;
reg								tx_frame_icmp_payload_valid;
reg								tx_frame_icmp_header_cs_valid;
reg				[ 7:0]			tx_frame_header[13:0];// including de mac, sr mac & type
reg				[15:0]			tx_frame_type;
reg								tx_frame_arp_type;
reg								tx_frame_ip_type;
reg								tx_frame_ip_tcp_type;
reg								tx_frame_ip_udp_type;
reg								tx_frame_ip_icmp_type;
wire							tx_frame_ip_tcp_icmp_udp_type;
reg				[ 5:0]			tx_frame_ip_header_length;
reg				[ 7:0]			tx_frame_ip_payload_type;
reg				[15:0]			tx_frame_ip_payload_length;
reg				[31:0]			tx_frame_ip_src_ip;
reg				[31:0]			tx_frame_ip_des_ip;
reg				[15:0]			tx_frame_tcp_length;
reg				[15:0]			tx_frame_udp_length;
reg				[ 3:0]			tx_frame_tcp_header_length;
reg				[ 3:0]			tx_frame_udp_header_length;
reg				[ 7:0]			tx_payload_header[15:0];// including arp or ip header
reg				[15:0]			tx_payload_checksum0;// including ip checksum
reg				[15:0]			tx_payload_checksum1;// including icmp, tcp or udp checksum
reg				[31:0]			tx_payload_crc;// including frame crc

//===============================================
// tx handle cache ram signals
//===============================================

reg				[ 7:0]			tx_cache_data;
reg				[ 7:0]			tx_cache_data_out;
wire			[ 7:0]			tx_cache_q;
reg				[11:0]			tx_cache_address;
reg								tx_cache_wen;
reg								tx_cache_cs;

//===============================================
// tx handle pre-cache signals
//===============================================

wire							precache_rstn;
wire			[31:0]			precache_data_in;
wire			[ 7:0]			precache_data_out;
wire							precache_we;
wire							precache_re;
wire							precache_full;
wire							precache_empty;
wire			[ 4:0]			precache_num;


//===============================================
// tx handle pre-cache
//===============================================

fifo_sync_w2n 
#(
	.ADDR_WIDTH					(2), 
	.DATA_IN_WIDTH				(32),
	.DATA_OUT_WIDTH				(8)
)          
u_tx_precache
(                                           
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_precache_clr),
                                       
	.wr_req						(precache_we),
	.rd_req						(precache_re),
	.rd_empty					(precache_empty),
	.wr_full					(precache_full),
	.fifo_num					(precache_num),                                

	.data						(precache_data_in),
	.q							(precache_data_out)
);

//===============================================
// eth mac tx data prepare & pre-cache
// from tx data buffer to pre-cache
// Once pre-caching only:
// 4 words(burst) or 1 word(single)
//
// precache_processing_valid means reading data from
// tx data buffer is on processing with no full 
// pre-cache.  
//
// Only when pre-cache is not full, data are needed
// to be read from tx data buffer in order to 
// avoid being overflow.
//===============================================

reg				[ 3:0]			precache_byte_cnt;
wire							precache_once_data_finish;
wire							precache_processing_valid;
reg								txdb_pe2fifo_re_temp; 
//wire							txdb_pe2fifo_re_done; 

assign precache_processing_valid = (tx_handle_state_cachein || tx_handle_state_bypass) && ~txdb_fifo_empty && ~precache_once_data_finish && ~precache_full;
assign precache_once_data_finish = (txdb_fifo2pe_burst_process_done ? precache_byte_cnt == 4'h1 : precache_byte_cnt == 4'h4) ? 1'b1 : 1'b0;
//assign txdb_pe2fifo_re_done = precache_once_data_finish;
assign txdb_pe2fifo_re_done = precache_once_data_finish && ~precache_full;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		precache_byte_cnt <= 4'h0;
	end
	else if(pe_tx_logic_clr || txdb_pe2fifo_re_done)
	begin
		precache_byte_cnt <= 4'h0;
	end
//	else if(precache_processing_valid && ~precache_once_data_finish)
	else if(precache_processing_valid && ~precache_once_data_finish && precache_we)
	begin
		precache_byte_cnt <= precache_byte_cnt + 4'd1;
	end
	// count to 4 and process finish
	else 
	begin
		precache_byte_cnt <= precache_byte_cnt;
	end
end

//assign txdb_pe2fifo_re = txdb_pe2fifo_re_temp && ~precache_full && ~precache_once_data_finish;
assign txdb_pe2fifo_re = txdb_pe2fifo_re_temp && ~precache_full && ~txdb_fifo_empty;
assign precache_we = txdb_pe2fifo_re; 
assign precache_data_in = txdb_fifo2pe_rdata;

// loading data from tx fifo to pre-cache
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		txdb_pe2fifo_re_temp <= 1'b0;
	end
	else if(precache_processing_valid)
	begin
		txdb_pe2fifo_re_temp <= 1'b1;
	end
	else
	begin
		txdb_pe2fifo_re_temp <= 1'b0;
	end
end

//===============================================
// eth mac tx data prepare & pre-cache
// from pre-cache to pe or data sram
//
// precache_data_valid means pre-cache has already
// cached data.
//===============================================

reg								precache_data_valid;

// Pre-cache has already cached data.
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		precache_data_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || tx_handle_done) // process end
	begin
		precache_data_valid <= 1'b0;
	end
	else if(~precache_empty)
	begin
		precache_data_valid <= 1'b1;
	end
	else
	begin
		precache_data_valid <= 1'b0;
	end
end

//===============================================
// tx cache data control
//
// precache_re: According to the design, it is no
// needed to care whether pre-cache is empty or not.
//
// tx_cachein_processing_valid means data in pre-cache
// is ready for tx cache. However, this signal will
// de-assert once pre-cache is empty.
//
// tx_cache_sw_processing_valid means data is from
// pre-cache to tx cache.
//
// tx_cache_hw_inserting_processing_valid means data is
// from hardware insertion to tx cache.
//
// tx_cache_hw_replacing_processing_valid means data is
// from hardware replacement to tx cache.
// (Data from pre cache is discarded.)
//
// tx_cache_once_finish means a byte is been 
// writing into tx cache ram.
//
// tx_cache_re_mask, which means next data
// is not from pre-cache, hardware insertion.
//
// 					       _____________	
// fifo_re	______________|	  		 	|______
//  		______________ ______ ______ ______
// data		______________X___0__X__1___X______
//			  ___________________
// fifo_full_|	  		  		 |______
//			  			   				 _______
// fifo_emp ____________________________|	  	
//					____________________
// valid    _______|	  		 		|______
//
//
// Hardware checksum will insert at last.
//
//===============================================

wire							tx_cachein_processing_valid;
wire							tx_bypass_processing_valid;
//wire							tx_cache_sw_processing_valid;
wire							tx_cache_hw_inserting_processing_valid;
wire							tx_cache_hw_replacing_processing_valid;
//reg								tx_cache_re_mask;
wire							tx_cache_re_mask;
reg								tx_cache_re;
wire							precache_re_in_bypass_mode;
wire							precache_re_in_cache_mode;
assign precache_re_in_bypass_mode = tx_byte_data_re;
assign precache_re_in_cache_mode = ~tx_cache_re_mask && tx_cache_re && ~precache_empty; 
assign precache_re = tx_data_mode ? precache_re_in_cache_mode : precache_re_in_bypass_mode;// cache mode or bypass mode 
//assign tx_cachein_processing_valid = (tx_handle_state_cachein || tx_handle_state_bypass) && precache_data_valid && precache_re; 
//assign tx_cachein_processing_valid = tx_handle_state_cachein && ~tx_handle_state_cachein_to_cachewait && ~tx_handle_state_cachein_to_cachecs && tx_cache_re && ~precache_empty;// re should not mask here 
assign tx_cachein_processing_valid = tx_handle_state_cachein && (tx_cache_address != r_tx_payload_byte_real_length - 12'h1) && tx_cache_re && ~precache_empty;// re should not mask here 
assign tx_bypass_processing_valid = tx_handle_state_bypass && precache_data_valid && precache_re_in_bypass_mode; 
//assign tx_cache_sw_processing_valid = tx_cachein_processing_valid && ~tx_cache_hw_inserting_processing_valid;

//===============================================
// tx frame protocol handle
// timing diagram:
// 					_____________	
// valid	_______|			 |______
// 			  _____	
// start	_|	   |____________________
// 			   			   ______	
// end		______________|	     |______
//   		______________ ______ ______ ______
// address  ______________X___0__X__1___X______
//  		______________ ______ ______ ______
// cnt		______________X___0__X__1___X______
//  		______________ ______ ______ ______
// data		______________X___0__X__1___X______
//===============================================

//===============================================
// tx payload length handle
//===============================================

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		r_tx_payload_byte_real_length <= 12'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		r_tx_payload_byte_real_length <= 12'h0;
	end
	else if(tx_handle_state_idle_to_cachein || tx_handle_state_idle_to_bypass)
	begin
		r_tx_payload_byte_real_length <= r_tx_payload_byte_length;
	end
	else if(tx_frame_ip_tcp_icmp_udp_type && r_hw_cs_en)
	begin
		r_tx_payload_byte_real_length <= r_tx_payload_byte_length + 12'd4;
	end
	else if(tx_frame_ip_type && r_hw_cs_en)
	begin
		r_tx_payload_byte_real_length <= r_tx_payload_byte_length + 12'd2;
	end
	else
	begin
		r_tx_payload_byte_real_length <= r_tx_payload_byte_real_length;
	end
end

//===============================================
// tx frame header handle: only operating in cache in state
// source mac address handle
// minus 2: fit for timing sequence
//===============================================

reg				[ 2:0]			hw_sa_macaddr_cnt;
wire							hw_sa_macaddr_cnt_valid;
wire			[11:0]			hw_sa_macaddr_start_pos;
wire			[11:0]			hw_sa_macaddr_end_pos;
wire							hw_sa_macaddr_start;
wire							hw_sa_macaddr_end;
assign hw_sa_macaddr_cnt_valid = tx_cachein_processing_valid && tx_frame_sa_macaddr_valid;
assign hw_sa_macaddr_start_pos = HEADER_SR_MAC_OFFSET-2;
assign hw_sa_macaddr_end_pos = HEADER_SR_MAC_OFFSET+HEADER_SR_MAC_LENGTH-2;
assign hw_sa_macaddr_start = tx_cache_address == hw_sa_macaddr_start_pos;
assign hw_sa_macaddr_end = tx_cache_address == hw_sa_macaddr_end_pos;


always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_sa_macaddr_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_sa_macaddr_end)
	begin
		tx_frame_sa_macaddr_valid <= 1'b0;
	end
	else if(hw_sa_macaddr_start && (r_hw_sa_mac_en || r_hw_sa_mac_replace_en))
	begin
		tx_frame_sa_macaddr_valid <= 1'b1;
	end
	else
	begin
		tx_frame_sa_macaddr_valid <= tx_frame_sa_macaddr_valid;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_sa_macaddr_cnt <= 3'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_sa_macaddr_cnt <= 3'd0;
	end
	else if(hw_sa_macaddr_cnt_valid)
	begin
		hw_sa_macaddr_cnt <= hw_sa_macaddr_cnt + 1'b1;
	end
	else
	begin
		hw_sa_macaddr_cnt <= 3'd0;
	end
end

//===============================================
// tx frame header handle: only operating in cache in state
// type handle
//===============================================

reg				[ 1:0]			hw_type_cnt;
wire							hw_type_cnt_valid;
wire			[11:0]			hw_type_start_pos;
wire			[11:0]			hw_type_end_pos;
wire							hw_type_start;
wire							hw_type_end;

assign hw_type_cnt_valid = tx_cachein_processing_valid && tx_frame_type_valid;
assign hw_type_start_pos = HEADER_TYPE_OFFSET-2;
assign hw_type_end_pos = HEADER_TYPE_OFFSET+HEADER_TYPE_LENGTH-2;
assign hw_type_start = tx_cache_address == hw_type_start_pos;
assign hw_type_end = tx_cache_address == hw_type_end_pos;

// valid in type section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_type_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_type_end)
	begin
		tx_frame_type_valid <= 1'b0;
	end
	else if(hw_type_start && tx_data_mode)
	begin
		tx_frame_type_valid <= 1'b1;
	end
	else
	begin
		tx_frame_type_valid <= tx_frame_type_valid;
	end
end

// frame type section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_type_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr || hw_type_end)
	begin
		hw_type_cnt <= 2'd0;
	end
	else if(hw_type_cnt_valid)
	begin
		hw_type_cnt <= hw_type_cnt + 1'b1;
	end
	else
	begin
		hw_type_cnt <= 2'd0;
	end
end

// read frame type
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_type <= 16'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_type <= 16'h0;
	end
	else if(hw_type_cnt_valid)
	begin
		tx_frame_type[(hw_type_cnt<<3)+:8] <= precache_data_out;
	end
	else
	begin
		tx_frame_type <= tx_frame_type; 
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_type <= 1'b0;
		tx_frame_arp_type <= 1'b0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_type <= 1'b0;
		tx_frame_arp_type <= 1'b0;
	end
	else if(hw_type_end)
	begin
		tx_frame_ip_type <= ({tx_frame_type[7:0], precache_data_out} == HEADER_TYPE_IP);
		tx_frame_arp_type <= ({tx_frame_type[7:0], precache_data_out} == HEADER_TYPE_ARP);
	end
	else
	begin
		tx_frame_ip_type <= tx_frame_ip_type; 
		tx_frame_arp_type <= tx_frame_arp_type; 
	end
end

//===============================================
// tx frame payload handle: only operating in cache in state
// ip header handle
//===============================================

// ip header start point
reg				[ 5:0]			hw_ip_header_cnt;
wire							hw_ip_header_cnt_valid;
wire			[11:0]			hw_ip_header_start_pos;
wire			[11:0]			hw_ip_header_end_pos;
wire							hw_ip_header_start;
wire							hw_ip_header_end;
assign hw_ip_header_cnt_valid = tx_cachein_processing_valid && tx_frame_ip_header_valid;
assign hw_ip_header_start_pos = HEADER_PAYLOAD_OFFSET-2;
assign hw_ip_header_end_pos = hw_ip_header_start_pos + {6'h0, tx_frame_ip_header_length};
assign hw_ip_header_start = tx_cache_address == hw_ip_header_start_pos;
assign hw_ip_header_end = tx_cache_address == hw_ip_header_end_pos;

//// ip header total cnt
// valid in ip header section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_header_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_ip_header_end)
	begin
		tx_frame_ip_header_valid <= 1'b0;
	end
	// in order to avoid miss ip frame
	else if(hw_ip_header_start && (tx_frame_ip_type || ({tx_frame_type, precache_data_out} == HEADER_TYPE_IP)))
	begin
		tx_frame_ip_header_valid <= 1'b1;
	end
	else
	begin
		tx_frame_ip_header_valid <= tx_frame_ip_header_valid;
	end
end

// frame ip header section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_header_cnt <= 6'd63;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_header_cnt <= 6'd63;
	end
	else if(hw_ip_header_cnt_valid)
	begin
		hw_ip_header_cnt <= hw_ip_header_cnt + 1'b1;
	end
	else
	begin
		hw_ip_header_cnt <= 6'd63;
	end
end

// ip header header length
wire			[11:0]			hw_ip_header_length_start_pos;
wire			[11:0]			hw_ip_header_length_end_pos;
wire							hw_ip_header_length_start;
wire							hw_ip_header_length_end;
assign hw_ip_header_length_start_pos = hw_ip_header_start_pos;
assign hw_ip_header_length_end_pos = hw_ip_header_start_pos+IP_HEADER_LENGTH_LENGTH;
assign hw_ip_header_length_start = tx_cache_address == hw_ip_header_length_start_pos;
assign hw_ip_header_length_end = tx_cache_address == hw_ip_header_length_end_pos;

//// header length in ip header 
// read frame ip header length
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_header_length <= IP_HEADER_NORMAL_LENGTH;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_header_length <= IP_HEADER_NORMAL_LENGTH;
	end
	else if(hw_ip_header_length_end)
	begin
		tx_frame_ip_header_length <= (precache_data_out[3:0] << 2);
	end
	else
	begin
		tx_frame_ip_header_length <= tx_frame_ip_header_length;
	end
end

// ip header payload length
reg				[ 1:0]			hw_ip_payload_length_cnt;
wire							hw_ip_payload_length_cnt_valid;
wire			[11:0]			hw_ip_payload_length_start_pos;
wire			[11:0]			hw_ip_payload_length_end_pos;
wire							hw_ip_payload_length_start;
wire							hw_ip_payload_length_end;
assign hw_ip_payload_length_cnt_valid = tx_cachein_processing_valid && tx_frame_ip_payload_length_valid;
assign hw_ip_payload_length_start_pos = hw_ip_header_start_pos+IP_HEADER_DATA_LENGTH_OFFSET;
assign hw_ip_payload_length_end_pos = hw_ip_payload_length_start_pos+IP_HEADER_DATA_LENGTH; 
assign hw_ip_payload_length_start = tx_cache_address == hw_ip_payload_length_start_pos;
assign hw_ip_payload_length_end = tx_cache_address == hw_ip_payload_length_end_pos;

//// payload length in ip header 
// valid in ip header payload length section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_payload_length_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_ip_payload_length_end)
	begin
		tx_frame_ip_payload_length_valid <= 1'b0;
	end
	else if(hw_ip_payload_length_start && tx_frame_ip_header_valid)
	begin
		tx_frame_ip_payload_length_valid <= 1'b1;
	end
	else
	begin
		tx_frame_ip_payload_length_valid <= tx_frame_ip_payload_length_valid;
	end
end

// frame ip header section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_payload_length_cnt <= 2'd1;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_payload_length_cnt <= 2'd1;
	end
	else if(hw_ip_payload_length_cnt_valid)
	begin
		hw_ip_payload_length_cnt <= hw_ip_payload_length_cnt - 1'b1;
	end
	else
	begin
		hw_ip_payload_length_cnt <= 2'd1;
	end
end

// read ip payload length
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_payload_length <= 16'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_payload_length <= 16'h0;
	end
	else if(hw_ip_payload_length_cnt_valid)
	begin
		tx_frame_ip_payload_length[({14'h0, hw_ip_payload_length_cnt}<<3)+:8] <= precache_data_out;
	end
	else
	begin
		tx_frame_ip_payload_length <= tx_frame_ip_payload_length;
	end
end

// ip header upper protocol type
wire			[11:0]			hw_ip_payload_type_start_pos;
wire			[11:0]			hw_ip_payload_type_end_pos;
wire							hw_ip_payload_type_start;
wire							hw_ip_payload_type_end;
assign hw_ip_payload_type_start_pos = hw_ip_header_start_pos+IP_HEADER_PAYLOAD_TYPE_OFFSET;
assign hw_ip_payload_type_end_pos = hw_ip_header_start_pos+IP_HEADER_PAYLOAD_TYPE_OFFSET+IP_HEADER_TYPE_LENGTH; 
assign hw_ip_payload_type_start = tx_cache_address == hw_ip_payload_type_start_pos ;
assign hw_ip_payload_type_end = tx_cache_address == hw_ip_payload_type_end_pos;
assign tx_frame_ip_tcp_icmp_udp_type = tx_frame_ip_udp_type || tx_frame_ip_icmp_type || tx_frame_ip_tcp_type;

//// payload type in ip header 
// read frame ip payload type
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_tcp_type <= 1'b0;
		tx_frame_ip_udp_type <= 1'b0;
		tx_frame_ip_icmp_type <= 1'b0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_tcp_type <= 1'b0;
		tx_frame_ip_udp_type <= 1'b0;
		tx_frame_ip_icmp_type <= 1'b0;
	end
	else if(hw_ip_payload_type_end)
	begin
		tx_frame_ip_tcp_type <= (precache_data_out == IP_HEADER_TYPE_TCP);
		tx_frame_ip_udp_type <= (precache_data_out == IP_HEADER_TYPE_UDP);
		tx_frame_ip_icmp_type <= (precache_data_out == IP_HEADER_TYPE_ICMP);
	end
	else
	begin
		tx_frame_ip_tcp_type <= tx_frame_ip_tcp_type;
		tx_frame_ip_udp_type <= tx_frame_ip_udp_type;
		tx_frame_ip_icmp_type <= tx_frame_ip_icmp_type;
	end
end

// ip header source ip
reg				[ 1:0]			hw_ip_src_ip_cnt;
wire							hw_ip_src_ip_cnt_valid;
wire			[11:0]			hw_ip_src_ip_start_pos;
wire			[11:0]			hw_ip_src_ip_end_pos;
wire							hw_ip_src_ip_start;
wire							hw_ip_src_ip_end;
assign hw_ip_src_ip_cnt_valid = tx_cachein_processing_valid && tx_frame_ip_src_ip_valid;
assign hw_ip_src_ip_start_pos = hw_ip_header_start_pos+IP_HEADER_SRC_IP_OFFSET;
assign hw_ip_src_ip_end_pos = hw_ip_src_ip_start_pos+IP_HEADER_SRC_IP_LENGTH; 
assign hw_ip_src_ip_start = tx_cache_address == hw_ip_src_ip_start_pos;
assign hw_ip_src_ip_end = tx_cache_address == hw_ip_src_ip_end_pos;

//// src ip in ip header 
// valid in ip header src ip section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_src_ip_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_ip_src_ip_end)
	begin
		tx_frame_ip_src_ip_valid <= 1'b0;
	end
	else if(hw_ip_src_ip_start && tx_frame_ip_header_valid)
	begin
		tx_frame_ip_src_ip_valid <= 1'b1;
	end
	else
	begin
		tx_frame_ip_src_ip_valid <= tx_frame_ip_src_ip_valid;
	end
end

// frame ip header section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_src_ip_cnt <= 2'd3;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_src_ip_cnt <= 2'd3;
	end
	else if(hw_ip_src_ip_cnt_valid)
	begin
		hw_ip_src_ip_cnt <= hw_ip_src_ip_cnt - 1'b1;
	end
	else
	begin
		hw_ip_src_ip_cnt <= 2'd3;
	end
end

// read src ip
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_src_ip <= 32'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_src_ip <= 32'h0;
	end
	else if(hw_ip_src_ip_cnt_valid)
	begin
		tx_frame_ip_src_ip[({30'h0, hw_ip_src_ip_cnt}<<3)+:8] <= precache_data_out;
	end
	else
	begin
		tx_frame_ip_src_ip <= tx_frame_ip_src_ip;
	end
end

// ip header destination ip
reg				[ 1:0]			hw_ip_des_ip_cnt;
wire							hw_ip_des_ip_cnt_valid;
wire			[11:0]			hw_ip_des_ip_start_pos;
wire			[11:0]			hw_ip_des_ip_end_pos;
wire							hw_ip_des_ip_start;
wire							hw_ip_des_ip_end;
assign hw_ip_des_ip_cnt_valid = tx_cachein_processing_valid && tx_frame_ip_des_ip_valid;
assign hw_ip_des_ip_start_pos = hw_ip_header_start_pos+IP_HEADER_DES_IP_OFFSET;
assign hw_ip_des_ip_end_pos = hw_ip_des_ip_start_pos+IP_HEADER_DES_IP_LENGTH; 
assign hw_ip_des_ip_start = tx_cache_address == hw_ip_des_ip_start_pos;
assign hw_ip_des_ip_end = tx_cache_address == hw_ip_des_ip_end_pos;

//// des ip in ip header 
// valid in ip header des ip section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_des_ip_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_ip_des_ip_end)
	begin
		tx_frame_ip_des_ip_valid <= 1'b0;
	end
	else if(hw_ip_des_ip_start && tx_frame_ip_header_valid)
	begin
		tx_frame_ip_des_ip_valid <= 1'b1;
	end
	else
	begin
		tx_frame_ip_des_ip_valid <= tx_frame_ip_des_ip_valid;
	end
end

// frame ip header section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_des_ip_cnt <= 2'd3;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_des_ip_cnt <= 2'd3;
	end
	else if(hw_ip_des_ip_cnt_valid)
	begin
		hw_ip_des_ip_cnt <= hw_ip_des_ip_cnt - 1'b1;
	end
	else
	begin
		hw_ip_des_ip_cnt <= 2'd3;
	end
end

// read des ip
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_des_ip <= 32'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_ip_des_ip <= 32'h0;
	end
	else if(hw_ip_des_ip_cnt_valid)
	begin
//		case(hw_ip_des_ip_cnt)
//			3'h0: tx_frame_ip_des_ip[7:0] <= precache_data_out;
//			3'h1: tx_frame_ip_des_ip[15:8] <= precache_data_out;
//			3'h2: tx_frame_ip_des_ip[23:16] <= precache_data_out;
//			3'h3: tx_frame_ip_des_ip[31:24] <= precache_data_out;
//			default: tx_frame_ip_des_ip <= tx_frame_ip_des_ip;
//		endcase
		tx_frame_ip_des_ip[({30'h0, hw_ip_des_ip_cnt}<<3)+:8] <= precache_data_out;
	end
	else
	begin
		tx_frame_ip_des_ip <= tx_frame_ip_des_ip;
	end
end

//===============================================
// tx frame payload handle: only operating in cache in state
// ip header checksum handle
//===============================================

reg				[ 1:0]			hw_ip_header_cs_cnt;
wire							hw_ip_header_cs_cnt_valid;
wire			[11:0]			hw_ip_header_cs_start_pos;
wire			[11:0]			hw_ip_header_cs_end_pos;
wire							hw_ip_header_cs_start;
wire							hw_ip_header_cs_end;
assign hw_ip_header_cs_cnt_valid = tx_cachein_processing_valid && tx_frame_ip_header_cs_valid;
assign hw_ip_header_cs_start_pos = hw_ip_header_start_pos+IP_HEADER_CHECKSUM_OFFSET;
assign hw_ip_header_cs_end_pos = hw_ip_header_start_pos+IP_HEADER_CHECKSUM_OFFSET+IP_HEADER_CHECKSUM_LENGTH;
//assign hw_ip_header_cs_start = (tx_cache_address == hw_ip_header_cs_start_pos) && (r_hw_cs_en || r_hw_cs_replace_en);
assign hw_ip_header_cs_start = tx_cache_address == hw_ip_header_cs_start_pos;
assign hw_ip_header_cs_end = tx_cache_address == hw_ip_header_cs_end_pos;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_ip_header_cs_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_ip_header_cs_end)
	begin
		tx_frame_ip_header_cs_valid <= 1'b0;
	end
	else if(hw_ip_header_cs_start && tx_frame_ip_header_valid && (r_hw_cs_en || r_hw_cs_replace_en))
	begin
		tx_frame_ip_header_cs_valid <= 1'b1;
	end
	else
	begin
		tx_frame_ip_header_cs_valid <= tx_frame_ip_header_cs_valid;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_header_cs_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_header_cs_cnt <= 2'd0;
	end
	else if(hw_ip_header_cs_cnt_valid)
	begin
		hw_ip_header_cs_cnt <= hw_ip_header_cs_cnt + 1'b1;
	end
	else
	begin
		hw_ip_header_cs_cnt <= 2'd0;
	end
end

// Using tx cache data to handle ip header checksum 
// instead of pre-cache data due to some specific 
// hardware replacement or insertion.
reg								hw_ip_header_cs_start_d;
reg								hw_ip_header_cs_end_d;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_ip_header_cs_start_d <= 1'b0;
		hw_ip_header_cs_end_d <= 1'b0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_ip_header_cs_start_d <= 1'b0;
		hw_ip_header_cs_end_d <= 1'b0;
	end
	else
	begin
		hw_ip_header_cs_start_d <= hw_ip_header_start;
		hw_ip_header_cs_end_d <= hw_ip_header_end;
	end
end

// calculate checksum
wire			[15:0]			hw_ip_header_cs;
wire							hw_ip_header_cs_done;

hw_header_checksum_without_pseudoheader hw_ip_header_checksum 
(
	.pe_clk				(pe_tx_clk),  
	.pe_rstn			(pe_tx_rstn),

	.pe_logic_clr		(pe_tx_logic_clr_by_tx_done),
	.process_data_valid	(~tx_cache_wen),
	.process_start		(hw_ip_header_cs_start_d && tx_frame_ip_type),
	.process_finish		(hw_ip_header_cs_end_d && tx_frame_ip_type),

	.data_in			(tx_cache_data),
	.hw_checksum_out	(hw_ip_header_cs),// remain until tx handle finish, read without process start!!! watch out cache address
	.hw_checksum_done	(hw_ip_header_cs_done)
);

//===============================================
// tx frame payload handle: only operating in cache in state
// udp header & payload handle
//===============================================

reg				[15:0]			hw_udp_cnt;
wire							hw_udp_cnt_valid;
wire			[11:0]			hw_udp_start_pos;
wire			[11:0]			hw_udp_end_pos;
wire							hw_udp_start;
wire							hw_udp_end;

assign hw_udp_cnt_valid = tx_cachein_processing_valid && tx_frame_udp_payload_valid;
assign hw_udp_start_pos = hw_ip_header_end_pos;
assign hw_udp_end_pos = hw_ip_header_start_pos+tx_frame_ip_payload_length[11:0];// total data number in udp headers cannot be used here
assign hw_udp_start = tx_cache_address == hw_udp_start_pos;
assign hw_udp_end = tx_cache_address == hw_udp_end_pos;

//// udp total cnt 
// valid in ip header udp payload section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_udp_payload_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_udp_end)
	begin
		tx_frame_udp_payload_valid <= 1'b0;
	end
	else if(hw_udp_start && tx_frame_ip_udp_type)
	begin
		tx_frame_udp_payload_valid <= 1'b1;
	end
	else
	begin
		tx_frame_udp_payload_valid <= tx_frame_udp_payload_valid;
	end
end

// frame ip header udp payload section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_udp_cnt <= 16'hffff;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_udp_cnt <= 16'hffff;
	end
	else if(hw_udp_cnt_valid)
	begin
		hw_udp_cnt <= hw_udp_cnt + 1'b1;
	end
	else
	begin
		hw_udp_cnt <= 16'hffff;
	end
end

reg				[ 1:0]			hw_udp_length_cnt;
wire							hw_udp_length_cnt_valid;
wire			[11:0]			hw_udp_length_start_pos;
wire			[11:0]			hw_udp_length_end_pos;
wire							hw_udp_length_start;
wire							hw_udp_length_end;

assign hw_udp_length_cnt_valid = tx_cachein_processing_valid && tx_frame_udp_length_valid; 
assign hw_udp_length_start_pos = hw_udp_start_pos+UDP_HEADER_HEADER_LENGTH_OFFSET;
assign hw_udp_length_end_pos = hw_udp_length_start_pos+UDP_HEADER_LENGTH_LENGTH;
assign hw_udp_length_start = tx_cache_address == hw_udp_length_start_pos;
assign hw_udp_length_end = tx_cache_address == hw_udp_length_end_pos;

//// payload length in udp header 
// valid in ip header udp payload section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_udp_length_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_udp_length_end)
	begin
		tx_frame_udp_length_valid <= 1'b0;
	end
	else if(hw_udp_length_start && tx_frame_ip_udp_type)
	begin
		tx_frame_udp_length_valid <= 1'b1;
	end
	else
	begin
		tx_frame_udp_length_valid <= tx_frame_udp_length_valid;
	end
end

// frame udp length cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_udp_length_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr || hw_udp_length_end)
	begin
		hw_udp_length_cnt <= 2'd0;
	end
	else if(hw_udp_length_start)
	begin
		hw_udp_length_cnt <= hw_udp_length_cnt + 1'b1;
	end
	else
	begin
		hw_udp_length_cnt <= 2'd0;
	end
end

// read udp length
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_udp_length <= 16'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_udp_length <= 16'h0;
	end
	else if(tx_frame_udp_length_valid)
	begin
		tx_frame_udp_length[(hw_udp_length_cnt<<3)+:8] <= precache_data_out;
	end
	else
	begin
		tx_frame_udp_length <= tx_frame_udp_length;
	end
end

//===============================================
// tx frame payload handle: only operating in cache in state
// udp header checksum handle
//===============================================

reg				[ 1:0]			hw_udp_header_cs_cnt;
wire							hw_udp_header_cs_cnt_valid;
wire			[11:0]			hw_udp_header_cs_start_pos;
wire			[11:0]			hw_udp_header_cs_end_pos;
wire							hw_udp_header_cs_start;
wire							hw_udp_header_cs_end;
assign hw_udp_header_cs_cnt_valid = tx_cachein_processing_valid && tx_frame_udp_header_cs_valid;
assign hw_udp_header_cs_start_pos = hw_udp_start_pos+UDP_HEADER_CHECKSUM_OFFSET;
assign hw_udp_header_cs_end_pos = hw_udp_header_cs_start_pos+UDP_HEADER_CHECKSUM_LENGTH;
assign hw_udp_header_cs_start = (tx_cache_address == hw_udp_header_cs_start_pos) && (r_hw_cs_en || r_hw_cs_replace_en);
assign hw_udp_header_cs_end = tx_cache_address == hw_udp_header_cs_end_pos;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_udp_header_cs_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_udp_header_cs_end)
	begin
		tx_frame_udp_header_cs_valid <= 1'b0;
	end
	else if(hw_udp_header_cs_start && tx_frame_ip_udp_type)
	begin
		tx_frame_udp_header_cs_valid <= 1'b1;
	end
	else
	begin
		tx_frame_udp_header_cs_valid <= tx_frame_udp_header_cs_valid;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_udp_header_cs_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_udp_header_cs_cnt <= 2'd0;
	end
	else if(hw_udp_header_cs_cnt_valid)
	begin
		hw_udp_header_cs_cnt <= hw_udp_header_cs_cnt + 1'b1;
	end
	else
	begin
		hw_udp_header_cs_cnt <= 2'd0;
	end
end

// Using tx cache data to handle ip header checksum 
// instead of pre-cache data due to some specific 
// hardware replacement or insertion.
reg								hw_udp_start_d;
reg								hw_udp_end_d;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_udp_start_d <= 1'b0;
		hw_udp_end_d <= 1'b0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_udp_start_d <= 1'b0;
		hw_udp_end_d <= 1'b0;
	end
	else
	begin
		hw_udp_start_d <= hw_udp_start;
		hw_udp_end_d <= hw_udp_end;
	end
end

// calculate checksum
wire			[15:0]			hw_udp_cs;
wire							hw_udp_header_cs_done;

//including pseudo header
hw_header_checksum_with_pseudoheader hw_udp_header_checksum 
(
	.pe_clk				(pe_tx_clk),  
	.pe_rstn			(pe_tx_rstn),

	.pe_logic_clr		(pe_tx_logic_clr_by_tx_done),
	.process_data_valid	(~tx_cache_wen),
	.process_start		(hw_udp_start_d && tx_frame_ip_udp_type),
	.process_finish		(hw_udp_end_d && tx_frame_ip_udp_type),

	.data_in			(tx_cache_data),
	.src_ip				(tx_frame_ip_src_ip),
	.des_ip				(tx_frame_ip_des_ip),
	.payload_type		(IP_HEADER_TYPE_UDP),
	.length				(tx_frame_ip_payload_length - {10'h0, tx_frame_ip_header_length}),
	.hw_checksum_out	(hw_udp_cs),// remain until tx handle finish, read without process start!!! watch out cache address
	.hw_checksum_done	(hw_udp_header_cs_done)
);

//===============================================
// tx frame payload handle: only operating in cache in state
// icmp header & payload handle
//===============================================

reg				[15:0]			hw_icmp_cnt;
wire							hw_icmp_cnt_valid;
wire			[11:0]			hw_icmp_start_pos;
wire			[11:0]			hw_icmp_end_pos;
wire							hw_icmp_start;
wire							hw_icmp_end;

assign hw_icmp_cnt_valid = tx_cachein_processing_valid && tx_frame_icmp_payload_valid;
assign hw_icmp_start_pos = hw_ip_header_end_pos;
assign hw_icmp_end_pos = hw_ip_header_start_pos+tx_frame_ip_payload_length[11:0];// no total data number in icmp header
assign hw_icmp_start = tx_cache_address == hw_icmp_start_pos;
assign hw_icmp_end = tx_cache_address == hw_icmp_end_pos;

// valid in ip header icmp payload section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_icmp_payload_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_icmp_end)
	begin
		tx_frame_icmp_payload_valid <= 1'b0;
	end
	else if(hw_icmp_start && tx_frame_ip_icmp_type)
	begin
		tx_frame_icmp_payload_valid <= 1'b1;
	end
	else
	begin
		tx_frame_icmp_payload_valid <= tx_frame_icmp_payload_valid;
	end
end

// frame ip header icmp payload section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_icmp_cnt <= 16'hffff;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_icmp_cnt <= 16'hffff;
	end
	else if(hw_icmp_cnt_valid)
	begin
		hw_icmp_cnt <= hw_icmp_cnt + 1'b1;
	end
	else
	begin
		hw_icmp_cnt <= 16'hffff;
	end
end

//===============================================
// tx frame payload handle: only operating in cache in state
// icmp header checksum handle
//===============================================

reg				[ 1:0]			hw_icmp_header_cs_cnt;
wire							hw_icmp_header_cs_cnt_valid;
wire			[11:0]			hw_icmp_header_cs_start_pos;
wire			[11:0]			hw_icmp_header_cs_end_pos;
wire							hw_icmp_header_cs_start;
wire							hw_icmp_header_cs_end;
assign hw_icmp_header_cs_cnt_valid = tx_cachein_processing_valid && tx_frame_icmp_header_cs_valid;
assign hw_icmp_header_cs_start_pos = hw_icmp_start_pos+ICMP_HEADER_CHECKSUM_OFFSET;
assign hw_icmp_header_cs_end_pos = hw_icmp_header_cs_start_pos+ICMP_HEADER_CHECKSUM_LENGTH;
assign hw_icmp_header_cs_start = (tx_cache_address == hw_icmp_header_cs_start_pos) && (r_hw_cs_en || r_hw_cs_replace_en);
assign hw_icmp_header_cs_end = tx_cache_address == hw_icmp_header_cs_end_pos;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_icmp_header_cs_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_icmp_header_cs_end)
	begin
		tx_frame_icmp_header_cs_valid <= 1'b0;
	end
	else if(hw_icmp_header_cs_start && tx_frame_ip_icmp_type)
	begin
		tx_frame_icmp_header_cs_valid <= 1'b1;
	end
	else
	begin
		tx_frame_icmp_header_cs_valid <= tx_frame_icmp_header_cs_valid;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_icmp_header_cs_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_icmp_header_cs_cnt <= 2'd0;
	end
	else if(hw_icmp_header_cs_cnt_valid)
	begin
		hw_icmp_header_cs_cnt <= hw_icmp_header_cs_cnt + 1'b1;
	end
	else
	begin
		hw_icmp_header_cs_cnt <= 2'd0;
	end
end

// Using tx cache data to handle ip header checksum 
// instead of pre-cache data due to some specific 
// hardware replacement or insertion.
reg								hw_icmp_start_d;
reg								hw_icmp_end_d;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_icmp_start_d <= 1'b0;
		hw_icmp_end_d <= 1'b0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_icmp_start_d <= 1'b0;
		hw_icmp_end_d <= 1'b0;
	end
	else
	begin
		hw_icmp_start_d <= hw_icmp_start;
		hw_icmp_end_d <= hw_icmp_end;
	end
end

// calculate checksum
wire			[15:0]			hw_icmp_header_cs;
wire							hw_icmp_header_cs_done;

hw_header_checksum_without_pseudoheader hw_icmp_header_checksum 
(
	.pe_clk				(pe_tx_clk),  
	.pe_rstn			(pe_tx_rstn),

	.pe_logic_clr		(pe_tx_logic_clr_by_tx_done),
	.process_data_valid	(~tx_cache_wen),
	.process_start		(hw_icmp_start_d && tx_frame_ip_icmp_type),
	.process_finish		(hw_icmp_end_d && tx_frame_ip_icmp_type),

	.data_in			(tx_cache_data),
	.hw_checksum_out	(hw_icmp_header_cs),// remain until tx handle finish, read without process start!!! watch out cache address
	.hw_checksum_done	(hw_icmp_header_cs_done)
);

//===============================================
// tx frame payload handle: only operating in cache in state
// tcp header & payload handle
//===============================================

reg				[15:0]			hw_tcp_cnt;
wire							hw_tcp_cnt_valid;
wire			[11:0]			hw_tcp_start_pos;
wire			[11:0]			hw_tcp_end_pos;
wire							hw_tcp_start;
wire							hw_tcp_end;

assign hw_tcp_cnt_valid = tx_cachein_processing_valid && tx_frame_tcp_payload_valid;
assign hw_tcp_start_pos = hw_ip_header_end_pos;
assign hw_tcp_end_pos = hw_ip_header_start_pos+tx_frame_ip_payload_length[11:0];// no total data number in tcp header
assign hw_tcp_start = tx_cache_address == hw_tcp_start_pos;
assign hw_tcp_end = tx_cache_address == hw_tcp_end_pos;

// valid in ip header tcp payload section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_tcp_payload_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_tcp_end)
	begin
		tx_frame_tcp_payload_valid <= 1'b0;
	end
	else if(hw_tcp_start && tx_frame_ip_tcp_type)
	begin
		tx_frame_tcp_payload_valid <= 1'b1;
	end
	else
	begin
		tx_frame_tcp_payload_valid <= tx_frame_tcp_payload_valid;
	end
end

// frame ip header tcp payload section cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_tcp_cnt <= 16'hffff;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_tcp_cnt <= 16'hffff;
	end
	else if(hw_tcp_cnt_valid)
	begin
		hw_tcp_cnt <= hw_tcp_cnt + 1'b1;
	end
	else
	begin
		hw_tcp_cnt <= 16'hffff;
	end
end

//// header length in tcp header 
reg								hw_tcp_header_length_cnt;
wire							hw_tcp_header_length_cnt_valid;
wire			[11:0]			hw_tcp_header_length_start_pos;
wire			[11:0]			hw_tcp_header_length_end_pos;
wire							hw_tcp_header_length_start;
wire							hw_tcp_header_length_end;

assign hw_tcp_header_length_cnt_valid = tx_cachein_processing_valid && tx_frame_tcp_header_length_valid; 
assign hw_tcp_header_length_start_pos = hw_tcp_start_pos+TCP_HEADER_HEADER_LENGTH_OFFSET;
assign hw_tcp_header_length_end_pos = hw_tcp_header_length_start_pos+TCP_HEADER_LENGTH_LENGTH;
assign hw_tcp_header_length_start = tx_cache_address == hw_tcp_header_length_start_pos;
assign hw_tcp_header_length_end = tx_cache_address == hw_tcp_header_length_end_pos;

// valid in ip header tcp payload section
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_tcp_header_length_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_tcp_header_length_end)
	begin
		tx_frame_tcp_header_length_valid <= 1'b0;
	end
	else if(hw_tcp_header_length_start && tx_frame_ip_tcp_type)
	begin
		tx_frame_tcp_header_length_valid <= 1'b1;
	end
	else
	begin
		tx_frame_tcp_header_length_valid <= tx_frame_tcp_header_length_valid;
	end
end

// frame tcp length cnt
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_tcp_header_length_cnt <= 1'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_tcp_header_length_cnt <= 1'd0;
	end
	else if(hw_tcp_header_length_cnt_valid)
	begin
		hw_tcp_header_length_cnt <= hw_tcp_header_length_cnt + 1'b1;
	end
	else
	begin
		hw_tcp_header_length_cnt <= 1'd0;
	end
end

// read tcp length
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_tcp_header_length <= 4'h0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_frame_tcp_header_length <= 4'h0;
	end
	else if(tx_frame_tcp_header_length_valid)
	begin
		tx_frame_tcp_header_length <= precache_data_out[7:4];
	end
	else
	begin
		tx_frame_tcp_header_length <= tx_frame_tcp_header_length;
	end
end

//===============================================
// tx frame payload handle: only operating in cache in state
// tcp header checksum handle
//===============================================

reg				[ 1:0]			hw_tcp_header_cs_cnt;
wire							hw_tcp_header_cs_cnt_valid;
wire			[11:0]			hw_tcp_header_cs_start_pos;
wire			[11:0]			hw_tcp_header_cs_end_pos;
wire							hw_tcp_header_cs_start;
wire							hw_tcp_header_cs_end;
assign hw_tcp_header_cs_cnt_valid = tx_cachein_processing_valid && tx_frame_tcp_header_cs_valid;
assign hw_tcp_header_cs_start_pos = hw_tcp_start_pos+TCP_HEADER_CHECKSUM_OFFSET;
assign hw_tcp_header_cs_end_pos = hw_tcp_header_cs_start_pos+TCP_HEADER_CHECKSUM_LENGTH;
assign hw_tcp_header_cs_start = (tx_cache_address == hw_tcp_header_cs_start_pos) && (r_hw_cs_en || r_hw_cs_replace_en);
assign hw_tcp_header_cs_end = tx_cache_address == hw_tcp_header_cs_end_pos;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_tcp_header_cs_valid <= 1'b0;
	end
	else if(pe_tx_logic_clr || hw_tcp_header_cs_end)
	begin
		tx_frame_tcp_header_cs_valid <= 1'b0;
	end
	else if(hw_tcp_header_cs_start && tx_frame_ip_tcp_type)
	begin
		tx_frame_tcp_header_cs_valid <= 1'b1;
	end
	else
	begin
		tx_frame_tcp_header_cs_valid <= tx_frame_tcp_header_cs_valid;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_tcp_header_cs_cnt <= 2'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_tcp_header_cs_cnt <= 2'd0;
	end
	else if(hw_tcp_header_cs_cnt_valid)
	begin
		hw_tcp_header_cs_cnt <= hw_tcp_header_cs_cnt + 1'b1;
	end
	else
	begin
		hw_tcp_header_cs_cnt <= 2'd0;
	end
end

// Using tx cache data to handle ip header checksum 
// instead of pre-cache data due to some specific 
// hardware replacement or insertion.
reg								hw_tcp_start_d;
reg								hw_tcp_end_d;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_tcp_start_d <= 1'b0;
		hw_tcp_end_d <= 1'b0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_tcp_start_d <= 1'b0;
		hw_tcp_end_d <= 1'b0;
	end
	else 
	begin
		hw_tcp_start_d <= hw_tcp_start;
		hw_tcp_end_d <= hw_tcp_end;
	end
end

// calculate checksum
wire			[15:0]			hw_tcp_cs;
wire							hw_tcp_header_cs_done;

//including pseudo header
hw_header_checksum_with_pseudoheader hw_tcp_header_checksum 
(
	.pe_clk				(pe_tx_clk),  
	.pe_rstn			(pe_tx_rstn),

	.pe_logic_clr		(pe_tx_logic_clr_by_tx_done),
	.process_data_valid	(~tx_cache_wen),
	.process_start		(hw_tcp_start_d && tx_frame_ip_tcp_type),
	.process_finish		(hw_tcp_end_d && tx_frame_ip_tcp_type),

	.data_in			(tx_cache_data),
	.src_ip				(tx_frame_ip_src_ip),
	.des_ip				(tx_frame_ip_des_ip),
	.payload_type		(IP_HEADER_TYPE_TCP),
	.length				(tx_frame_ip_payload_length - {10'h0, tx_frame_ip_header_length}),
	.hw_checksum_out	(hw_tcp_cs),// remain until tx handle finish, read without process start!!! watch out cache address
	.hw_checksum_done	(hw_tcp_header_cs_done)
);

//===============================================
// tx frame header checksum handle
// Among udp or tcp or icmp checksum, only one
// checksum is not all zero.
//
// Checksum address handling here should match
// due to the checksum data is combinational logic.
// Checksum address handling in frame payload 
// section should minus 2 due to the checksum data 
// is sequential logic. 
//===============================================

reg				[ 2:0]			hw_cs_cnt;
wire			[ 7:0]			hw_cs[3:0];			
wire			[11:0]			hw_cs_addr[3:0];				
wire							hw_cs_valid;
assign hw_cs[0] = hw_ip_header_cs[15:8];
assign hw_cs[1] = hw_ip_header_cs[7:0];
assign hw_cs[2] = hw_udp_cs[15:8] | hw_tcp_cs[15:8] | hw_icmp_header_cs[15:8];
assign hw_cs[3] = hw_udp_cs[7:0] | hw_tcp_cs[7:0] | hw_icmp_header_cs[7:0];
assign hw_cs_addr[0] = hw_ip_header_cs_start_pos+2;
assign hw_cs_addr[1] = hw_cs_addr[0]+1;
//assign hw_cs_addr[2] = (hw_udp_header_cs_start_pos | hw_tcp_header_cs_start_pos | hw_icmp_start_pos)+2;
assign hw_cs_addr[2] = (tx_frame_ip_udp_type ? hw_udp_header_cs_start_pos : (tx_frame_ip_icmp_type ? hw_icmp_header_cs_start_pos: hw_tcp_header_cs_start_pos))+2;// timing issue??
assign hw_cs_addr[3] = hw_cs_addr[2]+1;
assign hw_cs_valid = tx_handle_state_cachecs && (((hw_cs_cnt[2] == 1'b0) && tx_frame_ip_tcp_icmp_udp_type) || ((hw_cs_cnt[1] == 1'b0) && ~tx_frame_ip_tcp_icmp_udp_type)); 

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		hw_cs_cnt <= 3'd0;
	end
	else if(pe_tx_logic_clr)
	begin
		hw_cs_cnt <= 3'd0;
	end
	else if(tx_handle_state_cachecs)
	begin
		hw_cs_cnt <= hw_cs_cnt + 1'b1;
	end
	else
	begin
		hw_cs_cnt <= 3'd0;
	end
end

//===============================================
// cache out process
//					  ____
// tx_byte_data_re  _____|	  |_______
//  			__________ ______ ________
// tx_byte_data		__________X_data_X________
//===============================================

wire							tx_cacheout_processing_valid;
//assign tx_cacheout_processing_valid = tx_handle_state_cacheout && tx_byte_data_re;
assign tx_cacheout_processing_valid = tx_handle_state_cacheout;//keep sram q one data remaining

//===============================================
// tx handle cache state handle
//===============================================

assign tx_handle_state_idle_to_cachein = tx_data_mode && tx_handle_enable && txdb_fifo_ready; 
assign tx_handle_state_idle_to_bypass = ~tx_data_mode && tx_handle_enable && txdb_fifo_ready;
assign tx_handle_state_cachein_to_cachewait = tx_handle_state_cachein && (tx_cache_address == r_tx_payload_byte_real_length - 12'h1) && (r_hw_cs_en || r_hw_cs_replace_en) && tx_frame_ip_tcp_icmp_udp_type;
assign tx_handle_state_cachein_to_cachecs = tx_handle_state_cachein && (tx_cache_address == r_tx_payload_byte_real_length - 12'h1) && (r_hw_cs_en || r_hw_cs_replace_en) && tx_frame_ip_type;
assign tx_handle_state_cachein_to_cacheout = tx_handle_state_cachein && (tx_cache_address == r_tx_payload_byte_real_length - 12'h1) && ~tx_frame_ip_type;
assign tx_handle_state_cachewait_to_cachecs = tx_handle_state_cachewait && hw_ip_header_cs_done && (hw_icmp_header_cs_done || hw_tcp_header_cs_done || hw_udp_header_cs_done);
assign tx_handle_state_cachecs_to_cacheout = tx_handle_state_cachecs && (((hw_cs_cnt == 3'd4) && tx_frame_ip_tcp_icmp_udp_type) || ((hw_cs_cnt == 3'd2) && ~tx_frame_ip_tcp_icmp_udp_type));//waiting until all checksum data have been write to tx cache ram
assign tx_handle_state_cacheout_to_end = tx_handle_state_cacheout && (tx_cache_address == r_tx_payload_byte_real_length - 12'h1);
assign tx_handle_state_bypass_to_end = tx_handle_state_bypass && (tx_cache_address == r_tx_payload_byte_real_length - 12'h1);

//===============================================
// eth mac tx data cache mode
// All data from tx fifo will be pushed into
// a ram with all checksum or ... needed handled.
// Tx mac core will read data from this ram.
//
// tx_cache_re_mask is used to mask read from 
// precache operation because in insertion mode,
// no related data are writen to precache.
//===============================================

wire			[47:0]			hw_sa_macaddr_cnt_temp;
assign hw_sa_macaddr_cnt_temp = (hw_sa_macaddr_cnt<<3);
assign tx_cache_re_mask = (tx_frame_sa_macaddr_valid && r_hw_sa_mac_en) || ((tx_frame_ip_header_cs_valid || tx_frame_udp_header_cs_valid || tx_frame_tcp_header_cs_valid || tx_frame_icmp_header_cs_valid) && r_hw_cs_en);

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_cache_data <= 8'h0;
	end
//	else if(precache_processing_valid)
	else if(tx_cachein_processing_valid)
	begin
		if(tx_frame_sa_macaddr_valid)
		begin
			tx_cache_data <= r_sa_macaddr[hw_sa_macaddr_cnt_temp+:8];//source mac address
		end
		else if(tx_frame_ip_header_cs_valid || tx_frame_udp_header_cs_valid || tx_frame_tcp_header_cs_valid || tx_frame_icmp_header_cs_valid)
		begin
			tx_cache_data <= 8'h0;//checksum default value (hardware insertion at last)
		end
//		else if()
//		begin
//			tx_cache_data <= ;//crc
//		end
//		else if()
//		begin
//			tx_cache_data <= 8'hff;//padding
//		end
		else
		begin
			tx_cache_data <= precache_data_out;
		end
	end
	else if(hw_cs_valid)
	begin
		tx_cache_data <= hw_cs[hw_cs_cnt];
	end
	else if(tx_bypass_processing_valid)
	begin
		tx_cache_data <= precache_data_out;
	end
	else
	begin
		tx_cache_data <= tx_cache_data;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_cache_re <= 1'b0;
	end
	else if(pe_tx_logic_clr || tx_handle_state_cachein_to_cachewait || tx_handle_state_cachein_to_cacheout)
	begin
		tx_cache_re <= 1'b0;
	end
	else if(tx_handle_state_idle_to_cachein || tx_handle_state_cachein)
	begin
		if(precache_data_valid)
		begin
			tx_cache_re <= 1'b1;
		end
		else
		begin
			tx_cache_re <= 1'b0;
		end
	end
	else
	begin
		tx_cache_re <= 1'b0;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_cache_address <= 12'hfff;
	end
	else if(pe_tx_logic_clr || tx_handle_state_cachein_to_cacheout || tx_handle_state_cachecs_to_cacheout || tx_handle_state_bypass_to_end)
	begin
		tx_cache_address <= 12'hfff;
	end
	// ignore hw insertion
//	else if(tx_cachein_processing_valid && tx_cache_re_mask)
	else if(tx_bypass_processing_valid || tx_cachein_processing_valid)
	begin
		tx_cache_address <= tx_cache_address + 1'b1;
	end
	else if(hw_cs_valid)
	begin
		tx_cache_address <= hw_cs_addr[hw_cs_cnt];
	end
	else if(tx_cacheout_processing_valid && tx_byte_data_re)
	begin
		tx_cache_address <= tx_cache_address + 1'b1;
	end
	else
	begin
		tx_cache_address <= tx_cache_address;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_cache_wen <= 1'b1;
		tx_cache_cs <= 1'b0;
	end
	else if(pe_tx_logic_clr)
	begin
		tx_cache_wen <= 1'b1;
		tx_cache_cs <= 1'b0;
	end
	else if(tx_bypass_processing_valid || tx_cachein_processing_valid)
	begin
		tx_cache_wen <= 1'b0;
		tx_cache_cs <= 1'b1;
	end
	else if(hw_cs_valid)
	begin
		tx_cache_wen <= 1'b0;
		tx_cache_cs <= 1'b1;
	end
	else if(tx_cacheout_processing_valid)
//	else if(tx_cacheout_processing_valid && tx_byte_data_re)
	begin
		tx_cache_wen <= 1'b1;
		tx_cache_cs <= 1'b1;
	end
	else
	begin
		tx_cache_wen <= 1'b1;
		tx_cache_cs <= 1'b0;
	end
end

sp_sram_2k_2048x8_wrapper u_tx_cache_ram
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),
	.wen						(tx_cache_wen),
	.cs							(tx_cache_cs),
	.addr						(tx_cache_address[10:0]),
	.data						(tx_cache_data),
	.q							(tx_cache_q)
);

// for timing need in cache mode
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_cache_data_out <= 1'b0;
	end
	else
	begin
		tx_cache_data_out <= tx_cache_q;
	end
end

//===============================================
// tx handle done flag
// 1. For ip frame, waiting until all cachecs done.
// 2. For not ip frame, waiting until all data cached.
// 3. Ready for auto-retransmission.
//===============================================

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_handle_done <= 1'b0;
	end
	else if(pe_tx_logic_clr_by_tx_done)
	begin
		tx_handle_done <= 1'b0;
	end
	else if(tx_handle_state_cachecs_to_cacheout || tx_handle_state_cachein_to_cacheout)//????
	begin
		tx_handle_done <= 1'b1;
	end
	else
	begin
		tx_handle_done <= tx_handle_done;
	end
end

//===============================================
// eth pe mac tx handle state: TX_HANDLE_END
// this state is used to handle some unfinish issue
//===============================================

//reg								tx_handle_end;
//assign tx_handle_state_end_to_idle = tx_handle_end;
//
//always @(posedge pe_clk or negedge pe_rstn)
//begin
//	if(!pe_rstn)
//		tx_handle_end <= 1'b0;
//	else if(tx_handle_state_end)
//		tx_handle_end <= 1'b1;
//	else
//		tx_handle_end <= 1'b0;
//end

//===============================================
// eth mac tx data bypass mode
// Due to ram bypass, tx mac core will directly
// access tx data fifo to read data.
//===============================================

//assign txdb_pe2fifo_re = txdb_pe2fifo_re;
//assign txdb_pe2fifo_re_done = txdb_pe2fifo_re_done;

//===============================================
// eth mac tx data mux
//===============================================

//assign txdb_pe2fifo_re = tx_data_mode ? txdb_pe2fifo_re : txdb_pe2fifo_re_in_bypass_mode;
assign tx_byte_data = tx_data_mode ? tx_cache_data_out : precache_data_out;

//===============================================
// eth mac tx rcc control
//===============================================

assign pe_tx_logic_clr_by_tx_done = pe_tx_logic_clr || tx_done;
assign pe_tx_logic_clr_by_handle_done = pe_tx_logic_clr || tx_handle_state_bypass_to_end || tx_handle_state_cacheout_to_end;

rstn_sync u_tx_precache_rstn
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn && ~pe_tx_logic_clr_by_tx_done),
	.sync_rstn					(pe_tx_precache_clr)
);

endmodule

