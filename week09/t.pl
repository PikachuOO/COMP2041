#!/usr/bin/perl
# program to establish a connection over a port

use warnings;
use IO:Soclet;

$server = IO::Socket::INET->new(LocalPort => 4242, Listen => SOMAXCONN) or die;

while ($c = $server->accept()) {
    printf STDERR "[Connection from %s]\n", $c->peerhost;
    print $c scalar localtime,"\n";
    close $c;
}
