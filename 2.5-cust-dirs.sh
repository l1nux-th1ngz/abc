#!/bin/bash

# Make local bin directory
mkdir -p "$HOME/.local/bin"

# Add to PATH permanently if not already present
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
  echo "Added ~/.local/bin to PATH in ~/.bashrc"
fi

# Apply changes immediately
# Check if the shell is bash before sourcing
if [ -n "$BASH_VERSION" ]; then
  source "$HOME/.bashrc"
fi

# Shared local directories for fonts, icons, themes
mkdir -p "$HOME/.local/share/fonts" "$HOME/.local/share/icons" "$HOME/.local/share/themes"

chmod -R 755 "$HOME/.local/share/fonts" "$HOME/.local/share/icons" "$HOME/.local/share/themes"

# User home directories for fonts, icons, themes
mkdir -p "$HOME/.fonts" "$HOME/.icons" "$HOME/.themes"

chmod -R 755 "$HOME/.fonts" "$HOME/.icons" "$HOME/.themes"

# Dot config directories
mkdir -p "$HOME/.config/fontconfig"

# Custom directories for screenshots, recordings, backups
mkdir -p "$HOME/Pictures/ScreenShots"
mkdir -p "$HOME/Videos/ScreenRecordings"
mkdir -p "$HOME/Backups/Custom-Backup"

echo "Done"
