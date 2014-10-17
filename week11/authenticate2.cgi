#!/usr/bin/perl

use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use CGI::Pretty

print header;
warningsToBrowser(1);

my ($inUser, $inPass);
$inUser = param("inUser") if defined param("inUser");
$inPass = param("inPass") if defined param("inPass");

# if username and password have been entered
if (defined $inUser && defined $inPass) {
    open (my $file, '<', "users/$inUser.password");
    my $pass = <$file>;
    chomp $pass;

    if ($inPass eq $pass) {
        print "You are authenticated.\n" ;
    } else {
        print "Incorrect username or password!\n";
    }

} else {
    print start_form;

    if (defined $inUser) { 
        print 'Password: ', password_field(-name=>'inPass',-maxlength=>80);

        print hidden(-name=>'inUser',-value=>"$inUser", -override=>1);
        # equivalent to:
        #printf '<input type="hidden" name="inUser" value="%s" />', $inUser;

    } else { 
        print 'Username: ', textfield(-name=>'inUser',-maxlength=>80);
    }
print end_form;
}

print end_html;

