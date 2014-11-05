#!/usr/bin/perl

use warnings;
use strict;

use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use CGI::Pretty;
use POSIX qw/ceil/;


# HTML head
print header;
print start_html('A Guessing Game Player');
warningsToBrowser(1);

# if number has been correctly guessed
if (defined param('Correct?')) {
    print h1('I Win!');

} else {
    my $upper = 100;
    my $lower = 0;
    my $guess;

    $upper = param('upper') if (defined param('upper'));
    $lower = param('lower') if (defined param('lower'));

    $guess = ceil( ($lower + $upper)/2 );
    $guess = 0 if $guess == 1;
    $lower = $guess if (defined param('Higher?'));
    $upper = $guess if (defined param('Lower?'));
    $guess = ceil( ($lower + $upper)/2 );

    # HTML form
    print start_form;
    print p("My guess is: ", b($guess));
    print submit('Higher?'), submit('Correct?'), submit('Lower?');
    print hidden(-name=>'upper', -value=>$upper, -override=>1);
    print hidden(-name=>'lower', -value=>$lower, -override=>1);
    print end_form;

}

print end_html;
