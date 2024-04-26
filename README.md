# Cortex on Kubernetes with Minikube and Vagrant

This project sets up a Cortex analysis platform on a 3-node Kubernetes cluster using Minikube with Vagrant and VirtualBox. Cortex serves as a powerful analysis and management tool for security researchers, coupled with Elasticsearch as its backend for data storage.

## Prerequisites

Before you start, make sure you have the following installed on your system:

- **Ubuntu/Debian System**: The installation steps were followed in a Ubuntu 22.04 system, they would need to be adapted for the installation in another distro families.
- **System resources**: You will need a system with at least 8GB of RAM and a 4-core CPU to handle the resources required by the cluster and its applications effectively.

## Installation Steps for dependencies

The package dependencies for this setup are Vagrant and VirtualBox. In this case, VirtualBox has been chosen over other possibilities such as KVM due to the simplicity and compatibility that VirtualBox offers. KVM would offer greater performance, but it requires kernel virtualization capability, which is not available in all development environments.

Two installation methods are going to be provided to install these dependencies: Automated installation, Step by Step commands or following the official documentation guides.

### Automated installation

To follow this installation process clone the repository, change your working directory to it and run the following command:

```bash
    sudo ./install_dependencies.sh
    ```

