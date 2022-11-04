#!/bin/bash

red="\e[0;91m"
green="\e[0;92m"
reset="\e[0m"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo -e "${green}======================"
echo -e "--ALFA ACH INSTALLER-"
echo -e "----By Soulsender----"
echo -e "github.com/Soulsender"
echo -e "======================${reset}"
sleep 3

# get dependancies
sudo apt update
which dkms || sudo apt install dkms
which rfkill || sudo apt install rfkill
which git || sudo apt install git

# clone drivers
cd ~
git clone https://github.com/morrownr/8812au-20210629.git

# compile and install
cd 8812au-20210629
sudo ./install-driver.sh

# check if drivers are ready
find /lib/modules/`uname -r`/ -name "8812au.ko"

# may need to unplug and replug the adapter
echo ""
echo -e "${green}The script is finished. Use ip a to check (the adapter is probably listed as wlan0). If it is still not listed, unplug and replug the adapter. 
If you are running this via virtual machine, you may also need to check your hypervisor (typically VMware or Virtualbox) 
settings and see if the USB port is being registered.${reset}"
echo -e "${red}For further issues, please see https://docs.alfa.com.tw/Support/Linux/RTL8812AU/ ${reset}"
sleep 3
