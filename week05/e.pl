#!/usr/bin/perl -w

$i = 0;
while ($i < @ARGV) {
    $a = $ARGV[$i];
    if (-r $a) {
        $bytes = -s $a;
        print ("$a is a file of $bytes bytes\n");
    } else {
        print ("$a not found\n");
    }
    $i++;
}
