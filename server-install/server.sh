#!/bin/bash

# update & install
apt update
apt install -y fail2ban unattended-upgrades ufw

# ufw
ufw allow 69/tcp

# ssh
cp -f sshd_config /etc/ssh/

# sudoers
echo "soul    ALL=(ALL:ALL) ALL" > /etc/sudoers

# fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# unattended-upgrades
systemctl start unattended-upgrades
systemctl enable unattended-upgrades


