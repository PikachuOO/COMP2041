#!/usr/bin/python
import sys

gcd = lambda x, y : x if y == 0 else gcd(y, x%y)

assert( len(sys.argv) == 3 )
print( gcd(sys.argv[1], sys.argv[2]) )

