#!/bin/sh

# update before run script
sudo apt update -y
sudo apt upgrade -y

# install ufw
sudo apt install ufw -y

# enable essentials services
sudo ufw allow ssh
sudo ufw allow "Nginx Full"
sudo ufw enable

# change default policy and other ...

# system update
sudo apt update -y
sudo apt upgrade -y
