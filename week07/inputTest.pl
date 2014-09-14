#!/usr/bin/perl

use warnings;
use strict;

#for word in line in file in argv
for my $File (@ARGV) {
    open (my $F, "<", $File) or die "$0: $File: $!\n";
    my @words;
    for my $inWord (<$F>) {
        push @words, $inWord =~ /[A-Za-z]+/g;
    }
    print @words;
    print "-----\n";
}
