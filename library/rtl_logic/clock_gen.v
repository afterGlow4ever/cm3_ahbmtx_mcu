//===============================================
//
//	File: clock_gen.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This lib is used to generate clock including:
// 	Clock shift 180 degrees;
// 	Clock even division;
// 	Clock odd division.
// 	
//===============================================

//===============================================
// Clock shift module
//===============================================
module clk_shift
(
	input							inclk,
	input							rstn,
	output						outclkn,
	output						locked
);

assign outclkn = (rstn == 1'b1) ? ~inclk : 1'b0;
assign locked = (rstn == 1'b1) ? 1'b1 : 1'b0;

endmodule

//===============================================
// Clock even division module
//===============================================
module clk_even_division
#(
	parameter					N
)
(
	input							inclk,
	input							rstn,
	output 						outclk,
	output						outclkn,
	output						locked
);

reg	[N/2-1:0]				clk_cnt;
reg									outclk1;
reg	[3:0]						clk_locked_cnt;

assign outclk = outclk1;
assign outclkn = ~outclk;
assign locked = (clk_locked_cnt == 4'b1010) ? 1'b1 : 1'b0;

always @(posedge inclk or negedge rstn)
begin
	if(!rstn)
	begin
		outclk1 <= 1'b0;
		clk_cnt <= 0;
	end
	else
		if(clk_cnt == N/2-1)
		begin
			outclk1 <= ~outclk1;
			clk_cnt <= 0;
		end
		else
			clk_cnt <= clk_cnt + 1;
end

always @(posedge outclk or negedge rstn)
begin
	if(!rstn)
		clk_locked_cnt <= 4'b0;
	else
		if(clk_cnt == N/2-1)
			if(clk_locked_cnt == 4'b1010)
				clk_locked_cnt <= clk_locked_cnt;
			else
				clk_locked_cnt <= clk_locked_cnt + 1'b1;
		else
			clk_locked_cnt <= clk_locked_cnt;
end

endmodule

//===============================================
// Clock odd division module
//===============================================
module clk_odd_division
#(
	parameter					N
)
(
	input							inclk,
	input							rstn,
	output						outclk,
	output						outclkn,
	output						locked
);

reg	[N/2:0]					clk1_cnt;
reg	[N/2:0]					clk2_cnt;
reg									outclk1;
reg									outclk2;
reg	[3:0]						clk_locked_cnt;

assign outclk = outclk1 | outclk2;
assign outclkn = ~outclk;
assign locked = (clk_locked_cnt == 4'b1010) ? 1'b1 : 1'b0;

always @(posedge inclk or negedge rstn)
begin
	if(!rstn)
	begin
		outclk1 <= 1'b0;
		clk1_cnt <= 0;
	end
	else
	begin
		if(outclk1 == 1'b0)
			if(clk1_cnt == N/2+1)
			begin
				outclk1 <= ~outclk1;
				clk1_cnt <= 1;
			end
			else
				clk1_cnt <= clk1_cnt + 1;
		else if(clk1_cnt == N/2)
		begin
			outclk1 <= ~outclk1;
			clk1_cnt <= 1;
		end
		else
			clk1_cnt <= clk1_cnt + 1;
	end		
end

always @(negedge inclk or negedge rstn)
begin
	if(!rstn)
	begin
		outclk2 <= 1'b0;
		clk2_cnt <= 0;
	end
	else
	begin
		if(outclk2 == 1'b0)
			if(clk2_cnt == N/2+1)
			begin
				outclk2 <= ~outclk2;
				clk2_cnt <= 1;
			end
			else
				clk2_cnt <= clk2_cnt + 1;
		else if(clk2_cnt == N/2)
		begin
			outclk2 <= ~outclk2;
			clk2_cnt <= 1;
		end
		else
			clk2_cnt <= clk2_cnt + 1;
	end		
end

always @(posedge outclk or negedge rstn)
begin
	if(!rstn)
		clk_locked_cnt <= 4'b0;
	else
		if(clk2_cnt == N/2+1)
			if(clk_locked_cnt == 4'b1010)
				clk_locked_cnt <= clk_locked_cnt;
			else
				clk_locked_cnt <= clk_locked_cnt + 1'b1;
		else
			clk_locked_cnt <= clk_locked_cnt;
end

endmodule





