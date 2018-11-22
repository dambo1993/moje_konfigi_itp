#SingleInstance force

; komendy aktywne tylko w explorerze
#IfWinActive ahk_exe cmd.exe

; uruchomienie explorera w danym katalogu
::ex.::explorer .

; kopiowanie w konsole
^V::
SendInput {Raw}%clipboard%
return