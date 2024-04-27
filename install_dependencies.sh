#!/bin/bash

# Update system available packages
echo "Updating available packages..."
apt-get update -y

# Install package dependencies
echo "Installing package dependencies for the script..."
apt-get install -y lsb-release wget gnupg2

# Install VirtualBox
echo "Installing VirtualBox..."

# Importing Oracle public keys
echo "Importing Oracle public keys..."
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | \
  gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor

# Adding VirtualBox APT Repository
echo "Adding VirtualBox APT Repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \
  tee -a /etc/apt/sources.list.d/virtualbox.list

# Update system available packages
echo "Updating available packages..."
apt-get update -y

# Install VirtualBox package
echo "Installing VirtualBox package ..."
apt-get install -y virtualbox-7.0 > /dev/null

# Check for errors in installation
if [ $? -eq 0 ]; then
    echo "VirtualBox installed successfully!"
else
    echo "Failed to install VirtualBox. Check for errors above."
fi

# Install Vagrant
echo "Installing Vagrant..."

# Importing HashiCorp public keys
echo "Importing HashiCorp public keys..."
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Adding HashiCorp APT Repository
echo "Adding HashiCorp APT Repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Installing vagrant package
echo "Installing Vagrant package..."
sudo apt update && sudo apt install vagrant > /dev/null

# Check for errors in installation
if [ $? -eq 0 ]; then
    echo "Vagrant installed successfully!"
else
    echo "Failed to install Vagrant. Check for errors above."
fi