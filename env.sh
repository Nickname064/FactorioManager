#!/bin/sh

# Does not do anything on its own, but contains variables that are shared between every script

FACTORIO_MANAGER_SYMLINK="$HOME/.factman"
SYSTEMD_SYMLINK="/etc/systemd/user/services"

MANAGER_DIR="$(dirname $0)"

SERVICES_FOLDER="${HOME}/.config/systemd/user"
SERVERS_FOLDER="${MANAGER_DIR}/servers"
