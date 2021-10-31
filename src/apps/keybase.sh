#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█▄▀ █▀▀ █▄█ █▄▄ ▄▀█ █▀ █▀▀
█░█ ██▄ ░█░ █▄█ █▀█ ▄█ ██▄
EOF

curl -s -Lo /tmp/Keybase.dmg https://prerelease.keybase.io/Keybase.dmg;
hdiutil attach /tmp/Keybase.dmg;
cp -rf /Volumes/Keybase\ App/Keybase.app  /Applications/Keybase.app;
hdiutil detach /Volumes/Keybase\ App;
rm /tmp/Keybase.dmg;

open /Applications/Keybase.app