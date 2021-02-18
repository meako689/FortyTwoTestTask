#!/bin/sh

fnd=$(grep -rin --exclude="apps.py" "\bnoqa\b" apps)

if [ "$fnd" ]; then
    echo "WARNING: noqa statements were found"
    echo "${fnd}"
    exit 1
else
    exit 0
fi
