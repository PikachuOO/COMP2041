#!/usr/bin/perl

use warnings;
use strict;

#for word in line in file in argv
for my $inFile (@ARGV) {
    open (my $IF, "<", $inFile) or die "$0: $inFile: $!\n";
    my (%probsum, $file);
    my @words;
    for my $inWord (<$IF>) {
        push @words, $inWord =~ /[A-Za-z]+/g;
    }
    for my $word (@words) {
#calculate log prob
        print ".\n";
        for $file (glob "poets/*.txt") {
            my ($c, $t, $s);
            open (F, "<", $file) or die "$0: $file: $!\n";
            $t +=()= /[A-Za-z]+/g and $c +=()= /\b\Q$word\E\b/gi for <F>;
            $s = join("", $file =~ /[A-Z]\w+/g) and $s =~ tr/_/ /;
            $probsum{$s} += log(($c+1)/$t);
        }
    }
#find highest probability
    my @a = sort {$probsum{$a} <=> $probsum{$b}} keys(%probsum);
    print "$inFile most resembles the work of $a[-1]\n";
}
