#!/bin/sh 
SMALL=10 
MEDIUM_SIZED=100 
declare small_files 
declare medium_files 
declare large_files

for file in *
do 
    if [[ `wc -l < "$file"` -lt "$SMALL" ]] 
    then 
        small_files="$small_files $file" 
    elif [[ `wc -l < "$file"` -lt "$MEDIUM_SIZED" ]] 
    then 
        medium_files="$medium_files $file" 
    else 
        large_files="$large_files $file" 
    fi 
done

echo "Small files:$small_files"
echo "Medium-sized files:$medium_files"
echo "Large files:$large_files"
