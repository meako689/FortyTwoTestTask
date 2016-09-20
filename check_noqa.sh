#!/bin/sh

fnd=$(grep -ri "\bnoqa\b" apps fortytwo_test_task)

if [[ $fnd ]]; then
    echo "WARNING: noqa statements were found"
    exit 1
else
    exit 0
fi