#!/bin/sh

# Downloads the mentioned factorio version in the current directory
# Checks for the SHAsum of the downloaded version as well

version="$1"
target_dir="$2"

echo "Downloading factorio version ${version} into ${target_dir}"

download_dir=$(mktemp -d)
download_name="factorio-server-${version}"

# 1 line = 1 shasum
# shasum file_name
shasum_url='https://factorio.com/download/sha256sums'

# TODO: Add checksumming
# TODO: Verify that the downloaded version doesn't already exist

echo "Downloading into ${download_dir}"

# Download packed archive
aria2c "https://factorio.com/get-download/${version}/headless/linux64" -o "${download_name}.tar.gz" -d "${download_dir}"

# Unzip it into our target directory
tar -xf "${download_dir}/${download_name}.tar.gz"

# Delete the packed archive
rm -f "${download_dir}/${download_name}.tar.gz"

# Move the unzipped version into our target directory
# mv $(echo ${download_dir}/*) "${target_dir}/${download_name}" >/dev/null
