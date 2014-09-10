#!/bin/bash

echo "Running `whereis paste` -s $@"
paste -s $@ > /tmp/output1

echo "Running ./pastes.pl $@"
./pastes.pl $@ > /tmp/output2

echo "Running diff on the output"
if diff /tmp/output[12] 
then
    echo "Test succeeded - output of ./pastes.pl matched `whereis paste` -s"
    exit 0
else
    echo "Test failed - output of ./pastes.pl did not match `whereis paste` -s"
    exit 1
fi
