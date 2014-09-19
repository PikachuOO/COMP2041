#!/usr/bin/perl

use warnings;
use strict;
use List::MoreUtils qw/ uniq /;

my $url = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
my $webpage = `wget -q -O- $url`;
my @courses = $webpage =~ /[A-Z]{4}\d{4}/g;
print join("\n", uniq @courses),"\n";
