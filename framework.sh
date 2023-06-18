#!/bin/bash

# try using pacstrap for the entire install in the future, example below
#pacstrap /mnt base
#pacstrap /mnt base-devel
#pacstrap /mnt linux
#pacstrap /mnt linux-firmware
#pacstrap /mnt linux-headers
#pacstrap /mnt nano

#clear
#sleep 0.5


# set hostname
echo framework > /etc/hostname

clear
sleep 0.5


# set timezone
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

clear
sleep 0.5


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
echo "framework" >> /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	framework.localdomain	framework" >> /etc/hosts

clear
sleep 0.5


# create user
#useradd -g users -G wheel,audio,video,storage,power,kvm,libvirt -m #holodrum
#clear
#sleep 1.5
#\passwd holodrum

#clear
#sleep 0.5


# configure sudo
EDITOR=nano visudo

clear
sleep 0.5


# enable multilib
sudo nano /etc/pacman.conf

clear
sleep 0.5


# generate fstab (is this neccesary with archinstall?)
genfstab -p -U /mnt >> /mnt/etc/fstab

clear
sleep 0.5


# create swapfile
dd if=/dev/zero of=/swapfile bs=1M count=2000 status=progress
chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

clear
sleep 1


# enable multilib
sudo nano /etc/pacman.conf

clear
sleep 0.5


# update
sudo pacman -Syu

clear
sleep 0.5


# install base
sudo pacman -S --noconfirm base
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm linux
sudo pacman -S --noconfirm linux-firmware
sudo pacman -S --noconfirm linux-headers
sudo pacman -S --noconfirm linux-hardened
sudo pacman -S --noconfirm linux-hardened-headers
sudo pacman -S --noconfirm linux-lts
sudo pacman -S --noconfirm linux-lts-headers
sudo pacman -S --noconfirm linux-zen
sudo pacman -S --noconfirm linux-zen-headers
sudo pacman -S --noconfirm nano

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

clear
sleep 0.5


# install xorg
sudo pacman -S --noconfirm mesa
sudo pacman -S --noconfirm xorg
sudo pacman -S --noconfirm xorg-apps
sudo pacman -S --noconfirm xorg-drivers
sudo pacman -S --noconfirm xorg-server
sudo pacman -S --noconfirm xorg-xinit

clear
sleep 0.5


# update
sudo pacman -Sy

clear
sleep 0.5


