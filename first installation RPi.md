### Connect to WiFi  
* create "wpa_supplicant.conf" in root directory  
* enter following:  

ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev  
update_config=1  
country=DE  

network={  
	scan_ssid=1  
	ssid="SSID"  
	psk="PASSWORD"  
	key_mgmt=WPA-PSK  
}  
### SSH connection
* create "ssh" file in root directory  

### Change Timezone and Hostname  
* sudo raspi-config  

### Update  
* sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && clear

### Enable Root user (if necessary)
* sudo nano /etc/ssh/sshd_config  
* enter "PermitRootLogin yes"  
* passwd root  
* sudo reboot now 