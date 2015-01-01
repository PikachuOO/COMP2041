#!/usr/bin/env python

import sys
from string import maketrans

maximum = 0

# get input
number1 = int(sys.stdin.readline().rstrip())
number2 = int(sys.stdin.readline().rstrip())
leftNum = min(number1, number2)
rightNum = max(number1, number2)

# find popcount of max rightNum
#print gmpy.popcount(rightNum)
#print int.bit_length(rightNum)

# find compliment of max rightNum
rightNumComp = int(bin(rightNum)[2:].translate(maketrans("10", "01")), 2)
if (rightNum^rightNumComp > leftNum):
    print "success"
print rightNum^rightNumComp

