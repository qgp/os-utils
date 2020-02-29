# Arch installation

- boot live system
- install utils
  - git
- partition disk
  - using part.sh
- adjust /etc/pacman.d/mirrorlist
- install base `pacstrap /mnt/base`
- create fstab
    ```
    genfstab -U /mnt >> /mnt/etc/fstab
    ```
- change root `arch-chroot /mnt`
    ```bash
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    hwclock --systohc
    nano /etc/locale.gen
    locale-gen
    nano /etc/hostname
    passwd
    pacman -S grub efibootmgr
    mkdir /boot/efi
    mount /dev/sda2 /boot/efi
    nano /etc/default/grub (enable cryptodisk, adjust cmdline)
    nano /etc/mkinitcpio.conf (add encrypt hook)
    mkinitcpio -p linux
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg
    ```
