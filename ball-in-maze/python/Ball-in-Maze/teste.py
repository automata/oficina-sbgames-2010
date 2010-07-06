import serial
s = serial.Serial('/dev/ttyUSB0', 9600)
while 1:
    s.readline()
