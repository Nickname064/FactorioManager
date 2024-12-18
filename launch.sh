#!/bin/sh

[ $# -ne 2 ] && {
	echo "Use: $0 [server_folder] [save_folder]" >&2;
	exit 1;
}

SERVER_DIR="$1";
PACKAGE_DIR="$2"

exe="${SERVER_DIR}/bin/x64/factorio"
save="${PACKAGE_DIR}/save.zip"
settings="${PACKAGE_DIR}/server-settings.json"

# Launch factorio server
"$exe" --sync-mods "$save" --server-settings "$settings" --start-server "$save"
