#!/bin/bash

cd $1
pwd
cd $2
pwd

temp=$1

sed -i "s!\.\.!read_verilog $temp!g" dut.list
sed -i "s!\.\.!read_verilog $temp!g" fpga_7020_dut.list
sed -i "s!\.\.!read_ip $temp!g" fpga_7020_ip.list
#sed -i "s!\.\.!synth_ip [get_files $temp!g" fpga_7020_ip.list
#sed -i "s!\.\.!generate_target all [get_files $temp!g" fpga_7020_ip.list
#sed -i "s!xci!xci] -force!g" fpga_7020_ip.list
mv dut.list dut.tcl
mv fpga_7020_dut.list fpga_7020_dut.tcl
mv fpga_7020_ip.list fpga_7020_ip.tcl

echo $4 | sed "s/ /\n/g" > design_define.v
sed -i "s/+/ /g" design_define.v

sed -i "s/PROJECT_NAME_TEMP/$3/g" $3.tcl
sed -i "s/FPGA_CFG_TEMP/$5/g" $3.tcl
sed -i "s/PIN_TEMP/$6/g" $3.tcl
sed -i "s/SDC_TEMP/$7/g" $3.tcl

