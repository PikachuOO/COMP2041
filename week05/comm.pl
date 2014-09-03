#!/usr/bin/perl

use strict;
use warnings;

if (@ARGV+0 != 2) { die "Usage: $0 <file1> <file2>\n"; }

open (my $F1, "<", $ARGV[0]) or die "Can't open $ARGV[0]\n";
open (my $F2, "<", $ARGV[1]) or die "Can't open $ARGV[1]\n";

my $count = 0;
my @file1 = <$F1>;
my @file2 = <$F2>;
#if (<$F1> == <$F2>) { $count++; };

if (@file1+0 != @file2+0) { die "Files are different lengths\n"; }

my $i = 0;
while ($i < @file1-1) {
    if ($file1[$i] == $file2[$i]) { $count++; }
    $i++;
}
print "$count\n";
