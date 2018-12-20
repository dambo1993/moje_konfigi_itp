import serial.tools.list_ports
from beautifultable import BeautifulTable

def printPortsInfo(ports):
	print("Active COM ports:")
	table = BeautifulTable()
	table.column_headers = ["N", "PORT", "DESCRIPTION", "HWID"]
	number = 1
	for port, desc, hwid in ports:
		table.append_row([number, port, desc, hwid])
		number += 1
	print(table)
	
sortedPorts = sorted(serial.tools.list_ports.comports())

printPortsInfo(sortedPorts)