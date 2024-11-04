//===============================================
//
//	File: eth_ahb_data_arbiter.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04132024
//	Version: v1.0
//
// 	This is arbiter for eth mac tx or rx data.
//
//===============================================

module eth_ahb_data_arbiter
(
	// clk & rst
	input						module_clk,
	input						module_rstn,	

	// arbiter config
	input		[2:0]			r_priority_ratio,
	input						r_txrx_priority,
	input						r_arb_scheme,

	input						arbiter_en,
	output reg					tx_req_grant,
	output reg					rx_req_grant,
	output reg					grant_finish
);

reg				[2:0]			grant_cnt;
wire							grant_cnt_max;
reg								next_grant_transfer;
reg								req_continuous;	
reg								req_transfer;	
wire							arbiter_en_r;
reg								tx_last_req;// whether last req is tx
reg								rx_last_req;// whether last req is rx

//===============================================
// req detect
// req is only lasting a clk cycle
// all determined action must be performed 
// in this cycle.
//===============================================

posedge_detect 
#(
	.WIDTH						(1)
)
u_req_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(arbiter_en),
	.Y							(arbiter_en_r)
);

//===============================================
// req cnt
// only working in weighted rr mode
//===============================================

assign grant_cnt_max = grant_cnt == r_priority_ratio;

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		next_grant_transfer <= 1'b0;
	end
	//tx is higher
	else if(r_txrx_priority)
	begin
		if(rx_last_req)
		begin
			next_grant_transfer <= 1'b1;
		end
		else if(grant_cnt_max)
		begin
			next_grant_transfer <= 1'b1;
		end
		else
		begin
			next_grant_transfer <= 1'b0;
		end
	end
	//rx is higher
//	else if(~r_txrx_priority)
	else
	begin
		if(tx_last_req)
		begin
			next_grant_transfer <= 1'b1;
		end
		else if(grant_cnt_max)
		begin
			next_grant_transfer <= 1'b1;
		end
		else
		begin
			next_grant_transfer <= 1'b0;
		end
	end
//	else
//	begin
//		next_grant_transfer <= 1'b0;
//	end
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		grant_cnt <= 3'b0;
	end
	else if((r_arb_scheme == 1'b0) && arbiter_en_r)
	begin
		// grant reach max
		if(next_grant_transfer) 
		begin
			grant_cnt <= 3'b0;
		end
		else
		begin
			grant_cnt <= grant_cnt + 1'b1;
		end
	end
	else
	begin
		grant_cnt <= grant_cnt;
	end
end

//===============================================
// latch last request 
// this bit is lasting a period of time
//===============================================

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		tx_last_req <= 1'b0;
		rx_last_req <= 1'b0;
	end
	// using dynamic arbiter scheme
	else if((r_arb_scheme == 1'b0) && arbiter_en)
	begin
		if(rx_req_grant)
		begin
			tx_last_req <= 1'b0;
			rx_last_req <= 1'b1;
		end
		else if(tx_req_grant)
		begin
			tx_last_req <= 1'b1;
			rx_last_req <= 1'b0;
		end
		else
		begin
			tx_last_req <= tx_last_req;
			rx_last_req <= rx_last_req;
		end
	end
	else
	begin
		tx_last_req <= tx_last_req;
		rx_last_req <= rx_last_req;
	end
end

//===============================================
// arbiter
//===============================================

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		tx_req_grant <= 1'b0;
		rx_req_grant <= 1'b0;
	end
	// fixed priority
	else if((r_arb_scheme == 1'b1))
	begin
		tx_req_grant <= r_txrx_priority;
		rx_req_grant <= ~r_txrx_priority;
	end
	// round robin or weighted fair queue
	else if(arbiter_en_r)
	begin
		if(next_grant_transfer)
		begin
			if(rx_last_req)
			begin
				tx_req_grant <= 1'b1;
				rx_req_grant <= 1'b0;
			end
			else if(tx_last_req)
			begin
				tx_req_grant <= 1'b0;
				rx_req_grant <= 1'b1;
			end
			else
			begin
				tx_req_grant <= tx_req_grant;
				rx_req_grant <= rx_req_grant;
			end
		end
		else
		begin
			if(rx_last_req)
			begin
				tx_req_grant <= 1'b0;
				rx_req_grant <= 1'b1;
			end
			else if(tx_last_req)
			begin
				tx_req_grant <= 1'b1;
				rx_req_grant <= 1'b0;
			end
			else
			begin
				tx_req_grant <= tx_req_grant;
				rx_req_grant <= rx_req_grant;
			end
		end	
	end
	else
	begin
		tx_req_grant <= 1'b0;
		rx_req_grant <= 1'b0;
	end
end

always @(posedge module_clk or negedge module_rstn)
begin
	if(!module_rstn)
	begin
		grant_finish <= 1'b0;
	end
	else if(arbiter_en_r)
	begin
		grant_finish <= 1'b1;
	end
	else
	begin
		grant_finish <= 1'b0;
	end
end

endmodule

