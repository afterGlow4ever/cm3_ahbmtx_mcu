//===============================================
//
//	File: hw_header_checksum_with_pseudoheader.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 07062024
//	Version: v1.0
//
// 	This is hardware checksum generation with
// 	pseudo header.
//	This checksum is used in:
//	tcp header
//	udp header
//
//===============================================

module hw_header_checksum_with_pseudoheader
(
	input  						pe_clk,  
	input  						pe_rstn,

	// control signal
	input						pe_logic_clr,
	input						process_data_valid,
	input						process_start,//before a clk
	input						process_finish,// before a clk

	// data
	input		[ 7:0]			data_in,// supporinh in pseudo header?
	input		[31:0]			src_ip,
	input		[31:0]			des_ip,
	input		[ 7:0]			payload_type,
	input		[15:0]			length,
	output		[15:0]			hw_checksum_out,
	output reg					hw_checksum_done
);

//===============================================
// 				 ___	
// start	____|	|______________________________
// 				 	 ___________________________	
// valid	________|							|__
//  			____ ______ ______ ______ ______ __
// data_in		____X___0__X__1___X___2__X__3___X__
//  			____ ______ ______ ______ ______ __
// byte_cnt		____X___0__X__1___X___0__X__1___X__
//  			____ _____________ _____________ __
// halfword_cnt	____X___0_________X_________1___X__
//  			____ ______ ______ ______ ______ __
// byte_data	____X___0__X__1___X___2__X__3___X__
//						    ______		  ______
// halfword_valid _________|	  |______|		|_
//
//
// Hardware checksum will insert at last.
//
//===============================================

reg								byte_cnt;
reg								halfword_cnt;
reg								halfword_valid;
reg								process_doing;
wire							process_valid;
wire							process_valid_d;
reg				[15:0]			iterative_checksum;
reg				[ 2:0]			iterative_cnt;
reg								iterative_valid;
reg				[31:0]			hw_checksum;
reg								process_finish_d;
wire							process_finish_2d;
wire							process_finish_in_even;

//===============================================
// The number of data bytes must be even.
//===============================================

assign process_finish_in_even = byte_cnt ? process_finish : 1'b0; 
assign process_real_finish = process_finish_in_even ? process_finish : process_finish_d;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		process_finish_d <= 1'b0;
	end
	else if(pe_logic_clr) 
	begin
		process_finish_d <= 1'b0;
	end
	else 
	begin
		process_finish_d <= process_finish;
	end
end

sync_ff u_process_finish_2d 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),	
	.A							(process_finish_d),
	.Y							(process_finish_2d)
);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		process_doing <= 1'b0;
	end
	else if(pe_logic_clr || process_real_finish) 
	begin
		process_doing <= 1'b0;
	end
	else if(process_start)
	begin
		process_doing <= 1'b1;
	end
	else 
	begin
		process_doing <= process_doing;
	end
end

assign process_valid = process_doing && process_data_valid;

sync_ff u_hw_process_valid 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),	
	.A							(process_valid),
	.Y							(process_valid_d)
);

//===============================================
// byte && half word counter
// The number of data bytes must be even.
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		byte_cnt <= 1'b0;
	end
	else if(pe_logic_clr) 
	begin
		byte_cnt <= 1'b0;
	end
	else if(process_valid || process_finish_in_even)
	begin
		byte_cnt <= ~byte_cnt;
	end
//	else if(process_finish)
//	begin
//		byte_cnt <= 1'b0;
//	end
	else 
	begin
		byte_cnt <= byte_cnt;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		halfword_cnt <= 1'b1;
	end
	else if(pe_logic_clr) 
	begin
		halfword_cnt <= 1'b1;
	end
	else if(process_valid)
	begin
		halfword_cnt <= ~halfword_cnt;
	end
//	else if(process_finish)
//	begin
//		halfword_cnt <= 1'b0;
//	end
	else 
	begin
		halfword_cnt <= halfword_cnt;
	end
