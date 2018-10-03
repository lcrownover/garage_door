#!/bin/bash

apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools python3-venv nginx 

ln -s nginx/garage_door /etc/nginx/sites-enabled/garage_door

ln -s service/garage_door.service /etc/systemd/system/garage_door

ufw allow 420

systemctl enable garage_door
systemctl enable nginx
systemctl start garage_door
systemctl start nginx


