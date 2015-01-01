#!/usr/bin/env python

import sys
import math
from string import maketrans

def flip(number):
    return int(bin(number)[2:].translate(maketrans("10", "01")), 2)

def roundDownToPow2(number):
    return int(pow(2, math.ceil(math.log(number+1)/math.log(2)))/2)


maximum = 0

# get input
number1 = int(sys.stdin.readline().rstrip())
number2 = int(sys.stdin.readline().rstrip())
L = min(number1, number2)
R = max(number1, number2)

for A in range(L, R+1):
    # invert A
    notA = flip(A)

    # if inverse of leftnum not between L and R
    if notA in range(L, R):
        maximum = max(maximum, A^notA)

    # round down to nearest power of 2 and or with inverse
    else:
        # OR with inverse
        B = notA | roundDownToPow2(A)
        # XOR with A
        maximum = max(maximum, A^B)

print maximum
