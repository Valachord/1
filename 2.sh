#!/bin/bash

clear

# set hostname
echo skyloft > /etc/hostname
sleep 0.5
clear

# set timezone
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc
sleep 0.5
clear

# generate locale and set language
echo "LANG=en_DK.UTF-8" >> /etc/locale.conf
sleep 0.5
echo "en_DK.UTF-8 UTF-8" >> /etc/locale.gen
sleep 0.5
echo "KEYMAP=dk" >> /etc/vconsole.conf
sleep 2
locale-gen
clear
sleep 0.5

# set host information
echo "skyloft" >> /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	skyloft.localdomain	skyloft" >> /etc/hosts
clear
sleep 0.5

# create user
useradd -g users -G wheel,audio,video,storage,power,kvm,libvirt -m valachord
clear
sleep 1.5
\passwd valachord
clear
sleep 0.5

# configure sudo
EDITOR=nano visudo
clear
sleep 0.5

# enable multilib
sudo nano /etc/pacman.conf
clear
sleep 0.5

# update
sudo pacman -Sy
clear
sleep 0.5

# install network tools
sudo pacman -S --noconfirm dhcpcd
sudo pacman -S --noconfirm dialog
sudo pacman -S --noconfirm dosfstools
sudo pacman -S --noconfirm mtools
sudo pacman -S --noconfirm netctl
sudo pacman -S --noconfirm network-manager-applet
sudo pacman -S --noconfirm networkmanager
sudo pacman -S --noconfirm openssh
sudo pacman -S --noconfirm os-prober
sudo pacman -S --noconfirm wireless_tools
sudo pacman -S --noconfirm wpa_supplicant
sleep 0.5
clear

# install xorg
sudo pacman -S --noconfirm mesa
sudo pacman -S --noconfirm xorg
sudo pacman -S --noconfirm xorg-apps
sudo pacman -S --noconfirm xorg-drivers
sudo pacman -S --noconfirm xorg-server
sudo pacman -S --noconfirm xorg-xinit
sleep 0.5
clear

# install packages
sudo pacman -S --noconfirm alacritty
sudo pacman -S --noconfirm alsa-utils
sudo pacman -S --noconfirm atom
sudo pacman -S --noconfirm baobab
sudo pacman -S --noconfirm barrier
sudo pacman -S --noconfirm bashtop
sudo pacman -S --noconfirm bluez
sudo pacman -S --noconfirm bluez-utils
sudo pacman -S --noconfirm bridge-utils
sudo pacman -S --noconfirm cadence
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm conky
sudo pacman -S --noconfirm discord
sudo pacman -S --noconfirm dmenu
sudo pacman -S --noconfirm dnsmasq
sudo pacman -S --noconfirm dolphin-emu
sudo pacman -S --noconfirm ebtables
sudo pacman -S --noconfirm edk2-ovmf
sudo pacman -S --noconfirm efibootmgr
sudo pacman -S --noconfirm eog
sudo pacman -S --noconfirm evince
sudo pacman -S --noconfirm fakeroot
sudo pacman -S --noconfirm file-roller
sudo pacman -S --noconfirm filemanager-actions
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm fish
sudo pacman -S --noconfirm flatpak
sudo pacman -S --noconfirm gameconqueror
sudo pacman -S --noconfirm gimp
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gnome-boxes
sudo pacman -S --noconfirm gnome-calculator
sudo pacman -S --noconfirm gnome-calendar
sudo pacman -S --noconfirm gnome-clocks
sudo pacman -S --noconfirm gnome-contacts
sudo pacman -S --noconfirm gnome-disks
sudo pacman -S --noconfirm gnome-nettool
sudo pacman -S --noconfirm gnome-photos
sudo pacman -S --noconfirm gnome-system-monitor
sudo pacman -S --noconfirm gnome-usage
sudo pacman -S --noconfirm gnome-weather
sudo pacman -S --noconfirm grub
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm kdeconnect
sudo pacman -S --noconfirm kmail
sudo pacman -S --noconfirm libguestfs
sudo pacman -S --noconfirm libreoffice-fresh
sudo pacman -S --noconfirm libvirt
sudo pacman -S --noconfirm libzip
sudo pacman -S --noconfirm lightdm-webkit2-greeter
sudo pacman -S --noconfirm lutris
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm mailnag
sudo pacman -S --noconfirm maim
sudo pacman -S --noconfirm materia-gtk-theme
sudo pacman -S --noconfirm nautilus
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm nitrogen
sudo pacman -S --noconfirm nomacs
sudo pacman -S --noconfirm nyx
sudo pacman -S --noconfirm obs-studio
sudo pacman -S --noconfirm ocl-icd
sudo pacman -S --noconfirm openbsd-netcat
sudo pacman -S --noconfirm otf-font-awesome
sudo pacman -S --noconfirm picom
sudo pacman -S --noconfirm qbittorrent
sudo pacman -S --noconfirm qjackctl
sudo pacman -S --noconfirm retroarch
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm samba
sudo pacman -S --noconfirm spice-gtk
sudo pacman -S --noconfirm spice-vdagent
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm sushi
sudo pacman -S --noconfirm sysstat
sudo pacman -S --noconfirm telegram-desktop
sudo pacman -S --noconfirm tor
sudo pacman -S --noconfirm torbrowser-launcher
sudo pacman -S --noconfirm trayer
sudo pacman -S --noconfirm veracrypt
sudo pacman -S --noconfirm virt-manager
sudo pacman -S --noconfirm virt-viewer
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm virtualbox-guest-iso
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm vulkan-extra-layers
sudo pacman -S --noconfirm vulkan-extra-tools
sudo pacman -S --noconfirm vulkan-headers
sudo pacman -S --noconfirm vulkan-mesa-layers
sudo pacman -S --noconfirm vulkan-tools
sudo pacman -S --noconfirm vulkan-validation-layers
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm which
sudo pacman -S --noconfirm wine
sudo pacman -S --noconfirm wine-gecko
sudo pacman -S --noconfirm wine-mono
sudo pacman -S --noconfirm winetricks
sudo pacman -S --noconfirm x11vnc
sudo pacman -S --noconfirm xdotool
sudo pacman -S --noconfirm xlockmore
sudo pacman -S --noconfirm xmobar
sudo pacman -S --noconfirm xterm
sudo pacman -S --noconfirm zsh
sudo pacman -S qemu
sudo pacman -S virtualbox-host-modules-arch
clear
sleep 1

