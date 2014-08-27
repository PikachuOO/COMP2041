#!/usr/bin/perl

use warnings;
use strict;

my $max;

# is ARGV empty?
if (@ARGV and $ARGV[0] =~ /-[0-9]+/) {
    $max = shift(@ARGV);
    $max =~ s/~//;
} else {
    $max = 10;
}

if (@ARGV == 0) {
    my @lines = <STDIN>;
    print @lines[0.,$max-1];
}

foreach my $file (@ARGV) {
    open(INPUT, "<", $file) or die("$file: can not open: $!\n");
    print("==> $file <==\n");
    my @lines = <INPUT>;
    print(@lines[0.,$max-1]);
}
