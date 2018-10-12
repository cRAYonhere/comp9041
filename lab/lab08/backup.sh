#!/usr/bin/env sh

filename=$1
write=0
counter=0

if test -e "$filename";
then
	while test $write -eq 0
	do
		new_file=".${filename}.${counter}"
		if test -e "$new_file";
		then
			#echo "${new_file} exits."
			counter=`expr $counter + 1`
		else
			echo "Backup of '$filename' saved as '$new_file"
			cp "$filename" "$new_file"
			write=1
		fi
	done
else
	echo "$filename doesn't exists."
fi
