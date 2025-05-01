//===============================================
//
//	File: encoder_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03302025
//	Version: v1.0
//
// 	This model is simulate encoder.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module encoder_model
#(
	parameter					CLK_PERIOD = 500,
	parameter					IDLE_LEVEL = 0,
	parameter					POLARITY = 1
//	parameter					HALF = 64,
//	parameter					PERIOD = 128
)
(
	input		[15:0]			encoder_period_number,
	input		[15:0]			encoder_half,
	input		[15:0]			encoder_period,
	input						encoder_direction,
	input						encoder_direct_enable,
	input						encoder_quadrature_enable,
	output 						encoder_direct_output,
	output 						encoder_quadrature_output
);

//===============================================
// internal clock generator
//===============================================

reg								clk;
reg								rstn;

initial
begin
	clk = 1'b0;
	#100
	forever #(CLK_PERIOD/2) clk = ~clk;
end

initial
begin
	rstn = 1'b0;
	#100
	rstn = 1'b1;
end

//===============================================
// encoder generator enable
//===============================================

wire							encoder_direct_enable_r;
reg								encoder_running;
reg			[15:0]				encoder_reload_finish;

posedge_detect u_encoder_model_enable
(
	.clk						(clk),
	.rstn						(rstn),
	.A							(encoder_direct_enable),
	.Y							(encoder_direct_enable_r)
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		encoder_running <= 1'b0;
	else if(encoder_direct_enable_r)
		encoder_running <= 1'b1;
	else if(encoder_reload_finish)
		encoder_running <= 1'b0;
	else
		encoder_running <= encoder_running;
end

//===============================================
// encoder generator
//===============================================

reg			[15:0]				encoder_counter;
wire							encoder_counter_reload;
reg			[15:0]				encoder_reload_counter;
assign encoder_counter_reload = encoder_counter == encoder_period;
assign encoder_reload_finish = (encoder_period_number == 16'h0) ? 1'b0 : (encoder_reload_counter == encoder_period_number);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		encoder_reload_counter <= 16'h0;
	end
	else if(encoder_running)
	begin
		if(encoder_counter_reload)
		begin
			encoder_reload_counter <= encoder_reload_counter + 1'b1;
		end
		else
		begin
			encoder_reload_counter <= encoder_reload_counter;
		end
	end
	else
	begin
		encoder_reload_counter <= 16'h0;
	end
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		encoder_counter <= 16'h0;
	end
	else if(encoder_running)
	begin
		if(encoder_counter_reload)
		begin
			encoder_counter <= 16'h0;
		end
		else
		begin
			encoder_counter <= encoder_counter + 1'b1;
		end
	end
	else
	begin
		encoder_counter <= 16'h0;
	end
end

//===============================================
// encoder direction
// 1: reverse q is earlier than d
// 0: forward d is earlier than q
//===============================================

wire	 						encoder_direct_output_temp;
wire	 						encoder_quadrature_output_temp;

assign encoder_direct_output_temp = encoder_running ? ((encoder_counter <= encoder_half) ? POLARITY : ~POLARITY) : IDLE_LEVEL;
assign #((encoder_half*CLK_PERIOD)/2) encoder_quadrature_output_temp = encoder_quadrature_enable ? encoder_direct_output_temp : IDLE_LEVEL;

assign encoder_direct_output = encoder_direction ? encoder_quadrature_output_temp : encoder_direct_output_temp;
assign encoder_quadrature_output = encoder_direction ? encoder_direct_output_temp : encoder_quadrature_output_temp;

//===============================================
// encoder monitor
//===============================================

`ifdef ENCODER_MONITOR
reg								monitor_flag;

initial
begin
	monitor_flag = 1'b0;
	forever
	begin
		#100
		if(~monitor_flag && encoder_running && (encoder_counter == 16'h0))
		begin
			monitor_flag = 1'b1;
			$display($time, "[ENCODER MONITOR] encoder period %4h starts, period %4h.", encoder_reload_counter, encoder_period);
		end
		if(~encoder_running || (encoder_counter != 16'h0))
		begin
			monitor_flag = 1'b0;
		end
	end
end
`endif

endmodule


