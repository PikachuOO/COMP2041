#!/usr/bin/perl -w

$i = 0;

# '$#' is last element of an array
# for ($i=0; $i<=$#ARGV; $i++) {
# foreach $i (0,1,2) {
# foreach $i (0..(@ARGV-1)) {
foreach $a (@ARGV) {
    $a = $ARGV[$i];
    if (-r $a) {
        $bytes = -s $a;
        print ("$a is a file of $bytes bytes\n");
    } else {
        print ("$a not found\n");
    }
    $i++;
}
