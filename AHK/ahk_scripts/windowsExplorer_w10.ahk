#SingleInstance force

; komendy aktywne tylko w explorerze
#IfWinActive ahk_exe Explorer.EXE

; otwarcie pliku w notepadzie
F9::
Send, ^c
Run, notepad++.exe %Clipboard%
return

; otwarcie gita w aktualnym katalogu
^G::
Send, {AppsKey}
Send, s
Send, s
Send, {Enter}
return