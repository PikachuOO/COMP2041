#!/bin/bash

for file in *.jpg
do 
    echo "$file"
    date -r "$file"
    echo
done > before_dates.txt

./date_image-challenge.sh

for file in *.jpg
do 
    echo "$file"
    date -r "$file"
    echo
done > after_dates.txt

if ! [[ `diff before_dates.txt after_dates.txt` ]]
then
    echo "All tests passed"
    exit 0
else
    diff before_dates.txt after_dates.txt | head
    echo '[...]'
    echo "Script completed with errors"
    exit 1
fi
