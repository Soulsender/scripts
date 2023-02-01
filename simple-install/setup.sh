#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
RESET="\e[0m"

mkdir ~/.software
apt-get -y update
apt-get -y upgrade

# installs
sudo apt-get install wireguard proxychains tor macchanger wireshark qbittorrent network-manager flatpak network-manager -y
sudo apt-get install chromium micro vlc flameshot cmatrix hollywood terminator virtualbox gobuster docker.io -y
sudo docker pull rustscan/rustscan:2.0.0

if [`cat /etc/os-release | grep PRETTY_NAME` == 'PRETTY_NAME="Kali GNU/Linux Rolling"'] then
    echo "yes"
fi

echo -e "${RED}Please install obs & discord with flatpak${RESET}"
echo -e "${RED}Please install vscode${RESET}"
echo -e "${GRN}Script complete."
