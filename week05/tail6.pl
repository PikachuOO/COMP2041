#!/usr/bin/perl 
use warnings;
use strict;

my ($line, $file, @lines, $num);

($num) = (shift @ARGV) =~ /-(\d+)$/ or die "USAGE: ERROR";

foreach $file (@ARGV) {
    open (my $F, "<", $file) or die "ERROR";
    if ($#ARGV >= 1) { print "==> $file <==\n" };
    while ($line = <$F>) { push @lines, $line };
    print @lines[-$num..-1];
}

print @ARGV;
