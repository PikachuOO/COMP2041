#!/usr/bin/perl

open F, "wget -q -O- $ARGV[0]|"  or die "a horrible death\n";

for $line (<F>) {
    while ($line =~ /(([0-9][ -]*{8,15})/g)) {
        print $1,"\n";
    }
}
