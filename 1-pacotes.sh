#!/bin/bash

#Deletar a antiga pasta no /
sudo rm -r /archpost-installation-vm

# Reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo pacman -S --needed --noconfirm reflector rsync
sudo reflector -c Brazil -a 12 -p --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu


# Pacotes
# OS pacotes firefox git foram instalados durante a execução do script archinstall utilizando a opção de instalação de mais pacotes. 

# Audio
sudo pacman -S --needed vlc ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer-vaapi gstreamer a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore

# Outros
sudo pacman -S --needed flatpak zsh materia-gtk-theme ufw gufw aria2 bash-completion man-db man-pages texinfo curl cmatrix pacman-contrib dialog unrar zip unzip p7zip okular discount ebook-tools djvulibre unrar libzip kdegraphics-mobipocket kvantum-qt5 qt6-wayland qt5-wayland xorg-xkill gifski libappindicator-gtk3 gparted exa bat alacarte coreutils progress neofetch ntfs-3g xorg-xdpyinfo gnome-icon-theme-symbolic papirus-icon-theme

# Fontes
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation xorg-fonts-type1 xorg-fonts-misc ttf-bitstream-vera ttf-opensans terminus-font ttf-roboto ttf-roboto-mono xorg-fonts-100dpi 

# Pipeware
sudo pacman -S --needed pipewire pipewire-alsa pipewire-jack wireplumber pipewire-pulse gst-plugin-pipewire libpulse pipewire-x11-bell xdg-desktop-portal

# Habilitar os serviços
sudo ufw enable
sudo systemctl enable ufw.service

# Fontes
wget -P ~/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ~/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

#Alias
mv .bash_aliases ~/

# Variáveis
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
echo "source ~/.bash_aliases" >> ~/.bashrc

#Apparmor
sudo pacman -S --needed apparmor python-notify2 python-psutil 
sudo systemctl enable apparmor.service
sudo touch /var/log/syslog
sudo mkdir ~/.config/autostart
sudo mv apparmor-notify.desktop ~/.config/autostart
sudo sed -i '34s/#//' /etc/apparmor/parser.conf
sudo chown henriqueffc:henriqueffc ~/.config/autostart

# Mlocate
sudo pacman -S --needed mlocate
sudo updatedb

printf "\e[1;32mFim! Acrescente o AppArmor -paBoot.txt- nos parâmetros do boot. Reinicie o sistema.\e[0m"
