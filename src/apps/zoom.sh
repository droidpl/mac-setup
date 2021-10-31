#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

▀█ █▀█ █▀█ █▀▄▀█
█▄ █▄█ █▄█ █░▀░█
EOF

curl -s -Lo /tmp/Zoom.pkg https://cdn.zoom.us/prod/5.8.3.2240/Zoom.pkg
sudo installer -pkg /tmp/Zoom.pkg -target /
rm /tmp/Zoom.pkg;