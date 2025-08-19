#!/bin/bash

# Install Spicetify CLI
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Prompt user for installing Spicetify Marketplace
read -p "Would you like to install Spicetify Marketplace? (Y/n): " response

# Convert response to lowercase for simplicity
response=${response,,}

if [[ "$response" == "y" || "$response" == "" ]]; then
    curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh
    echo "Spicetify Marketplace installation complete."
else
    echo "Skipping Marketplace installation."
fi

echo "Done."
