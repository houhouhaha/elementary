#!/bin/bash
#
# personnaliser-elementary.sh
# 
# (c) Niki Kovacs, 2014

CWD=$(pwd)

# Ranger les fonds d'écran à leur place
#echo ":: Installation des fonds d'écran supplémentaires."
#if [ -d /usr/share/backgrounds ]; then
#	cp -f $CWD/../backgrounds/* /usr/share/backgrounds/
#fi

# Ranger les icônes à leur place
echo ":: Installation des icônes supplémentaires."
if [ -d /usr/share/pixmaps ]; then
  cp -f $CWD/../pixmaps/* /usr/share/pixmaps/
fi

# Activer les polices Bitmap
echo ":: Activation des polices Bitmap."
if [ -h /etc/fonts/conf.d/70-no-bitmaps.conf ]; then
	rm -f /etc/fonts/conf.d/70-no-bitmaps.conf
	ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
	dpkg-reconfigure fontconfig
fi

# Configurer APT
echo ":: Configuration des dépôts de base pour APT."
cat $CWD/../apt/sources.list.precise > /etc/apt/sources.list
chmod 0644 /etc/apt/sources.list

echo ":: Configuration du dépôt Elementary Update pour APT."
cat $CWD/../apt/elementary-update.list > /etc/apt/sources.list.d/elementary-update.list
cat $CWD/../apt/libreoffice.list > /etc/apt/sources.list.d/libreoffice.list
cat $CWD/../apt/webupd8.list > /etc/apt/sources.list.d/webupd8.list
chmod 0644 /etc/apt/sources.list.d/elementary-update.list
chmod 0644 /etc/apt/sources.list.d/libreoffice.list
chmod 0644 /etc/apt/sources.list.d/webupd8.list

GPGKEYS="FD316B5D 4C9D234C 1378B444"

for GPGKEY in $GPGKEYS; do
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $GPGKEY
done

# Recharger les informations et mettre à jour
apt-get update
apt-get -y dist-upgrade

# Supprimer les paquets inutiles
CHOLESTEROL=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/cholesterol-precise)
apt-get -y autoremove --purge $CHOLESTEROL

# Installer les paquets supplémentaires
PAQUETS=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets-precise)
apt-get -y install $PAQUETS

