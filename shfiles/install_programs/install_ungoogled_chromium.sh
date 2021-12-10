#!/bin/bash

sudo apt-get autoremove --purge chromium

echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' | sudo tee /etc/apt/sources.list.d/home:ungoogled_chromium.list

sudo wget -nv https://download.opensuse.org/repositories/home:ungoogled_chromium/Ubuntu_Focal/Release.key -O "/etc/apt/trusted.gpg.d/home:ungoogled_chromium.asc"

sudo apt update && sudo apt install ungoogled-chromium