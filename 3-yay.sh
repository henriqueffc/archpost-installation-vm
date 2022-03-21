#!/usr/bin/env bash

# Henrique Custódio
# https://github.com/henriqueffc
#
# AVISO: Execute o script por sua conta e risco.

#Cores dos avisos

AZUL='\e[1;34m'
VERDE='\e[1;32m'

echo -e "$AZUL 
-------------------------------------------------------------------------
                    Instalando o YAY
-------------------------------------------------------------------------"

# YAY
sudo pacman -S --needed git base-devel go wget
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

echo -e "$AZUL 
-------------------------------------------------------------------------
                    Instalando os pacotes AUR
-------------------------------------------------------------------------"

# Pacotes AUR
yay --needed -S - <./pacotes/aur.txt

printf "%s $VERDE Fim! Reinicie o sistema.\n"