# install packages
#sudo pacman -S --noconfirm gnome-boxes
#sudo pacman -S --noconfirm gnome-calculator
#sudo pacman -S --noconfirm gnome-calendar
#sudo pacman -S --noconfirm gnome-characters
#sudo pacman -S --noconfirm gnome-clocks
#sudo pacman -S --noconfirm gnome-contacts
#sudo pacman -S --noconfirm gnome-font-viewer
#sudo pacman -S --noconfirm gnome-nettool
#sudo pacman -S --noconfirm gnome-photos
#sudo pacman -S --noconfirm gnome-weather
#sudo pacman -S --noconfirm lightdm-webkit2-greeter
#sudo pacman -S --noconfirm tracker3-miners
#sudo pacman -S --noconfirm flex
sudo pacman -S --noconfirm alacritty
sudo pacman -S --noconfirm alsa-utils
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --noconfirm atom
sudo pacman -S --noconfirm audacity
sudo pacman -S --noconfirm autoconf
sudo pacman -S --noconfirm automake
sudo pacman -S --noconfirm awesome-terminal-fonts
sudo pacman -S --noconfirm baobab
sudo pacman -S --noconfirm barrier
sudo pacman -S --noconfirm bashtop
sudo pacman -S --noconfirm binutils
sudo pacman -S --noconfirm bison
sudo pacman -S --noconfirm bitwarden
sudo pacman -S --noconfirm blueberry
sudo pacman -S --noconfirm bluez
sudo pacman -S --noconfirm bluez-utils
sudo pacman -S --noconfirm bpytop
sudo pacman -S --noconfirm bridge-utils
sudo pacman -S --noconfirm cadence
sudo pacman -S --noconfirm clamav
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm code
sudo pacman -S --noconfirm conky
sudo pacman -S --noconfirm corectrl
sudo pacman -S --noconfirm cups
sudo pacman -S --noconfirm dconf-editor
sudo pacman -S --noconfirm debugedit
sudo pacman -S --noconfirm dialog
sudo pacman -S --noconfirm discord
sudo pacman -S --noconfirm dkms
sudo pacman -S --noconfirm dmenu
sudo pacman -S --noconfirm dnsmasq
sudo pacman -S --noconfirm dolphin-emu
sudo pacman -S --noconfirm dosbox
sudo pacman -S --noconfirm dunst
sudo pacman -S --noconfirm ebtables
sudo pacman -S --noconfirm edk2-ovmf
sudo pacman -S --noconfirm efibootmgr
sudo pacman -S --noconfirm eog
sudo pacman -S --noconfirm evince
sudo pacman -S --noconfirm evolution
sudo pacman -S --noconfirm exfatprogs
sudo pacman -S --noconfirm fakeroot
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm file
sudo pacman -S --noconfirm file-roller
sudo pacman -S --noconfirm filemanager-actions
sudo pacman -S --noconfirm findutils
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm firewalld
sudo pacman -S --noconfirm fish
sudo pacman -S --noconfirm flatpak
sudo pacman -S --noconfirm fprintd
sudo pacman -S --noconfirm gameconqueror
sudo pacman -S --noconfirm gamemode
sudo pacman -S --noconfirm gawk
sudo pacman -S --noconfirm gcc
sudo pacman -S --noconfirm gdm
sudo pacman -S --noconfirm gettext
sudo pacman -S --noconfirm gimp
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gnome-control-center
sudo pacman -S --noconfirm gnome-disk-utility
sudo pacman -S --noconfirm gnome-keyring
sudo pacman -S --noconfirm gnome-pie
sudo pacman -S --noconfirm gnome-screenshot
sudo pacman -S --noconfirm gnome-session
sudo pacman -S --noconfirm gnome-settings-daemon
sudo pacman -S --noconfirm gnome-shell
sudo pacman -S --noconfirm gnome-shell-extensions
sudo pacman -S --noconfirm gnome-system-monitor
sudo pacman -S --noconfirm gnome-tweaks
sudo pacman -S --noconfirm gnome-usage
sudo pacman -S --noconfirm gnome-user-share
sudo pacman -S --noconfirm grep
sudo pacman -S --noconfirm grilo-plugins
sudo pacman -S --noconfirm groff
sudo pacman -S --noconfirm grsync
#sudo pacman -S --noconfirm grub
sudo pacman -S --noconfirm gst-plugin-pipewire
sudo pacman -S --noconfirm gtop
sudo pacman -S --noconfirm gvfs
sudo pacman -S --noconfirm gvfs-afc
sudo pacman -S --noconfirm gvfs-goa
sudo pacman -S --noconfirm gvfs-google
sudo pacman -S --noconfirm gvfs-gphoto2
sudo pacman -S --noconfirm gvfs-mtp
sudo pacman -S --noconfirm gvfs-nfs
sudo pacman -S --noconfirm gvfs-smb
sudo pacman -S --noconfirm gzip
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm intel-media-driver
sudo pacman -S --noconfirm intel-ucode
sudo pacman -S --noconfirm iwd
sudo pacman -S --noconfirm kdeconnect
sudo pacman -S --noconfirm kvantum
sudo pacman -S --noconfirm kvantum-qt5
sudo pacman -S --noconfirm lib32-gamemode
sudo pacman -S --noconfirm lib32-giflib
sudo pacman -S --noconfirm lib32-gnutls
sudo pacman -S --noconfirm lib32-gst-plugins-base-libs
sudo pacman -S --noconfirm lib32-gtk3
sudo pacman -S --noconfirm lib32-libpulse
sudo pacman -S --noconfirm lib32-libva
sudo pacman -S --noconfirm lib32-libxcomposite
sudo pacman -S --noconfirm lib32-libxinerama
sudo pacman -S --noconfirm lib32-libxslt
sudo pacman -S --noconfirm lib32-mpg123
sudo pacman -S --noconfirm lib32-ocl-icd
sudo pacman -S --noconfirm lib32-openal
sudo pacman -S --noconfirm lib32-v4l-utils
sudo pacman -S --noconfirm lib32-vulkan-radeon
sudo pacman -S --noconfirm libguestfs
sudo pacman -S --noconfirm libpulse
sudo pacman -S --noconfirm libreoffice-fresh
sudo pacman -S --noconfirm libtool
sudo pacman -S --noconfirm libva-intel-driver
sudo pacman -S --noconfirm libvirt
sudo pacman -S --noconfirm libzip
sudo pacman -S --noconfirm lutris
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm m4
sudo pacman -S --noconfirm mailnag
sudo pacman -S --noconfirm maim
sudo pacman -S --noconfirm make
sudo pacman -S --noconfirm materia-gtk-theme
sudo pacman -S --noconfirm mesa-demos
sudo pacman -S --noconfirm mutter
sudo pacman -S --noconfirm nautilus
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm nitrogen
sudo pacman -S --noconfirm nomacs
sudo pacman -S --noconfirm nyx
sudo pacman -S --noconfirm obs-studio
sudo pacman -S --noconfirm ocl-icd
sudo pacman -S --noconfirm openbsd-netcat
sudo pacman -S --noconfirm os-prober
sudo pacman -S --noconfirm otf-font-awesome
sudo pacman -S --noconfirm patch
sudo pacman -S --noconfirm patchage
sudo pacman -S --noconfirm picom
sudo pacman -S --noconfirm piper
sudo pacman -S --noconfirm pipewire-zeroconf
sudo pacman -S --noconfirm pkgconf
sudo pacman -S --noconfirm powertop
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm python-pipx
sudo pacman -S --noconfirm python-virtualenv
sudo pacman -S --noconfirm qbittorrent
sudo pacman -S --noconfirm qemu
sudo pacman -S --noconfirm qemu-arch-extra
sudo pacman -S --noconfirm qemu-emulators-full
sudo pacman -S --noconfirm qjackctl
sudo pacman -S --noconfirm qt5-base
sudo pacman -S --noconfirm qt5ct
sudo pacman -S --noconfirm qt6-base
sudo pacman -S --noconfirm qtile
sudo pacman -S --noconfirm refind
sudo pacman -S --noconfirm retroarch
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm rust
sudo pacman -S --noconfirm rygel
sudo pacman -S --noconfirm samba
sudo pacman -S --noconfirm scrot
sudo pacman -S --noconfirm sed
sudo pacman -S --noconfirm simple-scan
sudo pacman -S --noconfirm smartmontools
sudo pacman -S --noconfirm solaar
sudo pacman -S --noconfirm speedtest-cli
sudo pacman -S --noconfirm spice-gtk
sudo pacman -S --noconfirm spice-vdagent
sudo pacman -S --noconfirm starship
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm sushi
sudo pacman -S --noconfirm sysprof
sudo pacman -S --noconfirm sysstat
sudo pacman -S --noconfirm telegram-desktop
sudo pacman -S --noconfirm texinfo
sudo pacman -S --noconfirm tor
sudo pacman -S --noconfirm torbrowser-launcher
sudo pacman -S --noconfirm trayer
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-jetbrains-mono
sudo pacman -S --noconfirm ungoogled-chromium
sudo pacman -S --noconfirm veracrypt
sudo pacman -S --noconfirm virt-manager
sudo pacman -S --noconfirm virt-viewer
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm virtualbox-guest-iso
sudo pacman -S --noconfirm virtualbox-host-modules-arch
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm vulkan-extra-layers
sudo pacman -S --noconfirm vulkan-extra-tools
sudo pacman -S --noconfirm vulkan-headers
sudo pacman -S --noconfirm vulkan-intel
sudo pacman -S --noconfirm vulkan-mesa-layers
sudo pacman -S --noconfirm vulkan-tools
sudo pacman -S --noconfirm vulkan-validation-layers
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm which
sudo pacman -S --noconfirm wine
sudo pacman -S --noconfirm wine-gecko
sudo pacman -S --noconfirm wine-mono
sudo pacman -S --noconfirm winetricks
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm x11vnc
sudo pacman -S --noconfirm xbindkeys
sudo pacman -S --noconfirm xcursor-neutral
sudo pacman -S --noconfirm xdg-user-dirs-gtk
sudo pacman -S --noconfirm xdg-utils
sudo pacman -S --noconfirm xdotool
sudo pacman -S --noconfirm xf86-input-evdev
sudo pacman -S --noconfirm xf86-input-synaptics
sudo pacman -S --noconfirm xf86-input-vmmouse
sudo pacman -S --noconfirm xf86-input-void
sudo pacman -S --noconfirm xf86-video-amdgpu
sudo pacman -S --noconfirm xf86-video-ati
sudo pacman -S --noconfirm xf86-video-dummy
sudo pacman -S --noconfirm xf86-video-fbdev
sudo pacman -S --noconfirm xf86-video-intel
sudo pacman -S --noconfirm xf86-video-nouveau
sudo pacman -S --noconfirm xf86-video-openchrome
sudo pacman -S --noconfirm xf86-video-qxl
sudo pacman -S --noconfirm xf86-video-vesa
sudo pacman -S --noconfirm xf86-video-vmware
sudo pacman -S --noconfirm xf86-video-voodoo
sudo pacman -S --noconfirm xlockmore
sudo pacman -S --noconfirm xorg-bdftopcf
sudo pacman -S --noconfirm xorg-docs
sudo pacman -S --noconfirm xorg-font-util
sudo pacman -S --noconfirm xorg-fonts-100dpi
sudo pacman -S --noconfirm xorg-fonts-75dpi
sudo pacman -S --noconfirm xorg-iceauth
sudo pacman -S --noconfirm xorg-mkfontscale
sudo pacman -S --noconfirm xorg-server
sudo pacman -S --noconfirm xorg-server-devel
sudo pacman -S --noconfirm xorg-server-xephyr
sudo pacman -S --noconfirm xorg-server-xnest
sudo pacman -S --noconfirm xorg-server-xvfb
sudo pacman -S --noconfirm xorg-sessreg
sudo pacman -S --noconfirm xorg-smproxy
sudo pacman -S --noconfirm xorg-x11perf
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm xorg-xcmsdb
sudo pacman -S --noconfirm xorg-xcursorgen
sudo pacman -S --noconfirm xorg-xdpyinfo
sudo pacman -S --noconfirm xorg-xdriinfo
sudo pacman -S --noconfirm xorg-xev
sudo pacman -S --noconfirm xorg-xgamma
sudo pacman -S --noconfirm xorg-xinit
sudo pacman -S --noconfirm xorg-xinput
sudo pacman -S --noconfirm xorg-xkbevd
sudo pacman -S --noconfirm xorg-xkbprint
sudo pacman -S --noconfirm xorg-xkbutils
sudo pacman -S --noconfirm xorg-xkill
sudo pacman -S --noconfirm xorg-xlsatoms
sudo pacman -S --noconfirm xorg-xlsclients
sudo pacman -S --noconfirm xorg-xpr
sudo pacman -S --noconfirm xorg-xrefresh
sudo pacman -S --noconfirm xorg-xsetroot
sudo pacman -S --noconfirm xorg-xvinfo
sudo pacman -S --noconfirm xorg-xwd
sudo pacman -S --noconfirm xorg-xwininfo
sudo pacman -S --noconfirm xorg-xwud
sudo pacman -S --noconfirm zram-generator
sudo pacman -S --noconfirm zsh

