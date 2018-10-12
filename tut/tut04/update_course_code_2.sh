#!/bin/bash
comp9041="COMP9041"
comp2041="COMP2041"
file="$1"
echo "$file"
if test -d "$file"
then
	
	for filename in $file/*
	do	
		filename=${filename##*/}
		echo $filename
		if [[ "$filename" =~ $comp9041 ]]
		then
			echo 1
			var=`echo "$filename" | sed -r "s/COMP9041/COMP9042/g"`
		else
			echo 2
			var=`echo "$filename" | sed -r "s/COMP2041/COMP2042/g"`
		fi
		echo namechange "$filename" "$var"
		#mv "$filename" $var
	done
else
	test -d "$file" && exit 1
	if [[ "$file" =~ $comp9041 ]]
	then
		echo 3
		var=`echo "$file" | sed -r "s/COMP9041/COMP9042/g"`
	else
		echo 4
		var=`echo "$file" | sed -r "s/COMP2041/COMP2042/g"`
	fi
	echo namechanged "$file" "$var"
	#mv "$filename" $var	
fi	
