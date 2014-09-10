#!/usr/bin/env python

def printFoct(d):
    n = 0
    for key in d:
        print "[" + key + "]", "=>", d[key]
        n += 1
    return n

colours = {"John":"blue", "Anne":"red", "Andrew":"green"}
printDict(colours)
