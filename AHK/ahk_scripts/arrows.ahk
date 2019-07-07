#SingleInstance force

CapsLock & h::Send {left}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & l::Send {right}
CapsLock & m::Send {PgDn}
CapsLock & ,::Send {PgUp}

; Optional feature - Caps lock always off
CapsLock::SetCapsLockState, Off

; only in explorer - to easy move in folders:
#IfWinActive ahk_exe Explorer.EXE
CapsLock & `;::Send {Enter}
CapsLock & i::Send !{Up}


