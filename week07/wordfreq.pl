#!/usr/bin/perl -w

foreach $line <> {
    $line = lc $line;
    for $word (split /\w+/, $line) {
        $word_count{$word}++;
    }
}

@words = keys %word_count;
@sorted words = sort {$a <=> $b} @words;

print "@words\n";

while (($k, $i) = each %word_count) {
    print "\n";
}
