#!/bin/bash


zip -j legit.zip ./S2_2018_comp9041_ass1_legit/diary.txt ./S2_2018_comp9041_ass1_legit/legit.pl ./S2_2018_comp9041_ass1_legit/test_cases/test*.sh

retVal=$?
if [ $retVal -eq 0 ];
then
	retVal=$?
	if [ $retVal -eq 0 ];
	then
		scp legit.zip z5181159@cse.unsw.edu.au:~/Desktop/comp9041/temp
	else
		echo "scp failed"
	fi
else
	echo "Zip Failed"
fi
retVal=$?
if [ $retVal -eq 0 ];
then 
	mv legit.zip ~/.local/share/Trash
else
	echo "delete through mv failed"
fi
