#!/bin/bash
OLDIFS="$IFS"
IFS=':'
while read n p u g c d st; do
echo -e "User:$n\n\tPass:$p\n\tUID: $u\n\tGID:$g\n\tComment:$c\n\tHOME:$d\n\tShELL:$s"
done < /etc/passwd
IFS="$OLDIFS"

