#!/usr/bin/perl

use warnings;
use strict;

for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    my ($last, $curr) = 0;
    while ($webcontent =~ /Lecture[^<]*?<\/a>.*?([SX][12])(.*?<td class=){5}.*?>([^<]*?)</sg and $3) {
        print $last = $curr if (($curr = "$course: $1 $3\n") ne $last);
    }
}
