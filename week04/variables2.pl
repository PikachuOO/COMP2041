#!/usr/bin/perl -w
# -w prints all warnings

$count = 0;
while (<STDIN>) {
    $count++;
}

print "$count lines were read in\n";