# Get yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
clear
sleep 1

# Git lightdm glorious theme
git clone https://aur.archlinux.org/lightdm-webkit2-theme-glorious.git
cd lightdm-webkit2-theme-glorious
makepkg -sri
cd ..
sudo rm -r lightdm-webkit2-theme-glorious
clear
sleep 1

# Grub fallout theme
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
bash /tmp/install.sh

# Aur packages
yay -S --noconfirm cylon
yay -S --noconfirm debtap
yay -S --noconfirm goverlay-git
yay -S --noconfirm mangohud-git
yay -S --noconfirm openrazer-meta
yay -S --noconfirm polychromatic-git
yay -S --noconfirm protontricks
yay -S --noconfirm replay-sorcery
yay -S --noconfirm snapd
yay -S --noconfirm suru-plus-aspromauros-git
yay -S --noconfirm teamviewer
clear
sleep 1

# create swapfile
dd if=/dev/zero of=/swapfile bs=1M count=2000 status=progress
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab
clear
sleep 1

# window manager
sudo pacman -S --noconfirm xmonad
sudo pacman -S --noconfirm xmonad-contrib
clear
sleep 1.5

# install gpu
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
clear
sleep 1.5

# install audio
sudo pacman -S --noconfirm pavucontrol
sudo pacman -S --noconfirm pulseaudio
sudo pacman -S --noconfirm pulseaudio-alsa
sudo pacman -S --noconfirm pulseaudio-bluetooth
sudo pacman -S --noconfirm pulseaudio-jack
clear
sleep 1.5

# mkinitcpio
mkinitcpio -P
clear
sleep 0.5

# enable systems
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable libvirtd.service
systemctl enable lightdm
systemctl enable tor
clear

# lightdm theme settings
sudo nano /etc/lightdm/lightdm.conf
sleep 0.5
sudo nano /etc/lightdm/lightdm-webkit2-greeter.conf
sleep 0.5

# delete files
rm 2.sh
clear
sleep 0.5

# let user know that the install finished
#echo "DING DING DING! Install is complete"
echo DING DING DIIIING!
echo Install is complete!
echo
