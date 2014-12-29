#!/usr/bin/env python

def fibonacci(n):
    #print n
    if (n == 0):
        #print "\n"
        return 0
    elif (n == 1):
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

# main program
n = 1
while (n < 10):
    print fibonacci(n)
    n += 1
