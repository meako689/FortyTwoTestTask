#!/bin/sh

fnd=$(find apps -type f -name "*.html")
[ "$fnd" ] && echo "Keep your templates in root folder" && exit 1
fnd=$(find apps -type f -name "*.js" -o -name "*.css")
[ "$fnd" ] && echo "Keep your assets in root folder" && exit 1
exit 0
