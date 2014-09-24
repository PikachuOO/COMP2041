#!/usr/bin/env python

import sys, re, subprocess

if sys.argv[1] == "-f":
    freqFlag = True
    url = sys.argv[2]
else:
    url = sys.argv[1]

wget = subprocess.Popen(['wget','-q','-O-',url], stdout=subprocess.PIPE)
source = wget.communicate()[0].rstrip('\n')
source = re.sub("<!--.*?-->", "", source)
tags = dict()

for tag in re.findall("<[\s\/]*(\w+)", source):
    tag = tag.lower()
    tags.setdefault(tag, 0)
    tags[tag] += 1

if freqFlag:
    for tag in sorted(tags.keys()):
        print tag, tags[tag]
else:
    for tag in sorted(tags.items(), key=lambda x: x[1])
    print "hello"

