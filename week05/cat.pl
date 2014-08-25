#!/usr/bin/perl -w

# "does this array have zero elements?"
#if (!@ARGV) {
#print <...
#}

foreach $arg (@ARGV) {
    open F, $arg or die;

    while ($line = <F>) {
        $line =~ s/(Ron|Harry|Dumbledore)/Hermione/g;
        print $line;
    }

    close F;
}
