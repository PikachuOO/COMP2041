#!/usr/bin/perl

use warnings;
use strict;

die "usage: $0 file ...\n" if (!@ARGV);
foreach my $filename (@ARGV) {
    open (my $F, "<", $filename) or die "$0: $filename: $!\n";
    foreach (my @lines = <$F>) {
        tr{\n}{\t};
        print;
    }
    print "\n";
}
