#!/bin/bash
#1. regex checking for id ?
#2. How to account for backslash
re_mark="^[0-9]{1,3}"
re_id="^[0-9]{7}"
while read id mark
do
	if ! [[ $mark =~ $re_mark ]]; then
		echo "$id ?? ($mark)"
	elif ! [[ $id =~ $re_id ]]; then
		echo "?? $mark ($id)"
	else
		if [ $mark -lt 0 ]
		then
			echo "$id ?? ($mark)"
		elif [ $mark -lt 50 ]
		then
			echo "$id FL"
		elif [ $mark -lt 65 ]
		then
			echo "$id PS"
		elif [ $mark -lt 75 ]
		then
			echo "$id CR"
		elif [ $mark -lt 85 ]
		then
			echo "$id DN"
		elif [ $mark -lt 101 ]
		then
			echo "$id HD"
		elif [ $mark -gt 100 ]
		then
			echo "$id ?? ($mark)"
		fi
	fi
done
