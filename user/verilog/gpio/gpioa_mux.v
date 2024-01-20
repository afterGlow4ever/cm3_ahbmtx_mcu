//===============================================
//
//	File: gpioa_mux.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01102024
//	Version: v1.0
//
// 	This is GPIOA alternate function mux.
//===============================================

module gpioa_mux 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// normal gpio
	input	[15:0]				gpio_out,
	input	[15:0]				gpio_dir,
	output	[15:0]				gpio_in,

	// config
	input  		[31:0]			r_mode,  
	input  		[31:0]			r_af,  
	
	// alternate function
	// No.0
	input						uart1_tx,	
	input						uart1_tx_oen,	
	// No.1
	output						uart1_rx,	
	input						uart1_rx_oen,	

	// status
	output  	[15:0]			gpioa_out,  
	output  	[15:0]			gpioa_dir,
	input 		[15:0]			gpioa_in
);

//===============================================
// gpio direction control determine
// 1: hardware control
// 0: software control
// gpio alternate enable control
// 1: alternate mode
// 0: gpio mode
//===============================================

reg				[15:0]			hw_dir;

genvar								i;

generate
	for(i = 0; i < 16; i = i + 1)
	begin: GPIO_DIR
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				hw_dir[i] <= 1'b0;
			else if(r_mode[2*i+1:2*i] == 2'h2)
				hw_dir[i] <= 1'b1;
			else
				hw_dir[i] <= 1'b0;
		end
	end
endgenerate

//===============================================
// gpio alternate select
//===============================================

reg				[31:0]			hw_af;

genvar								j;

generate
	for(j = 0; j < 16; j = j + 1)
	begin: GPIO_AF
		always @(posedge module_clk or negedge module_rstn)
		begin
			if(!module_rstn)
				hw_af[2*j+1:2*j] <= 2'h0;
			else
				hw_af[2*j+1:2*j] <= r_af[2*j+1:2*j];
		end
	end
endgenerate

////===============================================
//// gpio direction control determine
//// 1: i2c open drain
//// 0: general push pull
////===============================================
//
//reg				[15:0]			hw_od;
//
//genvar								j;
//
//generate
//	for(j = 0; j < 16; j = j + 1)
//	begin: GPIO_TYPE
//		always @(posedge module_clk or negedge module_rstn)
//		begin
//			if(!module_rstn)
//				hw_od[j] <= 1'b0;
//			else if(r_type[j] == 1'b1)
//				hw_od[j] <= 1'b1;
//			else
//				hw_od[j] <= 1'b0;
//		end
//	end
//endgenerate

//===============================================
// GPIOA0 mux
// 0: uart1 tx
//===============================================

assign gpioa_out[0] = (hw_dir[0] == 1'b1) ? ((hw_af[1:0] == 2'h0) ? uart1_tx :
											 (hw_af[1:0] == 2'h1) ? 1'bz :
											 (hw_af[1:0] == 2'h2) ? 1'bz : 1'bz)
										  	: gpio_out[0];

assign gpioa_dir[0] = (hw_dir[0] == 1'b1) ? ((hw_af[1:0] == 2'h0) ? uart1_tx_oen :
											 (hw_af[1:0] == 2'h1) ? 1'b0 :
											 (hw_af[1:0] == 2'h2) ? 1'b0 : 1'b0)
										  	: gpio_dir[0];

assign gpio_in[0] = (hw_dir[0] == 1'b1) ? 1'b0 : gpioa_in[0];

//===============================================
// GPIOA1 mux
// 0: uart1 rx
//===============================================

assign gpioa_out[1] = (hw_dir[1] == 1'b1) ? ((hw_af[3:2] == 2'h0) ? 1'bz :
											 (hw_af[3:2] == 2'h1) ? 1'bz :
											 (hw_af[3:2] == 2'h2) ? 1'bz : 1'bz)
											: gpio_out[1];

assign gpioa_dir[1] = (hw_dir[1] == 1'b1) ? ((hw_af[3:2] == 2'h0) ? uart1_rx_oen :
										 	 (hw_af[3:2] == 2'h1) ? 1'b0 :
										 	 (hw_af[3:2] == 2'h2) ? 1'b0 : 1'b0)
										 	: gpio_dir[1];

assign uart1_rx = (hw_af[3:2] == 2'h0) ? gpio_in[1] : 1'b1;

assign gpio_in[1] = (hw_dir[1] == 1'b1) ? 1'b0 : gpioa_in[1];

//===============================================
// others not used 
//===============================================

genvar								k;

generate
	for(k = 2; k < 16; k = k + 1)
	begin: GPIO_MUX
		assign gpioa_out[k] = (hw_dir[k] == 1'b1) ? 1'b0 : gpio_out[k];
		assign gpioa_dir[k] = (hw_dir[k] == 1'b1) ? 1'b0 : gpio_dir[k];
		assign gpio_in[k] = (hw_dir[k] == 1'b1) ? 1'b0 : gpioa_in[k];
	end
endgenerate

endmodule

