#!/bin/sh

fnd=$(find apps -type f -name "*.html" -name "*.css" -name "*.js")
[ "$fnd" ] && echo "apps shall not contain any static files." && exit 1
exit 0
