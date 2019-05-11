#SingleInstance force

CapsLock & h::Send {left}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & l::Send {right}

; Optional feature - Caps lock always off
CapsLock::SetCapsLockState, Off