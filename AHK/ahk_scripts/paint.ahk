#SingleInstance force

; komendy aktywne tylko w oknie painta
#If WinActive("ahk_exe mspaint.exe")

; uruchomienie narzedzia do zaznaczania
^D::
Send, !s
Send, s
Send, e
Send, {Enter}
return