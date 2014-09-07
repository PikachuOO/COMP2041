#!/usr/bin/perl

use warnings;
use strict;

die "$0: invalid option -- $1\n" if (($ARGV[0] =~ /^-(\S+)/) and ($1 ne 'r'));
my $course = ($ARGV[1] or $ARGV[0]) and (@ARGV == 1 or @ARGV == 2) 
    or die "Usage: $0 [-r] <course-name>\n";
print $course,"\n";
