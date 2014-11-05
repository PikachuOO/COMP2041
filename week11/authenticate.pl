#!/usr/bin/perl

use warnings;
use strict;

print "username: ";
my $inUser = <>;
chomp $inUser;
print "password: ";
my $inPass = <>;

open (my $file, '<', "users/$inUser.password") or die "Unkown username!\n";
my $pass = <$file>;

if ($inPass eq $pass) {
    print "You are authenticated.\n" ;
} else {
    print "Incorrect password!\n";
    print "$inPass ne $pass\n";
}
