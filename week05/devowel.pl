#!/usr/bin/perl

use warnings;
use strict;

#while (my $line = <>) {
while (<>) {
    s/[aeiou]//gi;
    print;
}
