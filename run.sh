#!/bin/bash
cd ~/

# Update
sudo pacman -Syuu

# Install base packages
yes | sudo pacman -S xorg-xinit xorg-xrandr
yes | sudo pacman -S neovim firefox dmenu
yes | sudo pacman -S python-pip python2-pip
yes | sudo pacman -S git curl wget
yes | sudo pacman -S xbindkeys
yes | sudo pacman -S alsa-utils
yes | sudo pacman -S ttf-font-awesome

# python linter
#sudo pip install flake8

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
