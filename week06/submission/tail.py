#!/usr/bin/env python

import sys


for file in sys.argv[1:]:
    lines = []
    for line in open(file,'r'):
        lines.append(line)

    if len(lines) <= 10:
        print "".join(lines).rstrip('\n')
    else:
        print "".join(lines[-10:]).rstrip('\n')
