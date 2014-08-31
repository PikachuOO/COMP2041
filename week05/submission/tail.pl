#!/usr/bin/perl 

use strict;
use warnings;
use diagnostics;

my $num = 10;

# squelch flag if given and set output size
if (@ARGV+0 and $ARGV[0] =~ /^-(\d+)$/) {
    $num = $1;
    shift @ARGV;
}

if (@ARGV+0 == 0) {
    push my @lines, <STDIN>;
    print @lines[-$num..-1];
} else {
    foreach my $file (@ARGV) {
        open (my $F, "<", $file) 
            or print "$0: can't open $file\n" and next;
        print "==> $file <==\n" if ($#ARGV >= 1);
        push my @lines, <$F>;
        if ($num < @lines+0) {
            print @lines[-$num..-1];
        } else {
            print @lines;
        }
    }
}
