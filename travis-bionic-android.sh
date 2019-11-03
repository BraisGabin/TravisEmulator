#!/usr/bin/env bash

# Install Android SDK
export ANDROID_HOME=$HOME/android-sdk
mkdir -p ${ANDROID_HOME}
curl -o /tmp/sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip -q -o /tmp/sdk.zip -d ${ANDROID_HOME}
export PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Install platform-tools
sdkmanager "platform-tools"

# Don't show warning: "File $HOME/.android/repositories.cfg could not be loaded."
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

# Accept the android license
mkdir -p ${ANDROID_HOME}/licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"
