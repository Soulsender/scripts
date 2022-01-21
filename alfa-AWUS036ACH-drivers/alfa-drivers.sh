#!/bin/bash

echo "By Soulsender"
echo "Commands courtesy of David Bombal"
echo "https://www.youtube.com/watch?v=hEXwOkyYNL0&t=303s"

# update repositories
apt-get -y update
apt-get -y upgrade 

# install drivers (chipset rtl8812au)
apt-get -y install realtek-rtl88xxau-dkms

# install dkms
apt-get -y install dkms

# ======
# sometimes this will work but the second part of the script will run anyways to make sure
# ======

# install git if not installed
apt-get -y install git

# clone more drivers
git clone https://github.com/aircrack-ng/rtl8812au

# compile
cd ~/rtl8812au
make
make install

# may need to unplug and replug the adapter
echo "The script is finished. Use iwconfig to check (probably listed as wlan0). If it is still not listed, unplug and replug the adapter. 
If you are running this via virtual machine, you may also need to check your hypervisor (typically VMware or Virtualbox) 
settings and see if the USB port is being registered."
