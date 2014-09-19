#!/usr/bin/perl

use warnings;
use strict;

for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    while ($webcontent =~
        /(?=Lecture<\/a>).*?([SX][12])(.*?<td){5}.*?>([MTWFS]\w\w\b.+?)</sg) {
        print "$course: $1 $3\n";
    }
}
