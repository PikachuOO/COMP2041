#!/usr/bin/perl

use warnings;
use strict;

my %lectures;

for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    my @times = $webcontent =~ /(?=Lecture).*?([MTWFS]\w+\s+\d\d:\d\d\s-\s\d\d:\d\d\s\(\w+:\d-\d,\d\d-\d\d\),?\s*)+/sg;
    for my $time (@times) {
        print "$course: S? $time\n";
    }

}


