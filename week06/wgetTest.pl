#!/usr/bin/perl

use warnings;
use strict;

my $string = '<p>Prerequisite: 75 in COMP1911 and COMP1921 or COMP1927';

while ($string =~ s/(?<=Prerequisite:).*?([A-Z]{4}\d{4})// ) {
    print $1,"\n";
}
