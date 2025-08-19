#!/bin/bash

# Copy configuration files into bspwm directory
cp bspwmrc ~/.config/bspwm/
cp autostart ~/.config/bspwm/

# Set permissions
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/autostart

# Copy sxhkd configuration
cp sxhkdrc ~/.config/sxhkd/

# Set permissions
chmod +x ~/.config/sxhkd/sxhkd

# Copy scripts
cp scripts/* ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/*

echo "Done"
