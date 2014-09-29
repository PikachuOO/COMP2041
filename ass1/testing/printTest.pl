#!/usr/bin/perl

#  printTest.pl
#  test converting a print statement from python to perl
#
#  Created by Callum Howard on 29/09/2014.
#

use warnings;
use strict;

# print "Hello World"
# print "Hello World\n";
for <> {
    if ($_ =~ /"print"[\s]([\"\'])(.*?)\1/)) {
        
}