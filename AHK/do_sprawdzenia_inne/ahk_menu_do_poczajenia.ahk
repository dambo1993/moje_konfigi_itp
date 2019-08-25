MenuList=
(
AHK > Reload AHK > Run Script.ahk
AHK > Environment > Run Environment.ahk
System > Mute > Send {Volume_Mute}
)

Loop, parse, MenuList, `n
{
  StringSplit, MenuLevel,A_LoopField, >

if(MenuLevel4 = "" )
{
  Menu, %MenuLevel1%, Add, %MenuLevel2%, Action
  Menu, MyMenu, Add, %MenuLevel1%, :%MenuLevel1%
  Command := varize(MenuLevel2)   ;Remove illegal characters
  %Command% = %MenuLevel3%
}
else
{
  Menu, %MenuLevel2%, Add, %MenuLevel3%, Action
  Menu, %MenuLevel1%, Add, %MenuLevel2%, :%MenuLevel2%
  Menu, MyMenu, Add, %MenuLevel1%, :%MenuLevel1%
  Command := varize(MenuLevel3)   ;Remove illegal characters
  %Command% = %MenuLevel4%
  VarSetCapacity(MenuLevel4,0)	;Reset Menulevel4 to blank
}

}

Menu, MyMenu, Show
sleep, 2000
exitapp

Action:
selected := varize(A_ThisMenuItem) ;Remove illegal characters
exe = % %selected%
DynaRun("#notrayicon `n"exe)
exitapp

DynaRun(TempScript, pipename="")
{
   static _:="uint",@:="Ptr"
   If pipename =
      name := "AHK" A_TickCount
   Else
      name := pipename
   __PIPE_GA_ := DllCall("CreateNamedPipe","str","\\.\pipe\" name,_,2,_,0,_,255,_,0,_,0,@,0,@,0)
   __PIPE_    := DllCall("CreateNamedPipe","str","\\.\pipe\" name,_,2,_,0,_,255,_,0,_,0,@,0,@,0)
   if (__PIPE_=-1 or __PIPE_GA_=-1)
      Return 0
   Run, %A_AhkPath% "\\.\pipe\%name%",,UseErrorLevel HIDE, PID
   If ErrorLevel
      MsgBox, 262144, ERROR,% "Could not open file:`n" __AHK_EXE_ """\\.\pipe\" name """"
   DllCall("ConnectNamedPipe",@,__PIPE_GA_,@,0)
   DllCall("CloseHandle",@,__PIPE_GA_)
   DllCall("ConnectNamedPipe",@,__PIPE_,@,0)
   script := (A_IsUnicode ? chr(0xfeff) : (chr(239) . chr(187) . chr(191))) TempScript
   if !DllCall("WriteFile",@,__PIPE_,"str",script,_,(StrLen(script)+1)*(A_IsUnicode ? 2 : 1),_ "*",0,@,0)
      Return A_LastError
   DllCall("CloseHandle",@,__PIPE_)
   Return PID
}

varize(var, autofix = true) {
   Loop, Parse, var
   { c = %A_LoopField%
      x := Asc(c)
      If (x > 47 and x < 58) or (x > 64 and x < 91) or (x > 96 and x < 123)
         or c = "#" or c = "_" or c = "@" or c = "$" or c = "?" or c = "[" or c = "]"
         IfEqual, autofix, 1, SetEnv, nv, %nv%%c%
         Else er++
   } If StrLen(var) > 254
      IfEqual, autofix, 1, StringLeft, var, var, 254
      Else er++
   IfEqual, autofix, 1, Return, nv
   Else Return, er
}