#!/bin/sh

# Downloads the mentioned factorio version in the current directory
# Checks for the SHAsum of the downloaded version as well

version="$1"
target_dir="$2"

echo "Downloading factorio version ${version} into ${target_dir}"

download_dir=$(mktemp -d) # We download into a temporary dir, then extract the archive to the target dir
download_name="factorio-server-${version}"

# 1 line = 1 shasum
# shasum file_name
shasum_url='https://factorio.com/download/sha256sums'

# TODO: Add checksumming
# TODO: Verify that the downloaded version doesn't already exist

#rm -rf "${target_dir}/${download_name}";
#mkdir "${target_dir}/${download_name}" || { echo "Couldn't create directory for server"; exit 2; }

echo "Downloading into ${download_dir}"
mkdir "${target_dir}/${download_name}"

# Download packed archive
aria2c "https://factorio.com/get-download/${version}/headless/linux64" \
  -d "${download_dir}" \
  -o "${download_name}"

# Extract it
tar -xf "${download_dir}/${download_name}" \
  -C "${target_dir}/${download_name}" \
  --strip-components 1

# Delete the archive
rm -rf "${download_dir}"
