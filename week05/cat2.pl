#!/usr/bin/perl -w

# "does this array have zero elements?"
#if (!@ARGV) {
#print <...
#}

foreach $arg (@ARGV) {
    open F, $arg or die;
    @lines = <F>;
    close F;

    foreach $line (@lines) {
        $line =~ s/Harry/COMP2041/g;
        $line =~ s/Ron/Hermione/g;
        $line =~ s/Dumbledore/Hermione/g;
    }
    print $line;

    close F;
}
