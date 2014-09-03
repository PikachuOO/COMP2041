#!/bin/bash

if [[ $# != 2 ]]
then
    >&2 echo "Usage: $0 <file1> <file2>"
    exit 1
fi

i=0
while read line
do
    fileArray1[$i++]="$line"
done < $1

j=0
while read line
do
    fileArray2[$j++]="$line"
done < $2

if [[ $j != $k ]]
then
    >&2 echo "Warning: file length does not match"
fi

diffCount=0
while [[ $i > 0 ]]
do
   if [[ $fileArray1[$i] ne $fileArray2[$i] ]] 
   then
       $diffcount++
   fi
   $i++
done

