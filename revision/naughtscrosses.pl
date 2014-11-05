#!/usr/bin/perl

#  naughtscrosses.pl
#
#  A game of naughts and crosses
#  Callum Howard 2014
#
#  -------------
#  | 1 | 2 | 3 |
#  -------------
#  | 4 | 5 | 6 |
#  -------------
#  | 7 | 8 | 9 |
#  -------------
#

use strict;
use warnings;

my  $boardSize = 4;
our $cols = $boardSize;
our $rows = $boardSize;
our @buffer;
our $o = "\033[1;32m O\033[0m";
our $x = "\033[1;31m X\033[0m";
our $space = length($rows*$cols);
our $valid;
my  $player = 1;


# initialise board buffer with blank spaces
for (my $i=0; $i<$cols; $i++) {
    for (my $j=0; $j<$rows; $j++) {
        my $pos = getPos($j, $i);
        if ($space == 1) {
            setPos($pos, sprintf("\033[1;30m%d\033[0m", eval($pos+1)));
        } elsif ($space == 2) {
            setPos($pos, sprintf("\033[1;30m%2d\033[0m", eval($pos+1)));
        } else {
            die "Can't display board";
        }
    }
}

# game loop
while ( not isComplete() ) {
    print "\n";
    printBoard();
    print "\n";
    
    # get user's move
    my $aPos = 0;
    while ( not $valid ) {
        print "Invalid move!\n" if not $valid and defined $valid;
        print "Player 1's move: " if $player == 1;
        print "Player 2's move: " if $player == 2;
        $aPos = <STDIN>;
        $aPos-- if ($aPos =~ /^\d+$/);
        $valid = validAPos($aPos);
    }
    
    # make move and toggle turn
    if ($player == 1) {
        setPos($aPos, $o);
        $player = 2;
    } else {
        setPos($aPos, $x);
        $player = 1;
    }
}

print "\n";
printBoard();
print "\n";
print "Draw, nobody wins\n";

exit 0;


sub printBoard {
    printDiv();

    # for every row
    for (my $j=0; $j<$rows; $j++) {
        print "| ";

        # for every column
        for (my $i=0; $i<$cols; $i++) {
            my $pos = getPos($j, $i);
            printf "%s | ", $buffer[$pos];
        }

        print "\n";
        printDiv();
    }

}

sub printDiv {
    # div size is 4*COL+1
    for (my $i=0; $i<$cols; $i++) {
        print "----";
        print "-" if $space == 2;
    }
    print "-\n";
}

# given row and col return pos (index for buffer)
sub getPos {
    my $row = shift @_;
    my $col = shift @_;
    return ($row*$rows)+$col;
}

# set marker
sub setPos {
    my $aPos = shift @_;
    my $marker = shift @_;
    $buffer[$aPos] = $marker if $space eq 1;
    $buffer[$aPos] = sprintf("%2s", $marker) if $space eq 2;
}

sub isComplete {
    # check if every spot is filled
    for (@buffer) {
        return 0 if (not $_ ~~ $x) and (not $_ ~~ $o);
    }
    return 1;
}

sub validAPos {
    my $aPos = shift @_;
    chomp $aPos;

    if ($aPos !~ /^\d+$/) {
        # exit query
        if ($aPos eq "q") {
            print "Are you sure you want to quit? [y/n]: ";
            my $ans = lc <STDIN>;
            chomp $ans;
            while (not $ans ~~ "y" and not $ans ~~ "n") {
                print "Please enter 'y' or 'n': ";
                $ans = lc <STDIN>;
                chomp $ans;
            }
            exit 0 if $ans ~~ "y";
            undef $valid;
        }
        $aPos = 0;
    }

    return (
        $aPos >= 0 and 
        $aPos < $rows*$cols and 
        $buffer[$aPos] ne $x and 
        $buffer[$aPos] ne $o
    );
}
