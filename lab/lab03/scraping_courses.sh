#!/bin/bash
var=$1
{ wget -q -O- "http://www.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=All" | egrep "$var[0-9]{4}" ; wget -q -O- "http://www.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=All" | egrep "$var[0-9]{4}" ; }  | sed -r "s/[[:blank:]][[:blank:]]+//g" | egrep -io "[A-Z]{4}[0-9]{4}\.html..+" | sed -r "s/\.html\">/ /g" | sed -r "s/(.){9}$//g" | sed -r "s/[[:blank:]]$//g" | sort -d | uniq
