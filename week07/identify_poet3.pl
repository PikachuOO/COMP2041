#!/usr/bin/perl

use warnings;
use strict;


package PoetLookup;

sub new {
    my $class = shift
    my $self = {
        _file   => shift,
        _total  => 0,
        _freq   => {},
    };

    my ($logProb, @words);
    open (my $F, "<", $self->{_file}) or die "$0: $file: $!\n";

    for (<$F>) {
        $self->{_total} += @words = /([A-Z]+)/gi;
        $self->{_freq}{lc $_}++ for @words;
    }

    return bless $self, $class;
}

sub getLogProb {
    my ($self, $word) = @_;
    return log( ($self->{_freq}{$word}+1)/$total );
}

#--- end package PoetLookup


package main;

my %poetHash;

for $file (glob "poets/*.txt") {
    my ($poet);
    open (my $F, "<", $file) or die "$0: $file: $!\n";
    $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;
    
    $poetHash{$poet} = new PoetLookup($file);
}

#TODO up to here!!
for my $inFile (@ARGV) {
    open (my $IF, "<", $inFile) or die "$0: $inFile: $!\n";
    my @words = $inWord =~ /[A-Z]+/gi;
    

}

