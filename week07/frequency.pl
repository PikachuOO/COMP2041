

while (my $line = <>) {
    $line =~ tr/A-Z/a-z/;
    foreach my $word ($line =~ /[a-z]+/g) {
        $count{$word}++;
    }
}

my @words = keys($count);
my @sorted_words = sort({$count{$a} <=> $count{$b}} @words);

