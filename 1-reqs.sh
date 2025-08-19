#!/bin/bash

# Update
sudo apt update

# Server
sudo apt -y install xorg xserver-xorg xorg-dev xorg-xbacklight xbindkeys xvkbd xorg-xinput
sudo apt -y install xbindkeys xvkbd xinput xserver-xephyr x11-utils
sudo apt -y install xinit  x11-utils x11-xkb-utils x11-xserver-utils 
sudo apt -y install xserver-xorg-core xserver-xorg-video-intel xserver-xorg-input-libinput

# Build Packages
sudo apt install -y  build-essential cmake meson ninja-build curl pkg-config
sudo apt -y install git gcc make xcb libxcb-util0-dev libxcb-ewmh-dev
sudo apt  -y install build-essential make gcc cmake bison meson ninja-build curl pkg-config wget git  gnupg xauth 
sudo apt -y install zip unzip autoconf autoconf-archive automake autotools-dev gettext autorandr bash-completions 
sudo apt -y install libtool-bin libtool pkg-config clangd intltool intltool-debian systemd-sysv sysvinit-core 
sudo apt -y install libnss-systemd libpam-systemd  xdg-utils

# xcb
sudo apt -y install  libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev
sudo apt -y install libxcb-xinerama0-dev libxcb-ewmh2 xq yq jq libxcb-ewmh-dev todotxt-cli
sudo apt -y install xbindkeys xbacklight xbindkeys xvkbd xinput  libx11-dev libxft-dev libxinerama-dev 
sudo apt -y install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev 
sudo apt -y install libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev  

#
sudo apt -y install xdotool feh wmctrl  network-manager-gnome xdo  silversearcher-ag fd-find vs ripgrep
sudo apt -y install  smbclient cifs-utils ripgrep fd-find unzip wmctrl lxappearance libxml-simple-perl
sudo apt -y install exiftool calcurse
sudo apt -y install  dialog   mtools  intel-microcode  dosfstools mtools ffmpeg binutils  libimage-exiftool-perl
sudo apt -y install trash-cli brightnessctl light geany-plugins bluefish playerctl exif libposix-strptime-perl

# Polkits
 sudo apt -y install lxpolkit polkitd  lintian binutils-multiarch  libtext-template-perl shared-mime-info

 # pkexec
 sudo apt -y install pkexec

echo "Done"
