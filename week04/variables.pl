#!/usr/bin/perl -w

while ("Callum Rocks") {
    $line = <STDIN>;

    if (!$line) {
        last;
    }
    
    $count++;
}

print "$count lines were read\n";
