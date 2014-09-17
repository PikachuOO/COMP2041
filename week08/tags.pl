#!/usr/bin/perl

$url = ARGV[0];

$source = `wget -q -O- '$url'` or die;
$source = lc $website;
$source =~ s/<!--.*?-->//g;

@tags = $source =~ /<[\s\/]*(\w+)/g;
foreach $tag (@tags) {
    $tagcount{$tag}++;
}

if ($sort_by_freq) {
    @tags = sort {$tagcount{$a} <=> $tagcount{$b}} keys %tagcount;
} else {
    @tags = sort keys %tagcount;
}

print "$_ $tagcount{$_}\n" foreach (@tags);
