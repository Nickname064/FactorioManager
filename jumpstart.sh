#!/bin/sh

# Launch a factorio server with the provided config and version

[ $# -ne 2 ] && {
	echo "Use: $0 [bundle_path] [factorio_version]" >&2;
	exit 1;
}

BUNDLE="$1"
FACTORIO_VERSION="$2";

WD="$(dirname $0)"

exe="${WD}/servers/factorio-server-${FACTORIO_VERSION}/bin/x64/factorio"
save="${BUNDLE}/save.zip"
settings="${BUNDLE}/server-settings.json"

if ! [ -f "$exe" ]; then
	echo -e "No Factorio server for version ${FACTORIO_VERSION}\nAre you sure this is a correct and downloaded factorio version ?" >&2;
	exit 1;
fi

# Launch factorio server
"$exe" --sync-mods "$save" --server-settings "$settings" --start-server "$save"
