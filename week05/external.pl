#!/usr/bin/perl

use warnings
#use strict

open F, "date|" or die;

$year = <F>;
chomp $year;
$year =~ s/\s*$//;
$year =~ s/.*\s//;
print "year='$year'\n";
