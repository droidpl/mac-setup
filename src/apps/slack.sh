#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█▀ █░░ ▄▀█ █▀▀ █▄▀
▄█ █▄▄ █▀█ █▄▄ █░█
EOF

curl -s -Lo /tmp/Slack.dmg https://downloads.slack-edge.com/releases/macos/4.21.1/prod/universal/Slack-4.21.1-macOS.dmg;
hdiutil attach /tmp/Slack.dmg;
cp -rf /Volumes/Slack/Slack.app  /Applications/Slack.app;
hdiutil detach /Volumes/Slack;
rm /tmp/Slack.dmg;