#!/bin/bash

for file in "$@"
do
    tempfile="$file.tmp"
    sed 's/COMP2041/COMP2042/g;s/COMP9041/COMP9042/g' $file
    mv $tempfile $file
done

