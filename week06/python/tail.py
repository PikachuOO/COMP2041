#!/usr/bin/env python

import sys
import fileinput

lines = []
files = dict();

for line in fileinput.input():
    files.setdefault(fileinput.filename(), []).append(line)

for file in files.iterkeys():
    files[file][-1] = files[file][-1].rstrip('\n')
    if len(files[file]) <= 10:
        print "".join(files[file])
    else:
        print "".join(files[file][-10:])
