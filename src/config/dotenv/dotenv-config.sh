#!/bin/bash

cat << "EOF"

-----------------------------

█▀▄ █▀█ ▀█▀ █▀▀ █▄░█ █░█
█▄▀ █▄█ ░█░ ██▄ █░▀█ ▀▄▀
EOF

# Substitute current environment with ohmyzsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove previous configuration
rm -rf ~/.zshrc ~/dotfiles

# Clone dotfiles
git clone git@github.com:droidpl/dotfiles.git ~/environment
cp -rf ~/environment/dotfiles ~/dotfiles
cp -rf ~/environment/.zshrc ~/.zshrc
cp -rf ~/environment/.vscode ~/.vscode

# Remove previous folders
rm -rf ~/environment
