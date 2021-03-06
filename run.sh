#!/usr/bin/env bash

set -e
set -o pipefail

SCRIPT_DIR="$(readlink -f "$0" | xargs dirname)"

NAME_TAG="revelation:latest"

pushd "$SCRIPT_DIR"

docker build \
    -t "$NAME_TAG" \
    .
docker run \
    -it --rm \
    --user="$(id -u $USER):$(id -g $USER)" \
    --env="DISPLAY" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --workdir="/home/$USER" \
    "$NAME_TAG" \
    "$@"

popd

