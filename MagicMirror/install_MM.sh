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
echo "#!/bin/bash" > start_mm.sh
echo "sleep 30s" >> start_mm.sh
echo "cd /home/pi/MagicMirror" >> start_mm.sh
echo "npm run start" >> start_mm.sh
sudo chmod +x start_mm.sh
####################################################
#Create cron job for automatic start
####################################################
cd /home/pi
echo "@reboot root /home/pi/start_mm.sh" > start_mm
sudo mv start_mm /etc/cron.d/start_mm
####################################################
#Copy config from github
####################################################
cd /home/pi
mkdir dummy
cd /home/pi/dummy
wget https://raw.githubusercontent.com/a-maze-1ng/Raspberry-Pi/main/MagicMirror/config/config.js
####################################################
#Backup config file
####################################################
sudo cp /home/pi/MagicMirror/config/config.js /home/pi/MagicMirror/config/config.js_backup
####################################################
#Copy config file to MagicMirror directory
####################################################
sudo mv /home/pi/dummy/config.js /home/pi/MagicMirror/config/config.js
####################################################
#Cleanup
####################################################
sudo rm -rf /home/pi/dummy
####################################################
#Reboot
####################################################
sudo reboot