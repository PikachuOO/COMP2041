#!/usr/bin/perl 
use warnings;
use strict;

my ($line, $file, @lines);
my $num = shift @ARGV;
$num =~ /\d+/ or die "USAGE: ERROR";


foreach $file (@ARGV) {
    open (my $F, "<", $file) or die "ERROR";
    if ($#ARGV > 0) {
        print "==> $file <==";
    }
    while ($line = $F) {
        print @lines[$num..-1];
    }
}




