#!usr/bin/python
import os

########## script start ##########
#write in logfile
os.system('echo script start')
os.system('date')

########## update pihole ##########
#write in logfile
os.system('echo pihole -up')
os.system('date')
#update pihole
os.system('sudo pihole -up')

########## update pihole gravity ##########
#write in logfile
os.system('echo pihole -g')
os.system('date')
#update pihole gravity
os.system('sudo pihole -g')


########## update root hints ##########
#write in logfile
os.system('echo update root hints')
os.system('date')
#update root hints
os.system('sudo wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints')

########## script end ##########
#write in logfile
os.system('echo script end')
os.system('date')
