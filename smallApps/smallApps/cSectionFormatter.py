import clipboard
import sys

length = 120

text = sys.argv[1]

spacesCounter = length - len(text) - 4

spaces1 = int(spacesCounter/2)

if spacesCounter % 2 == 0:
	spaces2 = spaces1
else:
	spaces2 = spaces1 + 1

lineSeparators = "/" + ((length - 2) * "*") + "/"
linetxt = "/*" + (spaces1 * " ") + text + (spaces2 * " ") + "*/"

output = lineSeparators + "\n" + linetxt + "\n" + lineSeparators

print(output)
clipboard.copy(output)