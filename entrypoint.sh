#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR="/home/steam/Steam/steamapps/common/Project Zomboid Dedicated Server"

if [ ! -f "$INSTALL_DIR/start-server.sh" ]; then
    /home/steam/steamcmd/steamcmd.sh \
        +login anonymous \
        +app_update 380870 -beta unstable validate \
        +quit
fi

ADMINPASSWORD="${ADMINPASSWORD:-}"
SERVERNAME="${SERVERNAME:-}"

args=()

if [[ -n "${ADMINPASSWORD}" ]]; then
    args+=("-adminpassword" "${ADMINPASSWORD}")
fi

if [[ -n "${SERVERNAME}" ]]; then
    args+=("-servername" "${SERVERNAME}")
fi

cd "$INSTALL_DIR"

exec "bash start-server.sh" "${args[@]}" "$@"
