#!/usr/bin/perl

use warnings
#use strict

open F, "date|" or die;

$date = <F>;
chomp $date;
if ($date =~ (\d\d\d\d/) *$/) {
    $year = $1;
} else {
    die "could not find a uear in $date"
}
$year =~ s/\s*$//;
$year =~ s/.*\s//;
print "year='$year'\n";
