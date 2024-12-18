#!/bin/sh

# First line is the experimental release
# Second line is the stable release

curl -s https://factorio.com | htmlq --text 'dd.text-right' | sed 's/\s//g' | grep -v '^$' | sort -Vr
