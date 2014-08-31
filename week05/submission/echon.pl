#!/usr/bin/perl -w
if (@ARGV != 2) { print "Usage: \"$0\" <number of lines> <string>\n" } else { print "$ARGV[1]\n" while ($ARGV[0]--) };
