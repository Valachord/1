loadkeys dk

timedatectl set-ntp true

## partitions

lsblk

## create partition, 512M for efi, 300G for system

cfdisk /dev/sda

## check partition again, if neccesarry, with lsblk

## format efi

mkfs.fat -F32 /dev/sda1

## format main partition

mkfs.ext4 /dev/sda2

## mount partitions

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

## install base

pacstrap /mnt base base-devel linux linux-firmware linux-headers nano

## generate fstab

genfstab -p -U /mnt >> /mnt/etc/fstab

## change root

arch-chroot /mnt

## set timezone

ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

## generate locale and set language

echo "LANG=en_DK.UTF-8" >> /etc/locale.conf
echo "en_DK.UTF-8 UTF-8" >> /etc/locale.gen
echo "KEYMAP=dk" >> /etc/vconsole.conf
locale-gen

## set host information

echo "framework" >> /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	framework.localdomain	framework" >> /etc/hosts

## mkinitcpio

mkinitcpio -P

## configure sudo

EDITOR=nano visudo

## enable multilib

sudo nano /etc/pacman.conf

## create swapfile

dd if=/dev/zero of=/swapfile bs=1M count=2000 status=progress
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

## update

sudo pacman -Syu



sudo pacman -S networkmanager
sudo pacman -S nm-connection-editor
sudo pacman -S network-manager-applet
sudo pacman -S gnome-disk-utility
sudo pacman -S gnome-system-monitor
sudo pacman -S alacritty
sudo pacman -S archlinux-keyring
sudo pacman -S awesome-terminal-fonts
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S bridge-utils
sudo pacman -S audacity
sudo pacman -S cmake
sudo pacman -S code
sudo pacman -S conky
sudo pacman -S corectrl
sudo pacman -S cups
sudo pacman -S discord
sudo pacman -S dnsmasq
sudo pacman -S dos2unix
sudo pacman -S edk2-ovmf
sudo pacman -S efibootmgr
sudo pacman -S eog
sudo pacman -S exfatprogs
sudo pacman -S file-roller
sudo pacman -S firefox
sudo pacman -S firewalld
sudo pacman -S --noconfirm flatpak
sudo pacman -S --noconfirm fprintd
sudo pacman -S --noconfirm gamemode
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gvfs-afc
sudo pacman -S --noconfirm gvfs-goa
sudo pacman -S --noconfirm gvfs-google
sudo pacman -S --noconfirm gvfs-gphoto2
sudo pacman -S --noconfirm gvfs-mtp
sudo pacman -S --noconfirm gvfs-nfs
sudo pacman -S --noconfirm gvfs-smb
sudo pacman -S --noconfirm iwd
sudo pacman -S --noconfirm kdeconnect
sudo pacman -S --noconfirm kvantum
sudo pacman -S --noconfirm kvantum-qt5
sudo pacman -S --noconfirm lib32-gamemode
sudo pacman -S --noconfirm lib32-giflib
sudo pacman -S --noconfirm lib32-gnutls
sudo pacman -S --noconfirm lib32-gst-plugins-base-libs
sudo pacman -S --noconfirm lib32-libva
sudo pacman -S --noconfirm lib32-libxcomposite
sudo pacman -S --noconfirm lib32-libxinerama
sudo pacman -S --noconfirm lib32-libxslt
sudo pacman -S --noconfirm lib32-mpg123
sudo pacman -S --noconfirm lib32-ocl-icd
sudo pacman -S --noconfirm lib32-openal
sudo pacman -S --noconfirm lib32-v4l-utils
sudo pacman -S --noconfirm lib32-vulkan-radeon
sudo pacman -S --noconfirm libvirt
sudo pacman -S --noconfirm lutris
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm libguestfs
sudo pacman -S --noconfirm mesa-demos
sudo pacman -S --noconfirm nautilus
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm obs-studio
sudo pacman -S --noconfirm openbsd-netcat
sudo pacman -S --noconfirm otf-font-awesome
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm python-pipx
sudo pacman -S --noconfirm qbittorrent
sudo pacman -S --noconfirm qemu-full
sudo pacman -S --noconfirm qemu-emulators-full
sudo pacman -S --noconfirm qjackctl
sudo pacman -S --noconfirm qt5ct
sudo pacman -S --noconfirm smartmontools
sudo pacman -S --noconfirm speedtest-cli
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm sushi
sudo pacman -S --noconfirm sysprof
sudo pacman -S --noconfirm telegram-desktop
sudo pacman -S --noconfirm torbrowser-launcher
sudo pacman -S --noconfirm veracrypt
sudo pacman -S --noconfirm virt-manager
sudo pacman -S --noconfirm virt-viewer
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm wine
sudo pacman -S --noconfirm wine-gecko
sudo pacman -S --noconfirm wine-mono
sudo pacman -S --noconfirm winetricks
sudo pacman -S --noconfirm xbindkeys
sudo pacman -S --noconfirm xdg-user-dirs-gtk

## install nvidia gpu

sudo pacman -S --noconfirm lib32-mesa
sudo pacman -S --noconfirm lib32-nvidia-utils
sudo pacman -S --noconfirm lib32-vulkan-icd-loader
sudo pacman -S --noconfirm mesa
sudo pacman -S --noconfirm nvidia
sudo pacman -S --noconfirm nvidia-dkms
sudo pacman -S --noconfirm nvidia-settings
sudo pacman -S --noconfirm nvidia-utils
sudo pacman -S --noconfirm opencl-nvidia
sudo pacman -S --noconfirm vulkan-icd-loader

## install intel gpu/cpu

sudo pacman -S --noconfirm intel-media-driver
sudo pacman -S --noconfirm intel-ucode
sudo pacman -S --noconfirm libva-intel-driver
sudo pacman -S --noconfirm powertop
sudo pacman -S --noconfirm vulkan-intel

## install audio

sudo pacman -S --noconfirm easyeffects
sudo pacman -S --noconfirm lib32-pipewire
sudo pacman -S --noconfirm lib32-libpulse
sudo pacman -S --noconfirm pavucontrol
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-audio
sudo pacman -S --noconfirm pipewire-jack
sudo pacman -S --noconfirm pipewire-media-session
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-zeroconf

## enable systems

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable dhcpcd
systemctl enable libvirtd
systemctl enable sshd
systemctl enable tor

## virsh (didn't work during test install, virtualbox)

sudo virsh -c qemu:///system net-autostart default
sudo virsh -c qemu:///system net-start default

sudo pacman -Syu

## create user

useradd -g users -G wheel,ftp,audio,video,storage,power,kvm,libvirt -m mob
passwd mob