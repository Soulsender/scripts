#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'

mkdir ~/Applications
apt-get -y update
apt-get -y upgrade

# [Y/n] Find best mirror
while true
do
 read -r -p "${BLU}Would you like to find the best CA mirror? [Y/n] " input
 case $input in
	[yY][eE][sS]|[yY])
 echo -e "${GRN}...Finding best CA mirror..."
 sudo cp /etc/apt/sources.list{,.backup}
 sudo apt-get -y install python3-pip
 sudo pip3 install apt-select

 # change CA to your country (ex. US, UK)
 apt-select -C CA
 
 sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
 sudo mv sources.list /etc/apt/
 break
 ;;
	[nN][oO]|[nN])
 echo -e "${RED}Cancelled"
 break
	;;
     *)
 echo -e "${RED}Invalid Input"
 ;;
 esac
done

# [Y/n] Install KDE Plasma minimal
while true
do
 read -r -p "${BLU}Would you like to install KDE Plasma (minimal)? [Y/n] " input
 case $input in
	[yY][eE][sS]|[yY])
 echo -e "${GRN}...Installing KDE Plasma..."
 sudo apt install kde-plasma-desktop
 break
 ;;
	[nN][oO]|[nN])
 echo -e "${RED}Cancelled"
 break
	;;
     *)
 echo -e "${RED}Invalid Input"
 ;;
 esac
done

# Install WireGuard, Proxychains, Discord, Pycharm, Microsoft Teams
apt-get -y install wireguard
apt-get -y install proxychains
apt-get -y install discord
apt-get -y install tor
apt-get -y install macchanger

while true
do
 read -r -p "${BLU}Would you like to install snap packages? [Y/n] " input
 case $input in
	[yY][eE][sS]|[yY])
 echo -e "${GRN}...Installing Snaps..."
 snap install pycharm-community --classic
 snap install teams
 break
 ;;
	[nN][oO]|[nN])
 echo -e "${RED}Cancelled"
 break
	;;
     *)
 echo -e "${RED}Invalid Input"
 ;;
 esac
done

# Install VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update
apt-get install code -y

