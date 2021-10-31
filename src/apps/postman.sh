#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█▀█ █▀█ █▀ ▀█▀ █▀▄▀█ ▄▀█ █▄░█
█▀▀ █▄█ ▄█ ░█░ █░▀░█ █▀█ █░▀█
EOF

mkdir -p /tmp/postman
curl -s -Lo /tmp/postman/Postman.zip https://dl.pstmn.io/download/latest/osx
unzip -q /tmp/postman/Postman.zip -d /tmp/postman
mv /tmp/postman/Postman.app /Applications/Postman.app
rm -rf /tmp/postman

