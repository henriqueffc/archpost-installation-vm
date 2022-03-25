#!/usr/bin/env bash

# Henrique Custódio
# https://github.com/henriqueffc
#
# AVISO: Execute o script por sua conta e risco.

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/GNOME/ name "GNOME"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/GNOME/ apps "['org.gnome.Contacts.desktop', 'org.gnome.Maps.desktop', 'org.gnome.Photos.desktop', 'org.gnome.Weather.desktop', 'org.gnome.Totem.desktop', 'org.gnome.Books.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Extensions.desktop', 'yelp.desktop', 'org.gnome.Cheese.desktop', 'simple-scan.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Epiphany.desktop', 'org.gnome.Music.desktop', 'org.gnome.Characters.desktop', 'org.gnome.font-viewer.desktop']"


gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'YaST', 'GNOME']"
