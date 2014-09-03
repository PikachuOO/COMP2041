#!/usr/bin/perl

use warnings;
use strict;

my @buf = <>;
foreach my $line (@buf) {
    $line =~ s/\n$/\t/;
    print $line;
}
