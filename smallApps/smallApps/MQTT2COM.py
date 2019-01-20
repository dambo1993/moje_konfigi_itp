import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish

import argparse
import serial
import sys

import time
import threading

debugFlag = False
inputTopic = ""
outputTopic = ""

serialPort = ""
baudrate = 115200
ser = None


def log(txt):
    global debugFlag
    if debugFlag:
        print(txt)
        pass

parser = argparse.ArgumentParser(description='Convert MQTT to serial and vice-versa')
parser.add_argument('-p', nargs=1, help='serial port device/COMport', required=True)
parser.add_argument('-b', nargs=1, default="115200", help='baudrate of serial port', required=False)
parser.add_argument('-broker', nargs=1, help='Address of the MQTT broker', required=True)
parser.add_argument('-i', nargs=1, help='Input topic', required=True)
parser.add_argument('-o', nargs=1, help='Output topic', required=True)
parser.add_argument('-print', nargs=1, help='print mode on/off', default="off", choices=["0","1"], required=False)
args = parser.parse_args()

if args.print != None:
    if args.print[0] == "1":
        debugFlag = True
    else:
        debugFlag = False

baudrate = int(args.b[0])
serialPort = args.p[0]
inputTopic = args.i[0]
outputTopic = args.o[0]

def serialReceiver():
    while True:
        payload = ser.readline()
        if payload != b'':
            p = bytearray(payload)
            if 0x10 in p:
                p.remove(0x10)
            if 0x13 in p:
                p.remove(0x13)
            log("Serial received: " + str(p))
            client.publish(outputTopic, p)

def on_connect(self, mosq, obj, rc):
	log("Connected with result code " + str(rc))
	self.subscribe(inputTopic,0)

def on_message(client, userdata, msg):
    log("MQTT received: " + str(msg.payload))
    payload = bytearray(msg.payload)
    payload.append(0x10)
    ser.write(payload)

try:
    ser = serial.Serial(serialPort, baudrate=115200, timeout=0.1)
except:
    print("Serial port error!")
    sys.exit(1)
    pass

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect(args.broker[0], 1883, 60)

t_receiver = threading.Thread(target=serialReceiver)
t_receiver.daemon = True
t_receiver.start()

client.loop_forever()