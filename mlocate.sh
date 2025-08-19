#!bin/bash

# Update
sudo apt update

# Install
sudo apt -y install mlocate

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "mlocate installed successfully."
    else
        echo "Failed to install mlocate. Exiting."
        exit 1
    fi
else
    echo "mlocate is already installed."
fi

#Update
sudo updatedb 

# Check if the database update was successful
if [ $? -eq 0 ]; then
    echo "mlocate database updated successfully."
else
    echo "Failed to update the mlocate database."
    exit 1
fi
