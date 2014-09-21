#!/usr/bin/perl

use warnings;
use strict;

my $url = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
my $webpage = `wget -q -O- $url`;
my %courses; $courses{$_} = 1 for ($webpage =~ /[A-Z]{4}\d{4}/g);
print join("\n", sort keys %courses),"\n";
