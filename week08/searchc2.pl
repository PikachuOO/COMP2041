#!use/bin/perl

$func = $ARGV[0];

foreach $file (glob "*.c") {
    open (my $F, "<", $file) or die;
    while ($line = <F>) {
        $line =~ s!\s*//.*!!;
        $line =~ s!/\*,*\*/!!;
        $line =~ s/".*"//;

        if ($line =~ /^(\w+)\s+(\w+)\s*\(\s*(.*)\s*\)/){
            print "function type=",$1,"\n";
            print "function type=",$2,"\n";

            $args = $3;
            if ($args =~ /^\s*$/) {
                print "no arguments";
            } else {
                @args = split /,/, $args;
                foreach $arg (@args) {
                    $arg =~ /\s*(\w+)\s+(\w+)/;
                    print "\targ type=",$1,"\n";
                    print "\targ type=",$2,"\n";
                }
            }
            print "\n";
    }
}

