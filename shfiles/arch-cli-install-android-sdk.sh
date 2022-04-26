#! /bin/bash

pacman -S jdk-openjdk

# Get SDK tools (link from https://developer.android.com/studio/index.html#downloads)
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk*-linux.tgz

# Get NDK (https://developer.android.com/ndk/downloads/index.html)
wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip
uznip android-ndk*.zip

# Let it update itself and install some stuff
cd android-sdk-linux/tools
./android update sdk --no-ui

# Download every build-tools version that has ever existed
# This will save you time! Thank me later for this
./android update sdk --all --no-ui --filter $(seq -s, 27)

echo 'export ANDROID_HOME=$HOME/android-sdk-linux' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools' >> ~/.bashrc

source ~/.bashrc

# Optionally run build system as daemon (speeds up build process)
mkdir ~/.gradle
echo 'org.gradle.daemon=true' >> ~/.gradle/gradle.properties

