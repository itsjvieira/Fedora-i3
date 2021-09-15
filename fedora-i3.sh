#!/bin/bash

echo "# Installing software #"
echo ""

sudo dnf -y update
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf -y install zsh thunar-archive-plugin xarchiver zip unzip wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install google-chrome-stable_current_x86_64.rpm
sudo dnf -y install pavucontrol light xss-lock
sudo dnf -y install qpdfview-qt5 viewnior vlc
sudo dnf -y install lxappearance arandr
sudo dnf -y install xfce4-terminal texlive-base
sudo dnf -y install gcc gcc-c++ pulseaudio-libs-devel boost-devel
sudo dnf -y install audacity keepassxc libreoffice
sudo dnf -y install codium discord
sudo dnf -y install akmod-nvidia

git clone https://github.com/cdemoulins/pamixer.git
cd pamixer
make
sudo make install
cd ..

echo "# Moving config files #"
echo ""

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.config/VSCodium/User
mkdir -p ~/.config/xfce4/terminal
mkdir -p ~/.config/gtk-3.0

cp i3/config ~/.config/i3/config
cp i3status/config ~/.config/i3status/config
cp VSCodium/storage.json ~/.config/VSCodium/storage.json
cp VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
cp xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
cp gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

echo "# DONE #"