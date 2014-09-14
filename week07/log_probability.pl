#!/usr/bin/perl

for my $file (glob "poets/*.txt") {
    my ($c, $t, %s);
    open (F, "<", $file) or die "$0: $file: $!\n";
    $t +=()= /[A-Za-z]+/g and $c +=()= /\b\Q$ARGV[0]\E\b/gi for <F>;
    $s = join("", $file =~ /[A-Z]\w+/g) and $s =~ tr/_/ /;
    printf "log((%d+1)/%6d) = %8.4f %s\n", $c, $t, log(($c+1)/$t), $s; 
}
