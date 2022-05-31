# Raspberry-Pi		
## First Installation		
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

this is a test
this is a test
