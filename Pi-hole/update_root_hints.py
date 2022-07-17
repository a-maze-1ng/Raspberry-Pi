#!/usr/bin/python
import os
import time
os.system('echo "sleep for 60s"')
time.sleep(60)
os.system('sudo rm /var/lib/unbound/root.hints')
os.system('echo "delete done"')
os.system('wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints')
os.system('echo "hints download done"')
os.system('sudo service unbound restart')
os.system('echo "unbound service restarted"')
