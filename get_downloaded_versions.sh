#!/bin/sh

[ "$#" -ne 1 ] && {
	echo "Use: $(basename $0) [server-directory]" >&2;
	exit 1;
}

server_folder="$1"

"ls" "$server_folder" | sed -En 's/factorio-server-(.*)/\1/p' | sort -urV
