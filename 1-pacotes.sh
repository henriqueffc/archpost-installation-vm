#!/bin/bash

#Cores dos avisos

AZUL='\e[1;34m'
VERDE='\e[1;32m'
RED='\e[1;31m'
LVERDE='\e[0;92m'
FIM='\e[0m'

#Deletar a antiga pasta no /
sudo rm -r /archpost-installation-vm

# Grupos
sudo usermod -aG brlapi $USERNAME
sudo usermod -aG wheel $USERNAME

echo -e "${AZUL}
-------------------------------------------------------------------------
                          Instalando os pacotes
-------------------------------------------------------------------------
${FIM}"

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


echo -e "${AZUL}
-------------------------------------------------------------------------
                      Habilitando os serviços
-------------------------------------------------------------------------
${FIM}"

# Habilitar os serviços
sudo ufw enable
sudo systemctl enable ufw.service
echo -e "  ${AZUL}ufw.service habilitado${FIM}"
sudo systemctl enable systemd-boot-update
echo -e "  ${AZUL}systemd-boot-update habilitado${FIM}"

echo -e "${AZUL}
-------------------------------------------------------------------------
                      Restante das configurações
-------------------------------------------------------------------------
${FIM}"

#Fontes e outros
wget -P ~/Downloads -i $HOME/archpost-installation-vm/urls/urls.txt 
sudo mv ~/Downloads/*.ttf /usr/share/fonts/TTF
sudo fc-cache -fv

#Alias
mv $HOME/archpost-installation-vm/aliases/.bash_aliases ~/

#Modelos de arquivos para o Files
mv $HOME/archpost-installation-vm/modelo/arquivo.txt ~/Modelos

# Variáveis
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
echo "source ~/.bash_aliases" >> ~/.bashrc

#Apparmor
while :;  do
echo -ne "${VERDE}Você quer instalar o Apparmor?${FIM} ${LVERDE}(S) sim / (N) não ${FIM}"
read resposta
case "$resposta" in
     s|S|"")
        sudo pacman -S --needed apparmor python-notify2 python-psutil 
        sudo systemctl enable apparmor.service
        sudo touch /var/log/syslog
        mkdir ~/.config/autostart
        mv $HOME/archpost-installation/apparmor/apparmor-notify.desktop ~/.config/autostart
        sudo sed -i '34s/#//' /etc/apparmor/parser.conf
        sudo chown $USER:$USER ~/.config/autostart; break;;
     n|N)
         echo -e "${AZUL}Finalizando a instalação${FIM}"; break;;
     *)
         echo -e "${RED}Opção inválida${FIM}";;
esac
done


# Mlocate - necessário para a busca no Ulauncher
sudo pacman -S --needed mlocate
sudo updatedb
echo -e "  ${AZUL}Mlocate habilitado${FIM}"

#Mirrorlist atual
echo -e "${AZUL}Mirrorlist atual${FIM}"
cat /etc/pacman.d/mirrorlist

#Reflector
while :;  do
echo -ne "${AZUL}
Você quer executar o reflector para atualizar o mirrorlist?
Caso não tenha acontecido problemas na instalação dos pacotes não recomendamos a execução.${FIM}  ${LVERDE}(S) sim / (N) não 
${FIM}"
read resposta
case "$resposta" in
     s|S|"")
         sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak2
         sudo pacman -S --needed --noconfirm reflector rsync
         sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
         sudo pacman -Syyu; break;;
     n|N)
         echo -e "${AZUL}Fim da instalação${FIM}"; break;;
     *)
         echo -e "${RED}Opção inválida. Responda a pergunta.${FIM}";;
esac
done

printf "${VERDE}Fim! Caso tenha instalado o AppArmor acrescente as instruções do arquivo -paBoot.txt/linha 7- nos parâmetros do boot e depois reinicie o sistema. Se você não instalou o Apparmor apenas proceda com a reinicialização do sistema${FIM}\n"
