#Requires AutoHotkey v2.0+
; volume down in smooth increments
master_volume := Floor(SoundGetVolume())
; MsgBox "Master volume is " master_volume " percent."
switch
{
	case master_volume > 90:
		SoundSetVolume "89"
	case master_volume > 80 && master_volume <= 90:
		SoundSetVolume "79"
	case master_volume > 70 && master_volume <= 80:
		SoundSetVolume "69"
	case master_volume > 60 && master_volume <= 70:
		SoundSetVolume "59"
	case master_volume > 50 && master_volume <= 60:
		SoundSetVolume "49"
	case master_volume > 40 && master_volume <= 50:
		SoundSetVolume "39"
	case master_volume > 30 && master_volume <= 40:
		SoundSetVolume "29"
	case master_volume > 20 && master_volume <= 30:
		SoundSetVolume "19"
	case master_volume > 12 && master_volume <= 20:
		SoundSetVolume "11"
	case master_volume > 8 && master_volume <= 12:
		SoundSetVolume "7"
	case master_volume > 5 && master_volume <= 8:
		SoundSetVolume "4"
	case master_volume > 2 && master_volume <= 5:
		SoundSetVolume "1"
	case master_volume <= 2:
		SoundSetVolume "0"
}
