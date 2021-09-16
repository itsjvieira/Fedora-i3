#!/bin/bash

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
cp gtkrc-2.0 ~/.gtkrc-2.0
sudo cp etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf

convert wallpapers/1366×768.jpg lock.png -gravity center -composite ~/.config/i3/lockscreen.png
sudo cp wallpapers/1366×768.jpg /usr/share/backgrounds/wallpaper.jpg
nitrogen --set-auto /usr/share/backgrounds/wallpaper.jpg --save