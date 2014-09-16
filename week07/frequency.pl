#!/usr/bin/perl

for my $file (glob "poets/*.txt") {
    my ($c, $t, $s);
    open (F, "<", $file) or die "$0: $file: $!\n";
    $t +=()= /[A-Z]+/gi and $c +=()= /\b\Q$ARGV[0]\E\b/gi for <F>;
    $s = join("", $file =~ /[A-Z]\w+/g) and $s =~ tr/_/ /;
    printf "%4d/%6d = %.9f %s\n", $c, $t, $c/$t, $s; 
}
