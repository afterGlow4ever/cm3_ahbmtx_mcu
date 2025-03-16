//===============================================
//
//	File: channel_output_compare.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11302024
//	Version: v1.0
//
// 	This is pwm generator channel output compare.
// 	pwm compare
// 	channel 1
// 	channel 2
// 	channel 3
// 	channel 4
// 	channel 5
// 	channel 6
//
//===============================================

module channel_output_compare
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,

	input		[15:0]			r_cc1,
	input		[ 3:0]			r_oc1m,
	input		[15:0]			r_cc2,
	input		[ 3:0]			r_oc2m,
	input 		[15:0]			r_cc3,
	input 		[ 3:0]			r_oc3m,
	input 		[15:0]			r_cc4,
	input 		[ 3:0]			r_oc4m,
	input 		[15:0]			r_cc5,
	input 						r_cc5c3,
	input 						r_cc5c2,
	input 						r_cc5c1,
	input 		[ 3:0]			r_oc5m,
	input 		[15:0]			r_cc6,
	input 		[ 3:0]			r_oc6m,

	input 		[15:0]			arr_cnt,
	input 						dir,//??????? need delay??
	input						timing_enable,

	output reg					oc1refc,
	output reg					oc2refc,
	output reg					oc3refc,
	output reg					oc4refc,
	output reg					oc5refc,
	output reg					oc6refc,
	output 						oc5c1refc,
	output 						oc5c2refc,
	output 						oc5c3refc
);

//===============================================
// channel 1 & 2
//===============================================

wire 			[ 7:0]			oc1ref;
wire 			[ 7:0]			oc2ref;

assign oc1ref[1] = ~(arr_cnt != r_cc1);
assign oc1ref[2] = arr_cnt != r_cc1;
assign oc1ref[6] = arr_cnt >= r_cc1;
assign oc1ref[7] = arr_cnt < r_cc1;

assign oc2ref[1] = ~(arr_cnt != r_cc2);
assign oc2ref[2] = arr_cnt != r_cc2;
assign oc2ref[6] = arr_cnt >= r_cc2;
assign oc2ref[7] = arr_cnt < r_cc2;

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc1refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc1refc <= 1'b0;
	end
	else
	begin
		case(r_oc1m) 
			4'h1 : oc1refc <= oc1ref[1];
			4'h2 : oc1refc <= oc1ref[2];
//			4'h3 : oc1refc <= (arr_cnt == r_cc1) ? ~oc1refc : oc1refc; 
			4'h4 : oc1refc <= 1'b1;
			4'h5 : oc1refc <= 1'b0;
			4'h6 : oc1refc <= oc1ref[6];
			4'h7 : oc1refc <= oc1ref[7];
			4'hc : oc1refc <= oc1ref[6] || oc2ref[6];
			4'hd : oc1refc <= oc1ref[7] && oc2ref[7];
			4'he : oc1refc <= dir ? oc2ref[6] : oc1ref[6];
			4'hf : oc1refc <= dir ? oc2ref[7] : oc1ref[7];
			default: oc1refc <= 1'b0; 
		endcase
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc2refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc2refc <= 1'b0;
	end
	else
	begin
		case(r_oc2m) 
			4'h1 : oc2refc <= oc2ref[1];
			4'h2 : oc2refc <= oc2ref[2];
//			4'h3 : oc2refc <= (arr_cnt == r_cc2) ? ~oc2refc : oc2refc; 
			4'h4 : oc2refc <= 1'b1;
			4'h5 : oc2refc <= 1'b0;
			4'h6 : oc2refc <= oc2ref[6];
			4'h7 : oc2refc <= oc2ref[7];
			4'hc : oc2refc <= oc1ref[6] || oc2ref[6];
			4'hd : oc2refc <= oc1ref[7] && oc2ref[7];
			4'he : oc2refc <= dir ? oc2ref[6] : oc1ref[6];
			4'hf : oc2refc <= dir ? oc2ref[7] : oc1ref[7];
			default: oc2refc <= 1'b0; 
		endcase
	end
end

//===============================================
// channel 3 & 4
//===============================================

wire 			[ 7:0]			oc3ref;
wire 			[ 7:0]			oc4ref;

assign oc3ref[1] = ~(arr_cnt != r_cc3);
assign oc3ref[2] = arr_cnt != r_cc3;
assign oc3ref[6] = arr_cnt >= r_cc3;
assign oc3ref[7] = arr_cnt < r_cc3;