clear
sleep 1


# window manager
sudo pacman -S --noconfirm xmobar
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
sudo pacman -S --noconfirm easyeffects
sudo pacman -S --noconfirm lib32-pipewire
sudo pacman -S --noconfirm pavucontrol
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-audio
sudo pacman -S --noconfirm pipewire-jack
sudo pacman -S --noconfirm pipewire-media-session
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm pipewire-zeroconf 

clear
sleep 1.5


# mkinitcpio
mkinitcpio -P

clear
sleep 0.5


# enable systems
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable dhcpcd
systemctl enable gdm
systemctl enable libvirtd
#systemctl enable lightdm
systemctl enable networkmanager
systemctl enable sshd
systemctl enable tor

clear
sleep 1.5


# lightdm theme settings
#sudo nano /etc/lightdm/lightdm.conf
#sleep 0.5
#sudo nano /etc/lightdm/lightdm-webkit2-greeter.conf
#sleep 0.5

#clear
#sleep 1.5


#Virsh
sudo virsh -c qemu:///system net-autostart default
sleep 0.5
sudo virsh -c qemu:///system net-start default
sleep 0.5

clear
sleep 0.5


# update
sudo pacman -Sy

clear
sleep 0.5


#pipewire

#pip
#pip install streamdeck
#sleep 0.5
#pip3 install streamdeck-ui --user

