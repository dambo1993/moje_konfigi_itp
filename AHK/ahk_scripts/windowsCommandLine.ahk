#SingleInstance force

; komendy aktywne tylko w CMD i CMDerze
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")

; uruchomienie explorera w danym katalogu
::ex.::explorer .

; uruchomienie notepada++
::ntpp::notepad{+}{+}

; uruchomienie zwyklego notepada
::ntp::notepad

; uruchomienie SA - porty COM
::sacom::python c:\smallApps\COMPorts.py

; uruchomienie SA - puttyRunner
::saput::python c:\smallApps\puttyRunner.py

; uruchomienie SA - binaryCompare - potem musimy podac 2 pliki do porownania
::sacmpb::c:\smallApps\compareBinary.bat

; szybszy grep
::|gr::| grep 

; komenda aktywna tylko w CMD - CMDer ma juz to wbudowane
#If WinActive("ahk_exe cmd.exe")
; kopiowanie w konsole
^V::
SendInput {Raw}%clipboard%
return