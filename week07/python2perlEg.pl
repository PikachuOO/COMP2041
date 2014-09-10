#!/usr/bin/perl

while ($line = <>) {
    $line =~ s/([a-z]+)/\$$1/g;
    print $line;
}
