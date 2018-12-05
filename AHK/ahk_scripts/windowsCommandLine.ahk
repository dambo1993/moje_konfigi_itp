#SingleInstance force

; komendy aktywne tylko w CMD i CMDerze
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")

; uruchomienie explorera w danym katalogu
::ex.::explorer .

; uruchomienie notepada++
::ntpp::notepad{+}{+}

; uruchomienie zwyklego notepada
::ntp::notepad

; uruchomienie SM - porty COM
::sa_com::python c:\smallApps\COMPorts.py

#If WinActive("ahk_exe cmd.exe")
; kopiowanie w konsole
^V::
SendInput {Raw}%clipboard%
return