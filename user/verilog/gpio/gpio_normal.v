//===============================================
//
//	File: gpio_normal.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01102024
//	Version: v1.0
//
// 	This is GPIO normal input/output control.
//
//===============================================

module gpio_normal 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// config
	input  		[15:0]			r_od,  
	input  		[15:0]			r_toggle,  
	input  		[31:0]			r_mode,  
	input  		[31:0]			r_inttrig,  
	output reg	[15:0]			r_id,  

	// normal gpio
	output reg 	[15:0]			gpio_out,
	output reg 	[15:0]			gpio_dir,
	input		[15:0]			gpio_in,

	//interrupt
	output reg 	[15:0]			gpio_int
);

// high is output
// low is input
// default is output mode
//===============================================

genvar								i;

generate
	for(i = 0; i < 16; i = i + 1)
	begin: GPIO_DIR
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				gpio_dir[i] <= 1'b1;
			else if(r_mode[2*i+1:2*i] == 2'h1)
				gpio_dir[i] <= 1'b1;
			else if(r_mode[2*i+1:2*i] == 2'h0)
				gpio_dir[i] <= 1'b0;
			else
				gpio_dir[i] <= gpio_dir[i];
		end
	end
endgenerate

//===============================================
// gpio toggle logic
// any changes in r_toggle will cause a toggle
//===============================================

wire			[15:0]				gpio_toggle_detect;

edge_detect
#(
	.WIDTH							(16)
)
u_toggle_detect
(
	.clk							(module_clk),
	.rstn							(module_rstn),

	.A								(r_toggle),
	.Y								(gpio_toggle_detect)
);

//===============================================
// output control
// only valid in not alternate function
// default is output low
// if toggling gpio output to high and r_od is low, 
// then using r_od to low should write 1 and 0 or vice versa.
//===============================================

wire			[15:0]				gpio_outhigh_detect;
wire			[15:0]				gpio_outlow_detect;

posedge_detect
#(
	.WIDTH							(16)
)
u_outhigh_detect
(
	.clk							(module_clk),
	.rstn							(module_rstn),

	.A								(r_od),
	.Y								(gpio_outhigh_detect)
);

negedge_detect
#(
	.WIDTH							(16)
)
u_outlow_detect
(
	.clk							(module_clk),
	.rstn							(module_rstn),

	.A								(r_od),
	.Y								(gpio_outlow_detect)
);

genvar								j;

generate
	for(j = 0; j < 16; j = j + 1)
	begin: GPIO_OUT
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				gpio_out[j] <= 1'b0;
			else if(gpio_toggle_detect[j] == 1'b1)
				gpio_out[j] <= ~gpio_out[j];
			else if(r_mode[2*j+1:2*j] == 2'h1)
				if(gpio_outhigh_detect[j] == 1'b1)
					gpio_out[j] <= 1'b1;
				else if(gpio_outlow_detect[j] == 1'b1)
					gpio_out[j] <= 1'b0;
				else
					gpio_out[j] <= gpio_out[j];
			else
				gpio_out[j] <= gpio_out[j];
		end
	end
endgenerate

//===============================================
// input control
// only valid in not alternate function
//===============================================

//wire			[15:0]				gpio_in_afsync;
//
//// using 2d is
//// 1d 70% ~80%
//// 2d 99%%
//sync_ff_2d
//#(
//	.WIDTH							(16),
//	.DEFAULT_VAL					(0)
//)
//u_sync_ff_2d_inst0
//(
//	.clk							(module_clk),
//	.rstn							(module_rstn),	
//
//	.A								(gpio_in),
//	.Y								(gpio_in_afsync)
//);

genvar								k;

generate
	for(k = 0; k < 16; k = k + 1)
	begin: GPIO_IN
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				r_id[k] <= 1'b0;
			else
				r_id[k] <= gpio_in[k];
		end
	end
endgenerate

//===============================================
// input interrupt detect control
// only valid in input gpio mode
//===============================================

wire			[15:0]				gpio_inhigh_detect;
wire			[15:0]				gpio_inlow_detect;

posedge_detect
#(
	.WIDTH							(16)
)
u_inhigh_detect
(
	.clk							(module_clk),
	.rstn							(module_rstn),

	.A								(gpio_in),
	.Y								(gpio_inhigh_detect)
);

negedge_detect
#(
	.WIDTH							(16)
)
u_inlow_detect
(
	.clk							(module_clk),
	.rstn							(module_rstn),

	.A								(gpio_in),
	.Y								(gpio_inlow_detect)
);

genvar								m;

generate
	for(m = 0; m < 16; m = m + 1)
	begin: GPIO_INT
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				gpio_int[m] <= 1'b0;
			else if(r_mode[2*m+1:2*m] == 2'h0)
				if(r_inttrig[2*m+1:2*m] == 2'h0)
					gpio_int[m] <= gpio_inhigh_detect[m];
				else if(r_inttrig[2*m+1:2*m] == 2'h1)
					gpio_int[m] <= gpio_inlow_detect[m];
				else if(r_inttrig[2*m+1:2*m] == 2'h2)
					gpio_int[m] <= gpio_in[m];
				else if(r_inttrig[2*m+1:2*m] == 2'h3)
					gpio_int[m] <= ~gpio_in[m];
				else
					gpio_int[m] <= gpio_int[m];
			else
				gpio_int[m] <= gpio_int[m];
		end
	end
endgenerate

endmodule

