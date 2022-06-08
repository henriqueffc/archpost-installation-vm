#!/usr/bin/env bash

# Henrique Custódio
# https://github.com/henriqueffc
# AVISO: Execute o script por sua conta e risco.
# License: MIT License

#Cores dos avisos

AZUL='\e[1;34m'
VERDE='\e[1;32m'
RED='\e[1;31m'
LVERDE='\e[0;92m'
FIM='\e[0m'

#Pacotes
sudo pacman -S libappindicator-gtk3 wmctrl --needed

#Inicializar junto com o sistema
systemctl --user enable --now ulauncher

echo -e "$AZUL 
-------------------------------------------------------------------------
        	Iniciando as configurações do Ulauncher
-------------------------------------------------------------------------
$FIM" && sleep 8

#Copiando os ícones
tar -Jxxvf ./ulauncher/imagens.tar.xz -C ~/Imagens

#Instalando os temas
git clone https://github.com/dracula/ulauncher.git ~/.config/ulauncher/user-themes/dracula-ulauncher
git clone https://github.com/tom-james-watson/ulauncher-popdark.git ~/.config/ulauncher/user-themes/ulauncher-popdark

#Backup das configurações 
mv ~/.config/ulauncher/shortcuts.json ~/.config/ulauncher/shortcuts.json.bak
cp ~/.config/ulauncher/settings.json ~/.config/ulauncher/settings.json.bak

#Movendo o arquivo das configurações dos atalhos
mv ./ulauncher/shortcuts.json ~/.config/ulauncher/

#Substituindo o tema
sed -i 's/light/\dracula/' ~/.config/ulauncher/settings.json

#Mudando a tecla de atalho / não é necessário. o atalho já foi definido nas configurações de atalhos de teclado do GNOME pelo script 2-pacote.sh
#sed -i 's/<Primary>space/\<Super>backslash/' ~/.config/ulauncher/settings.json

#Instalando as extenções
git clone https://github.com/leinardi/ulauncher-exit-gnome ~/.local/share/ulauncher/extensions
git clone https://github.com/dalanicolai/gnome-tracker-extension ~/.local/share/ulauncher/extensions
git clone https://github.com/fisadev/ulauncher-better-file-browser ~/.local/share/ulauncher/extensions
git clone https://github.com/Doekeb/ulauncher-gnome-calculator ~/.local/share/ulauncher/extensions
git clone https://github.com/isacikgoz/ukill ~/.local/share/ulauncher/extensions
git clone https://ext.ulauncher.io/-/github-friday-ulauncher-clipboard ~/.local/share/ulauncher/extensions
git clone https://ext.ulauncher.io/-/github-kuenzelit-ulauncher-firefox-bookmarks ~/.local/share/ulauncher/extensions

printf "%s $VERDE Fim! O atalho para o Ulauncher foi defino no script 2-pacote.sh (Super + \). REINICIE o computador para que as mudanças sejam aplicadas no Ulauncher $FIM \n"