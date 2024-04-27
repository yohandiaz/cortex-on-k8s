#!/bin/bash

# Update system available packages
echo "Updating available packages..."
apt-get update -y

# Install package dependencies
echo "Installing package dependencies for the script..."
apt-get install -y lsb-release wget

# Install VirtualBox
echo "Installing VirtualBox..."

# Importing Oracle public keys
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | \
  gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor

# Adding VirtualBox APT Repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \
  tee -a /etc/apt/sources.list.d/virtualbox.list

# Update system available packages
echo "Updating available packages..."
apt-get update -y

# Install VirtualBox package
apt install virtualbox-7.0

echo "Dependencies installed successfully!"