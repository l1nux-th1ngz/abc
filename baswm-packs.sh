#!/bin/bash

sudo apt -y install xdotool feh wmctrl  network-manager-gnome
sudo apt -y install  smbclient cifs-utils ripgrep fd-find unzip dconf-editor
sudo apt -y install  dialog   mtools   dosfstools mtools ffmpeg lxappearance


# Polkits
 sudo apt -y install polkitd     policykit-1-gnome 

# Photo stuff
sudo apt -y install mirage imagemagick
sudo ap -y install imagemagick inkscape libimage-magick-perl imagemagick-7-common
sudo apt -y install fig2dev xfig xfig-libs fig2sxd

# Random shiy
sudo apt -y install chemtool openbabel openbabel-gui libwmf-bin hwinfo  arandr netpbm
sudo apt -y install hw-probe lolcat most silversearcher-ag libxcb-randr0-dev libxcb-icccm4-dev
sudo apt -y install util-linux gawk autorandr git gcc make xcb libxcb-util0-dev libxcb-ewmh-dev
sudp apt -y install  libxcb-keysyms1-dev libxcb-xinerama0-dev libxcb-ewmh2


echo "Done"
