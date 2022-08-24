#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
RESET="\e[0m"

mkdir ~/.software
apt-get -y update
apt-get -y upgrade

# installs
sudo apt-get install wireguard proxychains tor macchanger wireshark qbittorrent network-manager flatpak wpa_supplicant -y
sudo apt-get chromium sublime-text kde-standard vlc flameshot cmatrix hollywood terminator virtualbox  -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install rustscan
cargo install feroxbuster

echo -e "${RED}Please install obs & discord with flatpak${RESET}"
echo -e "$[RED}Please install vscode${RESET}"
echo -e "${GRN}Script complete."
