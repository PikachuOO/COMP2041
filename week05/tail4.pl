#!/usr/bin/perl

use warnings;
use strict;

my ($line, $file, $i, @files);
@files = @ARGV[2..-1];

foreach $file (@files) {
    open (F, "<", $file) or die "ERROR";
    while ($line = <F>) {
        print $line;
    }
}




