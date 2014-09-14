#!/usr/bin/perl

use warnings;
use strict;

for my $file (glob "poets/*.txt") {
    my ($c, $t, $s);
    open (F, "<", $file) or die "ERROR\n";
    $c +=()= /\b\Q$ARGV[0]\E\b/gi; $t +=()= /\w+/g for <F>;
    $s = join("", $file =~ /[A-Z]\w+/g);
    $s =~ tr/_/ /;
    printf "%4d/%6d = %.9f %s\n", $c, $t, $c/$t, $s; 
}
