#!/usr/bin/perl

use warnings;
use strict;

die "usage: $0 file ...\n" if (!@ARGV);
foreach my $filename (@ARGV) {
    open (my $F, "<", $filename) or die "$0: $filename: $!\n";
    my @lines = <$F>;
    while (@lines) {
        my $line = shift @lines;
        chomp $line;
        print $line;
        print "\t" if (@lines+0 > 0);
    }
    print "\n";
}
