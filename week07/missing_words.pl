#!/usr/bin/perl

open F1, "<$ARGV[0]" or die;
open F2, "<$ARGV[1]" or die;

for $word (<F1>) {
    chomp($word);
    push @file2, $word;
}

for $word (<F2>) {
    chomp($word);
    push @file2, $word;
}

%file1 = map {$_ => 1} @file;

for $word (keys %file1) {
    if (not $word ~~ @file2) {
        print $word, "\n";
    }
}
