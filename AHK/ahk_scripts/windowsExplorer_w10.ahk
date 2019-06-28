#SingleInstance force

; komendy aktywne tylko w explorerze
#IfWinActive ahk_exe Explorer.EXE

; otwarcie pliku w notepadzie
F9::
Send, !{AppsKey}
sleep, 1
Send, n
sleep, 1
Send, {Enter}
return

; otwarcie gita w aktualnym katalogu
^G::
Send, {AppsKey}
Send, s
Send, s
Send, {Enter}
return

; uruchomienie CMDera w aktualnie otwartym oknie
F8::
Send, !d
Send, {End}
Send, "
Send, {Home}
Send, cmder
Send, {space}
Send, "
Send, {Enter}
return