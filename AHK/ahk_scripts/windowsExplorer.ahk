#SingleInstance force

; komendy aktywne tylko w explorerze
#IfWinActive ahk_exe Explorer.EXE

; uruchomienie lini komend w aktualnie otwartym oknie
F8::
Send, !a
Send, cmd
Send, {Enter}
return

; utworzenie nowego pliku
F7::
Send, {alt}
Send, p
Send, w
Send, {Up}
Send, {Up}
Send, {Enter}
Send, ^A
return

; otwarcie pliku w notepadzie
F9::
Send, {AppsKey}
Send, n
Send, {Enter}
return

; otwarcie gita w aktualnym katalogu
^G::
Send, {AppsKey}
Send, s
Send, s
Send, {Enter}
return