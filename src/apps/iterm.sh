#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█ ▀█▀ █▀▀ █▀█ █▀▄▀█
█ ░█░ ██▄ █▀▄ █░▀░█
EOF

mkdir -p /tmp/iterm
curl -s -Lo /tmp/iterm/iterm.zip https://iterm2.com/downloads/stable/latest
unzip -q /tmp/iterm/iterm.zip -d /tmp/iterm
mv /tmp/iterm/iTerm.app /Applications/iTerm.app
rm -rf /tmp/iterm
