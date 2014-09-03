

%course_names = ();
open F, "<course_codes" or die "$0: can not open course_codes: $!";

while ($line = <F>) {
    chomp $line;
    $line =~ /([^ ]+) (.+)/ or die "$0: bad line format '$line'";
    $course_names{$1} = $2;
}
close F;

while ($line = <>) {
    chomp $line;
    @line =~ s/\|.*//;  #@f = split /\|/, $line;
    #$course= $f[0];
    $enr($line)++;
}

foreach $course (sort keys %enr) {
    printf "%s has %4d studnets\n", $course_names{$course}, $enr{$course};
}
