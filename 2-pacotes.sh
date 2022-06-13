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

# Grupos
sudo usermod -aG brlapi "$USERNAME"
sudo usermod -aG wheel "$USERNAME"

echo -e "$AZUL
-------------------------------------------------------------------------
  Instalando os pacotes para Áudio, programas, fontes 
  e Pipewire/wireplumber. Digite S (SIM) para todas as
  requisições feitas pelo sistema para as instalações
  desses pacotes.
-------------------------------------------------------------------------
$FIM" && sleep 3

# Pipewire
sudo pacman --needed -S - <./pacotes/pipewire.txt

# Áudio - Codecs
sudo pacman --needed -S - <./pacotes/pkg-audio.txt

# Outros
sudo pacman --needed -S - <./pacotes/pkg.txt

# Fontes
sudo pacman --needed -S - <./pacotes/fontes.txt

echo -e "$AZUL
-------------------------------------------------------------------------
                      Habilitando os serviços
-------------------------------------------------------------------------
$FIM"

# Habilitar os serviços
sudo systemctl enable --now ufw.service
sudo ufw enable
echo -e "$AZUL \t ufw.service habilitado $FIM"
sudo systemctl enable systemd-boot-update
echo -e "$AZUL \t systemd-boot-update habilitado $FIM"

echo -e "$AZUL
-------------------------------------------------------------------------
                      Restante das configurações
-------------------------------------------------------------------------
$FIM"

#Fontes
wget -i ./urls/urls.txt -P ~/Downloads
sudo mkdir -p /usr/local/share/fonts
tar -xf ./pacotes/fonts.tar.xz -C ~/Downloads
sudo mv ~/Downloads/*.ttf /usr/local/share/fonts
sudo mv ~/Downloads/*.TTF /usr/local/share/fonts
sudo fc-cache -fv

#Alias
mv ./aliases/.bash_aliases ~/

#Modelos de arquivos para o Files
mv ./modelo/arquivo.txt ~/Modelos

#Desabilitar o core dumps

sudo sed -i 's/#Storage=external/Storage=none/' /etc/systemd/coredump.conf

sudo systemctl daemon-reload

#Limite do tamanho do Journal

sudo sed -i 's/#SystemMaxUse=/SystemMaxUse=300M/' /etc/systemd/journald.conf

sudo systemctl restart systemd-journald.service

sudo journalctl --vacuum-size=100M
sudo journalctl --vacuum-time=2weeks

# Variáveis
echo "source ~/.bash_aliases" >>~/.bashrc

echo -e "$AZUL Alterando o tema, os ícones, o wallpaper e os atalhos do sistema em 1 $FIM" && sleep 1
echo -e "$AZUL Alterando o tema, os ícones, o wallpaper e os atalhos do sistema em 2 $FIM" && sleep 1
echo -e "$AZUL Alterando o tema, os ícones, o wallpaper e os atalhos do sistema em 3 $FIM" && sleep 1

#Tema do sistema GNOME 42
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
#Tema para os aplicativos legados GNOME 42
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

#Tema dos ícones 
#gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

#Desabilitar o tempo antes da sessão ser considerada ociosa
gsettings set org.gnome.desktop.session idle-delay "0"

#Suspensão automática - Desabilitada quando conectado a energia e na bateria
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type nothing

#Abrir os aplicativos centralizados na tela
gsettings set org.gnome.mutter center-new-windows true

#Desabilitar os cantos ativos
gsettings set org.gnome.desktop.interface enable-hot-corners false

#Ao pesquisar no overview não serão exibidos os resultados da pesquisa realizada pelos aplicativos contidos nesta lista.
gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Contacts.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Photos.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Epiphany.desktop', 'org.gnome.Software.desktop']"

#Tamanho da fonte do sistema
gsettings set org.gnome.desktop.interface font-name "Noto Sans 12"
gsettings set org.gnome.desktop.interface document-font-name "Noto Sans 12"
gsettings set org.gnome.desktop.interface monospace-font-name "Noto Sans Mono 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Noto Sans Bold 12"
gsettings set org.gnome.desktop.interface font-antialiasing rgba

#GNOME Software
gsettings set org.gnome.software download-updates false
gsettings set org.gnome.software first-run false

#Atalhos do teclado (abnt2 com teclado numérico)
# abaixar o volume - Ctrl + - teclado numérico
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Primary>KP_Subtract']"
# aumentar o volume - Ctrl + + teclado numérico
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Primary>KP_Add']"
#reproduzir ou pausar reprodução de mídia - Crtl + * teclado numérico
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['<Primary>KP_Multiply']"
#mudar para a próxima faixa - Ctrl + / teclado numérico
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Primary>KP_Divide']"
# abrir navegador - Super + B
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
#abrir o Files na home - Super + F
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"
#fechar a janela - Super + Q
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

# Atalho personalizado para lançar o Terminal - Super + T
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Super>t"

# Atalho personalizado para lançar o Ulauncher (Wayland) - Super + \
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Ulauncher"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "ulauncher-toggle"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>backslash"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

#Wallpaper dinâmico
mkdir "$HOME"/Imagens/Wallpaper
sudo cp ./wallpapers/*.* ~/Imagens/Wallpaper
sed -i 's|/home/user1|'$HOME'|g' ~/Imagens/Wallpaper/dynamic_wallpaper.xml
dir=$HOME
#Light
gsettings set org.gnome.desktop.background picture-uri file://$dir/Imagens/Wallpaper/dynamic_wallpaper.xml
#Dark
gsettings set org.gnome.desktop.background picture-uri-dark file://$dir/Imagens/Wallpaper/dynamic_wallpaper.xml

#Apparmor
sudo pacman -S --needed apparmor python-notify2 python-psutil
sudo systemctl enable apparmor.service
sudo touch /var/log/syslog
mkdir ~/.config/autostart
mv ./apparmor/apparmor-notify.desktop ~/.config/autostart
sudo sed -i '/#write-cache/c\write-cache' /etc/apparmor/parser.conf
sudo chown $USER:$USER ~/.config/autostart

# Mlocate - necessário para a busca no Ulauncher
sudo pacman -S --needed mlocate
sudo updatedb
echo -e "$AZUL \t Mlocate habilitado. $FIM"

#Mirrorlist atual
echo -e "$VERDE Mirrorlist atual. $FIM"
cat /etc/pacman.d/mirrorlist

#Reflector
while :; do
   echo -ne "$VERDE 
Você quer executar o reflector para atualizar o mirrorlist?
Caso não tenha acontecido problemas na instalação dos pacotes não recomendamos a execução. $FIM $LVERDE (S) sim / (N) não $FIM"
   read -r resposta
   case "$resposta" in
   s | S | "")
      sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak2
      sudo pacman -S --needed --noconfirm reflector rsync
      sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
      sudo pacman -Syyu
      break
      ;;
   n | N)
      echo -e "$AZUL Fim da instalação. $FIM"
      break
      ;;
   *)
      echo -e "$RED Opção inválida. Responda a pergunta. $FIM"
      ;;
   esac
done

# Pacman hooks
sudo mkdir /etc/pacman.d/hooks
sudo cp ./hooks/*.hook /etc/pacman.d/hooks/

#Parâmetros do boot
cp /boot/loader/entries/*.conf ~/
sudo sed -i '$ { s/^.*$/& lsm=landlock,lockdown,yama,apparmor,bpf/ }' /boot/loader/entries/*.conf

printf "%s $VERDE Fim! Reinicie o sistema. $FIM \n"
