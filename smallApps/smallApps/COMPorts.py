import serial.tools.list_ports
from beautifultable import BeautifulTable
import sys
import COMutils
	
sortedPorts = sorted(serial.tools.list_ports.comports())

COMutils.printPortsInfo(sortedPorts, "Active COM ports")

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

		COMutils.printPortsInfo(portsDifference, "Difference between scans")