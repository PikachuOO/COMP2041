#!/usr/bin/perl -w

$a = 42;
$a[0] = 24;
$a[1] = 25;
$a[2] = 26;

print "$a\n";
print "@a\n";

# array is used in scalar context, so returns length
print 0+@a, "\n";
