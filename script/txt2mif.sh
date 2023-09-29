#!/bin/bash

cd $1
pwd

rm -rf $5

echo "DEPTH =" $3";" >> $5
echo "WIDTH =" $4";" >> $5
echo "ADDRESS_RADIX = HEX;" >> $5
echo "DATA_RADIX = HEX;" >> $5
echo "CONTENT" >> $5
echo "BEGIN" >> $5

cnt=0

cat $2 | while read line
do
	s=`echo "obase=16; $cnt" | bc`
	echo $s" : "${line:0:8}";" >> $5
	cnt=$cnt+1
done

cnt=`sed -n '$=' $5`
cnt=$cnt-6

for((i=$cnt; i<$3; i++))
do
	s=`echo "obase=16; $i" | bc`
	echo $s" : 00000000;" >> $5
done

echo "END;" >> $5

