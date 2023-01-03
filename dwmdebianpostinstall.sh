#!/usr/bin/env bash

#Update the packages and install applications you want
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y aptitude synaptic vim git net-tools htop neomutt build-essential wget curl firefox-esr network-manager
sudo apt install -y xorg xserver-xorg x11-xserver-utils libx11-dev linux-headers-$(uname -r) firmware-linux-nonfree mesa-utils \
libxft-dev libfontconfig1 libx11-6 libxinerama-dev stterm suckless-tools imagemagick feh fonts-font-awesome
sudo apt install xserver-xorg-dev i3lock

#For transparancy install compton
sudo apt install -y compton

#For VMs uncomment
#sudo apt install -y dkms

mkdir ~/.config ~/bin ~/dotfiles ~/Software ~/Documents ~/Downloads ~/Pictures ~/Videos ~/Music ~/Podcasts ~/Projects

#Basic Install of dwm
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz

tar -xvzf dwm-6.2.tar.gz -C ~/Software

cd  ~/Software/dwm-6.2

make

ln -sf ~/Software/dwm-6.2/dwm ~/bin/dwm

rm -f dwm-6.2.tar.gz

echo "Finished compiling and sym linking dwm"

########### Customize From Here #############################

#Basic install of st
cd ~/Software

git clone https://github.com/linuxdabbler/st.git

cd ~/Software/st

sudo sed -i 's/Ubuntu Mono/Monospace/g' ~/Software/st/config.h
sudo sed -i 's/JoyPixels/font awesome/g' ~/Software/st/config.h

make

sudo apt remove -y stterm

ln -sf ~/Software/st/st ~/bin/st

echo "Finished compiling and sym linking st"

Set up dotfiles

cd ~/dotfiles

git clone https://github.com/linuxdabbler/personal-dot-files.git

cd ~/dotfiles/personal-dot-files

chmod +x bmenu debinfo dwmbar dwm-iconbar fehbg hush lok louder pmenu quieter refbar shufman wal weather.sh
mv bmenu debinfo dwmbar dwm-iconbar fehbg hush lok louder pmenu quieter refbar shufman wal weather.sh ~/bin/

mv wallpapers/ ~/Pictures

cat Xresources >> ~/.Xdefaults
cat bash-alias.txt >> ~/.bashrc
mv bookmarks ~/.config/

echo '#!/bin/sh' > ~/.xinitrc
echo 'feh --bg-scale ~/Pictures/wallpapers/141.png' >> ~/.xinitrc 
echo '~/bin/dwmbar &' >> ~/.xinitrc 
echo 'exec dwm' >> ~/.xinitrc

#sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack

echo "Install complete! Logout, Login, and startx!"
