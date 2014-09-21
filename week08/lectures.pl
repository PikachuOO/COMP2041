#!/usr/bin/perl

use warnings;
use strict;

my $formatFlag = shift @ARGV if $ARGV[0] =~ /-d/;
for my $course (@ARGV) {
    my $url = "http://www.timetable.unsw.edu.au/current/$course.html";
    my $webcontent = `wget -q -O- $url`;
    my ($last, $curr) = 0;
    while ($webcontent =~ /Lecture[^<]*?<\/a>.*?([SX][12])(.*?<td class=){5}.*?>([^<]*?)</sg and $3) {
        $curr = "$course: $1 $3\n";
        my $sem = $1;
        if (defined $formatFlag and $curr ne $last) {
            my @info = $curr =~ /(([MTWFS]\w\w),\s)?([MTWFS]\w\w)\s0?([1-9]?\d):\d\d\s-\s0?([1-9]?\d)/g;
            while (@info) {
                print "$sem $course $info[2] ",$info[3]++,"\n" while ($info[3] < $info[4]);
                shift @info for (1..3);
            }
        } else {
            print $curr if $curr ne $last;
        }
        $last = $curr;
    }
}
