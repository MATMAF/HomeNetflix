#!/bin/bash

# Check sudo
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# Distribution
echo "Chose your distribution"
echo "1 - ubuntu"
echo "2 - debian"
read distribution

if [ $distribution -eq 1 ]
then
    # Uninstall old versions 
    apt-get remove docker docker-engine docker.io containerd runc -y


    # Set up the repository
    apt-get update
    apt-get install ca-certificates curl gnupg lsb-release -y
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


    # Install Docker Engine
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
elif [ $distribution -eq 2 ]
then
    # Uninstall old versions 
    apt-get remove docker docker-engine docker.io containerd runc -y


    # Set up the repository
    apt-get update
    apt-get install ca-certificates curl gnupg lsb-release -y
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


    # Install Docker Engine
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
else
    echo "Your distribution is not supported"
    exit
fi

# Create webssh image
git clone https://github.com/ole-vi/webssh.git
cd webssh
docker build -t webssh .
cd ..
rm -r webssh

# Start containers
docker compose up -d

# Connect to the server
hostname=$(hostname -I)
echo "CONNECT TO YOUR SERVER :"
echo "http://$hostname"