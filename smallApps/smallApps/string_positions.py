# prosty programik do wizualizacji pozycji napisu - potrzebowalem do obrabiania tekstow na LCDku
from beautifultable import BeautifulTable
import sys
	
if len(sys.argv) == 2:
	text = sys.argv[1]
	print(text)

	table = BeautifulTable()
	table.column_headers = list(text)
	table.append_row(list(range(0,len(text))))
	print(table)
else:
	print("Wrong params")