#!/usr/bin/env sh
set -x
./docker/compose.sh exec --user "$(id -u)":"$(id -g)" "$@"
