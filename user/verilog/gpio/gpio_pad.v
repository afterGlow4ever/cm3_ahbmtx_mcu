//===============================================
//
//	File: gpio_pad.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01082024
//	Version: v1.0
//
// 	This is pad ring for gpio.
//
//===============================================

module gpio_pad 
(
	// port
	inout	[15:0]				gpio,

	// config
	input  	[15:0]				r_type,  
	input  	[31:0]				r_pupd,  
	input  	[31:0]				r_speed,  
	
	// status
	input  	[15:0]				gpio_out,  
	input  	[15:0]				gpio_dir,
	output 	[15:0]				gpio_in
);

//===============================================
// gpio pad ring
//===============================================

genvar										i;

generate
	for(i = 0; i < 16; i = i + 1)
	begin: GPIO_PAD
		pad u_pad
		(
			.r_type							(r_type[i]),
			.r_speed						(r_speed[2*i+1:2*i]),
			.r_pupd							(r_pupd[2*i+1:2*i]),	
			.gpio_out						(gpio_out[i]),
			.gpio_dir						(gpio_dir[i]),
			.gpio_in						(gpio_in[i]),	
			.gpio							(gpio[i])	
		);
	end
endgenerate

endmodule

