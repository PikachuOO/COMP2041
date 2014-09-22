#!/usr/bin/perl
# program to establish a connection over a port

use warnings;
use IO:Soclet;

$server = IO::Socket::INET->new(LocalPort => 4242, Listen => SOMAXCONN) or die;

while ($c = $server->accept()) {
    my $request = <$c>;
    chomp $request;
    my ($method, $path, $protocol) = split /\s+,$request;
    print STDERR "request=$request";
    open F, $request;
    print $c "Content-type: text/html\n\n";
    print $c <F>;
    close $c;
}
