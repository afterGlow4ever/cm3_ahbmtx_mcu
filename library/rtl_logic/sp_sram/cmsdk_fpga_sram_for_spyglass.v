//===============================================
//
//	File: cmsdk_fpga_sram_for_spyglass.v
//	Author: afterGlow,4ever
//	Date: 08182024 
//	Version: v1.0
//
// 	This sram is used to replace ram in spyglass.
// 	
//===============================================

module cmsdk_fpga_sram #(
  parameter AW = 16,
  parameter MEMFILE = "image.hex"
 )
 (
  // Inputs
  input  wire          CLK,
  input  wire [AW-1:0] ADDR,
  input  wire [31:0]   WDATA,
  input  wire [3:0]    WREN,
  input  wire          CS,

  // Outputs
  output wire [31:0]   RDATA
  );

  reg               cs_reg;

  always @ (posedge CLK)
    begin
    cs_reg <= CS && |WREN && |WDATA && |ADDR;
    end

  assign RDATA = {32{cs_reg}};

endmodule
