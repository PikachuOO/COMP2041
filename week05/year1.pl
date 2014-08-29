#!/usr/bin/perl -w

# <> specifies a stream
while ($line = <>) {
    chomp $line;
    $line =~ s/[^ ]* //;
    $line =~ s/[^ ]* //;
    $line =~ s/ .*//;
    next if $line !~ /\S/;
    print OUT $line, " ";
}
