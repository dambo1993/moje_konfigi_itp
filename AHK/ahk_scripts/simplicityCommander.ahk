#SingleInstance force

::cmdrrra::commander readmem -d EFR32 --range 0x
::cmdrrre::commander readmem -d EFR32 --region @
::cmdrme::commander device masserase -d EFR32
::cmdrpere::commander device pageerase --region @
::cmdrpera::commander device pageerase --range 0x