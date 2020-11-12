#SingleInstance force

; only in CubeIDE - highlight current "phrase"
IfWinActive ahk_exe stm32cubeide.exe
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
}
