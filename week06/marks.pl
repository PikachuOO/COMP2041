#!/usr/bin/perl

use warnings;
use strict;

open (F, "<", "marks");

while (my $line = <F>) {
    my @arr = split (/ /, $line);
    print $arr[0];

    if ($arr[1] =~ /(\d\d|100)/) {
        if ($arr[1] < 50) {
            print " FL";
        } else if () {

        }
    } else {
        print "?? ($arr[1])";
    }

    print "/n";

    }
}
