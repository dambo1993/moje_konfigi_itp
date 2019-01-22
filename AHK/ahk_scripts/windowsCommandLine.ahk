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

; uruchomienie SA - porty COM z wyszukaniem nowych
::sacomn::python c:\smallApps\COMPorts.py -n

; uruchomienie SA - termRunner - putty
::saput::python c:\smallApps\termRunner.py -putty

; uruchomienie SA - termRunner - dambusiowa_konsolka
::sadmb::python c:\smallApps\termRunner.py -dmb

; uruchomienie SA - binaryCompare - potem musimy podac 2 pliki do porownania
::sacmpb::c:\smallApps\compareBinary.bat

; uruchomienie SA - cSectionFormatter
::sacsf::python c:\smallApps\cSectionFormatter.py

; uruchomienie SA - MQTT2COM
::sam2c::python c:\smallApps\MQTT2COM.py

; uruchomienie SA - MQTT2COM z adresem na moje RPi
; w wersji "standardowej"
::sam2crpis::python c:\smallApps\MQTT2COM.py -broker "192.168.0.11" -i input -o output -p 
; w wersji z innymi in/out:
::sam2crpi::python c:\smallApps\MQTT2COM.py -broker "192.168.0.11" 

; szybszy grep
::|gr::| grep 

; python - mega oszczednosc 3 znakow :p
::pth::python

; python - pip install - ostatnio duzo tego klepie
::pthpi::python -m pip install 

; uruchomienie katalogu ze skryptami
::ahkf::cd C:/ahk_scripts

; komenda aktywna tylko w CMD - CMDer ma juz to wbudowane
#If WinActive("ahk_exe cmd.exe")
; kopiowanie w konsole
^V::
SendInput {Raw}%clipboard%
return