#!/bin/bash

# check root
if [ "$EUID" -ne 0 ]
  then echo "PLEASE RUN AS ROOT"
  exit
fi

# user & sudoers
function create_user {
    useradd -d /home/soul soul
    echo "soul    ALL=(ALL:ALL) ALL" > /etc/sudoers
}

read -r -p "Would you like to create user \"soul\"? [Y/n] " input
case $input in
      [yY][eE][sS]|[yY])
            echo "Confirmed"
            create_user
            ;;
      [nN][oO]|[nN])
            echo "Skipping"
            ;;
      *)
            echo "Invalid input"
            exit 1
            ;;
esac


# update & install
apt update
apt install -y fail2ban unattended-upgrades ufw

# ufw
ufw allow 69/tcp
ufw delete allow 22/tcp

# ssh
cp -f sshd_config /etc/ssh/

# fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# unattended-upgrades
systemctl start unattended-upgrades
systemctl enable unattended-upgrades

echo "SCRIPT COMPLETE"