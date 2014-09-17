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
    next if $inFile eq "-d";
    my (%probSum, %wordList);
    open (my $IF, "<", $inFile) or die "$0: $inFile: $!\n";
    my @words;
    push @words, $_ =~ /[A-Z]+/gi for <$IF>;
    for my $word (@words) {
        $probSum{$_}+=$poetHash{$_}->getLogProb(lc $word) for keys %poetHash;
    }

    # find highest probability
    my @a = sort {$probSum{$b} <=> $probSum{$a}} keys(%probSum);
    if ($ARGV[0] eq "-d") {
        for my $poet (@a) {
            printf "$inFile: log_probability of %.1f for $poet\n", $probSum{$poet};
        }
}
    print "$inFile most resembles the work of ",$a[0];
    printf " (log-probability=%.1f)\n", $probSum{$a[0]};
}
