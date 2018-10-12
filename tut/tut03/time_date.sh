#!/bin/bash
curr_month=$(date +%m)
next_month=`expr $curr_month + 1`
while [ $curr_month -lt $next_month ]
do
	date
	sleep 1h
	curr_month=$(date +%m)
done
