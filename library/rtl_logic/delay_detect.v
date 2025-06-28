//===============================================
//
//	File: edge_delay_detect.v
//	Author: afterGlow,4ever
//	Date: 03222025
//	Version: v1.0
//
// 	This lib is used to delay detect level edge including:
// 	Edge delay detect -> trigger
// 	Edge delay hold detect -> hold
// 	
//===============================================

//===============================================
// Edge delay detect module
//===============================================

module edge_delay_detect
#(
	parameter						WIDTH = 4
)
(
	input							clk,
	input							rstn,

	input 		[WIDTH-1:0]			delay_value,
	input							input_value,
	input							expected_value,
	input							force_detected,
	output  						input_valid,
	output  						input_detected
);

reg				[WIDTH-1:0]			detection_cnt;

assign input_detected = (detection_cnt == delay_value);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		detection_cnt <= {WIDTH{1'b0}};
	end
	else if(input_detected)
	begin
		detection_cnt <= {WIDTH{1'b0}};
	end
	else if((input_value == expected_value) || force_detected)
	begin
		detection_cnt <= detection_cnt + 1'b1;
	end
	else
	begin
		detection_cnt <= {WIDTH{1'b0}};
	end
end

endmodule

//===============================================
// Edge delay hold detect module
// First edge using debounce logic.
// However, second edge should delay the same
// time to compensate delay in first edge, which
// makes the length of signal detected remaining.
//===============================================

module edge_delay_hold_detect
#(
	parameter						WIDTH = 4
)
(
	input							clk,
	input							rstn,

	input							enable,
	input 		[WIDTH-1:0]			delay_value,
	input							input_value,
	input							expected_value,
	output  						input_valid,
	output  						input_detected
);

reg				[WIDTH-1:0]			detection_cnt;
reg				[WIDTH-1:0]			loss_cnt;
wire								input_valid_delay;
wire								input_valid_nodelay;
assign input_valid = (|delay_value ? input_valid_delay : input_valid_nodelay) && enable;
assign input_valid_delay = (detection_cnt == delay_value) || (|loss_cnt);
assign input_valid_nodelay = (input_value == expected_value);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		detection_cnt <= {WIDTH{1'b0}};
	end
	else if((input_value != expected_value) || ~enable)
	begin
		detection_cnt <= {WIDTH{1'b0}};
	end
	else if(~input_valid)
	begin
		detection_cnt <= detection_cnt + 1'b1;
	end
	else
	begin
		detection_cnt <= detection_cnt;
	end
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		loss_cnt <= {WIDTH{1'b0}};
	end
	else if(~enable)
	begin
		loss_cnt <= {WIDTH{1'b0}};
	end
	else if(|loss_cnt)
	begin
		if(input_value == expected_value)
		begin
			loss_cnt <= delay_value;
		end
		else
		begin
			loss_cnt <= loss_cnt - 1'b1;
		end
	end
	else if(detection_cnt == delay_value)
	begin
		loss_cnt <= delay_value;
	end
	else
	begin
		loss_cnt <= {WIDTH{1'b0}};
	end
end

posedge_detect u_posedge_detect_inst0 
(
	.clk						(clk),
	.rstn						(rstn),
	.A							(input_valid),
	.Y							(input_detected)
);

endmodule


