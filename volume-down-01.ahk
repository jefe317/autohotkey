#Requires AutoHotkey v2.0+
#SingleInstance Force

; volume down in smooth increments
master_volume := Floor(SoundGetVolume())
; MsgBox "Master volume is " master_volume " percent."
switch
{
	case master_volume > 20 && master_volume <= 100:
		SoundSetVolume "-10"
		ToolTip("volume " master_volume)
	case master_volume > 12 && master_volume <= 20:
		SoundSetVolume "12"
		ToolTip("volume 12")
	case master_volume > 8 && master_volume <= 12:
		SoundSetVolume "8"
		ToolTip("volume 8")
	case master_volume > 5 && master_volume <= 8:
		SoundSetVolume "5"
		ToolTip("volume 5")
	case master_volume > 2 && master_volume <= 5:
		SoundSetVolume "2"
		ToolTip("volume 2")
	case master_volume <= 2:
		SoundSetVolume "0"
		ToolTip("volume 0")
}
SetTimer () => ToolTip(), -500
