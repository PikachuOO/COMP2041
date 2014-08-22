#!/bin/bash

undergrad=$(wget -q -O- "http://www.handbook.unsw.edu.au/vbook2014/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=All" | egrep -o "[A-Z]{4}[0-9]{4}</TD>|<A.*>.*</A>" | sed s/'<.*">'//g | sed s/'<.*>'//g | tr '\n' ' ' | sed -r 's/([A-Z]{4}[0-9]{4})/\n\1/g')

postgrad=$(wget -q -O- "http://www.handbook.unsw.edu.au/vbook2014/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=All" | egrep -o "[A-Z]{4}[0-9]{4}</TD>|<A.*>.*</A>" | sed s/'<.*">'//g | sed s/'<.*>'//g | tr '\n' ' ' | sed -r 's/([A-Z]{4}[0-9]{4})/\n\1/g')

echo "$undergrad" "$postgrad" | egrep ^[A-Z]{4}[0-9]{4} | sed "s/\s$//" | sed "s/\s$//" |sort | uniq | egrep ^$1
