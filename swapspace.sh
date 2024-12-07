#!/bin/bash

# Prompt user for swap file size
echo "Please enter the desired swap file size in gigabytes (e.g., 2):"
read -r SWAP_SIZE_GB

# Validate input is a positive number
if ! [[ "$SWAP_SIZE_GB" =~ ^[0-9]+$ ]] || [ "$SWAP_SIZE_GB" -eq 0 ]; then
    echo "Error: Please enter a valid positive number"
    exit 1
fi

# Define the swap file path
SWAP_FILE="/swapfile"

# Check if the swap file already exists
if [ -f "$SWAP_FILE" ]; then
    echo "Swap file already exists at $SWAP_FILE"
    exit 1
fi

# Create swap file
echo "Creating swap file of size ${SWAP_SIZE_GB}G..."
sudo fallocate -l ${SWAP_SIZE_GB}G $SWAP_FILE

# Set the appropriate permissions for the swap file
echo "Setting permissions on swap file..."
sudo chmod 600 $SWAP_FILE

# Set up the swap file
echo "Setting up swap file..."
sudo mkswap $SWAP_FILE

# Enable the swap file
echo "Enabling the swap file..."
sudo swapon $SWAP_FILE

# Add the swap file to /etc/fstab for persistence
echo "Adding swap file to /etc/fstab for persistence..."
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

# Verify that the swap file is enabled
echo "Swap file is now enabled:"
swapon --show

# Success message
echo "Swap setup complete. The swap file will be available after each reboot."

# Display current memory usage
echo "Current memory usage:"
free -h
