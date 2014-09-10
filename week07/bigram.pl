

foreach $line <> {
    $line = lc $line;
    @words = plit /w+/, $line;
    for $word (@words) {
        $count{$last_word}{$word}++ if defined($last_word);
        $last_wrod = $word;
    }
}

for $word (keys %count) {
    print "$word ->\n";
    for $next_word (keys $count{$word}) {
        print "\t$next_word = ", $count{$word}{$next_word},"\n";
        if ($count{$word}{$next_word} > $most_common_count) {
            $most_common_count = $count{$word}{next_word};
            $most_common_next_word = $next_word;
        }
        $total_count += $count{$word}{}#...
    }
}
