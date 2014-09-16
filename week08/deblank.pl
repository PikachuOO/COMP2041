#!/usr/bin/perl -i
while (<>) {
    # if it's a line of spaces, remove it
    print if !/^\s"$/;
}
