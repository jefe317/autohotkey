#Requires AutoHotkey v2.0+
; Start recording in OBS, or stop recording if OBS is open
; Use WinExist to check if the OBS window exists
if WinExist("ahk_class Qt662QWindowIcon") {
    Run("C:\Users\lange\OneDrive\Documents\AutoHotkey\obs-cmd-windows-amd64.exe recording toggle")
} else {
    Run("C:\Program Files\obs-studio\bin\64bit\obs64.exe --startrecording", "C:\Program Files\obs-studio\bin\64bit\")
}