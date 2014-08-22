#!/bin/bash

for file in *.jpg
do
    # handle if there are no image files
    [ -e "$file" ] || continue
    date=`date -r "$file" | egrep -o '[A-Z][a-z]{2} [0-9]+ [0-9]{2}:[0-9]{2}'`
    convert -gravity south -pointsize 36 -annotate 0 "$date" "$file" "$file"
done

