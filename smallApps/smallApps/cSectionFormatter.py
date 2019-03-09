import clipboard
import sys

length = 120

text = sys.argv[1]

lineSeparators = "/" + ((length - 2) * "*") + "/"

linetxt = "/*" + text.center(length - 4) + "*/"

output = lineSeparators + "\n" + linetxt + "\n" + lineSeparators

print(output)
clipboard.copy(output)