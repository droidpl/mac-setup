#!/bin/bash

cat << "EOF"

-----------------------------
Installing Brew Basics

█▄▄ ▄▀█ █▀ █ █▀▀   ▀█▀ █▀█ █▀█ █░░ █▀
█▄█ █▀█ ▄█ █ █▄▄   ░█░ █▄█ █▄█ █▄▄ ▄█
EOF

# GNU libs
echo "Installing GNU lib essentials..."
brew install libzip gnutls libgpg-error nettle sqlite libidn2 pkg-config stow coreutils libksba npth gdbm icu4c libtasn1 gettext libassuan libunistring openssl readline unbound libevent libusb openssl@1.1 xz gmp libffi libyaml p11-kit

cat << EOF >> ~/.zshrc_local
# Adds essential tools to the toolchain
export PATH="/usr/local/opt/icu4c/bin:\$PATH"
export PATH="/usr/local/opt/openssl@3/bin:\$PATH"
EOF
source ~/.zshrc_local


# Languages
echo "Installing languages..."
brew install sbt ansible rbenv ruby-build go python

# Utils
echo "Installing utilities..."
brew install tldr
brew install ngrok

cat << "EOF"

-----------------------------
Installing Brew Apps

▀█ █▀ █░█
█▄ ▄█ █▀█
EOF
brew install zsh


cat << "EOF"

▀█▀ █▀▀ █▀█ █▀█ ▄▀█ █▀▀ █▀█ █▀█ █▀▄▀█
░█░ ██▄ █▀▄ █▀▄ █▀█ █▀░ █▄█ █▀▄ █░▀░█
EOF

brew tap hashicorp/tap
brew install tfenv
tfenv install
tfenv use 


cat << "EOF"

▄▀█ █▄░█ █▀ █ █▄▄ █░░ █▀▀
█▀█ █░▀█ ▄█ █ █▄█ █▄▄ ██▄
EOF

brew install ansible


# Tutorial on how to install kubectl on Mac: https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
cat << "EOF"

█▄▀ █░█ █▄▄ █▀▀ █▀▀ ▀█▀ █░░
█░█ █▄█ █▄█ ██▄ █▄▄ ░█░ █▄▄
EOF

brew install kubectl
kubectl version --client


cat << "EOF"

▄▀█ █░█░█ █▀   █▀▀ █░░ █
█▀█ ▀▄▀▄▀ ▄█   █▄▄ █▄▄ █
EOF

brew install awscli


cat << "EOF"

▄▀█ ▀█ █░█ █▀█ █▀▀   █▀▀ █░░ █
█▀█ █▄ █▄█ █▀▄ ██▄   █▄▄ █▄▄ █
EOF

brew install azure-cli
