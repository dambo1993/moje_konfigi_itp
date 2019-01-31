import serial.tools.list_ports
from beautifultable import BeautifulTable

def printPortsInfo(ports, name=""):
	print(name)
	table = BeautifulTable()
	table.column_headers = ["N", "PORT", "DESCRIPTION", "HWID", "NAME"]
	number = 1
	for port, desc, hwid in ports:
		devName = "?"
		if "USB VID:PID=0403:6001" in hwid:
			devName = "FT232"
		if "USB VID:PID=1A86:7523" in hwid:
			devName = "CH340"
		table.append_row([number, port, desc, hwid, devName])
		number += 1
	print(table)