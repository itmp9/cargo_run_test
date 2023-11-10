#!/bin/bash

sudo apt install mdadm -y
DISK1="/dev/sdb"
DISK2="/dev/sdc"
MOUNT_POINT="/mnt/raid"
mkfs.ext4 $DISK1
mkfs.ext4 $DISK2
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 $DISK1 $DISK2
sudo mkfs.ext4 /dev/md0
sudo mkdir -p $MOUNT_POINT
sudo mount /dev/md0 $MOUNT_POINT
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
sudo update-initramfs -u
echo "/dev/md0 $MOUNT_POINT ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab
echo "RAID 1 has been created and configured. It will be mounted automatically at $MOUNT_POINT on system boot."
