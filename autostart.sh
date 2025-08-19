#!/bin/bash

### Helper Function ###
run() {
  if ! pgrep -x "$1" > /dev/null; then
    "$@" &
  fi
}

### Set display from arandr saved script ###
# sh ~/.screenlayout/monitor.sh &

### System Tray Utilities ###
run nm-applet
run volumeicon

### Enable Numlock ###
numlockx on &

### Notification Daemon ###
killall dunst 2>/dev/null
run dunst

### Polybar ###
"$HOME/.config/polybar/launch.sh"

### X Resources ###
xrdb merge "$HOME/.Xresources"

### SXHKD ###
run sxhkd -c "$HOME/.config/sxhkd/sxhkdrc"

### Wallpaper ###
WALLPAPER_DIR="$HOME/.local/share/wallpapers"
if [ -d "$WALLPAPER_DIR" ]; then
  RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
  [ -n "$RANDOM_WALLPAPER" ] && feh --bg-scale "$RANDOM_WALLPAPER" &
fi

### Picom ###
run picom --config "$HOME/.config/picom/picom.conf"

### Brightness ###
"$HOME/.config/scripts/brightness-startup.sh" &> /dev/null &

### Power Management ###
run gnome-power-manager  &

### PolicyKit Agent ###
run polkit-gnome-authentication-agent-1

### Wallpaper Changer ###
"$HOME/.config/bspwm/scripts/wallpc.sh"

### Low battery notifier ###
"$HOME/.config/bspwm/scripts/low_bat_notifier.sh"


###  DEX Optional Autostart Apps ###
# dex "$HOME/.config/autostart/app.desktop"
