#Requires AutoHotkey v2.0+
#SingleInstance Force

; volume up in smooth increments
master_volume := Round(SoundGetVolume())
; MsgBox "Master volume is " master_volume " percent."
switch
{
	case master_volume >= 20 && master_volume < 100:
		SoundSetVolume "+10"
		ToolTip("volume " master_volume)
	case master_volume >= 12 && master_volume < 20:
		SoundSetVolume "20"
		ToolTip("volume 20")
	case master_volume >= 8 && master_volume < 12:
		SoundSetVolume "12"
		ToolTip("volume 12")
	case master_volume >= 5 && master_volume < 8:
		SoundSetVolume "8"
		ToolTip("volume 8")
	case master_volume >= 2 && master_volume < 5:
		SoundSetVolume "5"
		ToolTip("volume 5")
	case master_volume < 2:
		SoundSetVolume "2"
		ToolTip("volume 2")
}
SetTimer () => ToolTip(), -500
