#!/usr/bin/env python

import sys
import fileinput

#squelch flag if given and set output size
if (len(sys.argv) != 0 and sys.argv[0] =~ /^-(\d+)$/):
    num = 1;
else:
    for line in fileinput.input():

