#!/bin/bash

cd $1
pwd
cd $2
pwd

temp=$1

sed -i "s!\.\.!set_global_assignment -name VERILOG_FILE $temp!g" dut.list
sed -i "s!\.\.!set_global_assignment -name VERILOG_FILE $temp!g" fpga_ep4_dut.list
mv dut.list dut.tcl
mv fpga_ep4_dut.list fpga_ep4_dut.tcl

echo $4 | sed "s/ /\n/g" > design_define.v
sed -i "s/+/ /g" design_define.v

sed -i "s/PROJECT_NAME_TEMP/$3/g" $3.tcl
sed -i "s/FPGA_CFG_TEMP/$5/g" $3.tcl
sed -i "s/PIN_TEMP/$6/g" $3.tcl
sed -i "s/SDC_TEMP/$7/g" $3.tcl

