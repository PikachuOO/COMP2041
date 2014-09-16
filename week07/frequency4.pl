#!/usr/bin/perl

use warnings;
use strict;

my %frequency;

for my $file (glob "poets/*.txt") {
    my ($c, $t, $poet, @w);
    open (F, "<", $file) or die "$0: $file: $!\n";

    # format file name for printing
    $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;

    for (<F>) {
        $t += @w = /([A-Z]+)/gi;
        $frequency{$poet}{lc $_}++ for @w;
    }

    $c = $frequency{$poet}{$ARGV[0]};
    printf "%4d/%6d = %.9f %s\n", $c, $t, $c/$t, $poet; 
}
