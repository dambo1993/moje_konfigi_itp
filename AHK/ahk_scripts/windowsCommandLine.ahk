#SingleInstance force

; komendy aktywne tylko w cmd i cmderze
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")

; uruchomienie explorera w danym katalogu
::ex.::explorer .

; kopiowanie w konsole
^V::
SendInput {Raw}%clipboard%
return