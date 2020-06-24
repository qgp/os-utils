#!/bin/bash
set -e

DISK=$1 && [ $DISK ]
echo "going to partition ${DISK}"
sleep 2

sgdisk -og ${DISK}
sgdisk -a 1 -n 1:34:2047 -c 0:"BIOS Boot Partition" -t 0:ef02 ${DISK}
sgdisk -n 2:0:+200M -c 0:"EFI System Partition" -t 0:ef00 ${DISK}
sgdisk -n 3:0:+500M -c 0:"/boot" -t 0:8300 ${DISK}
sgdisk -n 4:0:0 -c 0:"Linux" -t 0:8300 ${DISK}
sgdisk -p ${DISK}

# create EFI fs
mkfs.vfat ${DISK}2

# setup system partition
dd bs=512 count=4 if=/dev/random of=key_root iflag=fullblock
cryptsetup luksFormat -q --type luks2 --key-file key_root ${DISK}4
cryptsetup luksAddKey --key-file key_root ${DISK}4
cryptsetup luksDump ${DISK}4
cryptsetup open --key-file key_root ${DISK}4 enc_root 
mkfs.btrfs /dev/mapper/enc_root
mount /dev/mapper/enc_root /mnt
btrfs subvolume create /mnt/master
btrfs subvolume set-default /mnt/master
umount /mnt
mount /dev/mapper/enc_root /mnt
cp key_root /mnt/

# setup /boot (using LUKS1 for grub compatibility)
dd bs=512 count=4 if=/dev/random of=key_boot iflag=fullblock
cryptsetup luksFormat -q --type luks1 --key-file key_boot ${DISK}3
cryptsetup luksAddKey --key-file key_boot ${DISK}3
cryptsetup luksDump ${DISK}3
cryptsetup open --key-file key_boot ${DISK}3 enc_boot 
mkfs.btrfs /dev/mapper/enc_boot
mkdir /mnt/boot
mount /dev/mapper/enc_boot /mnt/boot
btrfs subvolume create /mnt/boot/master
btrfs subvolume set-default /mnt/boot/master
umount /mnt/boot
mount /dev/mapper/enc_boot /mnt/boot
cp key_boot /mnt/boot/
