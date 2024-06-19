#Requires AutoHotkey v2.0+
; AutoHotkey v2 script to toggle meeting video
; https://www.autohotkey.com/docs/v1/Hotkeys.htm

; https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0067050
; Zoom.exe ConfMultiTabContentWndClass
if WinExist("ahk_class ConfMultiTabContentWndClass") 
{
	WinActivate("ahk_class ConfMultiTabContentWndClass")
	Send("!v") ; send zoom video toggle, Alt+V
	Return
}
; https://support.google.com/a/users/answer/9896256?hl=en
; Chrome.exe Chrome_WidgetWin_1
else WinExist("ahk_class Chrome_WidgetWin_1") 
{
	WinActivate("Meet")
	Send("^e") ; send google meet video toggle, Ctrl+E
	Return
}