#!/usr/bin/perl

use warnings;
use strict;

my $numbered = 0;

if (@ARGV > 0 and $ARGV[0] eq "-n") {
    $numbered = 1;
    shift;
}


my $n = 1;

while (<>) {
    printf("%6d   ", $n++) if $numbered;
    print;
}
