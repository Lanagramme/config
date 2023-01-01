#!/bin/bash

package_list=('neovim' 'cmatrix' 'htop' 'neofetch' 'nodejs' 'npm' 'git' 'tmux' 'ranger' 'curl' 'python3' 'python3-venv' 'python3-pip' 'snapd' 'gnome-tweaks' 'flatpak' 'gnome-software-plugin-flatpak' 'filezilla')
snaps=('discord' 'mdless' 'fromscratch' 'submile-text' 'spotify' 'notion-snap' 'typora' 'simplenote' 'snap-store')
snaps_classic=('code' 'sublime-text')
flatpaks=('com.github.Eloston.UngoogledChromium')
apt_update_status=0

# Install apt packages

for package in ${package_list[@]}; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $package|grep "install ok installed")
    if [ "" = "$PKG_OK" ]; then
        if [ apt_update_status = 0 ]; then
            sudo apt update  && sudo apt upgrade --yes
            apt_update_status=1
        fi
        sudo apt-get --yes install $package
    else
        echo $package "is already installed"
    fi
done

sudo apt autoremove --yes
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install snap packages

for package in ${snaps[@]}; do
    install=$(sudo df | grep $package)
    if [ "" = "$install" ]; then
        sudo snap install $package
    else
    echo "$package is already installed"
    fi
done

for package in ${snaps_classic[@]}; do
    install=$(sudo df | grep $package)
    if [ "" = "$install" ]; then
        sudo snap install $package --classic
    else
    echo "$package is already installed"
    fi
done


# Install flatpaks
# sudo flatpak install flathub $flatpaks
