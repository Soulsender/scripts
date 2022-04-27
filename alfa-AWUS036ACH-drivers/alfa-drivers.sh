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
  echo -e "${red}Uh oh, it seems there was a fucky wucky and the driver repositories aren't found which means you probably aren't running this script on Kali. The only way I've found to set this up properly is to add the Kali repositories to your system sources.${reset}"

  while true
  do
      read -r -p "Would you like to add Kali repositories to your system? [Y/n] " input
 
      case $input in
            [yY][eE][sS]|[yY])

                  while true
                  do
                        read -r -p "Would you like to create a backup of sources.list in the home directory? [Y/n] " input
                        case $input in
                              [yY][eE][sS]|[yY])
                                    echo -e "${green}Backing up sources.list ${reset}"
                                    sleep 3
                                    sudo cp -R /etc/apt/sources.list ~/
                                    echo -e "Sources backed up in ~"
                                    sleep 3
                                    break
                                    ;;
                              [nN][oO]|[nN])
                                    echo -e "${red}Operation canceled.${reset}"
                                    break
                                    ;;
                              *)
                                    echo -e "${red}Invalid input...${reset}"
                                    ;;
                        esac      
                  done

                  echo -e "${green}Adding Kali Repositories"
                  sleep 3
                  sudo tee -a /etc/apt/sources.list<<EOF
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF
                  break
                  ;;
            [nN][oO]|[nN])
                  echo -e "${red}Operation canceled.${reset}"
                  exit
                  break
                  ;;
            *)
                  echo -e "${red}Invalid input...${reset}"
                  ;;
      esac      
done
fi

apt-get -y install dkms
apt-get -y install realtek-rtl88xxau-dkms
apt-get -y install rtl8812au-dkms

# clone and compile
cd ~
git clone https://github.com/aircrack-ng/rtl8812au
cd ~/rtl8812au
make
make install

# may need to unplug and replug the adapter
echo ""
echo -e "${green}The script is finished. Use iwconfig to check (the adapter is probably listed as wlan0). If it is still not listed, unplug and replug the adapter. 
If you are running this via virtual machine, you may also need to check your hypervisor (typically VMware or Virtualbox) 
settings and see if the USB port is being registered.${reset}"
sleep 3
