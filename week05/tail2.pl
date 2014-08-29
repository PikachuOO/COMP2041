#!/usr/bin/perl

use warnings;
use strict;

my ($line, $i, @a);

while ($line = <>) {
    $a[$i++] = $line;
}

print @a[-5..-1];
