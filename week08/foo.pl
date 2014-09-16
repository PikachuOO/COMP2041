
my $function = $ARGV[0] or die;

foreach my $c_file (glob "*.c") {
    open(F, "<", $c_file);

    while (my $line = <F>) {
        $line =~ s/\/\/.*//;        #comments of the form //
        $line =~ s/\/|\*.*?\*\///;  #comments of the form */
        $line =~ s/".*?"//;         #comments of the form /*

        $line =~ /\b$function\s*\(/ or next;
        print "$c_file:$. function $function ";

        if ($line =~ /...
    }
}
