#!/bin/bash

cd $1
pwd
cd $2
pwd

temp=$1

sed -i "s!\.\.!$temp!g" sim.list
sed -i "s!\.\.!$temp!g" zynq_sim.list
sed -i "s!\.\.!$temp!g" dut.list
sed -i "s!\.\.!$temp!g" sim_inc.list

