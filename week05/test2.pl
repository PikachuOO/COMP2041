#!/usr/bin/perl

$a = "-10";
$a =~ s/-(\d+)/$1/;
print $a;
