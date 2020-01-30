#SingleInstance force

::@@m::thedambo1@gmail.com

::@@da::
	FormatTime, CurrentDateTime,, dd.MM.yyyy
	SendInput %CurrentDateTime%
Return

::@@ti::
	FormatTime, CurrentDateTime,, HH:mm:ss
	SendInput %CurrentDateTime%
Return

::@@dt::
	FormatTime, CurrentDateTime,, HH:mm:ss dd.MM.yyyy
	SendInput %CurrentDateTime%
Return

::@@sg::Sounds great.
::@@sgty::Sounds great. Thank you.