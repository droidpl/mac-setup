#!/bin/bash

cat << "EOF"

█▄░█ █▀█ █▀▄ █▀▀ ░░█ █▀
█░▀█ █▄█ █▄▀ ██▄ █▄█ ▄█
EOF

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

cat << EOF >> ~/.zshrc_local
# Adds nvm to the classpath
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
EOF
source ~/.zshrc_local

# Install node and npm
nvm install node
nvm use node

# Install npm
nvm install-latest-npm

# Install npm global packages
npm install -g serve standard
