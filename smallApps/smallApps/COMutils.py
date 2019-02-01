import serial.tools.list_ports
from beautifultable import BeautifulTable
from colored import fg, bg, attr
def checkPortBusy(port):
    try:
       ser = serial.Serial(port)
       return False
    except:
       return True

def portStateString(port):
	state = "Free"
	color = 'green'
	if checkPortBusy(port):
		state = "BUSY"
		color = 'red'
	return fg(color)+state+attr(1)

def descStr(port, desc):
	return desc[:desc.find("(")].strip()

def nameStr(hwid):
	if "USB VID:PID=0403:6001" in hwid:
		return "FT232"
	if "USB VID:PID=1A86:7523" in hwid:
		return "CH340"
	return "Unknown"

def printPortsInfo(ports, name=""):
	print(name)
	table = BeautifulTable()
	table.column_headers = ["N", "PORT", "STATE", "DESCRIPTION", "HWID", "NAME"]
	number = 1
	for port, desc, hwid in ports:
		table.append_row([number, port, portStateString(port) , descStr(port, desc), hwid.replace("  "," ").replace(" ","\n"), nameStr(hwid)])
		number += 1
	print(table)