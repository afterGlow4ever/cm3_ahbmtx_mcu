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
//	Date: 12072023 
//	Version: v1.1
//
// 	Both fifo can ouput the number of remaining data.
// 	
//===============================================

//===============================================
// Sync fifo module 
//===============================================

module fifo_sync
#(
	parameter							ADDR_WIDTH = 4,
	parameter							DATA_WIDTH = 8
)
(
	input								clk,
	input								rstn,
	input								wr_req,
	input								rd_req,
	output reg	[ADDR_WIDTH:0]			fifo_num,
	output 								rd_empty,
	output 								wr_full,
	input		[DATA_WIDTH-1:0]		data,

	output 		[DATA_WIDTH-1:0]		q
);

reg				[ADDR_WIDTH-1:0]		wr_addr;
reg				[ADDR_WIDTH-1:0]		rd_addr;
reg			 	[DATA_WIDTH-1:0]		fifo [ 0:2**ADDR_WIDTH];
integer									i;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		for(i = 0;i <= 2**ADDR_WIDTH;i=i+1)
			fifo[i] <= 0;
	else if(wr_req && !wr_full)
		fifo[wr_addr] <= data;
end

assign		q = fifo[rd_addr];

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		rd_addr <= 0;
	else if(!rd_empty && rd_req)
		rd_addr <= rd_addr + 1'b1;
	else
		rd_addr <= rd_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		wr_addr <= 0;
	else if(!wr_full && wr_req)
		wr_addr <= wr_addr + 1'b1;
	else
		wr_addr <= wr_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_num <= 0;
	else 
	begin
		case({wr_req, rd_req})
			2'b00: 
				fifo_num <= fifo_num;
			2'b01:
				if(fifo_num > 0)
					fifo_num <= fifo_num - 1'b1;
			2'b10:
				if(fifo_num < 2**ADDR_WIDTH)
					fifo_num <= fifo_num + 1'b1;
			2'b11: 
				fifo_num <= fifo_num;
			default: 
				fifo_num <= fifo_num;
		endcase
	end
end

// STARC05-1.3.1.3 
// Async reset should not be used in any combinational logic
assign rd_empty = (fifo_num == 0) ? 1'b1 : 1'b0;
assign wr_full = (fifo_num == 2**ADDR_WIDTH) ? 1'b1 : 1'b0;

//always @(*)
//begin
//	if(!rstn)
//		rd_empty = 1;
//	else if(fifo_num == 0)
//		rd_empty = 1;
//	else	
//		rd_empty = 0;
//end

//always @(*)
//begin
//	if(!rstn)
//		wr_full = 0;
//	else if(fifo_num == 2**ADDR_WIDTH)
//		wr_full = 1;
//	else	
//		wr_full = 0;
//end

endmodule

//===============================================
// Async fifo module
//===============================================

module fifo_async
#(
	parameter							ADDR_WIDTH = 4,
	parameter					 		DATA_WIDTH = 8
)
(
	input								wr_clk,
	input								rd_clk,
	input								wr_rstn,
	input								rd_rstn,

	input								wr_req,
	input								rd_req,
	output reg 							rd_empty,
	output reg							wr_full,
	output		[ADDR_WIDTH:0]			wr_fifo_num,
	output		[ADDR_WIDTH:0]			rd_fifo_num,

	input		[DATA_WIDTH-1:0]		data,
	output 		[DATA_WIDTH-1:0]		q
);

wire	 		[ADDR_WIDTH-1:0]		wr_addr;
reg 			[ADDR_WIDTH:0]			wr_bin;
wire 			[ADDR_WIDTH:0]			wr_gray_next;
wire 			[ADDR_WIDTH:0]			wr_bin_next;
reg			 	[ADDR_WIDTH:0]			wr_ptr;
reg 			[ADDR_WIDTH:0]			wr_rptr1;
reg 			[ADDR_WIDTH:0]			wr_rptr2;
wire 			[ADDR_WIDTH-1:0]		rd_addr;
reg 			[ADDR_WIDTH:0]			rd_bin;
wire 			[ADDR_WIDTH:0]			rd_gray_next;
wire 			[ADDR_WIDTH:0]			rd_bin_next;
reg 			[ADDR_WIDTH:0]			rd_ptr;
reg 			[ADDR_WIDTH:0]			rd_wptr1;
reg 			[ADDR_WIDTH:0]			rd_wptr2;

wire 									rd_empty_val;
wire									wr_full_val;

reg 			[DATA_WIDTH-1:0]		fifo [2**ADDR_WIDTH:0];
integer									i;

// Fifo
assign q = fifo[rd_addr];

//always @(posedge wr_clk or negedge rstn)
always @(posedge wr_clk or negedge wr_rstn)
begin
	if(!wr_rstn)
		for(i = 0;i <= 2**ADDR_WIDTH;i=i+1)
			fifo[i] <= 0;
//	else if(wr_req && !wr_full)
//		fifo[wr_addr] <= data;
	else if(wr_req && !wr_full)
		fifo[wr_addr] <= data;
end

// Ptr sync from write to read
always @(posedge rd_clk or negedge rd_rstn)
begin
	if(!rd_rstn)
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
always @(posedge wr_clk or negedge wr_rstn)
begin
	if(!wr_rstn)
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
assign rd_bin_next = rd_bin + (rd_req && !rd_empty);

bin_to_gray_gen
#(
	ADDR_WIDTH		
)
u_gray_code_gen_inst0
(
	.bin_code							(rd_bin_next),
	.gray_code							(rd_gray_next)
);

always @(posedge rd_clk or negedge rd_rstn)
begin
	if(!rd_rstn)
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
assign wr_bin_next = wr_bin + (wr_req && !wr_full);

