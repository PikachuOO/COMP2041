#!/usr/bin/perl

use warnings;
use strict;

my %hash;

$hash{COMP1927} = 1;
$hash{COMP2041} = 1;

$hash{COMP1927} = 1;

$hash{MATH2911} = 1;

print ("$_\n") foreach keys(%hash);

print "\n";
print (shift keys(%hash));
print "\n";

print ("$_\n") foreach keys(%hash);
