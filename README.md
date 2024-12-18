# FactorioManager
*A simple manager for factorio servers*

# Requirements
- A POSIX shell interpreter (sh/bash/fish/...)
- `htmlq`
- `curl`
- `systemd` (if you want to use systemd services, not mandatory)

# Architecture

- Servers
    > Contains different versions of factorio (headless server version)
    > Save data is externalised, to make switching versions easier
- Mods
    > Contains mods for a specific version of factorio
    > Building in progress (needs to automate mod download and mod management)
- Services
    > To make server management easier, each configuration has a systemd service associated to it
    > This folder contains those services

# Individual Commands

- `env.sh`
    > Contains definitions of variables used in the other scripts, such as the systemd folder, the global symlink, etc
- `download.sh`
    > Downloads a specific version of x86 linux headless factorio directly from the factorio servers
    > The version (passed as an argument) must be a valid factorio version
- `get_downloaded_versions.sh`
    > Lists the installed factorio server versions
- `get_latest.sh`
    > Returns two factorio versions
    > - The latest experimental release
    > - The latest stable release
- `get_versions.sh`
    > Returns all valid downloadable factorio versions (experimental AND stable)
- `jumpstart.sh`
    > Launches a factorio configuration
- `launch.sh`
    > Launches a factorio configuration (deprecated)
- `register.sh`
    > Creates the required symlinks for factorio-manager to function
    > Should be done at install time and whenever the factorio-manager folder is moved / renamed
- `unregister.sh`
    > Deletes the symlinks required for factorio-manager to function
    > Will not delete any save data, game data, servers, mods, etc, just unlinks it from your system
    > Doing `unregister` then deleting the factorio-manager folder uninstalls factorio-manager
- `systemd_pack.sh`
    > Creates a systemd service from the provided bundle and version