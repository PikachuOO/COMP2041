#!/usr/bin/env python

import sys

maximum = 0

# get input
number1 = int(sys.stdin.readline().rstrip())
number2 = int(sys.stdin.readline().rstrip())
leftNum = min(number1, number2)
rightNum = max(number1, number2)

# get permutations
for a in range(leftNum, rightNum+1):
    for b in range(a, rightNum+1):
        # find max xor
        if (a^b > maximum):
            maximum = a^b
        #print "{} xor {} = {}".format(a, b, a^b)

print maximum
