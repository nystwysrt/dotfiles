#!/bin/bash
cd ~/

# Update
sudo pacman -Syuu

# Install base packages
yes | sudo pacman -S xorg 
yes | sudo pacman -S xorg-xinit xorg-xrandr
yes | sudo pacman -S neovim firefox
yes | sudo pacman -S git curl wget
yes | sudo pacman -S xbindkeys xclip unclutter feh picom
yes | sudo pacman -S alsa alsa-utils
yes | sudo pacman -S ttf-font-awesome

# Install yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

# Set locale
echo 'export LC_ALL=en_US.utf-8' >> ~/.bashrc
echo 'export LANG="$LC_ALL"' >> ~/.bashrc
