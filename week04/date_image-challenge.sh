#!/bin/bash

for file in *.jpg
do
    # handle if there are no image files
    [ -e "$file" ] || continue

    # get original date
    date=`date -r "$file" +"%Y%m%d%H%M.%S"`

    # get label for image
    label=`date -r "$file" | egrep -o '[A-Z][a-z]{2} [0-9]+ [0-9]{2}:[0-9]{2}'`
    # annotate image
    convert -gravity south -pointsize 36 -annotate 0 "$label" "$file" "$file"

    # restore original modification date
    touch -t"$date" "$file"
done

