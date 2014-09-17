#!/usr/bin/perl

use warnings;
use strict;


package PoetLookup;

sub new {
    my $class = shift;
    my $self = {
        _file   => shift,
        _total  => 0,
        _freq   => {},
    };

    my ($logProb, @words);
    open (my $F, "<", $self->{_file}) or die "$0: $self->{_file}: $!\n";

    for (<$F>) {
        $self->{_total} += @words = /([A-Z]+)/gi;
        $self->{_freq}{lc $_}++ for @words;
    }

    return bless $self, $class;
}

sub getLogProb {
    my ($self, $word) = @_;
    $word = "mortality";
    $self->{_freq}{$word} = 0 if not defined $self->{_freq}{$word};
    return log( ($self->{_freq}{$word}+1)/$self->{_total} );
}

#--- end package PoetLookup


package main;

# initialise hash table
my %poetHash;
for my $file (glob "poets/*.txt") {
    my $poet;
    open (my $F, "<", $file) or die "$0: $file: $!\n";
    $poet = join("", $file =~ /[A-Z]\w+/g) and $poet =~ tr/_/ /;
    $poetHash{$poet} = new PoetLookup($file);
}


# calculate log probability
for my $inFile (@ARGV) {
    my (%probSum, %wordList);
    open (my $IF, "<", $inFile) or die "$0: $inFile: $!\n";
    my @words;
    push @words, $_ =~ /[A-Z]+/gi for <$IF>;
    for my $word (@words) {
        $wordList{lc $word}++;
    }
    for my $word (keys %wordList) {
        $probSum{$_}+=$poetHash{$_}->getLogProb(lc $word) for keys %poetHash;
    }

    # find highest probability
    my @a = sort {$probSum{$a} <=> $probSum{$b}} keys(%probSum);
    for my $poet (@a) {
        print "$inFile: log_probability of $probSum{$poet} for $poet\n";
    }
    print "$inFile most resembles the work of ",$a[-1];
    printf " log-probability=%8.4f\n", $probSum{$a[-1]};
}
