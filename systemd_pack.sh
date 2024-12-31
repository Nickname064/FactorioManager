#!/bin/sh

# Auto-generate systemd services for factorio server configs

# 1: Bundle path
# 2: Server version
# 3: UID (config name)

[ "$#" -ne 3 ] && {
	echo "Usage: $0 [bundle] [server version] [config name]" >&2;
	exit 1;
}


# Import global symbols
source ./env.sh

bundle_path=$(realpath "$1")
server_version="$2"
config_uid="$3"

systemd_filename="factorio_${config_uid}.service"
systemd_service="${SERVICES_FOLDER}/${systemd_filename}"

# TODO: Check that the provided version is a correct server version
# TODO:  Check that the bundle is a valid factorio bundle 

# Check that there isn't already a config with the same name
[ -f "${systemd_service}" ] && {
	echo "A config with the name ${config_uid} already exists." >&2;
	exit 2;
}

# Generate the systemd service
cat > "${systemd_service}" << EOF
# This file was generated with factorio_pack.sh
# Do not edit the path to FactorioManager, or move FactorioManager, or the links will be broken

[Unit]
Description= Launch a Factorio server with the "${config_uid}" config
After= network.target
StartLimitIntervalSec=0

[Service]
ExecStart=${FACTORIO_MANAGER_SYMLINK}/jumpstart.sh "$bundle_path" "$server_version"
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF
