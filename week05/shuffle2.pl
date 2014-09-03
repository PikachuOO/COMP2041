#!/usr/bin/perl

use warnings;
use strict;

my @lines = <>;
my $min = 0;
my $max = $#lines;

while ($min <= $max) {
    my $rand = int(rand($max));
    @lines[$min, $rand] = @lines[$rand, $min]; 
    $min++;
}

print @lines;
print "\n";
