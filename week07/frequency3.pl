#!/usr/bin/perl

use strict;
use warnings;

my %poets;
my %words;

for my $file (glob "poets/*.txt") {
    #count{$poet}{$word}++;
    open (my $F, "<", $file) or die "$0: $file: $!\n";
    my $poet;
    $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;

    
}
