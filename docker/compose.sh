#!/usr/bin/env sh
set -x

CURRENT_UID=$(id -u):$(id -g) docker-compose "$@"
