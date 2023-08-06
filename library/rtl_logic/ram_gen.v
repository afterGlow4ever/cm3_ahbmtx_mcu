//===============================================
//
//	File: ram_gen.v
//	Author: afterGlow,4ever
//	Date: 05222022
//	Version: v1.0
//
// 	This lib is used to generate RAM including:
// 	1 port RAM;
// 	Simple 2 port RAM(tp);
// 	True 2 port RAM(dp).
// 	
//===============================================

//===============================================
// RAM 1 port
//===============================================
module ram_1port
#(
	parameter										ADDR_WIDTH, DATA_WIDTH
)
(
	input												clk,
	input												rstn,
	input												wen,
	input												cen,
	input [ADDR_WIDTH-1:0]			addr,
	input	[DATA_WIDTH-1:0]			data,

	output reg [DATA_WIDTH-1:0]	q
);

reg [DATA_WIDTH-1:0]					ram [2**ADDR_WIDTH-1:0];
integer												i;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i < 2**ADDR_WIDTH-1;i=i+1)
			ram[i] <= 0;
	else if(wen && cen)
		ram[addr] <= data;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		q <= 0;
	else if((wen == 1'b0) && cen)
		q <= ram[addr];
	else
		q <= 'bx;
end

endmodule

//===============================================
// RAM simple 2 port half duplex
//===============================================
module ram_2port_tp
#(
	parameter										ADDR_WIDTH, DATA_WIDTH
)
(
	input												wr_clk,
	input												rd_clk,
	input												rstn,
	input												wren,
	input												rden,
	input [ADDR_WIDTH-1:0]			wr_addr,
	input [ADDR_WIDTH-1:0]			rd_addr,
	input	[DATA_WIDTH-1:0]			data,

	output reg [DATA_WIDTH-1:0]	q
);

reg [DATA_WIDTH-1:0]					ram [2**ADDR_WIDTH-1:0];
integer												i;

always @(posedge wr_clk or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i < 2**ADDR_WIDTH-1;i=i+1)
			ram[i] <= 0;
	else if(wren)
		ram[wr_addr] <= data;
end

always @(posedge rd_clk or negedge rstn)
begin
	if(!rstn)
		q <= 0;
	else if(rden)
		q <= ram[rd_addr];
	else
		q <= 'bx;
end

endmodule

//===============================================
// RAM true 2 port for full duplex
//===============================================
module ram_2port_dp
#(
	parameter										ADDR_WIDTH, DATA_WIDTH
)
(
	input												clk_a,
	input												clk_b,
	input												rstn,
	input												wren_a,
	input												rden_a,
	input												wren_b,
	input												rden_b,
	input [ADDR_WIDTH-1:0]			addr_a,
	input [ADDR_WIDTH-1:0]			addr_b,
	input	[DATA_WIDTH-1:0]			data_a,
	input	[DATA_WIDTH-1:0]			data_b,

	output reg [DATA_WIDTH-1:0]	q_a,
	output reg [DATA_WIDTH-1:0]	q_b
);

reg [DATA_WIDTH-1:0]					ram [2**ADDR_WIDTH-1:0];
integer												i;

always @(posedge clk_a or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i < 2**ADDR_WIDTH-1;i=i+1)
			ram[i] <= 0;
	else if(wren_a)
		ram[addr_a] <= data_a;
	else if(wren_b)
		ram[addr_b] <= data_b;
end

always @(posedge clk_a or negedge rstn)
begin
	if(!rstn)
		q_a <= 0;
	else if(rden_a)
		q_a <= ram[addr_a];
	else
		q_a <= 'bx;
end

always @(posedge clk_b or negedge rstn)
begin
	if(!rstn)
		q_b <= 0;
	else if(rden_b)
		q_b <= ram[addr_b];
	else
		q_b <= 'bx;
end

endmodule

