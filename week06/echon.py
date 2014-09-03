#!/usr/bin/env python

import sys

if sys.argv[1].isdigit():
    num = int(sys.argv[1])
    if num < 0:
        print "first argument must be positive"
else:
    print "Usage: ./echon.py"
    sys.exit(1)

string = sys.argv[2]

for i in xrange (0, num):
    print string
