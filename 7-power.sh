#!/bin/bash

# Install avahi-daemon, acpi, and acpid
sudo apt -y install avahi-daemon acpi acpid  acpi-support

# Create user and a group for avahi
addgroup --system avahi
adduser --system --no-create-home --ingroup avahi avahi

# Reload D-Bus
systemctl reload dbus

# Start and enable Avahi Daemon
sudo systemctl start avahi-daemon
sudo systemctl enable avahi-daemon

echo "Done"
