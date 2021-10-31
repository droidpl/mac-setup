#!/bin/bash

cat << "EOF"

█▀▀ █░░ █░█ ▀█▀ ▀█▀ █▀▀ █▀█
█▀░ █▄▄ █▄█ ░█░ ░█░ ██▄ █▀▄
EOF

git clone https://github.com/flutter/flutter.git -b stable /tmp/flutter
mv /tmp/flutter /Applications/flutter
rm -rf /tmp/flutter

# Add flutter to classpath
cat << EOF >> ~/.zshrc_local
# Adds flutter to the classpath (code)
export PATH="/Applications/flutter/bin:$PATH"
EOF
source ~/.zshrc_local

# Start analyzing the flutter patch
flutter doctor

# ANDROID
echo "Installing Flutter Android Dependencies..."

# Install Java 8 as pre-requisite
brew install adoptopenjdk/openjdk/adoptopenjdk8

# Install the Android SDK: Tutorial -> https://medium.com/@kyrusri/how-to-install-android-sdk-for-flutter-without-android-studio-on-mac-ca7dfaf096ae
brew install android-sdk
cat << EOF >> ~/.zshrc_local
# Adds the Android SDK to the classpath
export PATH="/usr/local/share/android-sdk:\$PATH"
export PATH="/usr/local/share/android-sdk/platform-tools:\$PATH"
export ANDROID_HOME="/usr/local/share/android-sdk:\$PATH"
EOF
source ~/.zshrc_local
mkdir -p ~/.android
touch ~/.android/repositories.cfg

# Update Android SDK references
sdkmanager --update
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;$ANDROID_PLATFORM" "build-tools;$ANDROID_BUILD_TOOLS" "cmdline-tools;latest"
flutter config --android-sdk /usr/local/share/android-sdk
flutter doctor --android-licenses

# IOS
echo "Installing Flutter IOS Dependencies..."

# Setup XCode installation for iOS
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

# Add cocoapods
sudo gem install cocoapods

# Check flutter doctor status
flutter doctor