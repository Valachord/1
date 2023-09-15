loadkeys dk

timedatectl set-ntp true

cfdisk /dev/sda

mkfs.fat -F32 /dev/sda1

mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware linux-headers nano

genfstab -p -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

echo "LANG=en_DK.UTF-8" >> /etc/locale.conf
echo "en_DK.UTF-8 UTF-8" >> /etc/locale.gen
echo "KEYMAP=dk" >> /etc/vconsole.conf
locale-gen

echo "minimal" >> /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1   minimal.localdomain minimal" >> /etc/hosts

mkinitcpio -P

EDITOR=nano visudo

sudo nano /etc/pacman.conf

dd if=/dev/zero of=/swapfile bs=1M count=2000 status=progress
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

sudo pacman -Syu

sudo pacman -S --noconfirm alacritty
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --noconfirm efibootmgr
sudo pacman -S --noconfirm exfatprogs
sudo pacman -S --noconfirm gdm
sudo pacman -S --noconfirm gnome-control-center
sudo pacman -S --noconfirm gnome-disk-utility
sudo pacman -S --noconfirm gnome-keyring
sudo pacman -S --noconfirm gnome-shell
sudo pacman -S --noconfirm gnome-shell-extensions
sudo pacman -S --noconfirm gnome-system-monitor
sudo pacman -S --noconfirm gnome-tweaks
sudo pacman -S --noconfirm grub
sudo pacman -S --noconfirm nautilus
sudo pacman -S --noconfirm network-manager-applet
sudo pacman -S --noconfirm os-prober
sudo pacman -S --noconfirm virtualbox-guest-utils
sudo pacman -S --noconfirm xdg-user-dirs-gtk
sudo pacman -S --noconfirm xorg
sudo pacman -S --noconfirm xorg-apps
sudo pacman -S --noconfirm xorg-drivers
sudo pacman -S --noconfirm xorg-xinit

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable gdm
systemctl enable sshd
systemctl enable vboxservice.service

grub-install --target=x86_64-efi --efi-directory=boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

## create user

useradd -g users -G wheel,ftp,audio,video,storage,power,kvm -m mob
\passwd mob

## after 1st boot
sudo modprobe -a vboxguest vboxsf vboxvideo

