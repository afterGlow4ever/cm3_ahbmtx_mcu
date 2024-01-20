//===============================================
//
//	File: pad.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01122024
//	Version: v1.0
//
// 	This is digital pad for gpio.
//	In normal or fpga, using this.
//	In asic, using analog pad.(reserved in future)
//
//	r_pupd and r_speed are only used in analog pad.
//
//===============================================

module pad 
(
	// config
	input  						r_type,  
	input  	[1:0]				r_speed,  
	input  	[1:0]				r_pupd,  
	
	// status
	input  						gpio_out,  
	input  						gpio_dir,
	output 						gpio_in,

	// port
	inout						gpio
);

//===============================================
// inout logic
// in open drain type, output only driving in low level
//===============================================

wire							od_out;

assign od_out = (gpio_out == 1'b1) ? 1'bz : 1'b0;
assign gpio_in = (gpio_dir == 1'b0) ? gpio : 1'b0;
assign gpio = (gpio_dir == 1'b1) ? ((r_type == 1'b1) ? od_out : gpio_out) : 1'bz;

endmodule

