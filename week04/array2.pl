#!/usr/bin/perl -w


while ($line = <STDIN>) {
    $a[$i++] = $line;
}

while ($i-- > 0) {
    print $a[$i];
}
