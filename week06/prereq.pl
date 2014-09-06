#!/usr/bin/perl

use warnings;
use strict;

my $course = $ARGV[0] or die "Usage: $0 <course-name>\n";
$course =~ /^([A-Z]{4}\d{4})$/ or die "Invalid course format: $course\n";
my $urlU = "http://www.handbook.unsw.edu.au/undergraduate/courses/2014/$1.html";
my $urlP = "http://www.handbook.unsw.edu.au/postgraduate/courses/2014/$1.html";
my $string = `wget -q -O- $urlU $urlP`;

while ($string =~ s/(?<=Prerequisite:).*?([A-Z]{4}\d{4})// ) {             
    print $1,"\n";
}

