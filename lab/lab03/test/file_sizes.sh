#!/bin/bash

small=""
medium=""
large=""

for file in ./*; do
	#echo "${file##*/}"
	var=`cat $file| wc -l`
	if [ $var -lt 10 ];
	then
		small="$small ${file##*/}"
		#echo "small ${file##*/}"
	elif [ $var -lt 100 ];
	then
		medium="$medium ${file##*/}"
		#echo "medium ${file##*/}"
	else
		large="$large ${file##*/}"
		#echo "large ${file##*/}"
	fi
done

echo "Small files: $small"
echo "Medium-sized files: $medium"
echo "Large files: $large"
