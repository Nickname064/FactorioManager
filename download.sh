#!/bin/sh

# Downloads the mentioned factorio version in the current directory
# Checks for the SHAsum of the downloaded version as well

[ "$#" -ne 2 ] && {
	echo "Usage: $0 [version] [target_directory]" >&2;
	exit 1;
}

version="$1"
target_dir="$2"

echo "Downloading factorio version ${version} into ${target_dir}"

# We download into a temporary directory
download_dir=$(mktemp -d)
download_name="factorio-server-${version}"
downloaded_archive="${download_name}.tar.gz"

curr_dir=$(pwd)

# 1 line = 1 shasum
# shasum file_name
shasum_url='https://factorio.com/download/sha256sums'

# TODO: Add checksumming
# TODO: Verify that the downloaded version doesn't already exist

echo "Downloading into ${download_dir}"

# Download packed archive
aria2c -o "${downloaded_archive}" -d "${download_dir}" "https://factorio.com/get-download/${version}/headless/linux64"

cd "${download_dir}"

# Unzip it
tar -xf "${downloaded_archive}"

cd "${curr_dir}"

# Delete the packed archive (to select everything with *)
rm -f "${download_dir}/${download_name}.tar.gz"

# Move the unzipped version into our target directory
mv $(echo "${download_dir}/*") "${target_dir}/${download_name}"

# TODO: Remove when replaced with mktemp
rm -rf "${download_dir}"
