#!usr/bin/perl

$n = $ARGV[0];

$lines = "";

$line .= <STDIN> foreach (1..$n);

print $lines;
