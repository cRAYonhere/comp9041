#!/bin/bash
regex="^[0-9]+"
if [ $# -ne 2 ];
then
	echo "Usage: ./echon.sh <number of lines> <string>">&2
elif ! [[ $1 =~ $regex ]];
then
	echo "./echon.sh: argument 1 must be a non-negative integer">&2
else
	seq_counter=0
	while [ $seq_counter -lt $1 ]
	do
		echo "$2"
		seq_counter=$[$seq_counter+1]
	done
fi
