#!/bin/bash

if [[ $# != 2 ]]
then
    >&2 echo "Usage: $0 <file1> <file2>"
    exit 1
fi

while true
do
    for my $i in {0..1000}
    do
        #./comm.pl $1 $2 >> commOutput.txt
        
         >> commOutput.txt
    done
    ./histogram.r
done
