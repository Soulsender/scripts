#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'

mkdir ~/.software
apt-get -y update
apt-get -y upgrade

# installs
sudo apt-get install wireguard proxychains tor macchanger wireshark qbittorrent network-manager code flatpak chromium sublime-text kde-plasma-desktop vlc mpv obs flameshot cmatrix hollywood terminator virtualbox  -y

# librewolf
distro=$(if echo " bullseye focal impish jammy uma una " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
echo "deb [arch=amd64] http://deb.librewolf.net $distro main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt update
sudo apt install librewolf -y

# flatpaks
sudo flatpak install discord

