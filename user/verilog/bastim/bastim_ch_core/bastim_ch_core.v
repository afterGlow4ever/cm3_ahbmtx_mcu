//===============================================
//
//	File: bastim_ch_core.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01212024
//	Version: v1.0
//
// 	This is channel core for basic timer.
//	This core is including:
//	4 channels for basic timer.
//
//===============================================

module bastim_ch_core
(
	input  						ch_clk,  
	input  						ch_rstn,

	// control
	input		[ 3:0]			ch_auto_reload,
	input		[ 3:0]			ch_tim_enable,

	//configs
	input 		[63:0]			r_psc,
	input 		[63:0]			r_arr,
	input 		[63:0]			r_startcnt,

	// interrupt status
	output		[ 3:0]			int_status_ch_reload
);

//===============================================
// basic timer channels
//===============================================

genvar									i;

generate
	for(i = 0; i < 4; i = i + 1)
	begin: BASTIM_CH
		bastim_ch u_bastim_ch 
		(
			.ch_clk						(ch_clk),  
			.ch_rstn					(ch_rstn),
		                                                
			.ch_auto_reload				(ch_auto_reload[i]),
			.ch_tim_enable				(ch_tim_enable[i]),
		
			.r_psc						(r_psc[15+i*16:i*16]),
			.r_arr						(r_arr[15+i*16:i*16]),
			.r_startcnt					(r_startcnt[15+i*16:i*16]),
		
			.int_status_ch_reload		(int_status_ch_reload[i])
		);
	end
endgenerate

endmodule

