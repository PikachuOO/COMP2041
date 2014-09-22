#!/usr/bin/perl
# program to establish a connection over a port

use warnings;
use IO:Soclet;

$server = IO::Socket::INET->new(LocalPort => 4242, Listen => SOMAXCONN) or die;

while ($c = $server->accept()) {
    print $c "Content-type: text/html\n\n";
    print $c "<html>\n";
    print $c "<h1>Andrew Rocks!</h1>\n";
    close $c;
}
