#!/bin/bash

while IFS= read line
do
	var1=`echo $line | sed -r "s/[01234]/</g"`
	var2=`echo $var1 | sed -r "s/[6789]/>/g"`
	echo $var2
done
