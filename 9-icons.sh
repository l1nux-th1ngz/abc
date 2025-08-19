#!/bin/bash

# Install necessary icon themes
sudo apt -y install adwaita-icon-theme unzip

# Define system-wide icon directory
ICON_DIR="/usr/share/icons"

# Clone and install Surfn icons system-wide
sudo git clone https://github.com/erikdubois/Surfn.git /tmp/Surfn
sudo cp -r /tmp/Surfn/surfn-icons/* "$ICON_DIR/"
sudo rm -rf /tmp/Surfn

# Clone and install ArcoLinux Candy icon theme system-wide
sudo git clone https://github.com/arcolinux/a-candy-beauty-icon-theme.git /tmp/a-candy-beauty
sudo cp -r /tmp/a-candy-beauty/usr/share/icons/* "$ICON_DIR/"
sudo rm -rf /tmp/a-candy-beauty

# Download Sardi icon theme
wget -O /tmp/sardi.zip https://sourceforge.net/projects/sardi/files/latest/download

# Unzip to system-wide icons directory
sudo unzip /tmp/sardi.zip -d "$ICON_DIR"

# Remove the zip file
rm /tmp/sardi.zip

# Update icon cache system-wide
sudo fc-cache -f -v

echo "################################################################"
echo "######################    icons installed     #########################"
echo "################################################################"
