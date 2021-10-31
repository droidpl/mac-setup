#!/bin/bash

# Load environment variables
source .env

# Install homebrew
sh ./src/brew.sh

# Install apps
sh ./src/apps/chrome.sh
sh ./src/apps/vscode.sh
sh ./src/apps/iterm.sh
sh ./src/apps/slack.sh
sh ./src/apps/zoom.sh
sh ./src/apps/postman.sh

# Command line tools
sh ./src/apps/brew-apps.sh
sh ./src/apps/flutter.sh
sh ./src/apps/nodejs.sh

# Git and GitHub
sh ./src/config/git/git-config.sh

# Dotenv
sh ./src/config/dotenv/dotenv-config.sh

# Bootstrap folders and personal elements
sh ./src/dock.sh
sh ./src/personalize.sh
