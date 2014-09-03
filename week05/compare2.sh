#!/bin/bash

read -r -a array1 <$1
read -r -a array1 <$1
read -r -a array1 <$1

for word in "${array1[@]}"
do
    echo $word
done

