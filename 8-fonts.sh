#!/bin/bash

# Update
sudo apt update

# Install
sudo apt -y install fontconfig fontconfig-config font-manager nemo-font-manager
sudo apt -y install fonts-recommended fonts-font-awesome fonts-terminus
sudo apt -y install fonts-noto-color-emoji fonts-symbola node-emojis-list ttf-ancient-fonts-symbola fonts-fork-awesome fonts-powerline fonts-roboto
sudo apt -y install fonts-roboto-fontface fonts-ubuntu ttf-ubuntu-font-family fonts-font-awesome fonts-fork-awesome fonts-material-design-icons-iconfont
sudo apt -y install toilet toilet-fonts fonts-noto-core fonts-noto-cjk fonts-hack-ttf fonts-liberation2 fonts-noto-color-emoji fonts-dejavu 


# Rebuild
fc-cache -f -v

echo "Done"
