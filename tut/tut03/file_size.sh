#!/bin/bash

file_size='[0-9]{1,}'
for file in ./*; do
   size=$(wc -c "$file" 2>/dev/null)
   size_sanitize=`echo $size | cut -d' ' -f 1`
   if [[ $size_sanitize =~ $file_size ]]
   then
      if [[ $size_sanitize -gt 100000 ]]
      then
         echo "$size_sanitize ${file##*/}"
      fi
   fi
done
