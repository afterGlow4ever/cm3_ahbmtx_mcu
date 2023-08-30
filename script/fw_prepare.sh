#!/bin/bash

cd $1
pwd
cd $2
pwd

temp=$1

sed -i "s!\.\.!$temp!g" fw_base_inc.list

