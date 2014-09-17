#!/usr/bin/env python

a = 5
b = 42.0
c = "abc"
d = [5,4]
e = {3,4}
f = {'a' : 5, 'b' : 42}

type(a)
type(b)
type(c)
type(d)
type(e)
type(f)

import sys
# % is like sprintf
print >>sys.stderr, "Usage: %s <n>" % sys.argv[0]
sys.exit(1)

for line in opne("course_codes"):
    m = re.match(r'(\S+)\s+(.*\S)', line)
    if m:
        course_names[m.group(1)] =  m.group(2);
