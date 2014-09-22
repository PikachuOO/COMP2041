#!/usr/bin/perl
# program to establish a connection over a port

use warnings;
use IO:Soclet;

$server = IO::Socket::INET->new(LocalPort => 4242, Listen => SOMAXCONN) or die;

print "Access this server at http://localhost:2041/\n\n";

while ($c = $server->accept()) {
    my $request = <$c>;
    print "Connection from ", $c->peerhost, ": $request";
    print $c "HTTP/1.0 200 OK\n";
    print $c "Content-type: text/html\n\n";
    $request =~ /^GET (.+) HTTP\/1.[01]\s*$/;
    if (open F, "</var/www/$1") {
        print $c <F>;
    }
    close $c;
}
