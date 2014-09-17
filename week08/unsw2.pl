#!/usr/bin/perl

use warnings;
use strict;

open (my $F, "<", "/usr/share/dict/words") or die "ERROR\n";
my @words;
foreach (<$F>) {
    push @words, $_ if $_ =~ /^[a-z]+(u$|un$|uns$)|(^w|^sw|^nsw)[a-z]+$/g;
}

print @words+0," found:\n";

foreach my $word1 (@words) {
    chomp $word1;
    foreach my $word2 (@words) {
        chomp $word2;
        if (grep (/unsw/, $word1.$word2)) {
            print $word1." ".$word2,"\n";
        }
    }
}
