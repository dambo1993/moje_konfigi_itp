import serial.tools.list_ports
from beautifultable import BeautifulTable
import sys

def printPortsInfo(ports, name=""):
	print(name)
	table = BeautifulTable()
	table.column_headers = ["N", "PORT", "DESCRIPTION", "HWID"]
	number = 1
	for port, desc, hwid in ports:
		table.append_row([number, port, desc, hwid])
		number += 1
	print(table)
	
sortedPorts = sorted(serial.tools.list_ports.comports())

printPortsInfo(sortedPorts, "Active COM ports")

if len(sys.argv) == 2:
	if sys.argv[1] == "-n":
		input("Plug/unplug device and press enter...")
		print()
		print()
		
		sortedPorts2 = sorted(serial.tools.list_ports.comports())

		portsDifference = None
		if len(sortedPorts) > len(sortedPorts2):
			portsDifference = [item for item in sortedPorts if item not in sortedPorts2]
		else:
			portsDifference = [item for item in sortedPorts2 if item not in sortedPorts]

		printPortsInfo(portsDifference, "Difference between scans")