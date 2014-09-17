#!/usr/bin/perl

use warnings;
use strict;

my %freq;

for my $file (glob "poets/*.txt") {
    my ($count, $total, $poet, $logProb, @words);
    open (my $F, "<", $file) or die "$0: $file: $!\n";
    $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;

    for (<$F>) {
        $total += @words = /([A-Z]+)/gi;
        $freq{$poet}{lc $_}++ for @words;
    }

    $count = $freq{$poet}{$ARGV[0]};
    $logProb = log(($count+1)/$total);
    printf "log((%d+1)/%6d) = %8.4f %s\n", $count, $total, $logProb, $poet;
}
