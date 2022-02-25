#!/bin/bash

# YAY 
sudo pacman -S --needed git base-devel go wget
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Pacotes AUR
yay -S appimagelauncher ulauncher downgrade inxi ttf-ms-fonts qgnomeplatform

printf "\e[1;32mFim! Reinicie o sistema.\e[0m"
