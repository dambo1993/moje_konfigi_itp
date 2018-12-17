#SingleInstance force

; komendy aktywne tylko w CMD i CMDerze
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")

::pltf::platformio 
::pltfh::platformio home
::pltfie::platformio init --ide eclipse
::pltfb::platformio boards