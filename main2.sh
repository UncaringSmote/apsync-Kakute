#!/bin/bash

## Part 2/3 - package install, updates and network config
set -e
set -x

## need to run from home directory
cd ~/

## Update everything
sudo apt update
sudo apt upgrade -y

## Ensure the ~/.local/bin is on the system path
echo "PATH=\$PATH:~/.local/bin" >> ~/.profile
source ~/.profile

## Add required packages for general
sudo apt install git screen python python-dev python-pip python-matplotlib -y
sudo apt install -y libxml2-dev libxslt1.1 libxslt1-dev libz-dev python-lxml python3-future
#sudo pip3 install --upgrade pip
pip install pyserial future pymavlink mavproxy geopy numpy dronekit --user

## Install a package that will automatically mount & unmount USB drives
sudo apt install usbmount -y

## Install the various softwares
~/apsync-Kakute/mavlink-router.sh
~/apsync-Kakute/apweb.sh
~/apsync-Kakute/use_networkmanager.sh

sudo reboot
