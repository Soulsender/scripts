#!/bin/bash
#
# forums for the issues if it persists
# https://forums.debian.net/viewtopic.php?p=683812
# https://www.pcsuggest.com/install-rtl8153-driver-linux/

# clone QCA6174 firmware from github and move it to the correct spot in /lib/firmware
mkdir /lib/firmware/ath10k
cd /lib/firmware/ath10k
git clone https://github.com/kvalo/ath10k-firmware
cd lib/firmware/ath10k/ath10k-firmware/QCA6174/hw3.0/4.4.1
cp firmware-6.bin_WLAN.RM.4.4.1-00151-QCARMSWPZ-2 /lib/firmware/ath10k/ath10k-firmware/QCA6174/hw3.0/firmware-6.bin
mv /lib/firmware/ath10k/ath10k-firmware/QCA6174 /lib/firmware/ath10k
rm -rf /lib/firmware/ath10k/ath10k-firmware

# clone rtl-8152 drivers
# in case it is not working https://www.realtek.com/en/directly-download?downloadid=14693064993b470514fcf9f45f2442e5

cd ~/Downloads
wget https://www.realtek.com/en/directly-download?downloadid=14693064993b470514fcf9f45f2442e5
tar xf 0008-r8152.53-2.09.0.tar.bz2
cd r8152-2.09.0/
apt-get update && sudo apt-get upgrade
apt-get -y install libelf-dev build-essential linux-headers-`uname -r`
cd ~/Downloads/r8152-2.09.0/
make -j2
make install
depmod -a
