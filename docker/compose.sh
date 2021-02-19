#!/usr/bin/env sh
set -x
# If first argument 'exec' or 'run' adds --user flag, or sets CURRENT_UID flag so you can use it inside your scripts

G_U_ID=$(id -u):$(id -g)
FIRST_ARG=$1
shift
[ "$FIRST_ARG" = "exec" ] || [ "$FIRST_ARG" = "run" ] && FIRST_ARG="$FIRST_ARG --user $G_U_ID"
# shellcheck disable=SC2086
CURRENT_UID=$G_U_ID docker-compose $FIRST_ARG "$@"