assign oc4ref[1] = ~(arr_cnt != r_cc4);
assign oc4ref[2] = arr_cnt != r_cc4;
assign oc4ref[6] = arr_cnt >= r_cc4;
assign oc4ref[7] = arr_cnt < r_cc4;

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc3refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc3refc <= 1'b0;
	end
	else
	begin
		case(r_oc3m) 
			4'h1 : oc3refc <= oc3ref[1];
			4'h2 : oc3refc <= oc3ref[2];
			4'h4 : oc3refc <= 1'b1;
			4'h5 : oc3refc <= 1'b0;
			4'h6 : oc3refc <= oc3ref[6];
			4'h7 : oc3refc <= oc3ref[7];
			4'hc : oc3refc <= oc3ref[6] || oc4ref[6];
			4'hd : oc3refc <= oc3ref[7] && oc4ref[7];
			4'he : oc3refc <= dir ? oc4ref[6] : oc3ref[6];
			4'hf : oc3refc <= dir ? oc4ref[7] : oc3ref[7];
			default: oc3refc <= 1'b0; 
		endcase
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc4refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc4refc <= 1'b0;
	end
	else
	begin
		case(r_oc4m) 
			4'h1 : oc4refc <= oc4ref[1];
			4'h2 : oc4refc <= oc4ref[2];
			4'h4 : oc4refc <= 1'b1;
			4'h5 : oc4refc <= 1'b0;
			4'h6 : oc4refc <= oc4ref[6];
			4'h7 : oc4refc <= oc4ref[7];
			4'hc : oc4refc <= oc3ref[6] || oc4ref[6];
			4'hd : oc4refc <= oc3ref[7] && oc4ref[7];
			4'he : oc4refc <= dir ? oc4ref[6] : oc3ref[6];
			4'hf : oc4refc <= dir ? oc4ref[7] : oc3ref[7];
			default: oc4refc <= 1'b0; 
		endcase
	end
end

//===============================================
// channel 5 & 6
//===============================================

wire	 		[ 7:0]			oc5ref;
wire	 		[ 7:0]			oc6ref;

assign oc5ref[1] = ~(arr_cnt != r_cc5);
assign oc5ref[2] = arr_cnt != r_cc5;
assign oc5ref[6] = arr_cnt >= r_cc5;
assign oc5ref[7] = arr_cnt < r_cc5;

assign oc6ref[1] = ~(arr_cnt != r_cc6);
assign oc6ref[2] = arr_cnt != r_cc6;
assign oc6ref[6] = arr_cnt >= r_cc6;
assign oc6ref[7] = arr_cnt < r_cc6;

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc5refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc5refc <= 1'b0;
	end
	else
	begin
		case(r_oc5m) 
			4'h1 : oc5refc <= oc5ref[1];
			4'h2 : oc5refc <= oc5ref[2];
			4'h4 : oc5refc <= 1'b1;
			4'h5 : oc5refc <= 1'b0;
			4'h6 : oc5refc <= oc5ref[6];
			4'h7 : oc5refc <= oc5ref[7];
			4'hc : oc5refc <= oc5ref[6] || oc6ref[6];
			4'hd : oc5refc <= oc5ref[7] && oc6ref[7];
			4'he : oc5refc <= dir ? oc6ref[6] : oc5ref[6];
			4'hf : oc5refc <= dir ? oc6ref[7] : oc5ref[7];
			default: oc5refc <= 1'b0; 
		endcase
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		oc6refc <= 1'b0;
	end
	else if(~timing_enable)
	begin
		oc6refc <= 1'b0;
	end
	else
	begin
		case(r_oc6m) 
			4'h1 : oc6refc <= oc6ref[1];
			4'h2 : oc6refc <= oc6ref[2];
			4'h4 : oc6refc <= 1'b1;
			4'h5 : oc6refc <= 1'b0;
			4'h6 : oc6refc <= oc6ref[6];
			4'h7 : oc6refc <= oc6ref[7];
			4'hc : oc6refc <= oc5ref[6] || oc6ref[6];
			4'hd : oc6refc <= oc5ref[7] && oc6ref[7];
			4'he : oc6refc <= dir ? oc6ref[6] : oc5ref[6];
			4'hf : oc6refc <= dir ? oc6ref[7] : oc5ref[7];
			default: oc6refc <= 1'b0; 
		endcase
	end
end

//===============================================
// channel 5 & 1/2/3
//===============================================

assign oc5c1refc = r_cc5c1 ? oc1refc && oc5refc : oc1refc;
assign oc5c2refc = r_cc5c2 ? oc2refc && oc5refc : oc2refc;
assign oc5c3refc = r_cc5c3 ? oc3refc && oc5refc : oc3refc;

endmodule

