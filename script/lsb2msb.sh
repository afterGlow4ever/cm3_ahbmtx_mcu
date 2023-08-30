#!/bin/bash

cd $1
pwd

cat $2 | while read line
do
	echo ${line:6:2}${line:4:2}${line:2:2}${line:0:2} >> temp.txt
done

rm -rf $2
mv temp.txt $2

