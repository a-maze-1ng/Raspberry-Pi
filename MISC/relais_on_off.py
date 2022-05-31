#!/usr/bin/python
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM) # Use GPIO numbers instead of Board numbers
 
RELAIS_1_GPIO = 17
GPIO.setup(RELAIS_1_GPIO, GPIO.OUT) # GPIO Modus
GPIO.output(RELAIS_1_GPIO, GPIO.LOW) # off
GPIO.output(RELAIS_1_GPIO, GPIO.HIGH) # on