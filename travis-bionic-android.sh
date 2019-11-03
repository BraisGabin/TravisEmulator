#!/usr/bin/env bash

#set -ex

# Install OpenJDK 8
sudo apt-get -y install openjdk-8-jdk

# Install Android SDK
export ANDROID_HOME=$HOME/android-sdk
mkdir -p ${ANDROID_HOME}
curl -o /tmp/sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip -q -o /tmp/sdk.zip -d ${ANDROID_HOME}

# Don't show warning
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

# Accept the android license
mkdir -p ${ANDROID_HOME}/licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"

# Use console plain
mkdir -p $HOME/.gradle/
echo "org.gradle.console=plain" > "$HOME/.gradle/gradle.properties"
