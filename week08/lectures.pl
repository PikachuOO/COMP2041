#!/usr/bin/perl

use warnings;
use strict;

for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    print "$course: S$1 $3\n" while $webcontent =~ /(?=Lecture).*?T([12])(.*?<td){5}.*?>(.*?)</sg and $3;
}
