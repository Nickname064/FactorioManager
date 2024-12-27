#!/bin/sh

# Unregister this factorio manager instance, removing the symlink

source ./env.sh

echo "Removing the factorio-manager symlink (${FACTORIO_MANAGER_SYMLINK})";
rm "$FACTORIO_MANAGER_SYMLINK";
