#!/bin/sh

for directory in "$@"
do
	#echo $directory
	var3=`echo "$directory" | sed s'/\/$//'`
	#echo $var3
	test ! -d "$directory" && continue 
	#echo "directory:$var3."
	album=${var3##*/}
	#echo album:$album
	year=`echo "$album" | egrep -o "[12][0-9]{3}$"`
	#echo year:$year.
	for file in "$var3"/*.mp3
	do
		test ! -f "$file" && continue
		#echo file:$file.
		var2=${file##*/}
		var2=`echo "$var2" | sed 's/[[:blank:]]-[[:blank:]]/~/g'`		
		track=`echo "$var2" | sed "s/[[:blank:]]-[[:blank:]]/~/g"|cut -d "~" -f  1`
		#echo track:$track.		
		title=`echo "$var2" | sed "s/[[:blank:]]-[[:blank:]]/~/g"|cut -d "~" -f  2`
		#echo title:$title.
		#echo variable $var2	
		artist=`echo "$var2" | sed "s/[[:blank:]]-[[:blank:]]/~/g"|cut -d "~" -f 3 | sed "s/\.mp3//g"`
		#echo artist:$artist.		
		id3 -t "$title" -a "$artist" -A "$album" -T "$track" -y "$year" "$file" 1>/dev/null
	done
done
