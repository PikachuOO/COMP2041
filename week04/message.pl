#!/usr/bin/perl

$message = "Callum Rocks";
print "You should know: $message\n";

$s = "a";
while ($i < 30) { #i starts as 0
    print length $s, "\n";
    $s = $s.$s;  #C: realloc strcopy etc
    $i++;
}
