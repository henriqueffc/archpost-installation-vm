#!/bin/bash

echo -ne "
-------------------------------------------------------------------------
                   Instalando os aplicativos Flatpaks
-------------------------------------------------------------------------
"

# Flatpak Aplicativos
flatpak install flathub com.github.rajsolai.textsnatcher -y
flatpak install flathub io.github.wereturtle.ghostwriter -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark -y

# Flatpak Remote-Beta
echo -n "Você quer adicionar o remote Flathub Beta? (S) sim / (N) não "
read resposta
case "$resposta" in
     s|S|"")
          flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
          echo "Fim da instalação"
     ;;
     n|N)
          echo "Fim da instalação"
     ;;
     *)
          echo "Opção inválida"
     ;;
esac


echo -e "${AZUL}
-------------------------------------------------------------------------
                   Fonte do Terminal - MesloLGS NF 14
-------------------------------------------------------------------------
${FIM}"

#Fonte do terminal
font=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$font/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$font/ font 'MesloLGS NF 12'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$font/ visible-name 'Padrão'