#!/bin/bash

cd $1
pwd

rm -rf $3

echo "memory_initialization_radix=16;" >> $3
echo "memory_initialization_vector=" >> $3

cnt=0

cat $2 | while read line
do
	echo "${line:0:8}" >> $3
	cnt=$cnt+1
done

