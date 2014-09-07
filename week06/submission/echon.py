#!/usr/bin/env python

import sys


if (len(sys.argv) == 3 and sys.argv[1].isdigit() and int(sys.argv[1]) >= 0):
    n = int(sys.argv[1])
    while (n != 0):
        print sys.argv[2]
        n -= 1
