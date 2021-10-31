#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█▀ █▀█ █▀▀ █▀▀ ▀█▀ ▄▀█ █▀▀ █░░ █▀▀
▄█ █▀▀ ██▄ █▄▄ ░█░ █▀█ █▄▄ █▄▄ ██▄
EOF

mkdir -p /tmp/spectacle
curl -s -Lo /tmp/spectacle/Spectacle.zip https://s3.amazonaws.com/spectacle/downloads/Spectacle+1.2.zip
unzip -q /tmp/spectacle/Spectacle.zip -d /tmp/spectacle
mv /tmp/spectacle/Spectacle.app /Applications/Spectacle.app
rm -rf /tmp/spectacle

# Run open to ensure it's executing
open /Applications/Spectacle.app