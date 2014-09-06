#!/usr/bin/perl

use warnings;
use strict;

my $domain="www.handbook.unsw.edu.au";
my $year=2014;

my $found=0;
my $content;

my $course = $ARGV[0] or die "Usage: $0 <course-name>\n";
$course =~ /^[A-Z]{4}\d{4}$/ or die "$0: Invalid course format: $course\n";

foreach my $career ("undergraduate","postgraduate") {
    my $url = "http://$domain/$career/courses/$year/$course.html";
    $content .= `wget -q -O- $url`; 
    $found += $?;
}

die "$0: Course not found: $course\n" if (!$found);
print uc $1,"\n" while ($content =~ s/(?<=equisite)[^<]*?(\b[A-Za-z]{4}\d{4}\b)//);
