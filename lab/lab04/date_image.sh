#!/bin/sh
for image in "$@"
do
	var=`ls -l "$image"`
	date=`echo "$var" | cut -d " " -f 6,7,8`
	#echo $date
	convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" "${image}" temporary_file.jpg && mv temporary_file.jpg "${image}";
done
