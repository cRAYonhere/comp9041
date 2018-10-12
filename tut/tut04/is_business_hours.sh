#!/bin/bash
moment=$(date +%H)
if test $moment -gt 9 && test $moment -lt 17
then
	exit 0
else
	exit 1
fi
