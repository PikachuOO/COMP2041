#!/usr/bin/perl

my %words

while my $line (<STDIN>) {
    foreach my $word ($line) {
        print $word;
        %words{$word}++;
    } 
}


