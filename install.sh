#!/bin/bash

useradd gd
chown -R gd:www-data /opt/garage_door
chmod -R 775 /opt/garage_door

apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools python3-venv nginx 

python3.6 -m venv venv
source venv/bin/activate
pip install wheel
pip install flask uwsgi
deactivate

cp nginx/garage_door /etc/nginx/sites-enabled/garage_door
cp service/garage_door.service /etc/systemd/system/garage_door.service
systemctl daemon-reload

ufw allow 420

systemctl enable garage_door
systemctl enable nginx
systemctl start garage_door
systemctl start nginx


