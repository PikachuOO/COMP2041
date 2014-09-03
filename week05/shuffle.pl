#!/usr/bin/perl

use warnings;
use strict;

my @lines = <>;

while (@lines) {
    print splice(@lines, int(rand(@lines+0)), 1);
}
