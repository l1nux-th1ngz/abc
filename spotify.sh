#!/bin/bash

# Import Spotify GPG key
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

# Add Repo
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Update
sudo apt-get update

# Install
sudo apt-get install -y spotify-client

# Set permissions
sudo chmod a+rw /usr/share/spotify
sudo chmod -R a+rw /usr/share/spotify/Apps

echo "Done"
