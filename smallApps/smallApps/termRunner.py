import sys
import serial.tools.list_ports
from beautifultable import BeautifulTable
import readchar
import subprocess
import sys
import argparse
import COMutils

speeds = [ 9600, 14400, 19200, 28800, 57600, 76800, 115200, 230400, 460800 ]
terminalsNames = [ "dmb", "putty", "teraterm" ]
# display table with speeds to select by user
def printCOMSpeeds():
	number = 1
	table = BeautifulTable()
	print("Select baudrate, default (only enter) is 115200 or press q for quit")
	table.column_headers = ["N", "SPEED"]
	for speed in speeds:
		table.append_row([number, speed])
		number += 1
	print(table)

parser = argparse.ArgumentParser(description='Command line tool to run some COM terminals')
parser.add_argument('-t', nargs=1, help='terminal name', choices=terminalsNames, required=True)
parser.add_argument('-n', nargs=1, help='Name of the terminal for "dambusiowa konsolka"')
parser.add_argument('-hist', help='History mode - last 10 settings', action="store_true")
args = parser.parse_args()

selectedTerminal = args.t[0]
	
sortedPorts = sorted(serial.tools.list_ports.comports())
if len(sortedPorts) == 0:
	print("COM PORTS NOT FOUND!!!")
	sys.exit(1)

COMutils.printPortsInfo(sortedPorts)

print("")
print(f"Select port COM (1-{len(sortedPorts)})")
print("")
c = readchar.readchar()

if c == b'\r':
	if len(sortedPorts) == 1:
		selectedPort = 1
	else:
		print("You can only press enter for single port in array")
		sys.exit(1)
else:
	selectedPort = int(c)
	
if selectedPort >= 1 and selectedPort <= len(sortedPorts):
	print(f"Selected COM: {sortedPorts[selectedPort-1][0]}")
else:
	print("Wrong COM number")
	sys.exit(1)

printCOMSpeeds()
selectedSpeed = 0

c = readchar.readchar()
if c == b'\r':
	selectedSpeed = speeds.index(115200)
elif c >= b'1' and c < b'8':
	selectedSpeed = int(c) - 1 # number to array position	
else:
	print("Wrong baudrate!!!")
	sys.exit(1)
	
print(f"Selected baudrate: {speeds[selectedSpeed]}")

# because we need array position 0-n
selectedPort = selectedPort-1

if selectedTerminal == "dmb":
	if args.n != None:
		print(f"Name: {args.n[0]}")
		subprocess.Popen(["c:/smallApps/dambusiowa_konsola.exe","-p" ,f"{sortedPorts[selectedPort][0]}","-b", f"{speeds[selectedSpeed]}","-n",f"{args.n[0]}"])
	else:
		subprocess.Popen(["c:/smallApps/dambusiowa_konsola.exe","-p" ,f"{sortedPorts[selectedPort][0]}","-b", f"{speeds[selectedSpeed]}"])
elif selectedTerminal == "putty":
	subprocess.Popen(["putty","-serial" ,f"{sortedPorts[selectedPort][0]}","-sercfg", f"{speeds[selectedSpeed]}"])
elif selectedTerminal == "teraterm":
	comNumber = sortedPorts[selectedPort][0][3:]
	print(f"Used com number: {comNumber}")
	subprocess.Popen(["ttermpro",f"/C={comNumber}", f"/BAUD={speeds[selectedSpeed]}"])
else:
	print("Error")
	sys.exit(1)
	