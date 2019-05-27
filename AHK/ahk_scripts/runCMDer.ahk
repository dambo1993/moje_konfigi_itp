#ifwinactive, ahk_class CabinetWClass
#p:: 
ControlGetText, address , edit1,ahk_class CabinetWClass
Run, cmder.exe, %address%
return
#ifwinactive ; Restores to normal behaviour, if needed