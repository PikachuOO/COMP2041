#!/usr/bin/perl

use warnings;
use strict;

our $domain = "www.handbook.unsw.edu.au";
our $year = 2014;
our %courses;
our $rFlag = 0;

$! = 1;

die "$0: invalid option -- $1\n" if (($ARGV[0] =~ /^-(\S+)/) and ($1 ne 'r'));
$rFlag = 1 if ($ARGV[0] eq "-r");

my $course = ($ARGV[1] or $ARGV[0]) and (@ARGV == 1 or (@ARGV == 2 and $rFlag))
    or die "Usage: $0 [-r] <course-name>\n";
$course =~ /^[A-Z]{4}\d{4}$/ or die "$0: Invalid course format: $course\n";

getPrereqs($course);
print "$_\n" foreach sort keys(%courses);
exit 0;


sub getPrereqs {
    my $course = $_[0];
    my $found = 0;
    my $content;

    foreach my $career ("undergraduate","postgraduate") {
        my $url = "http://$domain/$career/courses/$year/$course.html";
        $content .= `wget -q -O- $url`; 
        $found = ($found or not$?); $! = 1;
    }

    die "$0: Course not found: $course\n" if (!$found and !$rFlag);
    while ($content =~ s/(?<=equisite)[^<;\.]*?([A-Za-z]{4}\d{4})//) {
        $courses{uc $1} = 0;
    }
    foreach my $var (keys(%courses)) {
        if ($courses{$var} == 0) {
            $courses{$var} = 1;
            getPrereqs($var) if $rFlag;
        }
    }
    return;
}

