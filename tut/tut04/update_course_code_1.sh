#!/bin/bash
comp9041="COMP9041"
comp2041="COMP2041"
file="$1"
echo "$file"

test -d "$file" && exit 1
if [[ "$file" =~ $comp9041 ]]
then
	echo 1
	var=`echo "$file" | sed -r "s/COMP9041/COMP9042/g"`
else
	echo 2
	var=`echo "$file" | sed -r "s/COMP2041/COMP2042/g"`
fi
echo namechanged "$file" "$var"
#mv "$filename" $var


