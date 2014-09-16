#!/usr/bin/perl

use warnings;
use strict;

package PoetLookup;
sub new {
    my $hash = {};
    my $total = {};
    for my $file (glob "poets/*.txt") {
        my ($poet, $logProb, @words);
        open (my $F, "<", $file) or die "$0: $file: $!\n";
        $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;

        for (<$F>) {
            $$total{$poet} += @words = /([A-Z]+)/gi;
            $$hash{$poet}{lc $_}++ for @words;
        }

    }

    return bless $hash, $total;
}

sub logProb {
    $logProb = log(($count+1)/$total);
    $$hash{$poet}{$word}{"_logProb_"} = $logProb;

}

package main;
for my $inFile (@ARGV) {
    open (my $IF, "<", $inFile) or die "$0: $inFile: $!\n";
    my @words = $inWord =~ /[A-Z]+/gi;
    

}

