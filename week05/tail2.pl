#!/usr/bin/perl

use warnings;
use strict;

my $line;
my $i;
my @a;
while ($line = <STDIN>) {
    $a[$i++] = $line;
}

#while ($i-- > 0) {
#    print $a[$i];
#}

print $a[max];
