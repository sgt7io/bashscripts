#!/bin/sh

#This script is to automate or provide instructions for configuration of a post install of Debian
#It is still a work in progress and as things can be automated they will

#Switch to fastest update server
#Open "Software and Updates" => Debian Software Tab
#Download from and click "Select the best server"

#Create some additional directories we will use later
mkdir ~/.themes
mkdir ~/.icons
mkdir ~/software

#If upgrading to Debian testing on a VM uncomment the following
#To install extensions etc.
sudo apt -y install gcc-8-base
sudo apt -y install dkms
sudo apt -y install build-essential
sudo apt -y install linux-headers-$(uname -r) 

#If installing on a laptop uncomment to extend battery life
sudo apt -y install tlp

#For my ThinkPad T580 power management
sudo apt -y install acpi-call-dkms

#Add contrib and non-free repositories
sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.original
sudo sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list

#Update and update packages
sudo apt -y update
sudo apt -y upgrade

#Enable minimize, maximize, and close button
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

#Install additional graphical drivers if applicable
#Nvidia
#sudo apt -y install nvidia-detect
#sudo nvidia-detect
#sudo apt -y install nvidia-driver

#AMD
#sudo apt install firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu

#Remove unnecessary apps
sudo apt -y purge aisleriot five-or-more four-in-a-row hitori gnome-klotski gnome-mines gnome-nibbles gnome-robots 
sudo apt -y purge debian-reference-it debian-reference-es debian-reference-common
sudo apt -y autoremove

#Install additional software vim, synaptic, etc.
sudo apt -y install vim git synaptic intel-microcode tilix debian-reference-en nmap netcat tcpdump curl

#Set up .vimrc. Turn off syntax highlighting, turn on numbering, set up paste capability in Vim
echo "syntax on" > ~/.vimrc
echo "set number" >> ~/.vimrc
echo "set mouse=r" >> ~/.vimrc

#Install Restricted-Extras Packages
sudo apt -y install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

#Install VLC and Plugins
sudo apt -y install vlc vlc-plugin-samba vlc-plugin-video-splitter

#Install ufw enable 
sudo apt -y install ufw
sudo ufw enable
sudo ufw status verbose
sudo ufw app list
sudo ufw status numbered

#Configure Swappiness
sudo cat /proc/sys/vm/swappiness
sudo /bin/su -c "echo 'vm.swappiness = 10' > /etc/sysctl.d/swappiness.conf"

#Speed up the boot time
sudo cp -p /etc/default/grub /etc/default/grub.original
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

#Install easy theme if you don't want to customize too much
sudo apt -y install numix-gtk-theme numix-icon-theme-circle

#Enable Snap and Flatpak support
#Open Software Center and Search for Gnome Software to confirm installation
sudo apt -y install gnome-software-plugin-flatpak
#sudo apt -y install gnome-software-plugin-snap

#Switch to X.org as Wayland does not work as work
#Select System X11 Default at login screen
ps -e | grep X

#Install Desktop Desktop Icons,and User Themes Extensions
#https://extensions.gnome.org/extension/19/user-themes/
#https://extensions.gnome.org/extension/1465/desktop-icons/

#Install Additional Themes
#https://www.gnome-look.org/p/1357889/
#https://www.gnome-look.org/p/1279924/

#https://www.gnome-look.org/p/1334194/
#https://www.gnome-look.org/p/1267246/

#Open Tweaks => Appearance => Select Orchis for applications and Shell and Tela in icons.

#Go to Account Settings and set your user image. This will make your system more personal and more beautiful.

#Ctrl+Alt+T to open Terminal
#Settings => Devices => Keyboard => Add new shortcut
#Name it Open Terminal and type gnome-terminal as a command
#To set the shortcut, press Ctrl+Alt+T

#Xkill shortcut
#Settings => Devices => Keyboard => Add new shortcut. Type xkill in the name and command and set Ctrl+Alt+Esc as a shortcut

#Change LibreOffice look
#View => Toolbar Layout => Single Toolbar
#Tools =>  Options => View => Style. Select  Colibre icons

#Enable Tray Icons
#https://extensions.gnome.org/extension/1031/topicons/

#Enable Nightlight
#Settings → Devices → Display → and set Night Light on.

#Firefox Settings
#Firefox Preferences and activate Restore previous session

#Firefox DRM Settings
#DRM support select enable
