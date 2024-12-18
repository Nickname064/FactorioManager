#!/bin/sh

# Auto-generate systemd services for factorio server configs

# 1: Systemd folder (we need to have rights to write to that folder)
# 2: Bundle path
# 3: Server version
# 4: UID (config name)

[ "$#" -ne 4 ] && {
	echo "Usage: $0 [systemd_folder] [bundle] [server version] [config name]" >&2;
	exit 1;
}

systemd_folder="$1"
bundle_path="$2"
server_version="$3"
config_uid="$4"

systemd_filename="factorio_${config_uid}.service"
systemd_service="${systemd_folder}/${systemd_filename}"

# TODO: Check that the provided version is a correct server version
# TODO:  Check that the bundle is a valid factorio bundle 

# Check that there isn't already a config with the same name
[ -f "${systemd_service}" ] && {
	echo "A config with the name ${config_uid} already exists." >&2;
	exit 2;
}

# Generate the systemd service
cat > "test.service" << EOF
# This file was generated with factorio_pack.sh
# Do not edit the path to FactorioManager, or move FactorioManager, or the links will be broken

[Unit]
Description= Launch a Factorio server with the "${config_uid}" config
After= network.target
StartLimitIntervalSec=0

[Service]
ExecStart=/home/user/FactorioManager/jumpstart.sh "$bundle_path" "$server_version"
User=user
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF
