#!/usr/bin/env python

import fileinput, re

count = {}

for linei n fileinput.input():
    for word in re.findall(r'\w', line.lower()):
        if word in count:
            count[word] += 1
        else
        count[word] = 1

words = count.keys()
sorted_words = sorted(words, key lambda w: count[w])
for word in sorted_words:
    print "%8d %s" % (count[word], word)
