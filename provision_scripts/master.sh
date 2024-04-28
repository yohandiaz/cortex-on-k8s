#!/bin/bash

# Install dependencies for minikube cluster
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools containerd

# Download kubectl v1.3.0 binary and install it
curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Download minikube v1.33.0 binary and install it
curl -LO https://github.com/kubernetes/minikube/releases/download/v1.33.0/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64