bin_to_gray_gen
#(
	ADDR_WIDTH		
)
u_gray_code_gen_inst1
(
	.bin_code							(wr_bin_next),
	.gray_code							(wr_gray_next)
);

always @(posedge wr_clk or negedge wr_rstn)
begin
	if(!wr_rstn)
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

always @(posedge rd_clk or negedge rd_rstn)
begin
	if(!rd_rstn)
		rd_empty <= 1;
	else
		rd_empty <= rd_empty_val;
end

// Write full generation
assign wr_full_val = ({~wr_rptr2[ADDR_WIDTH:ADDR_WIDTH-1], wr_rptr2[ADDR_WIDTH-2:0]} == wr_gray_next);

always @(posedge wr_clk or negedge wr_rstn)
begin
	if(!wr_rstn)
		wr_full <= 0;
	else
		wr_full <= wr_full_val;
end


// fifo current data number
// just test, redesigne later




//assign fifo_num = (rd_bin <= wr_bin ) ? (wr_bin - rd_bin) : (2**ADDR_WIDTH - rd_bin + wr_bin);

//// using write end to caculate
//

// fifo current data number in tx end

wire			[ADDR_WIDTH:0]			wr_rptr2_bin;

gray_to_bin_gen
#(
	ADDR_WIDTH		
)
u_bin_code_gen_inst0
(
	.gray_code							(wr_rptr2),
	.bin_code							(wr_rptr2_bin)
);

assign wr_fifo_num = wr_bin - wr_rptr2_bin;

// fifo current data number in rx end

wire			[ADDR_WIDTH:0]			rd_wptr2_bin;

gray_to_bin_gen
#(
	ADDR_WIDTH		
)
u_bin_code_gen_inst1
(
	.gray_code							(rd_wptr2),
	.bin_code							(rd_wptr2_bin)
);

assign rd_fifo_num = rd_wptr2_bin - rd_bin;

endmodule

//===============================================
// Sync fifo module 
// Wide input to narrow output.
// Only pure divided.
// rd_addr width: wr_addr width + log(wr/rd) width
//===============================================

module fifo_sync_w2n
#(
	parameter							ADDR_WIDTH = 2,
	parameter							DATA_IN_WIDTH = 32,
	parameter							DATA_OUT_WIDTH = 8
)
(
	input								clk,
	input								rstn,
	input								wr_req,
	input								rd_req,
	output reg	[ADDR_WIDTH*($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):0]			fifo_num,
	output 								rd_empty,
	output 								wr_full,
	input		[DATA_IN_WIDTH-1:0]		data,

	output 		[DATA_OUT_WIDTH-1:0]	q
);

reg				[ADDR_WIDTH-1:0]		wr_addr;
reg				[ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))-1:0]		rd_addr;// for not power of 2
reg			 	[DATA_IN_WIDTH-1:0]		fifo [ 0:2**ADDR_WIDTH];
integer									i;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		for(i=0;i<=2**ADDR_WIDTH;i=i+1)
			fifo[i] <= 0;
	else if(wr_req && !wr_full)
	begin
		fifo[wr_addr] <= data;
	end
end

wire [ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):0] xaddr;
wire [ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):0] yaddr;

assign xaddr = rd_addr[(ADDR_WIDTH-1+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))):($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))];
assign yaddr = rd_addr[($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))-1:0]<<($clog2(DATA_OUT_WIDTH)); 
assign q = fifo[xaddr][yaddr+:(DATA_OUT_WIDTH)];
//assign		q = fifo[rd_addr[ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)]][((DATA_IN_WIDTH-1)-(rd_addr<<($clog2(DATA_OUT_WIDTH))))+:DATA_OUT_WIDTH];
//assign q = fifo[rd_addr[ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))]][rd_addr[($clog2(DATA_OUT_WIDTH)-1)+:DATA_OUT_WIDTH]];
//assign q = fifo[rd_addr[ADDR_WIDTH+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH)):ADDR_WIDTH]][rd_addr[($clog2(DATA_OUT_WIDTH)-1)]+:DATA_OUT_WIDTH];
//assign q = fifo[rd_addr[(2+2):2]][(rd_addr[1:0]<<3)+:8];
//assign q = fifo[rd_addr[4:2]][(rd_addr[3:0]<<3)+:8];
//assign q = fifo[rd_addr[(ADDR_WIDTH-1+($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))):($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))]][debug01+:(DATA_OUT_WIDTH)];

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		rd_addr <= 0;
	else if(!rd_empty && rd_req)
		rd_addr <= rd_addr + 1'b1;
	else
		rd_addr <= rd_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		wr_addr <= 0;
	else if(!wr_full && wr_req)
		wr_addr <= wr_addr + 1'b1;
	else
		wr_addr <= wr_addr;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_num <= 0;
	else 
	begin
		case({wr_req, rd_req})
			2'b00: 
				fifo_num <= fifo_num;
			2'b01:
				if(fifo_num > 0)
					fifo_num <= fifo_num - 1'b1;
			2'b10:
				if(fifo_num < 2**(ADDR_WIDTH*($clog2(DATA_IN_WIDTH/DATA_OUT_WIDTH))))
					fifo_num <= fifo_num + (DATA_IN_WIDTH/DATA_OUT_WIDTH);
			2'b11: 
				fifo_num <= fifo_num + ((DATA_IN_WIDTH/DATA_OUT_WIDTH)-1);
			default: 
				fifo_num <= fifo_num;
		endcase
	end
end

// STARC05-1.3.1.3 
// Async reset should not be used in any combinational logic
assign rd_empty = (fifo_num == 0) ? 1'b1 : 1'b0;
assign wr_full = (fifo_num > (2**ADDR_WIDTH-1)*(DATA_IN_WIDTH/DATA_OUT_WIDTH)) ? 1'b1 : 1'b0;


endmodule






