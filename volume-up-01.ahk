#Requires AutoHotkey v2.0+
; volume up in smooth increments
master_volume := Floor(SoundGetVolume())
; MsgBox "Master volume is " master_volume " percent."
switch
{
	case master_volume >= 90 && master_volume < 100:
		SoundSetVolume "100"
	case master_volume >= 80 && master_volume < 90:
		SoundSetVolume "91"
	case master_volume >= 70 && master_volume < 80:
		SoundSetVolume "81"
	case master_volume >= 60 && master_volume < 70:
		SoundSetVolume "71"
	case master_volume >= 50 && master_volume < 60:
		SoundSetVolume "61"
	case master_volume >= 40 && master_volume < 50:
		SoundSetVolume "51"
	case master_volume >= 30 && master_volume < 40:
		SoundSetVolume "41"
	case master_volume >= 20 && master_volume < 30:
		SoundSetVolume "31"
	case master_volume >= 12 && master_volume < 20:
		SoundSetVolume "21"
	case master_volume >= 8 && master_volume < 12:
		SoundSetVolume "13"
	case master_volume >= 5 && master_volume < 8:
		SoundSetVolume "9"
	case master_volume >= 2 && master_volume < 5:
		SoundSetVolume "6"
	case master_volume >= 0 && master_volume < 2:
		SoundSetVolume "3"
}