#!/usr/bin/env python

import sys
import fileinput

lines = []

for line in fileinput.input():
    lines.append(line)

if len(lines) <= 10:
    print str(lines)[-10:-1]
else:
    print str(lines)
