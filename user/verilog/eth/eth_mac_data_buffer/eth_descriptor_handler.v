//===============================================
//
//	File: eth_descriptor_handler.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 06222024
//	Version: v1.0
//
// 	This is eth descriptor handle.
//
//===============================================

module eth_descriptor_handler
(
	// clk & rst
	input						module_clk,
	input						module_rstn,	

	// control
	input						descriptor_logic_clr,
	input						tx_descriptor_handle,
	input						rx_descriptor_handle,

	// descriptors
	input		[ 1:0]			r_tdes_num,
	input		[ 1:0]			r_rdes_num,
	input		[31:0]			r_tdes00,
	input		[31:0]			r_tdes02,
	input		[31:0]			r_tdes03,
	input		[31:0]			r_tdes10,
	input		[31:0]			r_tdes12,
	input		[31:0]			r_tdes13,
	input		[31:0]			r_tdes20,
	input		[31:0]			r_tdes22,
	input		[31:0]			r_tdes23,
	input		[31:0]			r_tdes30,
	input		[31:0]			r_tdes32,
	input		[31:0]			r_tdes33,
	input		[31:0]			r_rdes00,
	input		[31:0]			r_rdes03,
	input		[31:0]			r_rdes10,
	input		[31:0]			r_rdes13,
	input		[31:0]			r_rdes20,
	input		[31:0]			r_rdes23,
	input		[31:0]			r_rdes30,
	input		[31:0]			r_rdes33,

	// tx configs
	output reg  [31:0]			r_tx_address1,
	output reg					r_tx_ioc_int_en,
	output reg  [11:0]			r_tx_length1,
	output reg  [27:26]			r_tx_cpc,	
	output reg  [25:24]			r_tx_saic,
	output reg  [17:16]			r_tx_cic,

	// rx configs
	output reg  [31:0]			r_rx_address1,
	output reg  				r_rx_ioc_int_en,
	
	// handle done
	output 						descriptor_handle_finish,
	output						last_tx_descriptor,
	output						last_rx_descriptor,
	input						process_finish
);

//===============================================
// descriptor handle detect
// Each data process will handle descriptors 
// only once.
//===============================================

wire							tx_descriptor_update;
wire							rx_descriptor_update;

posedge_detect u_tx_descriptor_handle_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(tx_descriptor_handle),
	.Y							(tx_descriptor_update)
);

posedge_detect u_rx_descriptor_handle_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(rx_descriptor_handle),
	.Y							(rx_descriptor_update)
);

//===============================================
// descriptor cnt
//===============================================

reg				[ 2:0]			tx_descriptor_cnt;// fix 4 descriptors in reg table
reg				[ 2:0]			rx_descriptor_cnt;// fix 4 descriptors in reg table

