#!/bin/bash

# Install dunst and related notification libraries
sudo apt -y install dunst libnotify-bin libnotify-dev

# Create configuration directory for dunst
mkdir -p ~/.config/dunst

# Indicate completion
echo "DONE"
