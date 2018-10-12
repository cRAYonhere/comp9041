#!/bin/bash

if [ $# -eq 1 ];
then
	for i in `seq 1 $1`;
	do
		echo $i
	done
elif [ $# -eq 2 ];
then
	for i in `seq $1 $2`;
	do
		echo $i
	done
elif [ $# -eq 3 ];
var=0
i=$1
then
	while [ $i -le $3 ];
	do
		echo $i
		let var+=1
		let i="$1 + ( var*$2 )"
	done
fi
