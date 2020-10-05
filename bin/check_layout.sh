#!/bin/sh

fnd=$(find apps -type f -name "*.html")
[ "$fnd" ] && echo "Templates should be in /templates" && exit 1
fnd=$(find apps -type f -name "*.js" -o -name "*.css")
[ "$fnd" ] && echo "Assets should be in /assets" && exit 1
exit 0
