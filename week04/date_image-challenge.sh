#!/bin/bash

for file in *.jpg
do
    # handle if there are no image files
    [ -e "$file" ] || continue

    # get original date
    date=`date -r new04 +"%Y%m%d%H%M"`

    # annotate image
    convert -gravity south -pointsize 36 -annotate 0 "$date" "$file" "$file"

    # restore original modification date
    touch -t"$date" "$file"
done

