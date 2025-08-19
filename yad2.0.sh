#!/bin/bash

# Update package lists
sudo apt update

# Install dependencies needed for building YAD
sudo apt -y install \
    aclocal \
    libgspell-1-dev \
    intltool \
    libwebkit2gtk-4.0-dev \
    auto-tools \
    gir1.2-gspell-1 \
    libdbus-glib2.0-cil-dev \
    automake \
    build-essential \
    libglib2.0-dev \
    libgtk-3-dev \
    gcc \
    libglib2.0-dev-bin \
    autoconf \
    autoconf-archive \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-good \
    autotools-dev \
    gspell-1-tests \
    libglib2.0-data \
    gsettings-desktop-schemas-dev \
    libwebkit2gtk-4.0 \
    gstreamer1.0-alsa \
    gstreamer1.0-pulseaudio \
    libgspell-1-2 \
    clang \
    inxi \
    libgtksourceview-3.0-1 \
    libgtksourceview-3.0-common \
    libgl1-mesa-dri \
    libxapp-gtk3-module \
    xapp-sn-watcher \
    libglib2.0-cil \
    libglib2.0-0 \
    gettext \
    libglib2.0-dev

# Download YAD source code
echo "Downloading YAD source code..."
wget https://github.com/v1cont/yad/releases/download/v14.1/yad-14.1.tar.xz

# Extract source
echo "Extracting YAD source code..."
tar -xf yad-14.1.tar.xz

# Pause briefly
sleep 10

# Change to source directory
echo "Changing directory to YAD source..."
cd yad-14.1

# Make configure executable and run it
chmod +x configure
./configure

sleep 5

# Install build dependencies again (redundant but kept as per original)
sudo apt -y install \
    libwebkit2gtk-4.0-dev \
    auto-tools \
    intltool \
    libgspell-1 \
    libwebkit2gtk-4.0-dev \
    libgtk-3-dev \
    libglib2.0-0 \
    automake \
    build-essential \
    intltool \
    libglib2.0-dev \
    libgtk-3-dev \
    libglib2.0-dev \
    libgtk-3-dev \
    libglib2.0-dev-bin \
    intltool \
    autoconf \
    intltool \
    libgtk-3 \
    libgspell-1 \
    libgtksourceview-3.0-1 \
    libwebkit2gtk-4.1-0 \
    libgspell-1-2 \
    libglib2.0-dev \
    libgtk-3-dev \
    gettext \
    autoconf-archive \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-good \
    autoconf \
    autotools-dev \
    gspell-1-tests \
    libglib2.0-bin \
    libxapp-gtk3-module

# Refresh package list
sudo apt update

# Run autoupdate macro
autoupdate

# Regenerate build system
autoreconf -ivf

# Run autoreconf and intltoolize
autoreconf -ivf && intltoolize

# Configure build with options
./configure --enable-tools --enable-html --enable-sourceview --enable-webkit --enable-gtk --enable-spell --enable-tray --enable-deprecated --enable-icon-browser

# Build and install
make
echo "Compilation complete."
sudo make install

# Copy yad.m4 to aclocal directory
sudo cp data/yad.m4 /usr/share/aclocal

# Run aclocal and autoconf again
aclocal
autoconf
./configure
make
sudo make install

# Copy binaries to system paths
sudo cp src/yad /usr/bin/yad
sudo cp src/yad-tools /usr/bin/yad-tools
sudo cp src/yad-settings /usr/bin/yad-settings
sudo cp src/yad-icon-browser /usr/bin/yad-icon-browser

# Set execute permissions
sudo chmod a+x /usr/bin/yad /usr/bin/yad-tools /usr/bin/yad-settings /usr/bin/yad-icon-browser

# Copy binaries to /usr/local/bin
echo "Coping"
sudo cp src/yad /usr/local/bin/yad
sudo cp src/yad-tools /usr/local/bin/yad-tools
sudo cp src/yad-settings /usr/local/bin/yad-settings
sudo cp src/yad-icon-browser /usr/local/bin/yad-icon-browser

# Set permissions for local binaries
sudo chmod a+x /usr/local/bin/yad /usr/local/bin/yad-tools /usr/local/bin/yad-settings /usr/local/bin/yad-icon-browser

# Navigate to data directory
cd yad-dialog-code/data

# Copy desktop files
sudo cp data/yad-icon-browser.desktop /usr/share/applications
sudo cp data/yad-settings.desktop /usr/share/applications

# Ensure schemas directory exists
if [ ! -d "/usr/share/glib-2.0/schemas" ]; then
    echo "Creating directory /usr/share/glib-2.0/schemas as it does not exist."
    sudo mkdir -p /usr/share/glib-2.0/schemas
fi
sudo cp data/yad.gschemas.xml /usr/share/glib-2.0/schemas/

# Copy icons
cd icons
sudo cp data/icons/16x16/yad.png /usr/share/icons/hicolor/16x16/apps
sudo cp data/icons/24x24/yad.png /usr/share/icons/hicolor/24x24/apps
sudo cp data/icons/32x32/yad.png /usr/share/icons/hicolor/32x32/apps
sudo cp data/icons/96x96/yad.png /usr/share/icons/hicolor/96x96/apps
sudo cp data/icons/128x128/yad.png /usr/share/icons/hicolor/128x128/apps

# Set permissions
sudo chmod 644 /usr/share/applications/yad-icon-browser.desktop
sudo chmod 644 /usr/share/applications/yad-settings.desktop
sudo chmod a+x /usr/share/glib-2.0/schemas/yad.gschema.xml

# Update icon cache
gtk-update-icon-cache

# Refresh package list again
sudo apt update

# Cleanup source directory
cd ..
sudo rm -rf yad-14.1

echo "YAD has installed successfully."

# Wait for background processes (if any)
wait

echo "Done"
