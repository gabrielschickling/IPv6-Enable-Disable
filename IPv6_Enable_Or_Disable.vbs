'Written by Gabriel Schickling
'Last Changed : 2/22/2017
'Purpose: To Enable or Disable IPv6 on a machine via Remote Management or other means
'How to Use: launch script via CMD using cscript with parameters "Enable" or "Disable"

Set WshShell = WScript.CreateObject("WScript.Shell")
'Arguments are "Disable" and "Enable"
Set args = WScript.Arguments
dim enabledisableIPv6
dim enable
dim disable
'Arguments variable
StrOption	=  WScript.Arguments(0)
'Variable that takes passed argument and autmatically makes it lowercase
strenabledisableIPv6 = (LCase(StrOption))
'variable enable
strenable = "enable"
'variable disable
strdisable = "disable"
'if the parameters string is equal to "Enable" then launch next command
If strenabledisableIPv6 = strenable Then
'Writes registry key to enable IPv6
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisabledComponents", "0" ,"REG_DWORD"
'if the parameters string is equal to "Disable" then launch next command
ElseIf strenabledisableIPv6 = strdisable Then
'Writes registry key to Disable IPv6
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisabledComponents", "255" ,"REG_DWORD"
Else
'any other parameters passed will quit script
Wscript.quit
End If
'quit
WScript.quit
