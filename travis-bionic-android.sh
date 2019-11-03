#!/usr/bin/env bash

set -ex

# Install Android SDK
export ANDROID_HOME=$HOME/android-sdk
mkdir -p ${ANDROID_HOME}
curl -o /tmp/sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip -q -o /tmp/sdk.zip -d ${ANDROID_HOME}
export PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Download dependencies to run sdkmanager with java 11
# extracted from: https://stackoverflow.com/a/55982976/842697
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar)
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/javax/xml/jaxb-impl/2.1/jaxb-impl-2.1.jar)
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/org/glassfish/jaxb/jaxb-xjc/2.3.2/jaxb-xjc-2.3.2.jar)
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/org/glassfish/jaxb/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar)
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/org/glassfish/jaxb/jaxb-jxc/2.3.2/jaxb-jxc-2.3.2.jar)
(cd ${ANDROID_HOME}/tools/bin; curl -O http://central.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar)

sed -i -E 's/^CLASSPATH=(.*)$/CLASSPATH=\1:$APP_HOME\/lib\/activation-1.1.1.jar:$APP_HOME\/lib\/jaxb-impl-2.1.jar:$APP_HOME\/lib\/jaxb-xjc-2.3.2.jar:$APP_HOME\/lib\/jaxb-core-2.3.0.1.jar:$APP_HOME\/lib\/jaxb-jxc-2.3.2.jar:$APP_HOME\/lib\/jaxb-api-2.3.1.jar/g' ${ANDROID_HOME}/tools/bin/sdkmanager

# Install platform-tools
sdkmanager "platform-tools"

# Don't show warning: "File $HOME/.android/repositories.cfg could not be loaded."
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

# Accept the android license
mkdir -p ${ANDROID_HOME}/licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"

set +xe
