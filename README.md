# Cortex on Kubernetes with Minikube and Vagrant

This project sets up a Cortex analysis platform on a 3-node Kubernetes cluster using Minikube with Vagrant and VirtualBox. Cortex serves as a powerful analysis and management tool for security researchers, coupled with Elasticsearch as its backend for data storage.

## Prerequisites

Before you start, make sure you have the following installed on your system:

- **Ubuntu/Debian System**: The installation steps for the dependencies were followed in an Ubuntu 22.04 system, these steps would need to be done following the official documentation guide for the installation in another distribution families.
- **System resources**: You will need a system with at least 8GB of RAM and a 4-core CPU to handle the resources required by the cluster and its applications effectively.

## Choice of Vagrant and VirtualBox

We have opted to use Vagrant with VirtualBox instead of directly installing Minikube on the host for the following reasons:

- **Consistency**: Vagrant ensures that all developers work within an identical environment, mitigating "works on my machine" issues.
- **Isolation**: This approach avoids conflicts between development dependencies and personal software on the host system.
- **Simplicity and Portability**: Using Vagrant and VirtualBox simplifies the setup process across different operating systems and enhances portability, making it easier for any developer to get started without complex configuration.

This setup strategy helps to create a more stable and predictable development environment that mirrors production settings as closely as possible.

## Installation Steps for dependencies

The package dependencies for this setup are Vagrant and VirtualBox. In this case, VirtualBox has been chosen over other possibilities such as KVM due to the simplicity and compatibility that VirtualBox offers. KVM would offer greater performance, but it requires kernel virtualization capability, which is not available in all development environments.

Three installation methods are going to be provided to install these dependencies: Automated installation, Step by Step commands or following the official documentation guides.

### Official documentation

VirtualBox installation guide: [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
Vagrant installation guide: [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

### Automated installation (Ubuntu/Debian)

To follow this installation process clone the repository, change your working directory to it and run the following command:

```bash
    cd cortex-on-minikube
    sudo ./ install_dependencies.sh
```

### Step by step (Ubuntu/Debian)

#### Installing VirtualBox:

```bash

    # Update system available packages
    sudo apt update -y

    # Importing Oracle public keys
    wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | \
       sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor

    # Adding VirtualBox APT Repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \
        sudo tee -a /etc/apt/sources.list.d/virtualbox.list

    # Update system available packages
    sudo apt update -y

    # Install VirtualBox package
    sudo apt install -y virtualbox
```

#### Installing Vagrant:

```bash

    # Update system available packages
    sudo apt update -y

    # Importing Hashicorp public keys
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

    # Adding Hashicorp APT Repository
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    # Installing Vagrant package
    sudo apt update && sudo apt install vagrant
```

Now you have the prerequisites installed.

## Getting Started

