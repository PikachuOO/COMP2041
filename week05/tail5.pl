#!/usr/bin/perl 
use warnings;
use strict;

my ($line, $file, @lines);
my ($num) = (shift @ARGV) =~ /-(\d+)$/ or die "USAGE: ERROR";

print "$num\n";
print "@ARGV\n";
print @ARGV+0;
print "\n";

foreach $file (@ARGV) {
    open (my $F, "<", $file) or die "ERROR";
    if (@ARGV+0) {
        print "==> $file <==";
    }
    while ($line = <$F>) {
        push @lines, $line;
    }
    print @lines[-$num..-1];
}
