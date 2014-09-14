#!/usr/bin/perl

use warnings;
use strict;

my %words;

while (my $line = <STDIN>) {
    while ($line =~ s/\b([A-Za-z]+)\b//) {
        $words{$1}++;
    } 
}

foreach my $word (keys %words) {
    printf "%s\t%s\n", $words{$word}, $word;
}
