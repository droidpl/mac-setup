#!/bin/bash

cat << "EOF"

-----------------------------

█▀█ █▀▀ █▀█ █▀ █▀█ █▄░█ ▄▀█ █░░ █ ▀█ █ █▄░█ █▀▀
█▀▀ ██▄ █▀▄ ▄█ █▄█ █░▀█ █▀█ █▄▄ █ █▄ █ █░▀█ █▄█
EOF


# Make zsh the default shell in mac
chsh -s /bin/zsh
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

# Create the Development folder for the projects
mkdir -p ~/Development
chmod og-rwx ~/Development
