sudo pacman -S --needed exfatprogs openssh sshfs base base-devel linux linux-firmware linux-headers zram-generator efibootmgr nano intel-ucode mesa lib32-mesa vulkan-intel lib32-vulkan-intel git dunst alacritty dolphin waybar rofi firefox podman docker docker-compose flatpak rclone network-manager-applet clamav distrobox firewalld libvirt iptables-nft dnsmasq openbsd-netcat qemu-full qemu-emulators-full qemu-block-gluster qemu-block-iscsi samba virtualbox virtualbox-host-modules-arch virtualbox-guest-iso lxsession speedtest-cli veracrypt vulkan-icd-loader lib32-vulkan-icd-loader wget xdg-user-dirs pipewire lib32-pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber pipewire-audio pipewire-zeroconf pavucontrol bluez bluez-utils blueman virt-manager swtpm edk2-ovmf xorg xorg-apps xorg-drivers xorg-xinit os-prober code conky digikam dosfstools gamescope grim slurp lutris mangohud ark discord gst-plugin-pipewire gst-plugins-good lib32-pipewire lib32-pipewire-jack noto-fonts-cjk noto-fonts-emoji ntfs-3g obs-studio qbittorrent seahorse slurp spotify-launcher steam telegram-desktop thunderbird torbrowser-launcher ttf-font-awesome ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono unrar vlc wine-staging sddm plasma-desktop
 
sudo freshclam

sudo virsh -c qemu:///system net-autostart default
sudo virsh -c qemu:///system net-start default

# yay

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && sudo rm -r yay

#yay -S portmaster-stub-bin # kills ssh

yay -S swww 

# snap

git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -si && cd .. && sudo rm -r snapd

# snap apps

sudo snap install authy

# system

systemctl enable --now firewalld docker docker.socket NetworkManager libvirtd sshd bluetooth libvirtd libvirtd.socket clamav-daemon snapd.socket tor sddm

sudo usermod -aG vboxusers,docker,libvirt,kvm,root,input mob

sudo ln -s /var/lib/snapd/snap /snap

# distrobox AUR

distrobox create -n AUR -i archlinux:latest

# distrobox Arch applications

distrobox create -n Apps -i archlinux:latest

yay -S downgrade pkgbrowser

# distrobox Sandbox

distrobox create -n Sandbox -i archlinux:latest

sudo pacman -S gnome-disk-utility gnome-system-monitor partitionmanager plasma-systemmonitor

sudo pacman -S nautilus