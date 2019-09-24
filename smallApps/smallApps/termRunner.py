import sys
import serial.tools.list_ports
from beautifultable import BeautifulTable
import readchar
import subprocess
import sys
import argparse
import COMutils

parser = argparse.ArgumentParser(description='Poor "GUI" to select ports to some terminals apps')
parser.add_argument('-dmb', help='dambusiowa konsolka', action='store_true')
parser.add_argument('-putty', help='putty', action='store_true')
parser.add_argument('-teraterm', help='teraterm', action='store_true')
parser.add_argument('-n', nargs=1, help='Name of the terminal for "dambusiowa konsolka"')
args = parser.parse_args()

selectedTerminal = None

if args.dmb == True:
	selectedTerminal = "dmb"
elif args.putty == True:
	selectedTerminal = "putty"
elif args.teraterm == True:
	selectedTerminal = "teraterm"
else:
	print("You need to select terminal!")
	sys.exit(1)

speeds = [ 9600, 14400, 19200, 28800, 57600, 76800, 115200, 230400 ]

def printSpeeds():
	number = 1
	table = BeautifulTable()
	print("Select baudrate, default is 115200 (q for quit)")
	table.column_headers = ["N", "SPEED"]
	for speed in speeds:
		table.append_row([number, speed])
		number += 1
	print(table)
	
sortedPorts = sorted(serial.tools.list_ports.comports())
if len(sortedPorts) == 0:
	print("COM PORTS NOT FOUND!!!")
	sys.exit(0)

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
		sys.exit(0)
else:
	selectedPort = int(c)
	
if selectedPort >= 1 and selectedPort <= len(sortedPorts):
	print(f"Selected COM: {sortedPorts[selectedPort-1][0]}")
else:
	print("Wrong COM number")
	sys.exit(0)

printSpeeds()

selectedSpeed = 0
exitFlag = False

c = readchar.readchar()
if c == b'\r':
	print("Baudrate is: 115200")
	selectedSpeed = speeds.index(115200)
elif c >= b'1' and c < b'8':
	selectedSpeed = int(c) - 1
	print(f"Selected baudrate is: {speeds[selectedSpeed]}")
else:
	exitFlag = True

if selectedTerminal == "dmb":
	if args.n != None:
		print(f"Name: {args.n[0]}")
		subprocess.Popen(["c:/smallApps/dambusiowa_konsola.exe","-p" ,f"{sortedPorts[selectedPort-1][0]}","-b", f"{speeds[selectedSpeed]}","-n",f"{args.n[0]}"])
	else:
		subprocess.Popen(["c:/smallApps/dambusiowa_konsola.exe","-p" ,f"{sortedPorts[selectedPort-1][0]}","-b", f"{speeds[selectedSpeed]}"])
elif selectedTerminal == "putty":
	subprocess.Popen(["putty","-serial" ,f"{sortedPorts[selectedPort-1][0]}","-sercfg", f"{speeds[selectedSpeed]}"])
elif selectedTerminal == "teraterm":
	comNumber = sortedPorts[selectedPort-1][0][3:]
	print(comNumber)
	subprocess.Popen(["ttermpro",f"/C={comNumber}", f"/BAUD={speeds[selectedSpeed]}"])	
	