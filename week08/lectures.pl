#!/usr/bin/perl

use warnings;
use strict;

for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    while ($webcontent =~ /(?=Lecture).*?(T|U)([12])(.*?<td){5}.*?>([MTWFS]\w\w\s.+?)</sg) {
        print "$course: S$2 $4\n" if $1 eq "T";
        print "$course: X$2 $4\n" if $1 eq "U";
    }
}
