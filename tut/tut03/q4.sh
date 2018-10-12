#!/bin/bash
if [ $# -gt 0 ] ;then
	for filename in "$@" ; 
	do
		file="$filename"
		while IFS= read -r line 
		do
			echo "$line"
		done < "$file"
	done 
else
	while read line
	do
		echo "$line"
	done
fi
