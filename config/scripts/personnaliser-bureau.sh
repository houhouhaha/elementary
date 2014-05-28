#!/bin/bash
#
# personnaliser-bureau.sh
# 
# (c) Niki Kovacs, 2014

UTILISATEUR=kikinovak

# Augmenter la taille de la police de l'interface utilisateur
su -c 'gsettings set org.gnome.desktop.interface font-name "Droid Sans 11"' $UTILISATEUR
# Augmenter la taille de la police du terminal
su -c 'gsettings set org.pantheon.terminal.settings font "Droid Sans Mono 12"' $UTILISATEUR
# Agencement des boutons de fenêtres similaire à Microsoft Windows
su -c 'gsettings set org.pantheon.desktop.gala.appearance button-layout ":minimize,maximize,close"' $UTILISATEUR
# Définir le nombre de lignes du lanceur d'applications (3 par défaut)
su -c 'gsettings set org.pantheon.desktop.slingshot rows 4' $UTILISATEUR
# Définir le nombre de colonnes du lanceur d'applications (4 par défaut)
su -c 'gsettings set org.pantheon.desktop.slingshot rows 4' $UTILISATEUR
# Interface semblable à Mac OS X Lion
su -c 'gsettings set org.gnome.desktop.wm.preferences theme "Lion"' $UTILISATEUR
# Alternative : Lion; la valeur "Chamapgne" est effectivement mal orthographiée
su -c 'gsettings set org.gnome.desktop.interface gtk-theme "Chamapgne"' $UTILISATEUR
# Fond d'écran par défaut
# Alternatives au choix: 1280x800.png 159.jpg 164.jpg 168.jpg 16.jpg 173.jpg 2.jpg 35mm.png 94.jpg ARTcast.jpg Blocks.jpg Climb.jpg CloudStorage.png Cold Evening.jpg Color.jpg crosses.jpg direction.jpg Dots.jpg elementaryos-default elementary-wallpapers.xml Geometric.png GoingHome.jpg GoldenBeach.jpg GoogleNow.png Horseshoe Bend Sunset.jpg jupiter.jpg Lake Tahoe Colors.jpg Leaves.jpg Lighthouse.jpg more_purple.jpg morning.jpg opensuse-1600x1200.jpg Our Night Under The Stars.jpg Paris la Tour Eiffel.jpg pedals.png ps3.png Purple.png rainbow.png rock_salt.jpg Sea.jpg snes.png Space.png sunset.jpg Temple.jpg The Coast.jpg thinklinux-1280x1024.png thinklinux-1280x854.jpg Tunnel.jpg Urban Dream.jpg Water Lily.jpg Wild.jpg
su -c 'gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/rock_salt.jpg"' $UTILISATEUR
# Désactiver l'alerte sonore du Terminal
su -c 'gsettings set org.pantheon.terminal.settings audible-bell false' $UTILISATEUR


