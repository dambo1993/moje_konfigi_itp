#SingleInstance force

CapsLock & h::Send {left}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & l::Send {right}

; temporary disabled - problably I don't use this right now - and this is better for eclipse
;CapsLock & m::Send {PgDn}
;CapsLock & ,::Send {PgUp}

; Optional feature - Caps lock always off
CapsLock::SetCapsLockState, Off

; only in explorer - to easy move in folders:
IfWinActive ahk_exe Explorer.EXE
{
	CapsLock & `;::Send {Enter}
	CapsLock & i::Send !{Up}
}



