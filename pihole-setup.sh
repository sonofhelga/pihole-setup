#!/bin/bash

sudo apt install curl -y
sudo curl -sSL https://install.pi-hole.net | sudo bash

clear
echo 'what would you like your pihole password to be?'
read password

pihole -a -p $password

sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 53
sudo ufw allow 5335

sudo apt update -y && sudo apt full-upgrade -y
sudo apt install unbound -y
sudo mv pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf

sudo service unbound restart
sudo systemctl enable unbound
