#SingleInstance force

; focus to main field - in firefox/eclipse etc
^F1::
Send, ^f
sleep, 1
Send, {Esc}
sleep, 1
Send, {Esc}
return