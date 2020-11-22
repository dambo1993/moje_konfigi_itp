#SingleInstance force

; only in CubeIDE - highlight current "phrase"
#If WinActive("ahk_exe stm32cubeide.exe")
{
	CapsLock & i::
		Send, {Alt Down}{Shift Down}
		Send, {Up}
		Send, {Alt Up}{Shift Up}
		Return
		
	CapsLock & u::
		Send, {Alt Down}{Shift Down}
		Send, {Down}
		Send, {Alt Up}{Shift Up}
		Return	
		
	CapsLock & '::
		Send, {Ctrl Down}{Alt Down}
		Send, {Down}
		Send, {Ctrl Up}{Alt Up}
		Return
	
	CapsLock & m::
		Send, {Alt Down}
		Send, {Down}
		Send, {Alt Up}
		Return
	
	CapsLock & ,::
		Send, {Alt Down}
		Send, {Up}
		Send, {Alt Up}
		Return

	CapsLock & 7::
		Send, {Shift Down}{Ctrl Down}
		Send, {Down}
		Send, {Shift Up}{Ctrl Up}
		Return

	CapsLock & 8::
		Send, {Shift Down}{Ctrl Down}
		Send, {Up}
		Send, {Shift Up}{Ctrl Up}
		Return

	CapsLock & a::
		Send, {End}
		Return
}
