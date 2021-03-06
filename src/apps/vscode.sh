#!/bin/bash

cat << "EOF"

-----------------------------
Installing...

█░█ █▀ █▀▀ █▀█ █▀▄ █▀▀
▀▄▀ ▄█ █▄▄ █▄█ █▄▀ ██▄
EOF

mkdir -p /tmp/vscode
curl -s -Lo /tmp/vscode/Vscode.zip "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal";
unzip -q /tmp/vscode/Vscode.zip -d /tmp/vscode
mv /tmp/vscode/Visual\ Studio\ Code.app /Applications/Visual\ Studio\ Code.app
rm -rf /tmp/vscode

# Add code command to the terminal
cat << EOF >> ~/.zshrc_local
# Add Visual Studio Code (code command) to the classpath
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:\$PATH"
EOF
source ~/.zshrc_local

echo "Added 'code' command to the command line on zsh"

# Install extensions
# Flutter extensions
code --install-extension marcelovelasquez.flutter-tree
code --install-extension Dart-Code.flutter
code --install-extension alexisvt.flutter-snippets

# GitHub
code --install-extension GitHub.copilot

# Code style
code --install-extension aaron-bond.better-comments

# Language extensions (python, go, rust, java...)
code --install-extension ms-python.python
code --install-extension golang.go
code --install-extension rust-lang.rust
code --install-extension ms-azuretools.vscode-docker
code --install-extension ecmel.vscode-html-css

# Install stripe extension
code --install-extension stripe.vscode-stripe