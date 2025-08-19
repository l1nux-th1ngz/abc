#!/bin/bash

# Update
sudo apt update

# Install packages
sudo apt -y install bspwm sxhkd terminator suckless-tools nemo-data
sudo apt -y install gvfs-backends dialog unzip rxvt-unicode gir1.2-nemo-3.0
sudo apt -y install libnemo-extension1 libnemo-extension-dev nemo-python
sudo apt -y install xdg-user-dirs-gtk nemo gvfs-backends

# Update user directories
xdg-user-dirs-update

# Create configuration directories
mkdir -p ~/.config/dmenu
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/terminator

# Add environment variables to ~/.xprofile
grep -qxF 'export XDG_CURRENT_DESKTOP=bspwm' ~/.xprofile || echo 'export XDG_CURRENT_DESKTOP=bspwm' >> ~/.xprofile
grep -qxF 'export DESKTOP_SESSION=bspwm' ~/.xprofile || echo 'export DESKTOP_SESSION=bspwm' >> ~/.xprofile

echo "DONE"
