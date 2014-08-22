for i in *.jpg; 
do 
    display "$i"; 
    read -p "Address to e-mail this image to? " email
    read -p "Message to accompany image? " message
    echo "$message" | mutt -s "$i" -a "$i" -- "$email"
    echo "$i" sent to "$email"
done



