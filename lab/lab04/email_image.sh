#!/bin/sh

for var in "$@"
do
	display "$var"
	subject=`echo $var | sed -r 's/\..+$//g'`
	echo Address to e-mail this image to?
	read email
	echo Message to accompany image?
	read message
	#echo subject $subject
	echo "$message" | mutt -s "$subject" -e 'set copy=no' -a "$var" -- "$email" && echo "$var" sent to "$email"
done
