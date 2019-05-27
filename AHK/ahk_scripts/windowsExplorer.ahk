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