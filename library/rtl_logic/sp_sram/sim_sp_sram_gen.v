//===============================================
//
//	File: sim_sp_sram_gen.v
//	Author: afterGlow,4ever
//	Date: 08212024 
//	Version: v1.0
//
// 	This sram is used to sim.
// 	
//===============================================

module sim_sp_sram_gen
#(
	parameter								ADDR_WIDTH = 10,
	parameter								DATA_WIDTH = 32,
	parameter								BYTE_WIDTH = 8,
	parameter								MEM_INITFILE = "none",
	parameter 								DEVICE_FAMILY = "ZYNQ_7020"
)
(
	input									clk,
	input									rst,
	input	[DATA_WIDTH/BYTE_WIDTH-1:0]		wea,
	input									ena,
	input 	[ADDR_WIDTH-1:0]				addr,
	input	[DATA_WIDTH-1:0]				data,
	output	[DATA_WIDTH-1:0]				q
);

reg     	[DATA_WIDTH-1:0]   				mem[(1<<ADDR_WIDTH)-1:0];

reg     	[ADDR_WIDTH-1:0]  				addr_valid;
reg               							ena_valid;

always @ (posedge clk or posedge rst)
begin
	if(rst)
  		ena_valid <= 1'b0;
	else
		ena_valid <= ena;
end

always @ (posedge clk or posedge rst)
begin
	if(rst)
  		addr_valid <= 'h0;
	else
		addr_valid <= addr;
end

genvar i;
integer j;

generate
	for(i=0;i<DATA_WIDTH/BYTE_WIDTH;i=i+1)
	begin: sp_ram_gen
		always @ (posedge clk or posedge rst)
		begin
			if(rst)
//		  		mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] <= {BYTE_WIDTH{1'b0}});
//		  		mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] <= 'h0;
				for(j=0;j<(1<<ADDR_WIDTH);j=j+1)
					mem[j] <= 'h0;
			else
//		  		mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] <= mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] | (data[(i*BYTE_WIDTH)+:BYTE_WIDTH] & (ena ? {BYTE_WIDTH{wea[i]}} : {BYTE_WIDTH{1'b0}}));
		  		if(ena && (wea[i] != 'h0))
		  			mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] <= data[(i*BYTE_WIDTH)+:BYTE_WIDTH];
				else
					mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH] <= mem[addr][(i*BYTE_WIDTH)+:BYTE_WIDTH];
		end
	end
endgenerate

assign q = ena_valid ? mem[addr_valid] : {DATA_WIDTH{1'b0}};

//generate
//	if((BYTE_WIDTH!=8)&&(BYTE_WIDTH!=9))
//	begin: multi_sp_ram_gen
//	integer i;
//
//		always @ (posedge clk)
//		begin
//			for(i=0;i<DATA_WIDTH/BYTE_WIDTH;i++)
//		  		mem[addr][(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] <= mem[addr][(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] || (data[(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] & (ena ? {BYTE_WIDTH{wea[i]}} : {BYTE_WIDTH{1'b0}}));
//		end
//		
//		assign q = ena_valid ? mem[addr_valid] : {DATA_WIDTH{1'b0}};
//	end
//	else
//	begin: single_sp_ram_gen
//	integer i;
//
//		always @ (posedge clk)
//		begin
//			for(i=0;i<DATA_WIDTH/BYTE_WIDTH;i++)
//		  		mem[addr][(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] <= mem[addr][(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] || (data[(i+1)*BYTE_WIDTH+:i*BYTE_WIDTH] & (ena ? {BYTE_WIDTH{wea[i]}} : {BYTE_WIDTH{1'b0}}));
////		  	mem[addr] <= mem[addr] || ((data & wea) && ena);
//		end
//		
//		assign q = ena_valid ? mem[addr_valid] : {DATA_WIDTH{1'b0}};
//	end
//endgenerate

endmodule

