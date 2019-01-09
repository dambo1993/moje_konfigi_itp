#SingleInstance force

; komendy aktywne tylko w CMD i CMDerze
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")

::cmdr::commander
::cmdrh::commander -h
::cmdrdi::commander device info
::cmdrdr::commander device recover
::cmdrrra::commander readmem -d EFR32 --range 0x
::cmdrrre::commander readmem -d EFR32 --region @
::cmdrdme::commander device masserase -d EFR32
::cmdrdpere::commander device pageerase --region @
::cmdrdpera::commander device pageerase --range 0x
::cmdrf::commander flash -d EFR32 