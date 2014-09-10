

colours = ("John"=>"blue", "Anne"=>"red", "Andrew"=>"green");

printHash(%colours);

sub printHash {
    %hash = @_;
    while (($k, $i) = each %hash) {
        print $k,"->",$i,"\n";
    }
}
