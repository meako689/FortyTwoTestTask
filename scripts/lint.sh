#!/bin/sh

fnd=$(find apps -type f -name "*.html" -name "*.css" -name "*.js")
[ "$fnd" ] && echo "apps shall not contain any static files." && exit 1

fnd=$(grep -rin --exclude="apps.py" "\bnoqa\b" apps)
if [ "$fnd" ]
then
    echo "WARNING: noqa statements were found"
    echo "${fnd}"
    exit 1
fi

flake8 apps
black apps
