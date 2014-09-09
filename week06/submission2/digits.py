#!/usr/bin/env python

import sys

for line in sys.stdin:
    for char in line:
        if char.isdigit() and int(char) < 5:
            sys.stdout.write("<")
        elif char.isdigit() and int(char) > 5:
            sys.stdout.write(">")
        else:
            sys.stdout.write(char)
