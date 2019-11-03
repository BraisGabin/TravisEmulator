FROM ubuntu:bionic

RUN apt-get update && apt-get install curl unzip openjdk-8-jdk -y
RUN curl https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip > /tmp/sdk.zip

# https://stackoverflow.com/a/51644855/842697
#ENV JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
ENV ANDROID_HOME=$HOME/android-sdk

RUN mkdir -p $ANDROID_HOME $ANDROID_HOME/licenses ~/.android/
RUN unzip -q -o /tmp/sdk.zip -d $ANDROID_HOME
RUN touch ~/.android/repositories.cfg
RUN echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"
