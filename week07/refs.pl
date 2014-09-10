#!/usr/bin/perl

$answer = 24;

$c = `$answer++`;
$b = \$answer;

print "asnwer=$answer\n";
$$b = 42;   # this is a reference
print "answer=$answer\n";
eval $c;
print "answer=$answer\n"