#sleep 0.5
#clear


#get yay

#git clone https://aur.archlinux.org/yay.git
#sleep 0.5
#cd yay
#sleep 0.5
#makepkg -si
#sleep 0.5
#cd ..
#sleep 0.5
#sudo rm -r yay
#clear
#sleep 0.5


# Git lightdm glorious theme
#git clone https://aur.archlinux.org/lightdm-webkit2-theme-glorious.git
#cd lightdm-webkit2-theme-glorious
#makepkg -sri
#cd ..
#sudo rm -r lightdm-webkit2-theme-glorious

#clear
#sleep 1


# Grub fallout theme
#wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
#bash /tmp/install.sh

#clear
#sleep 0.5


# Aur packages
#yay -S --noconfirm cylon
#yay -S --noconfirm debtap
#yay -S --noconfirm goverlay-git
#yay -S --noconfirm lib32-mangohud
#yay -S --noconfirm mangohud
#yay -S --noconfirm mangohud-git
#yay -S --noconfirm openrazer-meta
#yay -S --noconfirm polychromatic-git
#yay -S --noconfirm protontricks
#yay -S --noconfirm replay-sorcery
#yay -S --noconfirm snapd
#yay -S --noconfirm songrec
#yay -S --noconfirm steam-metadata-editor-git
#yay -S --noconfirm suru-plus-aspromauros-git
#yay -S --noconfirm teamviewer

