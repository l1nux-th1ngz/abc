#!/bin/bash

# Update
sudo apt update

# Check for upgrades
sudo apt upgrade -y

# Deepai script does not woek
sudo apt -y install autoconf automake autopoint libtool gettext intltool pkg-config 
sudo apt -y install libgspell-1-dev libwebkit2gtk-4.0-dev libglib2.0-dev libgtksourceview-3.0-dev 
sudo apt -y install gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-alsa gstreamer1.0-pulseaudio libcairo2-dev
sudo apt -y install aclocal libgspell-1-dev intltool
sudo apt -y install libwebkit2gtk-4.0-dev auto-tools intltoolize libgspell-1 libwebkit2gtk-4.0-dev gir1.2-gspell-1 libdbus-glib2.0-cil-dev
sudo apt -y install automake build-essential intltool libglib2.0-dev libgtk-3-dev libglib2.0-dev libgtk-3-dev gcc libglib2.0-dev-bin intltool
sudo apt -y install autoconf intltool libgtk-3 libgspell-1 libgtksourceview-3.0-1 libwebkit2gtk-4.1-0 libgspell-1-2 libglib2.0-dev libdbus-glib2.0-cil
sudo apt -y install autoconf-archive gstreamer1.0-libav gstreamer1.0-plugins-good autoconf autotools-dev libgspell-1-dev libglib2.0-data gsettings-desktop-schemas-dev
sudo apt -y install libwebkit2gtk-4.0 libwebkit2gtk-4.0-dev gstreamer1.0-alsa gstreamer1.0-pulseaudio libgspell-1-2 clang libglib2.0-0 inxi
sudo apt -y install libgtksourceview-3.0-1 libgtksourceview-3.0-common libgtksourceview-3.0-dev libgl1-mesa-dri gspell-1-tests libglib2.0-bin libgtk-3-dev gettext
sudo apt -y install libgl1-mesa-dri gstreamer1.0-pulseaudio gstreamer1.0-libav gstreamer1.0-alsa intltool libgspell-1-common libglib2.0-cil-dev libxapp-gtk3-module
sudo apt -y install libwebkit2gtk-4.0 libwebkit2gtk-4.0-dev libxapp-gtk3-module gstreamer1.0-libav libgtk-3-dev libgspell-1-dev libglib2.0-cil
sudo apt -y install xapp-sn-watcher libxapp-gtk3-module libgspell-1-dev libgspell-1-dev auto-tools intltoolize libwebkit2gtk-4.1-dev
sudo apt -y install autotools-dev automake autoconf autopoint
sudo apt -y install intltool libgspell-1-dev libwebkit2gtk-4.0-dev
sudo apt -y install libgtk-3-dev libglib2.0-dev libglib2.0-bin libgtksourceview-3.0-dev gstreamer1.0-libav
sudo apt -y install gstreamer1.0-plugins-good gstreamer1.0-alsa gstreamer1.0-pulseaudio
sudo apt -y install libxapp-gtk3-module xapp-sn-watcher libgspell-1-2
sudo apt -y install libglib2.0-cil-dev libglib2.0-0 gettext inxi clang build-essential intltool autoconf automake autopoint
sudo apt -y install libtool gettext intltool pkg-config
sudo apt -y install glib-2.0 gtk+3.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-alsa gstreamer1.0-pulseaudio libgspell-1-dev libwebkit2gtk-4.0-dev
sudo apt -y install libglib2.0-dev libglib2.0-bin libgtksourceview-3.0-dev


# meh
sleep 10

# Download YAD
echo "Downloading YAD source code..."
wget -O yad-14.1.tar.xz https://github.com/v1cont/yad/releases/download/v14.1/yad-14.1.tar.xz

# Extract source
echo "Extracting YAD source code..."
tar -xf yad-14.1.tar.xz

# RChange Dir
echo "Preparing build..."
cd yad-14.1

# Wait for user to press Enter before continuing
read -p "Press Enter to continue..."

# Make configure executable
chmod +x configure

# Run configure
./configure

# s
sleep 5

# Generate build system files
autoreconf -ivf
intltoolize

# yea
sleep 10

# Build and install
make
echo "Compilation complete."
sudo make install

# Copy yad.m4 to aclocal directory
sudo cp data/yad.m4 /usr/share/aclocal

# Re-run aclocal and autoconf
aclocal
autoconf
./configure

# Boo
sleep 10

# Build and install again
make
sudo make install

# again
sleep 10

# Copy binaries to system paths
sudo cp src/yad /usr/bin/yad
sudo cp src/yad-tools /usr/bin/yad-tools
sudo cp src/yad-settings /usr/bin/yad-settings
sudo cp src/yad-icon-browser /usr/bin/yad-icon-browser

# Set execute permissions
sudo chmod +x /usr/bin/yad /usr/bin/yad-tools /usr/bin/yad-settings /usr/bin/yad-icon-browser

# Copy binaries to /usr/local/bin
sudo cp src/yad /usr/local/bin/yad
sudo cp src/yad-tools /usr/local/bin/yad-tools
sudo cp src/yad-settings /usr/local/bin/yad-settings
sudo cp src/yad-icon-browser /usr/local/bin/yad-icon-browser

# Set permissions for local binaries
sudo chmod +x /usr/local/bin/yad /usr/local/bin/yad-tools /usr/local/bin/yad-settings /usr/local/bin/yad-icon-browser

# Copy desktop files and icons
cd ../yad-dialog-code/data

# Copy desktop entries
sudo cp yad-icon-browser.desktop /usr/share/applications/
sudo cp yad-settings.desktop /usr/share/applications/

# Ensure schemas directory exists
if [ ! -d "/usr/share/glib-2.0/schemas" ]; then
    sudo mkdir -p /usr/share/glib-2.0/schemas
fi
sudo cp yad.gschemas.xml /usr/share/glib-2.0/schemas/

# Compile
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# to slow
sleep 15

# Copy icons
cd ../icons
sudo cp data/icons/16x16/yad.png /usr/share/icons/hicolor/16x16/apps/
sudo cp data/icons/24x24/yad.png /usr/share/icons/hicolor/24x24/apps/
sudo cp data/icons/32x32/yad.png /usr/share/icons/hicolor/32x32/apps/
sudo cp data/icons/96x96/yad.png /usr/share/icons/hicolor/96x96/apps/
sudo cp data/icons/128x128/yad.png /usr/share/icons/hicolor/128x128/apps/

# Set permissions
sudo chmod 644 /usr/share/applications/yad-icon-browser.desktop
sudo chmod 644 /usr/share/applications/yad-settings.desktop
sudo chmod +x /usr/share/glib-2.0/schemas/yad.gschema.xml

# Update icon cache
gtk-update-icon-cache

# Refresh package list again
sudo apt update

# wait
wait

# Cleanup source directory and tarball
cd ..
rm -f yad-14.1.tar.xz
rm -rf yad-14.1

echo "YAD has installed successfully."
echo "Done"
