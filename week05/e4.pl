#!/usr/bin/perl -w

$i = 0;

# if you change the loop element, you change the array element
# $a is not a copy, it is an alias of the array
foreach $arg (@ARGV) {
    open F, $arg or die;
    @lines = <F>;
    close F;

    foreach $line (@lines) {
        $line =~ s/Harry/COMP2041/g;
        $line =~ s/Hermione/Harry/g;
        $line =~ s/COMP2041/Hermione/g;
    }
    print @lines;

    # equivalent of C assert
    open F, ">$arg" or die;
    print F @lines;
    close F;
}
