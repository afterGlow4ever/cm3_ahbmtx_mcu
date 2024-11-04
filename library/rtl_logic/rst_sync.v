//===============================================
//
//	File: rst_sync.v
//	Author: afterGlow,4ever
//	Date: 08242024
//	Version: v1.0
//
// 	This lib is used to synchrounize any reset
// 	in order to realize async reset and sync 
// 	release.
//
//===============================================

//===============================================
// Rstn sync
//===============================================

module rstn_sync
(
	input									clk,
	input									rstn,

	output reg								sync_rstn
);

reg											rstn_d;

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		rstn_d <= 1'b0;
		sync_rstn <= 1'b0;
	end
	else
	begin
		rstn_d <= 1'b1;
		sync_rstn <= rstn_d;
	end
end

endmodule

//===============================================
// Rst sync
//===============================================

module rst_sync
(
	input									clk,
	input									rst,

	output reg								sync_rst
);

reg											rst_d;

always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
		rst_d <= 1'b1;
		sync_rst <= 1'b1;
	end
	else
	begin
		rst_d <= 1'b0;
		sync_rst <= rst_d;
	end
end

endmodule

