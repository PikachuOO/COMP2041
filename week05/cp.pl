#!/usr/bin/perl -w

if (!open IN, "<$ARGV[0]") {
    die "$0 open failed of '$ARGV[0]': $!\n";
    exit 1;
}

# open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]" or die "$0: '$ARGV[1]' $!";

#while ($line = <IN>) {
#print OUT $line;
#}

#scalar value in an array context
print OUT <IN>;

close IN;
close OUT;
