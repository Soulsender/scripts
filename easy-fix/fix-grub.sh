#!/bin/bash

sudo fdisk -l

mount /dev/nvme0n1 /mnt

grub install --root-directory=/mnt/ /dev/nvme0n1

echo "RESTARTING IN FIVE SECONDS"
echo "RUN update-grub"

sleep 5

sudo reboot now
