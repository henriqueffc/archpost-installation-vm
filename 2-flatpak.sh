#!/bin/bash

# Flatpak Aplicativos
flatpak install flathub com.github.rajsolai.textsnatcher -y
flatpak install flathub io.github.wereturtle.ghostwriter -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark -y

# Flatpak Remote-Beta
echo -n "Voc\u00ea quer adicionar o remote Flathub Beta? (S) sim / (N) n\u00e3o "
read resposta
case "$resposta" in
     s|S|"")
      flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
     ;;
     n|N)
         echo "Continuando a instala\u00e7\u00e3o dos pacotes"
     ;;
     *)
         echo "Op\u00e7\u00e3o inv\u00e1lida"
     ;;
esac
