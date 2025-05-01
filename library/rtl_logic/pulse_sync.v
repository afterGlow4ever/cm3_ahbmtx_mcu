//===============================================
//
//	File: pulse_sync.v
//	Author: afterGlow,4ever
//	Date: 05192024
//	Version: v1.0
//
// 	This lib is used to synchrounize any async
// 	singal with pulse including:
// 	positive step;
// 	negative step;
// 	posedge;
// 	negedge;
//
//	However, des and src freq should be cautions.
//
//===============================================

//===============================================
// Positive step signal sync by pulse
//===============================================

module pos_step_sync2pulse
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					src_detect;
wire			[WIDTH-1:0]					des_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

posedge_detect 
#(
	.WIDTH						(WIDTH)
)
u_src_detect 
(
	.clk						(src_clk),
	.rstn						(src_rstn),
	.A							(src_A),
	.Y							(src_detect)
);

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_detect[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

edge_detect
#(
	.WIDTH						(WIDTH)
)
u_des_detect 
(
	.clk						(des_clk),
	.rstn						(des_rstn),
	.A							(des_step),
	.Y							(des_detect)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_detect),
	.Y							(des_Y)
);

endmodule

module pos_step_sync2step
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					src_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

posedge_detect 
#(
	.WIDTH						(WIDTH)
)
u_src_detect 
(
	.clk						(src_clk),
	.rstn						(src_rstn),
	.A							(src_A),
	.Y							(src_detect)
);

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_detect[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_step),
	.Y							(des_Y)
);

endmodule

//===============================================
// Negative step signal sync by pulse
//===============================================

module neg_step_sync2pulse
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 1
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					src_detect;
wire			[WIDTH-1:0]					des_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

negedge_detect 
#(
	.WIDTH						(WIDTH)
)
u_src_detect 
(
	.clk						(src_clk),
	.rstn						(src_rstn),
	.A							(src_A),
	.Y							(src_detect)
);

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_detect[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

edge_detect
#(
	.WIDTH						(WIDTH)
)
u_des_detect 
(
	.clk						(des_clk),
	.rstn						(des_rstn),
	.A							(des_step),
	.Y							(des_detect)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_detect),
	.Y							(des_Y)
);

endmodule

module neg_step_sync2step
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 1
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					src_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

negedge_detect 
#(
	.WIDTH						(WIDTH)
)
u_src_detect 
(
	.clk						(src_clk),
	.rstn						(src_rstn),
	.A							(src_A),
	.Y							(src_detect)
);

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_detect[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_step),
	.Y							(des_Y)
);

endmodule

//===============================================
// Posedge signal sync by pulse
//===============================================

module posedge_pulse_sync
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 0
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					des_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_A[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

edge_detect
#(
	.WIDTH						(WIDTH)
)
u_des_detect 
(
	.clk						(des_clk),
	.rstn						(des_rstn),
	.A							(des_step),
	.Y							(des_detect)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_detect),
	.Y							(des_Y)
);

endmodule

//===============================================
// Negedge signal sync by pulse
//===============================================

module negedge_pulse_sync
#(
	parameter								WIDTH = 1,
	parameter								DEFAULT_VAL = 1
)
(
	input									src_clk,
	input									src_rstn,
	input									des_clk,
	input									des_rstn,

	input 		[WIDTH-1:0]					src_A,
	output  	[WIDTH-1:0]					des_Y
);

wire			[WIDTH-1:0]					des_detect;
reg				[WIDTH-1:0]					src_step;
wire			[WIDTH-1:0]					des_step;

genvar										i;

generate
	for(i = 0; i < WIDTH; i = i + 1)
	begin:input_detection
		always @(posedge src_clk or negedge src_rstn)
		begin
			if(!src_rstn)
				src_step[i] <= DEFAULT_VAL;
			else if(src_A[i])
				src_step[i] <= ~src_step[i];
			else
				src_step[i] <= src_step[i];
		end
	end
endgenerate

sync_ff_2d
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_src_sync
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(src_step),
	.Y							(des_step)
);

edge_detect
#(
	.WIDTH						(WIDTH)
)
u_des_detect 
(
	.clk						(des_clk),
	.rstn						(des_rstn),
	.A							(des_step),
	.Y							(des_detect)
);

sync_ff
#(
	.WIDTH						(WIDTH),
	.DEFAULT_VAL				(DEFAULT_VAL)
)
u_des_1d
(
	.clk						(des_clk),
	.rstn						(des_rstn),	
	.A							(des_detect),
	.Y							(des_Y)
);

endmodule

