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

sudo pacman -S alacritty
sudo pacman -S archlinux-keyring
sudo pacman -S audacity
sudo pacman -S awesome-terminal-fonts
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S bridge-utils
sudo pacman -S cmake
sudo pacman -S code
sudo pacman -S conky
sudo pacman -S corectrl
sudo pacman -S cups
sudo pacman -S discord
sudo pacman -S dnsmasq
sudo pacman -S dos2unix
sudo pacman -S dunst
sudo pacman -S edk2-ovmf
sudo pacman -S efibootmgr
sudo pacman -S eog
sudo pacman -S exfatprogs
sudo pacman -S file-roller
sudo pacman -S firefox
sudo pacman -S firewalld
sudo pacman -S flatpak
sudo pacman -S fprintd
sudo pacman -S gamemode
sudo pacman -S git
sudo pacman -S gnome-disk-utility
sudo pacman -S gnome-system-monitor
sudo pacman -S gvfs-afc
sudo pacman -S gvfs-goa
sudo pacman -S gvfs-google
sudo pacman -S gvfs-gphoto2
sudo pacman -S gvfs-mtp
sudo pacman -S gvfs-nfs
sudo pacman -S gvfs-smb
sudo pacman -S hyprland
sudo pacman -S iwd
sudo pacman -S kdeconnect
sudo pacman -S kvantum
sudo pacman -S kvantum-qt5
sudo pacman -S lib32-gamemode
sudo pacman -S lib32-giflib
sudo pacman -S lib32-gnutls
sudo pacman -S lib32-gst-plugins-base-libs
sudo pacman -S lib32-libva
sudo pacman -S lib32-libxcomposite
sudo pacman -S lib32-libxinerama
sudo pacman -S lib32-libxslt
sudo pacman -S lib32-mpg123
sudo pacman -S lib32-ocl-icd
sudo pacman -S lib32-openal
sudo pacman -S lib32-v4l-utils
sudo pacman -S lib32-vulkan-radeon
sudo pacman -S libguestfs
sudo pacman -S libvirt
sudo pacman -S lutris
sudo pacman -S lxappearance
sudo pacman -S mesa-demos
sudo pacman -S nautilus
sudo pacman -S neofetch
sudo pacman -S network-manager-applet
sudo pacman -S networkmanager
sudo pacman -S nm-connection-editor
sudo pacman -S obs-studio
sudo pacman -S openbsd-netcat
sudo pacman -S otf-font-awesome
sudo pacman -S python-pip
sudo pacman -S python-pipx
sudo pacman -S qbittorrent
sudo pacman -S qemu-emulators-full
sudo pacman -S qemu-full
sudo pacman -S qjackctl
sudo pacman -S qt5-wayland
sudo pacman -S qt5ct
sudo pacman -S qt6-wayland
sudo pacman -S smartmontools
sudo pacman -S speedtest-cli
sudo pacman -S steam
sudo pacman -S sushi
sudo pacman -S sysprof
sudo pacman -S telegram-desktop
sudo pacman -S torbrowser-launcher
sudo pacman -S veracrypt
sudo pacman -S virt-manager
sudo pacman -S virt-viewer
sudo pacman -S virtualbox
sudo pacman -S vlc
sudo pacman -S wget
sudo pacman -S wine
sudo pacman -S wine-gecko
sudo pacman -S wine-mono
sudo pacman -S winetricks
sudo pacman -S wofi
sudo pacman -S xbindkeys
sudo pacman -S xdg-user-dirs-gtk

## install nvidia gpu

sudo pacman -S lib32-mesa
sudo pacman -S lib32-nvidia-utils
sudo pacman -S lib32-vulkan-icd-loader
sudo pacman -S mesa
sudo pacman -S nvidia
sudo pacman -S nvidia-dkms
sudo pacman -S nvidia-settings
sudo pacman -S nvidia-utils
sudo pacman -S opencl-nvidia
sudo pacman -S vulkan-icd-loader

## install intel gpu/cpu

sudo pacman -S intel-media-driver
sudo pacman -S intel-ucode
sudo pacman -S libva-intel-driver
sudo pacman -S powertop
sudo pacman -S vulkan-intel

## install audio

sudo pacman -S easyeffects
sudo pacman -S lib32-pipewire
sudo pacman -S lib32-libpulse
sudo pacman -S pavucontrol
sudo pacman -S pipewire
sudo pacman -S pipewire-alsa
sudo pacman -S pipewire-audio
sudo pacman -S pipewire-jack
sudo pacman -S pipewire-media-session
sudo pacman -S pipewire-pulse
sudo pacman -S pipewire-zeroconf

## enable systems

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable dhcpcd
systemctl enable libvirtd
systemctl enable sshd
systemctl enable tor

## create user

useradd -g users -G wheel,ftp,audio,video,storage,power,kvm,libvirt -m mob
passwd mob
