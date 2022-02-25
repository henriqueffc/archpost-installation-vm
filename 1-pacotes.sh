#!/bin/bash

#Deletar a antiga pasta no /
sudo rm -r /archpost-installation-vm

#Refresh database
sudo pacman -Syu

#Reflector
echo -n "Voc\u00ea quer executar o reflector para atualizar o mirrorlist? (S) sim / (N) n\u00e3o "
read resposta
case "$resposta" in
     s|S|"")
         sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
         sudo pacman -S --needed --noconfirm reflector rsync
         sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
         sudo pacman -Syyu
     ;;
     n|N)
         echo "Continuando a instala\u00e7\u00e3o dos pacotes"
     ;;
     *)
         echo "Op\u00e7\u00e3o inv\u00e1lida"
     ;;
esac


# Pacotes
# OS pacotes firefox git foram instalados durante a execução do script archinstall utilizando a opção de instalação de mais pacotes. 

# Audio
sudo pacman -S --needed vlc ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer-vaapi gstreamer a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore

# Outros
sudo pacman -S --needed flatpak zsh materia-gtk-theme ufw gufw aria2 bash-completion reflector rsync man-db man-pages texinfo curl cmatrix pacman-contrib dialog unrar zip unzip p7zip okular discount ebook-tools djvulibre unrar libzip kdegraphics-mobipocket kvantum-qt5 qt6-wayland qt5-wayland xorg-xkill libappindicator-gtk3 gparted exa bat alacarte coreutils progress neofetch ntfs-3g xorg-xdpyinfo gnome-icon-theme-symbolic papirus-icon-theme

# Fontes
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation xorg-fonts-type1 xorg-fonts-misc ttf-bitstream-vera ttf-opensans terminus-font ttf-roboto ttf-roboto-mono xorg-fonts-100dpi 

# Pipeware
sudo pacman -S --needed pipewire pipewire-alsa pipewire-jack wireplumber pipewire-pulse gst-plugin-pipewire libpulse pipewire-x11-bell xdg-desktop-portal

# Habilitar os serviços
sudo ufw enable
sudo systemctl enable ufw.service
sudo systemctl enable systemd-boot-update

# Fontes
wget -P ~/Downloads -i urls.txt 

#Alias
mv .bash_aliases ~/

#Modelos de arquivos para o Files
mv arquivo.txt ~/Modelos

# Variáveis
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
echo "source ~/.bash_aliases" >> ~/.bashrc

# Apparmor
echo -n "Voc\u00ea quer instalar o Apparmor? (S) sim / (N) n\u00e3o "
read resposta
case "$resposta" in
     s|S|"")
        sudo pacman -S --needed apparmor python-notify2 python-psutil 
        sudo systemctl enable apparmor.service
        sudo touch /var/log/syslog
        mkdir ~/.config/autostart
        mv apparmor-notify.desktop ~/.config/autostart
        sudo sed -i '34s/#//' /etc/apparmor/parser.conf
        sudo chown henriqueffc:henriqueffc ~/.config/autostart
     ;;
     n|N)
         echo "Continuando a instala\u00e7\u00e3o dos pacotes"
     ;;
     *)
         echo "Op\u00e7\u00e3o inv\u00e1lida"
     ;;
esac


# Mlocate
sudo pacman -S --needed mlocate
sudo updatedb

printf "\e[1;32mFim! Caso tenha instalado o AppArmor acrescente as instruções do arquivo -paBoot.txt/linha 7- nos parâmetros do boot e depois reinicie o sistema. Se você não instalou o Apparmor apenas proceda com a reinicialização do sistema\e[0m"
