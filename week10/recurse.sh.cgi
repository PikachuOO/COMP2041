#!/bin/bash

cat <<eof
Content-type: text/html

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Recurse</title>
    </head>
    <body>
eof

URN=`echo "$QUERY_STRING"|sed 's/[^0-9]//g'`
if test -z "$URN"
then
    URN=0
else
    URN=`expr $URN + 1`
fi

cat <<eof
        <b>Level $URN</b>: <a href="$SCRIPT_URI?$URN">Run me again</a>
    </body>
</html>
eof

