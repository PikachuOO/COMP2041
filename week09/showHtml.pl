


$raw $html = "<pre>\n";
$html;

while ($line = <>) {
    html.=$line; #append every line to html variable
    $line =~ s/</&lt/g;
    $line =~ s/>/&gt/g;

}
