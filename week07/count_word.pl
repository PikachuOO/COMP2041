#!/usr/bin/perl
$c +=()= /\b\Q$ARGV[0]\E\b/gi for <STDIN>;
printf "%s occurred %d times\n",lc $ARGV[0],$c;
