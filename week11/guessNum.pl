#!/usr/bin/perl

my $upper = 100;
my $lower = 0;
my $guess = 0;
my $correct;

while (not $correct) {
    $guess = int($lower+abs(($upper-$lower)/2));
    print "Guess: ", $guess, "\n";
    print "[h/l/c]? ";
    my $input = <STDIN>;
    chomp $input;

    if      ($input eq "h") {
        $lower = $guess;
        
    } elsif ($input eq "l") {
        $upper = $guess;

    } elsif ($input eq "c") {
        $correct = 1;

    } else {
        print "[h/l/c]? \n";

    }

}

print "I win!\n";



