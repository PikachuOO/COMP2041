#!/usr/bin/env python

import sys
import re

temp = []
for line in sys.stdin:
   temp.append(re.findall('/[A-Za-z]+/', line))
print temp
