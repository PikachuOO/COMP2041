#!/usr/bin/perl
$c +=()= /\b\Q$ARGV[0]\E\b/gi for <STDIN>;
printf lc $ARGV[0],"occurred %d times\n",$c;
