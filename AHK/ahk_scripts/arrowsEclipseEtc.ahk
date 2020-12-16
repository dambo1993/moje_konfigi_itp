#SingleInstance force

; only in CubeIDE - highlight current "phrase"
#If WinActive("ahk_exe stm32cubeide.exe")
{
	; expand visual block down
	CapsLock & i::
		Send, {Alt Down}{Shift Down}
		Send, {Up}
		Send, {Alt Up}{Shift Up}
		Return
		
	; expand visual block up
	CapsLock & u::
		Send, {Alt Down}{Shift Down}
		Send, {Down}
		Send, {Alt Up}{Shift Up}
		Return	
	
	; copyPaste selected lines	
	CapsLock & '::
		Send, {Ctrl Down}{Alt Down}
		Send, {Down}
		Send, {Ctrl Up}{Alt Up}
		Return
	
	; move selected lines down
	CapsLock & m::
		Send, {Alt Down}
		Send, {Down}
		Send, {Alt Up}
		Return
		
	; move selected lines down
	CapsLock & ,::
		Send, {Alt Down}
		Send, {Up}
		Send, {Alt Up}
		Return

	; next function
	CapsLock & 7::
		Send, {Shift Down}{Ctrl Down}
		Send, {Down}
		Send, {Shift Up}{Ctrl Up}
		Return

	; previous function
	CapsLock & 8::
		Send, {Shift Down}{Ctrl Down}
		Send, {Up}
		Send, {Shift Up}{Ctrl Up}
		Return

	; append text - because "end" key is too far away
	CapsLock & a::
		Send, {End}
		Return
		
	; visual line mode down
	CapsLock & Q::
		Send, {Shift Down}
		Send, {Down}
		Send, {Shift Up}
		Return

	; visual line mode up
	CapsLock & W::
		Send, {Shift Down}
		Send, {Up}
		Send, {Shift Up}
		Return
}
