#!/usr/bin/perl

use warnings;
use strict;

for $file in <F> {
    open(INPUT, "<", $file) or die("$file: can not open: $!\n");
    print("==> $file <==\n");
    my @lines = <INPUT>;
    print(@lines[$max-11..$max-1]);
}
