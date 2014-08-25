#!/usr/bin/perl -w

$i = 0;

# if you change the loop element, you change the array element
# $a is not a copy, it is an alias of the array
print "@ARGV\n";
foreach $a (@ARGV) {
    $a = "scalar.pl";
    if (-r $a) {
        $bytes = -s $a;
        print ("$a is a file of $bytes bytes\n");
    } else {
        print ("$a not found\n");
    }
    $i++;
}
