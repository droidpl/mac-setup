#!/bin/bash

cat << "EOF"

-----------------------------

█▀▀ █ ▀█▀   ▄▀█ █▄░█ █▀▄   █▀▀ █ ▀█▀ █░█ █░█ █▄▄
█▄█ █ ░█░   █▀█ █░▀█ █▄▀   █▄█ █ ░█░ █▀█ █▄█ █▄█
EOF

# Install GitHub on the CLI
echo "Installing GitHub CLI..."
brew install gh

# GPG deps
echo "Installing GPG dependencies..."
brew install gnupg libgcrypt pinentry pinentry-mac

# Generate key
ssh-keygen -q -t ed25519 -C "$GITHUB_EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
SSH_KEY=$(cat "$HOME/.ssh/id_ed25519.pub")

# Add key to GitHub profile
curl -i -X POST -H "Authorization: token $GITHUB_TOKEN" \
    https://api.github.com/user/keys \
    -d "{\"key\": \"$SSH_KEY\", \"title\": \"$USER Laptop\"}"

# Copy and setup SSH configuration
touch "$HOME/.ssh/known_hosts"
configpath=$(realpath "./src/config/git/ssh-config")
cp -rf "$configpath" "$HOME/.ssh/config"

# Copy .gitignore configuration
gitignorepath=$(realpath "./src/config/git/gitignore")
cp -rf "$gitignorepath" "$HOME/.gitignore"

# GPG configuration
mkdir -p ~/.gnupg
cat << EOF >> ~/.gnupg/gpg-agent.conf
# Pin entry program installed for mac
pinentry-program /usr/local/bin/pinentry-mac
EOF

# Import the key from keybase
echo "Now we will import the GPG keys from keybase. Make sure you have logged in into the Keybase account in the machine"
read -p "Press enter to continue..."
keybase pgp export | gpg --import
keybase pgp export --secret | gpg --import --allow-secret-key-import

# Get key id
export GPG_KEY=$(gpg --list-signatures --with-colons | grep "pub" | head -n 1 | cut -d':' -f5)
# Make sure we export the variables so they can be used by the envsubst
export GITHUB_EMAIL="$GITHUB_EMAIL"
export GIT_NAME="$GIT_NAME"
gitconfigpath=$(realpath "./src/config/git/gitconfig")
cat "$gitconfigpath" | envsubst '$GIT_NAME:$GITHUB_EMAIL:$GPG_KEY' > ~/.gitconfig
gpgconf --kill all


# Set environment variables for the GitHub token
echo export GITHUB_TOKEN="$GITHUB_TOKEN" >> ~/.zshrc_local

# Source th environments
source ~/.zshrc_local
