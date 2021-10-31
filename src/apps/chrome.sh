#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█▀▀ █░█ █▀█ █▀█ █▀▄▀█ █▀▀
█▄▄ █▀█ █▀▄ █▄█ █░▀░█ ██▄
EOF

# This script will download and install Google Chrome on a fresh installation of Mac OS X.
# Gist: https://gist.github.com/feniix/92a1f20eae13cde17821
curl -s -Lo /tmp/Google\ Chrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg;
hdiutil attach /tmp/Google\ Chrome.dmg;
cp -rf /Volumes/Google\ Chrome/Google\ Chrome.app  /Applications/Google\ Chrome.app;
hdiutil detach /Volumes/Google\ Chrome;
rm /tmp/Google\ Chrome.dmg;
