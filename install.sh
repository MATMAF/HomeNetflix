#!/bin/bash

# Check sudo
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

#variables
hostname=$(hostname -I)

# Create webssh image
git clone https://github.com/ole-vi/webssh.git
cd webssh
docker build -t webssh .
cd ..
rm -r webssh

# Start containers
docker compose up -d

# Connect to the server
echo "CONNECT TO YOUR SERVER :"
echo "http://$hostname"
