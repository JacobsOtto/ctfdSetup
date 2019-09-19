#!/bin/bash

#Name of your CTF.
#Do not use spaces in the name.
#This isn't the name people will see when they visit the site.
#You can change that later.
#If you're unsure, do not change this name. :)
CTF_NAME="CTFd"

#Gonna need it.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

#Perform updates and upgrades (upgrade isn't that important).
apt-get -y update;
apt-get -y upgrade;

#Setup CTFd home.
mkdir /home/CTFd;
cd /home/CTFd;

#Get CTFd.
git clone https://github.com/CTFd/CTFd.git;
cd CTFd;
./prepare.sh;

#Uncomment if you want to edit the config file.
#vim CTFd/config.py;

#Install nginx.
apt-get -y install nginx;
ufw allow 'Nginx Full';
ufw allow 'Nginx HTTP';
ufw allow 'Nginx HTTPS';

#Install certbot.
add-apt-repository ppa:certbot/certbot -y;
apt update;
apt install certbot python-certbot-nginx -y;
