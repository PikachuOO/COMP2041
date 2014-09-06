#!/usr/bin/perl

use warnings;
use strict;

my $course = $ARGV[0] or die "Usage: $0 <course-name>\n";
$course =~ /^([A-Z]{4}\d{4})$/ or die "$0: Invalid course format: $course\n";
my $urlU = "http://www.handbook.unsw.edu.au/undergraduate/courses/2014/$1.html";
my $urlP = "http://www.handbook.unsw.edu.au/postgraduate/courses/2014/$1.html";
my $string = (`wget -q -O- $urlU` or `wget -q -O- $urlP`) 
    or die "$0: Course not found: $course\n";
print uc $1, "\n" while ($string =~ s/(?<=equisite)[^<]*?(\b[A-Za-z]{4}\d{4}\b)//);
