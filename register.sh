#!/bin/sh

# Register this FactorioManager instance

# Import globals
source ./env.sh

echo "Registering Factorio Manager..."

# Creating symlink to factorio-manager.
ln -sf "$(realpath $(dirname $0))" "${FACTORIO_MANAGER_SYMLINK}" || {
	echo "Could not create symlink to ${FACTORIO_MANAGER_SYMLINK}" >&2;
	exit 1
}

# Folder to put our systemd entries into
echo "Creating systemd services folder..."
[ -d "$SERVICES_FOLDER" ] || mkdir -p "${SERVICES_FOLDER}" || {
	echo "Couldn't create services folder" >&2;
	exit 1;
}