clear
sleep 1

#nerdfonts
#git clone https://github.com/ryanoasis/nerd-fonts
#sleep 0.5
#cd nerd-fonts
#sleep 0.5
#./install.sh
#sleep 0.5
#cd ..
#sleep 0.5
#sudo rm -r nerd-fonts
#sleep 0.5
#clear
#sleep 0.5

#TEMP REMOVED
#AUR
#yay -S --noconfirm debtap
#yay -S --noconfirm lib32-mangohud
#yay -S --noconfirm mangohud
#yay -S --noconfirm openrazer-meta
#yay -S --noconfirm openrazer-meta
#yay -S --noconfirm polychromatic-git
#yay -S --noconfirm polychromatic-git
#yay -S --noconfirm protontricks
#yay -S --noconfirm replay-sorcery
#yay -S --noconfirm snapd
#yay -S --noconfirm songrec
#yay -S --noconfirm steam-metadata-editor-git
#yay -S --noconfirm suru-plus-aspromauros-git
#sleep 0.5

#add user to groups
sudo usermod -a -G wheel,ftp,sudo,audio,video,storage,power,kvm,libvirt,plugdev holodrum

clear
sleep 0.5


#copy dotfiles to new Install
#sudo mkdir /home/holodrum/.local
#sleep 0.5
#sudo mkdir /home/holodrum/.local/share
#sleep 0.5
#sudo mkdir /home/holodrum/.local/share/Steam
#sleep 0.5
#sudo mkdir /home/holodrum/.local/share/Steam/skins
#sleep 0.5
#sudo mkdir /home/holodrum/.config
#sleep 0.5
#sudo cp /install/.bashrc /home/holodrum/
#sleep 0.5
#sudo cp /install/.xinitrc /home/holodrum/
#sleep 0.5
#sudo cp -r /install/.xmonad /home/holodrum/.xmonad
#sleep 0.5
#sudo cp /install/xorg.conf /etc/X11/
#sleep 0.5
#sudo cp -r /install/Top-Right /home/holodrum/.local/share/Steam/skins/
#sleep 0.5
#sudo cp -r /install/xmobar /home/holodrum/.config/
#sleep 0.5
#sudo cp -r /install/applications /home/holodrum/.local/share/
#sleep 0.5
#sudo cp -r /install/dunst /home/holodrum/.config/
#sleep 0.5
#sudo cp -r /install/picom /home/holodrum/.config/
#sleep 0.5
#sudo cp -r /install/rofi /home/holodrum/.config/
#sleep 0.5
#sudo cp -r /install/yuzu /home/holodrum/.local/share/
#sleep 0.5
#sudo cp -r /install/chatterino /home/holodrum/.local/share/
#sleep 0.5

#sudo rm -r install
#sleep 0.5


#delete folder
#remove install folder
#sudo rm -r /install
#clear
#sleep 0.5


# delete files
#rm framework.sh

#clear
#sleep 0.5



# let user know that the install finished
echo DING DING DIIIING!
echo Install is complete!
echo
