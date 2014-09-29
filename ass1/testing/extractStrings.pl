#!/usr/bin/perl

#  extractStrings.pl
#  extract all the strings in a python program
#
#  Created by Callum Howard on 29/09/2014.
#

use warnings;
use strict;

my $pythonSrc;
my $extractedString;
$pythonSrc .= $_ while (<>);
print $_,"\n" for $pythonSrc =~ /\'(.*?)\'/sg;
print "\n";
print $_,"\n" for $pythonSrc =~ /\"(.*?)\"/sg;