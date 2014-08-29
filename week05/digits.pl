#!/usr/bin/perl

use warnings;
use strict;

while (<>) {
    s/[0-4]/\</g;
    s/[6-9]/\>/g;
    print;
}

