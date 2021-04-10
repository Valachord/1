#!/bin/bash

# set time
timedatectl set-ntp true
sleep 0.5
clear

# partitions
cmd=(whiptail --title Partitions --separate-output --menu "Select options:" 22 76 16)
options=(1 "Clean install"
         2 "Keep efi"
         3 "Clean install VM"
         4 "Keep efi VM")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            cfdisk
            mkfs.fat -F32 /dev/sda1
            mkfs.ext4 /dev/sda2
            mount /dev/sda2 /mnt
            mkdir /mnt/boot
            mount /dev/sda1 /mnt/boot
            ;;
        2)
            cfdisk
            #/dev/sda2
            mkfs.ext4 /dev/sda2
            mount /dev/sda2 /mnt
            mount /dev/sda1 /mnt/boot
            ;;
        3)
            cfdisk
            mkfs.fat -F32 /dev/vda1
            mkfs.ext4 /dev/vda2
            mount /dev/vda2 /mnt
            mkdir /mnt/boot
            mount /dev/vda1 /mnt/boot
            ;;
        4)
            cfdisk
            #/dev/sda2
            mkfs.ext4 /dev/vda2
            mount /dev/vda2 /mnt
            mount /dev/vda1 /mnt/boot
            ;;
    esac
done
sleep 1.5
clear

# install base
pacstrap /mnt base
pacstrap /mnt base-devel
pacstrap /mnt linux
pacstrap /mnt linux-firmware
pacstrap /mnt linux-headers
pacstrap /mnt nano
clear

# generate fstab
genfstab -p -U /mnt >> /mnt/etc/fstab
clear

# copy script
cp 2.sh /mnt
sleep 0.5

# change root
arch-chroot /mnt
clear
