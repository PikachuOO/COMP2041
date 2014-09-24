#!/usr/bin/perl

use warnings


cat <<eof
Content-type: text/html

<!DOCTYPE html>
<html lang="en">
<head></head>
<body>
<pre>
eof

echo $QUERY_STRING|sed 's/.*name=//;s/&.*/ Rocks/'

cat <<eof
</body>
</html>
eof
