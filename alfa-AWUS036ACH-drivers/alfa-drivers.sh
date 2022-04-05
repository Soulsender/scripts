#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "By Soulsender"
sleep 3

# update repositories
apt-get -y update

# install dkms
apt-get -y install dkms

# install drivers (chipset rtl8812au)
apt-get -y install realtek-rtl88xxau-dkms

# install git if not installed
apt-get -y install git

# clone more drivers
cd ~
git clone https://github.com/aircrack-ng/rtl8812au

# compile
cd ~/rtl8812au
make
make install
rm -rf ~/rtl8812au

# may need to unplug and replug the adapter
echo ""
echo "The script is finished. Use iwconfig to check (the adapter is probably listed as wlan0). If it is still not listed, unplug and replug the adapter. 
If you are running this via virtual machine, you may also need to check your hypervisor (typically VMware or Virtualbox) 
settings and see if the USB port is being registered."
sleep 2
