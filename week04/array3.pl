#!/usr/bin/perl -w

@a = <STDIN>;


# attempts to read as many lines as it can from standard input
while ($i-- > 0) {
    print $a[$i];
}

# if you put an array in a scalar context, it gives you the length
$i = @a;

print "length = $i";
