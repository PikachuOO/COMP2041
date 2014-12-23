#!/usr/bin/env python

import sys

sum = 0
number = sys.stdin.readline()
number = number.rstrip()

for digit in number:
    sum += int(digit)

print sum
