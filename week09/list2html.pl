#!/usr/bin/perl

use warnings;
use strict;

sub list2html {
    my @list = @_;

    return "" if !@list;
    return "<ul>\n<li>".join("</li>\n<li>", @list)."</li>\n</ul>\n";
}

print list2html("The", "Quick", "Brown", "Fox");
