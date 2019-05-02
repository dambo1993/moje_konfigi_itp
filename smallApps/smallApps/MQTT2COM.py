import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish

import argparse
import serial
import sys

import json
import time
import threading

class MQTT2COM():
	debugFlag = False
	inputTopic = ""
	outputTopic = ""
	brokerAddress = ""

	serialPort = ""
	baudrate = 115200
	ser = None

	client = None

	def log(self, txt):
		if self.debugFlag:
			print(txt)
			pass

	def checkDebugFlag(self, args):
		self.debugFlag = args.debug

	def checkSettingsParams(self, args):	
		self.checkDebugFlag(args)
		if args.f != None:
			self.log(f"Settings from file: {args.f[0]}")
			#try:
			settings = json.load(open('settings.json'))
			self.log(settings)
			
			self.brokerAddress = settings['broker']
			self.inputTopic = settings['input']
			self.outputTopic = settings['output']
			self.serialPort = settings['port']
			self.baudrate = settings['baudrate']				
			#except:
			#	print("Error in settings file")
			#	sys.exit(1)			

		elif args.p != None and args.i != None and args.o != None:
			self.serialPort = args.p[0]
			self.inputTopic = args.i[0]
			self.outputTopic = args.o[0]
			self.brokerAddress = args.b[0]
			
			if args.b != None:
				self.baudrate = int(args.b[0])
		else:
			print("Error in parameters!!!")
			sys.exit(1)

	def serialReceiverThread(self):
		while True:
			payload = self.ser.readline()
			if payload != b'':
				p = bytearray(payload)
				if 0x10 in p:
					p.remove(0x10)
				if 0x13 in p:
					p.remove(0x13)
				self.log("Serial received: " + str(p))
				self.client.publish(self.outputTopic, p)
	
	@staticmethod
	def on_connect(self, userdata, flags, rc):
		userdata.client.subscribe(userdata.inputTopic, 0)

	@staticmethod
	def on_message(client, userdata, msg):
		userdata.log("MQTT received: " + str(msg.payload))
		payload = bytearray(msg.payload)
		payload.append(0x10)
		userdata.ser.write(payload)

	def start(self):
		try:
			self.ser = serial.Serial(self.serialPort, baudrate=self.baudrate, timeout=0.1)
		except:
			print("Serial port error!")
			sys.exit(1)

		self.client = mqtt.Client(userdata=self)
		self.client.on_connect = self.on_connect
		self.client.on_message = self.on_message
		self.client.connect(self.brokerAddress, 1883, 60)

		t_receiver = threading.Thread(target=self.serialReceiverThread)
		t_receiver.daemon = True
		t_receiver.start()

		self.client.loop_forever()
			
parser = argparse.ArgumentParser(description='Convert MQTT to serial and vice-versa')
parser.add_argument('-p', nargs=1, help='serial port device/COMport')
parser.add_argument('-b', nargs=1, default="115200", help='baudrate of serial port')
parser.add_argument('-broker', nargs=1, help='Address of the MQTT broker')
parser.add_argument('-i', nargs=1, help='Input topic')
parser.add_argument('-o', nargs=1, help='Output topic')
parser.add_argument('-f', nargs=1, help='settings file - instead of previous params form command')
parser.add_argument('--debug', help='console debug enable', action='store_true')
args = parser.parse_args()

app = MQTT2COM()

app.checkSettingsParams(args)

app.start()