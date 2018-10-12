#!/bin/sh
cd images
for images in *
do
	#echo $filename
	filename=`echo "$images" | sed -r "s/.jpg//g"`
	#echo $filename
	if  echo "$images" | grep -Eq '\.jpg$'
	then
		new_filename="$filename.png"
		#echo $images $new_filename
		convert "$images" "$new_filename" && rm "$images"
	fi
done
