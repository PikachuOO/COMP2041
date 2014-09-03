#!/usr/bin/perl

use strict
use warnings

open F,"<", $ARGV[0] or die "a horrible daeth\n";

my @lines = <F>;
for $line (@lines) {
    chomp;
    my @characters = split //, $line;
    print @characters[$ARGV[0]..$ARGV[1]], "\n" if @characters >
    ($ARGV[1]-$ARGV[0]);
}