assign last_tx_descriptor = (tx_descriptor_cnt - 3'h1) == r_tdes_num;
assign last_rx_descriptor = (rx_descriptor_cnt - 3'h1) == r_rdes_num;

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		tx_descriptor_cnt <= 3'b0;
	end
	else if(descriptor_logic_clr || (last_tx_descriptor && process_finish))
	begin
		tx_descriptor_cnt <= 3'b0;
	end
	else if(tx_descriptor_update)
	begin
		tx_descriptor_cnt <= tx_descriptor_cnt + 1'b1;
	end
	else
	begin
		tx_descriptor_cnt <= tx_descriptor_cnt;
	end
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		rx_descriptor_cnt <= 3'b0;
	end
	else if(descriptor_logic_clr || (last_tx_descriptor && process_finish))
	begin
		rx_descriptor_cnt <= 3'b0;
	end
	else if(rx_descriptor_update)
	begin
		rx_descriptor_cnt <= rx_descriptor_cnt + 1'b1;
	end
	else
	begin
		rx_descriptor_cnt <= rx_descriptor_cnt;
	end
end

//===============================================
// prefetch config
//===============================================

wire			[31:0]			r_tdes0[3:0];	
//wire			[31:0]			r_tdes1[3:0];	
wire			[31:0]			r_tdes2[3:0];	
wire			[31:0]			r_tdes3[3:0];	
wire			[31:0]			r_rdes0[3:0];	
//wire			[31:0]			r_rdes1[3:0];	
//wire			[31:0]			r_rdes2[3:0];	
wire			[31:0]			r_rdes3[3:0];	

assign r_tdes0[0] = r_tdes00; 
assign r_tdes0[1] = r_tdes10; 
assign r_tdes0[2] = r_tdes20; 
assign r_tdes0[3] = r_tdes30; 
assign r_tdes2[0] = r_tdes02; 
assign r_tdes2[1] = r_tdes12; 
assign r_tdes2[2] = r_tdes22; 
assign r_tdes2[3] = r_tdes32; 
assign r_tdes3[0] = r_tdes03; 
assign r_tdes3[1] = r_tdes13; 
assign r_tdes3[2] = r_tdes23; 
assign r_tdes3[3] = r_tdes33; 

assign r_rdes0[0] = r_tdes00; 
assign r_rdes0[1] = r_tdes10; 
assign r_rdes0[2] = r_tdes20; 
assign r_rdes0[3] = r_tdes30; 
assign r_rdes3[0] = r_tdes03; 
assign r_rdes3[1] = r_tdes13; 
assign r_rdes3[2] = r_tdes23; 
assign r_rdes3[3] = r_tdes33; 

//assign r_tdes0 = {r_tdes30, r_tdes20, r_tdes10, r_tdes00};
////assign r_tdes1 = {r_tdes31, r_tdes21, r_tdes11, r_tdes01};
//assign r_tdes2 = {r_tdes32, r_tdes22, r_tdes12, r_tdes02};
//assign r_tdes3 = {r_tdes33, r_tdes23, r_tdes13, r_tdes03};
//assign r_rdes0 = {r_rdes30, r_rdes20, r_rdes10, r_rdes00};
////assign r_rdes1 = {r_rdes31, r_rdes21, r_rdes11, r_rdes01};
////assign r_rdes2 = {r_rdes32, r_rdes22, r_rdes12, r_rdes02};
//assign r_rdes3 = {r_rdes33, r_rdes23, r_rdes13, r_rdes03};

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		r_tx_address1 <= 32'h0;
		r_tx_ioc_int_en <= 1'b0;
		r_tx_length1 <= 12'h0;
		r_tx_cpc <= 2'h0; 
		r_tx_saic <= 2'h0;
		r_tx_cic <= 2'h0; 
	end
	else if(tx_descriptor_update)
	begin
		r_tx_address1 <= r_tdes0[tx_descriptor_cnt];
		r_tx_ioc_int_en <= r_tdes2[tx_descriptor_cnt][31];
		r_tx_length1 <= r_tdes2[tx_descriptor_cnt][11:0];
		r_tx_cpc <= r_tdes3[tx_descriptor_cnt][27:26]; 
		r_tx_saic <= r_tdes3[tx_descriptor_cnt][25:24];
		r_tx_cic <= r_tdes3[tx_descriptor_cnt][17:16]; 
	end
	else
	begin
		r_tx_address1 <= r_tx_address1;
		r_tx_ioc_int_en <= r_tx_ioc_int_en;
		r_tx_length1 <= r_tx_length1;
		r_tx_cpc <= r_tx_cpc; 
		r_tx_saic <= r_tx_saic;
		r_tx_cic <= r_tx_cic; 
	end
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		r_rx_address1 <= 32'h0;
		r_rx_ioc_int_en <= 1'b0;
	end
	else if(rx_descriptor_update)
	begin
		r_rx_address1 <= r_rdes0[rx_descriptor_cnt];
		r_rx_ioc_int_en <= r_rdes3[rx_descriptor_cnt][30];
	end
	else
	begin
		r_rx_address1 <= r_rx_address1;
		r_rx_ioc_int_en <= r_rx_ioc_int_en;
	end
end

//===============================================
// prefetch done
//===============================================

sync_ff u_descriptor_handle_finish
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.A							(tx_descriptor_update || rx_descriptor_handle),
	.Y							(descriptor_handle_finish)
);

endmodule

