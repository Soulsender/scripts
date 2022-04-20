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

# update repositories
apt-get -y update

# install dkms
apt-get -y install dkms

# install drivers (chipset rtl8812au)
apt-get -y install realtek-rtl88xxau-dkms

if [ $? -ne 1 ]
then
  # install git if not installed
  apt-get -y install git
  echo -e "${red} Uh oh, it seems there was a fucky wucky and the repository isn't found which means you probably arent running this on kali. Installing via sketchy reddit thread protocol initiated.${reset}"
  sleep 8
  # instructions from
  # https://www.reddit.com/r/Ubuntu/comments/gbb1nw/realtek_rtl8812au_netis_wf2190_usb_wireless/
  dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs sudo apt -y purge
  sudo apt install build-essential git
  cd ~
  git clone https://github.com/gnab/rtl8812au.git
  cd ~/rtl8812au
  make
  sudo make install
  sudo modprobe 8812au
  rm -rf ~/rtl8812au
fi

# may need to unplug and replug the adapter
echo ""
echo -e "${green}The script is finished. Use iwconfig to check (the adapter is probably listed as wlan0). If it is still not listed, unplug and replug the adapter. 
If you are running this via virtual machine, you may also need to check your hypervisor (typically VMware or Virtualbox) 
settings and see if the USB port is being registered.${reset}"
sleep 2
