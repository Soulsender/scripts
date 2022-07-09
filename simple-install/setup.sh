#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'

mkdir ~/.software
apt-get -y update
apt-get -y upgrade

# installs
sudo apt-get install wireguard proxychains tor macchanger wireshark qbittorrent network-manager code flatpak chromium sublime-text kde-plasma-desktop vlc mpv obs flameshot cmatrix hollywood terminator virtualbox  -y

# flatpaks
sudo flatpak install discord

echo -e "${GRN}Script complete."
echo -e "${BLU}Install LibreWolf"
