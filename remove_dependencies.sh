#!/bin/bash

# Remove package dependencies virtualbox-7.0 and vagrant
echo "Removing package dependencies for the cluster..."
apt-get remove -y virtualbox-7.0 vagrant > /dev/null

# auto remove dependencies
echo "Auto removing dependencies..."
apt-get autoremove -y

# Remove VirtualBox and Vagrant APT repositories
echo "Removing VirtualBox and Vagrant APT repositories..."
rm /etc/apt/sources.list.d/virtualbox.list /etc/apt/sources.list.d/hashicorp.list

# Remove Oracle and HashiCorp public keys
echo "Removing Oracle and HashiCorp public keys..."
rm /usr/share/keyrings/oracle-virtualbox-2016.gpg /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Check vagrant and virtualbox are removed
if [ -x "$(command -v vagrant)" ] || [ -x "$(command -v virtualbox)" ]; then
    echo "Failed to remove Vagrant or/and VirtualBox. Check for errors above."
else
    echo "Vagrant and VirtualBox removed successfully!"
fi

