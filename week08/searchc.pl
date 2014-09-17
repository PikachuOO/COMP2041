#!use/bin/perl

$func = $ARGV[0];

foreach $file (glob "*.c") {
    open (my $F, "<", $file) or die;
    i@lines = <F>;
    foreach $line (@lines) {
        $line =~ s!\s*//.*!!;
        $line =~ s!/\*,*\*/!!;
        $line =~ s/".*"//;

        if ($line =~ /\b$funct\s*(/){
            if ($line =~ /^\s+/) {
                print "$file:$. function $func used";
            } else {
                # $. is the current line in the current file
                print "$file:$. function $func defined";
            }
        }
    }
}

