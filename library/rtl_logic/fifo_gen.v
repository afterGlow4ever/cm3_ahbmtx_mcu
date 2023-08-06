//===============================================
//
//	File: fifo_gen.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This lib is used to generate fifo including:
// 	Sync fifo;
// 	Async fifo.
// 	
//===============================================

//===============================================
// Sync fifo module 
//===============================================
module fifo_sync
#(
	parameter										ADDR_WIDTH, DATA_WIDTH
)
(
	input												clk,
	input												rstn,
	input												wr_en,
	input												rd_en,
	output reg									rd_empty,
	output reg									wr_full,
	input	[DATA_WIDTH-1:0]			data,

	output reg [DATA_WIDTH-1:0]	q
);

reg [ADDR_WIDTH-1:0]					wr_addr;
reg [ADDR_WIDTH-1:0]					rd_addr;
reg [ADDR_WIDTH:0]						fifo_cnt;
reg [DATA_WIDTH-1:0]					fifo [ 0:2**ADDR_WIDTH];
integer												i;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i < 2**ADDR_WIDTH;i=i+1)
			fifo[i] <= 0;
	else if(wr_en && !wr_full)
		fifo[wr_addr] <= data;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		q <= 0;
	else if(rd_en && !rd_empty)
		q <= fifo[rd_addr];
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		rd_addr <= 0;
	else if(!rd_empty && rd_en)
		rd_addr <= rd_addr + 1'b1;
	else
		rd_addr <= rd_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		wr_addr <= 0;
	else if(!wr_full && wr_en)
		wr_addr <= wr_addr + 1'b1;
	else
//		wr_addr <= 0;
		wr_addr <= wr_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_cnt <= 0;
	else 
	begin
		case({wr_en, rd_en})
			2'b00: fifo_cnt <= fifo_cnt;
			2'b01:
				if(fifo_cnt != 0)
					fifo_cnt <= fifo_cnt - 1;
			2'b10:
				if(fifo_cnt != 2**ADDR_WIDTH-1)
					fifo_cnt <= fifo_cnt + 1;
			2'b11: fifo_cnt <= fifo_cnt;
			default: fifo_cnt <= fifo_cnt;
		endcase
	end
end
					
always @(fifo_cnt or rstn)
begin
	if(!rstn)
		rd_empty = 1;
	else if(fifo_cnt == 0)
		rd_empty = 1;
	else	
		rd_empty = 0;
end

always @(fifo_cnt or rstn)
begin
	if(!rstn)
		wr_full = 0;
	else if(fifo_cnt == 2**ADDR_WIDTH)
		wr_full = 1;
	else	
		wr_full = 0;
end

endmodule

//===============================================
// Async fifo module
//===============================================
module fifo_async
#(
	parameter										ADDR_WIDTH, DATA_WIDTH
)
(
	input												wr_clk,
	input												rd_clk,
	input												rstn,

	input												wr_req,
	input												rd_req,
	output reg 									rd_empty,
	output reg									wr_full,

	input	[DATA_WIDTH-1:0]			data,
	output [DATA_WIDTH-1:0]	q
);

wire [ADDR_WIDTH-1:0]					wr_addr;
reg [ADDR_WIDTH:0]						wr_bin;
wire [ADDR_WIDTH:0]						wr_gray_next;
wire [ADDR_WIDTH:0]						wr_bin_next;
reg [ADDR_WIDTH:0]						wr_ptr;
reg [ADDR_WIDTH:0]						wr_rptr1;
reg [ADDR_WIDTH:0]						wr_rptr2;
wire [ADDR_WIDTH-1:0]					rd_addr;
reg [ADDR_WIDTH:0]						rd_bin;
wire [ADDR_WIDTH:0]						rd_gray_next;
wire [ADDR_WIDTH:0]						rd_bin_next;
reg [ADDR_WIDTH:0]						rd_ptr;
reg [ADDR_WIDTH:0]						rd_wptr1;
reg [ADDR_WIDTH:0]						rd_wptr2;

wire 													rd_empty_val;
wire													wr_full_val;

reg [DATA_WIDTH-1:0]					fifo [2**ADDR_WIDTH:0];
integer												i;

// Fifo
assign q = fifo[rd_addr];

always @(posedge wr_clk or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i < 2**ADDR_WIDTH-1;i=i+1)
			fifo[i] <= 0;
	else if(wr_req && !wr_full)
		fifo[wr_addr] <= data;
end

// Ptr sync from write to read
always @(posedge rd_clk or negedge rstn)
begin
	if(!rstn)
	begin
		rd_wptr2 <= 0;
		rd_wptr1 <= 0;
	end
	else
	begin
		rd_wptr2 <= rd_wptr1;
		rd_wptr1 <= wr_ptr;
	end
end

// Ptr sync from read to write
always @(posedge wr_clk or negedge rstn)
begin
	if(!rstn)
	begin
		wr_rptr2 <= 0;
		wr_rptr1 <= 0;
	end
	else
	begin
		wr_rptr2 <= wr_rptr1;
		wr_rptr1 <= rd_ptr;
	end
end

// Read address generation
assign rd_addr = rd_bin[ADDR_WIDTH-1:0];
assign rd_bin_next = rd_bin + (rd_req & !rd_empty);

gray_code_gen
#(
	1, ADDR_WIDTH		
)gray_code_gen_inst0
(
	.bin_code							(rd_bin_next),
	.gray_code						(),
	.q										(rd_gray_next)
);

always @(posedge rd_clk or negedge rstn)
begin
	if(!rstn)
	begin
		rd_bin <= 0;
		rd_ptr <= 0;
	end
	else
	begin
		rd_bin <= rd_bin_next;
		rd_ptr <= rd_gray_next;
	end
end

// Write address generation
assign wr_addr = wr_bin[ADDR_WIDTH-1:0];
assign wr_bin_next = wr_bin + (wr_req & !wr_full);

gray_code_gen
#(
	1, ADDR_WIDTH		
)gray_code_gen_inst1
(
	.bin_code							(wr_bin_next),
	.gray_code						(),
	.q										(wr_gray_next)
);

always @(posedge wr_clk or negedge rstn)
begin
	if(!rstn)
	begin
		wr_bin <= 0;
		wr_ptr <= 0;
	end
	else
	begin
		wr_bin <= wr_bin_next;
		wr_ptr <= wr_gray_next;
	end
end

// Read empty generation
assign rd_empty_val = (rd_wptr2 == rd_gray_next);

always @(posedge rd_clk or negedge rstn)
begin
	if(!rstn)
		rd_empty <= 1;
	else
		rd_empty <= rd_empty_val;
end

// Write full generation
assign wr_full_val = ({~wr_rptr2[ADDR_WIDTH:ADDR_WIDTH-1], wr_rptr2[ADDR_WIDTH-2:0]} == rd_gray_next);

always @(posedge wr_clk or negedge rstn)
begin
	if(!rstn)
		wr_full <= 0;
	else
		wr_full <= wr_full_val;
end

endmodule

