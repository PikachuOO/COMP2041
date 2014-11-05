#!/usr/bin/perl

use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use CGI::Pretty;

print header;
print start_html;
warningsToBrowser(1);

my ($inUser, $inPass);
$inUser = param("inUser") if defined param("inUser");
$inPass = param("inPass") if defined param("inPass");


# if username and password have been entered
if (defined $inUser && defined $inPass) {
    open (my $file, '<', "users/$inUser.password") or (print "Unkown username!\n", end_html and exit);
    my $pass = <$file>;
    chomp $pass;

    if ($inPass eq $pass) {
        print "You are authenticated.\n" ;
    } else {
        print "Incorrect password!\n";
    }

} else {
    print start_form;

    if (defined $inUser) { 
        print 'Password: ', textfield('inPass');
        printf '<input type="hidden" name="inUser" value="%s" />', $inUser;
    } else { 
        print 'Username: ', textfield('inUser');
    }
print end_form;
}

print end_html;

