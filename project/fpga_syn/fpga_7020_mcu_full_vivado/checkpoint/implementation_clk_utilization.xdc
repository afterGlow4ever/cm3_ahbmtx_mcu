
# Location of BUFG Primitives 
set_property LOC BUFGCTRL_X0Y19 [get_cells u_fpga_platform/u_pll0/inst/clkf_buf]
set_property LOC BUFGCTRL_X0Y17 [get_cells u_fpga_platform/u_pll0/inst/clkout3_buf]
set_property LOC BUFGCTRL_X0Y18 [get_cells u_fpga_platform/u_pll0/inst/clkout2_buf]
set_property LOC BUFGCTRL_X0Y16 [get_cells u_fpga_platform/u_pll0/inst/clkout1_buf]
set_property LOC BUFGCTRL_X0Y0 [get_cells TCK_IBUF_BUFG_inst]

# Location of IO Primitives which is load of clock spine

# Location of clock ports
set_property LOC IOB_X1Y76 [get_ports CLK]
set_property LOC IOB_X1Y73 [get_ports TCK]

# Clock net "u_fpga_platform/u_pll0/inst/clk_out3" driven by instance "u_fpga_platform/u_pll0/inst/clkout3_buf" located at site "BUFGCTRL_X0Y17"
#startgroup
create_pblock {CLKAG_u_fpga_platform/u_pll0/inst/clk_out3}
add_cells_to_pblock [get_pblocks  {CLKAG_u_fpga_platform/u_pll0/inst/clk_out3}] [get_cells -filter { PRIMITIVE_GROUP != I/O && IS_PRIMITIVE==1 && PRIMITIVE_LEVEL !=INTERNAL } -of_object [get_pins -filter {DIRECTION==IN} -of_objects [get_nets -hierarchical -filter {PARENT=="u_fpga_platform/u_pll0/inst/clk_out3"}]]]
resize_pblock [get_pblocks {CLKAG_u_fpga_platform/u_pll0/inst/clk_out3}] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0 CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
#endgroup

# Clock net "u_fpga_platform/u_pll0/inst/clk_out2" driven by instance "u_fpga_platform/u_pll0/inst/clkout2_buf" located at site "BUFGCTRL_X0Y18"
#startgroup
create_pblock {CLKAG_u_fpga_platform/u_pll0/inst/clk_out2}
add_cells_to_pblock [get_pblocks  {CLKAG_u_fpga_platform/u_pll0/inst/clk_out2}] [get_cells -filter { PRIMITIVE_GROUP != I/O && IS_PRIMITIVE==1 && PRIMITIVE_LEVEL !=INTERNAL } -of_object [get_pins -filter {DIRECTION==IN} -of_objects [get_nets -hierarchical -filter {PARENT=="u_fpga_platform/u_pll0/inst/clk_out2"}]]]
resize_pblock [get_pblocks {CLKAG_u_fpga_platform/u_pll0/inst/clk_out2}] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
#endgroup

# Clock net "u_fpga_platform/u_pll0/inst/clk_out1" driven by instance "u_fpga_platform/u_pll0/inst/clkout1_buf" located at site "BUFGCTRL_X0Y16"
#startgroup
create_pblock {CLKAG_u_fpga_platform/u_pll0/inst/clk_out1}
add_cells_to_pblock [get_pblocks  {CLKAG_u_fpga_platform/u_pll0/inst/clk_out1}] [get_cells -filter { PRIMITIVE_GROUP != I/O && IS_PRIMITIVE==1 && PRIMITIVE_LEVEL !=INTERNAL } -of_object [get_pins -filter {DIRECTION==IN} -of_objects [get_nets -hierarchical -filter {PARENT=="u_fpga_platform/u_pll0/inst/clk_out1"}]]]
resize_pblock [get_pblocks {CLKAG_u_fpga_platform/u_pll0/inst/clk_out1}] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y0 CLOCKREGION_X0Y1:CLOCKREGION_X0Y1 CLOCKREGION_X1Y0:CLOCKREGION_X1Y0 CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
#endgroup

# Clock net "TCK_IBUF_BUFG" driven by instance "TCK_IBUF_BUFG_inst" located at site "BUFGCTRL_X0Y0"
#startgroup
create_pblock {CLKAG_TCK_IBUF_BUFG}
add_cells_to_pblock [get_pblocks  {CLKAG_TCK_IBUF_BUFG}] [get_cells -filter { PRIMITIVE_GROUP != I/O && IS_PRIMITIVE==1 && PRIMITIVE_LEVEL !=INTERNAL } -of_object [get_pins -filter {DIRECTION==IN} -of_objects [get_nets -hierarchical -filter {PARENT=="TCK_IBUF_BUFG"}]]]
resize_pblock [get_pblocks {CLKAG_TCK_IBUF_BUFG}] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
#endgroup
