#!/usr/bin/env python

import sys, re, subprocess

url = sys.argv[1];

wget = subprocess.Popen(['wget','-q','-O-',url], stdout=subprocess.PIPE)
source = wget.communicate()[0].rstrip('\n')
source = re.sub("<!--.*?-->", "", source)
tags = dict()

for tag in re.findall("<[\s\/]*(\w+)", source):
    tag = tag.lower()
    tags.setdefault(tag, 0)
    tags[tag] += 1;

for tag in sorted(tags.keys()):
    print tag, tags[tag]
