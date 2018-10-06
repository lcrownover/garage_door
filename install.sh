#!/bin/bash

G_D=/opt/garage_door

mkdir $G_D
cp -r * $G_D
useradd gd
chown -R gd:www-data $G_D
chmod -R 775 $G_D

apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools python3-venv nginx wiringpi

if [ ! -d "$G_D/venv" ]; then
  echo 'installing python environment...'
  python3 -m venv $G_D/venv
  source $G_D/venv/bin/activate
  pip install wheel
  pip install flask uwsgi
  deactivate
fi

systemctl stop polkit
systemctl disable polkit

cp $G_D/bin/open_boot /etc/init.d/garage_door
cp $G_D/nginx/garage_door /etc/nginx/sites-enabled/garage_door
rm -f /etc/nginx/sites-enabled/default
cp $G_D/service/garage_door.service /etc/systemd/system/garage_door.service
systemctl daemon-reload

systemctl enable garage_door
systemctl enable nginx
systemctl start garage_door
systemctl start nginx


