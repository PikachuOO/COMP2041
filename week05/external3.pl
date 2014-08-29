#!/usr/bin/perl

use warnings
#use strict

open F, "date|" or die;

$date = <F>;
chomp $date;
$date =~ / (\d{4}*$/ or die "could not find a year in $date";
$year = $1;
print "year='$year'\n";
