#!/bin/bash

# Install Bluetooth packages
sudo apt install -y bluez blueman bluetooth blueman

# Enable
sudo systemctl enable bluetooth

# Done
echo "done"
