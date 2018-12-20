import serial.tools.list_ports
from beautifultable import BeautifulTable

ports = serial.tools.list_ports.comports()
table = BeautifulTable()
table.column_headers = ["PORT", "DESCRIPTION", "HWID"]

print("Active COM ports:")
for port, desc, hwid in sorted(ports):
        table.append_row([port, desc, hwid])
print(table)