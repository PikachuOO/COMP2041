#!/bin/bash

a[0]="a"
a[1]="b"
a[2]="c"

for item in "${a[@]}"
do
    echo $item
done
