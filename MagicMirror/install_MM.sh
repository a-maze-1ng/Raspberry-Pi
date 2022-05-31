#!/bin/bash
#works best with RPi 32bit image (with desktop environment!)
if [ $USER == 'root' ]; then
         echo Please login as a user to execute the MagicMirror installation, not root
         exit 1
fi
####################################################
#Update the RPi
####################################################
cd /home/pi
sudo apt-get update && sudo apt-get upgrade -y
####################################################
#Install MagicMirror
#https://github.com/MichMich/MagicMirror
#https://docs.magicmirror.builders/getting-started/installation.html
####################################################
cd /home/pi
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
git clone https://github.com/MichMich/MagicMirror
cd MagicMirror/
npm install --only=prod --omit=dev
cp config/config.js.sample config/config.js
####################################################
#Create startup file
####################################################
cd /home/pi
wget https://raw.githubusercontent.com/a-maze-1ng/Raspberry-Pi/main/MagicMirror/config/start_mm.sh
sudo chmod +x start_mm.sh
####################################################
#Create cron job for automatic start
####################################################
cd /home/pi
wget https://raw.githubusercontent.com/a-maze-1ng/Raspberry-Pi/main/MagicMirror/config/startMM
sudo chown root:root startMM
sudo mv startMM /etc/cron.d/startMM #careful cron.d does not like .,_- characters!
####################################################
#Copy config from github
####################################################
cd /home/pi
mkdir dummy
cd /home/pi/dummy
wget https://raw.githubusercontent.com/a-maze-1ng/Raspberry-Pi/main/MagicMirror/config/config.js
wget https://raw.githubusercontent.com/a-maze-1ng/Raspberry-Pi/main/MagicMirror/config/lightdm.conf
####################################################
#Backup
####################################################
sudo cp /home/pi/MagicMirror/config/config.js /home/pi/MagicMirror/config/config.js_backup
sudo cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf_backup
####################################################
#Copy config files
####################################################
sudo mv /home/pi/dummy/config.js /home/pi/MagicMirror/config/config.js
sudo mv /home/pi/dummy/lightdm.conf /etc/lightdm/lightdm.conf
####################################################
#Cleanup
####################################################
sudo rm -rf /home/pi/dummy
####################################################
#Reboot
####################################################
sudo reboot