#!/bin/bash
regx='<blink>.*</blink>'
find . -type f -iname "*.html" -print0 | while IFS= read -r -d $'\0' line; do
   echo "$line"
   var=$(<$line)
   if [[ $var =~ $regx ]]
   then
      echo "$var is a match"
      mv
   fi
done
