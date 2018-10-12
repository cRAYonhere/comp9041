#!/bin/sh
var=$(expr "$1" - 1)
for i in `seq 2 $var`
do
	result=$(expr $1 % $i)
	if test "$result" -eq "0"
	then
		echo Not Prime
		exit 0
	fi
done
echo Prime
