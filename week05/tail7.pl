#!/usr/bin/perl 

use warnings;
use strict;

my ($line, $file, @lines, $num);

# squelch flag if given and set output size
if (@ARGV+0 and $ARGV[0] =~ /^-(\d+)$/) {
    $num = $1;
    shift @ARGV;
} else {
    $num = 10;
}

if (@ARGV+0 == 0) {
    # grab input from STDIN
    while ($line = <STDIN>) { push @lines, $line };
    print @lines[-$num..-1];
} else {
    # grab input from each file
    foreach $file (@ARGV) {
        open (my $F, "<", $file) or die "ERROR";
        if ($#ARGV >= 1) { print "==> $file <==\n" };
        while ($line = <$F>) { push @lines, $line };
        print @lines[-$num..-1];
    }
}

