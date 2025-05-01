//===============================================
//
//	File: pwm_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03302025
//	Version: v1.0
//
// 	This model is simulate pwm generator.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module pwm_model
#(
	parameter					CLK_PERIOD = 500,
	parameter					IDLE_LEVEL = 0,
	parameter					POLARITY = 1
//	parameter					HALF = 64,
//	parameter					PERIOD = 128
)
(
	input		[15:0]			pwm_period_number,
	input		[15:0]			pwm_half,
	input		[15:0]			pwm_period,
	input						pwm_enable,
	output 						pwm_output
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
// pwm generator enable
//===============================================

wire							pwm_enable_r;
reg								pwm_running;
reg			[15:0]				pwm_reload_finish;

posedge_detect u_pwm_model_enable
(
	.clk						(clk),
	.rstn						(rstn),
	.A							(pwm_enable),
	.Y							(pwm_enable_r)
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		pwm_running <= 1'b0;
	else if(pwm_enable_r)
		pwm_running <= 1'b1;
	else if(pwm_reload_finish)
		pwm_running <= 1'b0;
	else
		pwm_running <= pwm_running;
end

//===============================================
// pwm generator
//===============================================

reg			[15:0]				pwm_counter;
wire							pwm_counter_reload;
reg			[15:0]				pwm_reload_counter;
assign pwm_counter_reload = pwm_counter == pwm_period;
assign pwm_reload_finish = (pwm_period_number == 16'h0) ? 1'b0 : (pwm_reload_counter == pwm_period_number);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		pwm_reload_counter <= 16'h0;
	end
	else if(pwm_running)
	begin
		if(pwm_counter_reload)
		begin
			pwm_reload_counter <= pwm_reload_counter + 1'b1;
		end
		else
		begin
			pwm_reload_counter <= pwm_reload_counter;
		end
	end
	else
	begin
		pwm_reload_counter <= 16'h0;
	end
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		pwm_counter <= 16'h0;
	end
	else if(pwm_running)
	begin
		if(pwm_counter_reload)
		begin
			pwm_counter <= 16'h0;
		end
		else
		begin
			pwm_counter <= pwm_counter + 1'b1;
		end
	end
	else
	begin
		pwm_counter <= 16'h0;
	end
end

assign pwm_output = pwm_running ? ((pwm_counter <= pwm_half) ? POLARITY : ~POLARITY) : IDLE_LEVEL;

//always @(posedge clk or negedge rstn)
//begin
//	if(!rstn)
//	begin
//		pwm_output <= IDLE_LEVEL;
//	end
//	else if(pwm_running)
//	begin
//		if(pwm_counter < pwm_half)
//		begin
//			pwm_output <= POLARITY;
//		end
//		else
//		begin
//			pwm_output <= ~POLARITY;
//		end
//	end
//	else
//	begin
//		pwm_output <= IDLE_LEVEL;
//	end
//end

`ifdef PWM_MONITOR
reg								monitor_flag;

initial
begin
	monitor_flag = 1'b0;
	forever
	begin
		#100
		if(~monitor_flag && pwm_running && (pwm_counter == 16'h0))
		begin
			monitor_flag = 1'b1;
			$display($time, "[PWM MONITOR] pwm period %4h starts, period %4h with %4h half.", pwm_reload_counter, pwm_period, pwm_half);
		end
		if(~pwm_running || (pwm_counter != 16'h0))
		begin
			monitor_flag = 1'b0;
		end
	end
end
`endif

endmodule


