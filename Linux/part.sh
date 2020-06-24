#!/bin/bash
set -e

DISK=$1 && [ $DISK ]
echo "going to re-partition ${DISK}"
sleep 2

sgdisk -og ${DISK}
sgdisk -a 1 -n 1:34:2047 -c 0:"BIOS Boot Partition" -t 0:ef02 ${DISK}
sgdisk -n 2:0:+512M -c 0:"EFI System Partition" -t 0:ef00 ${DISK}
sgdisk -n 3:0:+512M -c 0:"Linux /boot" -t 0:BC13C2FF-59E6-4262-A352-B275FD6F7172 ${DISK}
sgdisk -n 4:0:0 -c 0:"Linux /" -t 0:8304 ${DISK}
sgdisk -p ${DISK}

mkfs.vfat ${DISK}2
mkfs.btrfs ${DISK}3
#mkfs.btrfs ${DISK}4