end

//===============================================
// checksum accumulation calculation
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		iterative_checksum <= 16'h0;
	end
	else if(pe_logic_clr) 
	begin
		iterative_checksum <= 16'h0;
	end
	else if(process_valid)
	begin
		if(byte_cnt)
		begin
			iterative_checksum[7:0] <= data_in;
			iterative_checksum[15:8] <= iterative_checksum[15:8];
		end
		else if(process_finish_in_even && ~process_real_finish)
		begin
			iterative_checksum[15:8] <= 8'h0;
			iterative_checksum[7:0] <= iterative_checksum[7:0];
		end
		else
		begin
			iterative_checksum[15:8] <= data_in;
			iterative_checksum[7:0] <= iterative_checksum[7:0];
		end
	end
	else 
	begin
		iterative_checksum <= iterative_checksum;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		hw_checksum <= 32'h0;
	end
	else if(pe_logic_clr) 
	begin
		hw_checksum <= 32'h0;
	end
	// Because byte number must be even, last data maybe zero inserted by hardware.
	else if((process_valid_d && ~byte_cnt))
	begin
		hw_checksum <= hw_checksum + {16'h0, iterative_checksum};
	end
	else 
	begin
		hw_checksum <= hw_checksum;
	end
end

//===============================================
// checksum carry calculation
//===============================================

reg				[31:0]			hw_checksum_d;
wire							iterative_cnt_threshold;
assign hw_checksum_out = hw_checksum_d; 
assign iterative_cnt_threshold = (iterative_cnt == 3'd5) ? 1'b1 : 1'b0;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		iterative_valid <= 1'b0;
	end
	else if(pe_logic_clr || iterative_cnt_threshold) 
	begin
		iterative_valid <= 1'b0;
	end
	else if(process_finish_2d)
	begin
		iterative_valid <= 1'b1;
	end
	else 
	begin
		iterative_valid <= iterative_valid;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		iterative_cnt <= 3'd0;
	end
	else if(pe_logic_clr) 
	begin
		iterative_cnt <= 3'd0;
	end
	else if(iterative_valid)
	begin
		iterative_cnt <= iterative_cnt + 1'b1;
	end
	else 
	begin
		iterative_cnt <= 3'd0;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		hw_checksum_d <= 32'h0;
	end
	else if(pe_logic_clr) 
	begin
		hw_checksum_d <= 32'h0;
	end
	// Because byte number must be even, last data maybe zero inserted by hardware.
	else if(iterative_valid)
	begin
		if(iterative_cnt == 3'd0)
		begin
			//pseudo header
			hw_checksum_d <= {16'h0, src_ip[15:0]} + {16'h0, src_ip[31:16]} + {16'h0, des_ip[15:0]} + {16'h0, des_ip[31:16]} + {24'h0, payload_type} + {16'h0, length};
		end
		else if(iterative_cnt == 3'd1)
		begin
			hw_checksum_d <= hw_checksum_d + {16'h0, hw_checksum[31:16]} + {16'h0, hw_checksum[15:0]};
		end
		else if(iterative_cnt == 3'd5)
		begin
			hw_checksum_d <= (hw_checksum_d == 32'h0) ? 16'hffff : (16'hffff - hw_checksum_d[15:0]);
		end
		else
		begin
			hw_checksum_d <= {16'h0, hw_checksum_d[31:16]} + {16'h0, hw_checksum_d[15:0]};
		end
	end
	else 
	begin
		hw_checksum_d <= hw_checksum_d;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		hw_checksum_done <= 1'b0;
	end
	else if(pe_logic_clr) 
	begin
		hw_checksum_done <= 1'b0;
	end
	else if(iterative_cnt_threshold)
	begin
		hw_checksum_done <= 1'b1;
	end
	else 
	begin
		hw_checksum_done <= hw_checksum_done;
	end
end

endmodule

