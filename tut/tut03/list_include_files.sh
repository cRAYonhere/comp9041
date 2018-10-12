#!/bin/bash -f
regx1='^([[:blank:]]*#).+\.h'
find . -type f -iname "*.c" -print0 | while IFS= read -r -d $'\0' line;
do
   filename=$line
   echo "${filename##*/} includes" #https://stackoverflow.com/questions/125281/how-do-i-remove-the-file-suffix-and-path-portion-from-a-path-string-in-bash
   var=$(<$line)
   while IFS='' read -r var
   do
      if [[ $var =~ $regx1 ]]
      then
         sanitized_var=`echo $var | sed -r 's/[[:blank:]]+//g'`
         header_file=`echo $sanitized_var | egrep -o "<.+>" | egrep -io "[a-z0-9]*\.h"`
         echo -e "\t$header_file"
      fi
   done <$line
done
