#SingleInstance force

; komendy aktywne tylko w explorerze
#IfWinActive ahk_exe Explorer.EXE

; uruchomienie lini komend w aktualnie otwartym oknie
F8::
Send, !a
Send, {End}
Send, "
Send, {Home}
Send, cmder
Send, {space}
Send, "
Send, {Enter}
return

; utworzenie nowego pliku
F7::
Send, {AppsKey}
Send, {Up}
Send, {Up}
Send, {Right}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Enter}
Send, ^A
Send, ^A
return

; otwarcie pliku w notepadzie
F9::
Send, {AppsKey}
Send, n
return

; otwarcie gita w aktualnym katalogu
^G::
Send, {AppsKey}
Send, s
Send, s
Send, {Enter}
return