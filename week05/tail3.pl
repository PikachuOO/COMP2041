#!/usr/bin/perl

use warnings;
use strict;

my ($line, $file, $i, @a);

foreach $file (@ARGV[2..-1]) {
    open(F, '<', $file);

    print "==> $file <==";
    while ($line = <F>) {
        $a[$i++] = $line;
    }

    print @a[-5..-1];
}




