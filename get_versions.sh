#!/bin/sh

# Versions are sorted in DESC order
# This includes the experimental release, which can be identified with `get_versions.sh`

curl https://factorio.com/download/archive/ | htmlq --text 'a.slot-button-inline' | sed 's/\s//g' | grep -v '^$' | sort -Vr
