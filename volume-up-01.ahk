#Requires AutoHotkey v2.0+
#SingleInstance Force

; Define volume levels
volume_levels := [0, 2, 5, 8, 12, 20, 30, 40, 50, 60, 70, 80, 90, 100]

current_volume := Round(SoundGetVolume())

; Find the closest volume level index
closest_idx := 1
min_diff := Abs(volume_levels[1] - current_volume)

for idx, level in volume_levels {
    diff := Abs(level - current_volume)
    if (diff < min_diff) {
        min_diff := diff
        closest_idx := idx
    }
}

; Calculate new index
new_idx := closest_idx + 1

; Ensure we don't exceed maximum
if (new_idx > volume_levels.Length)
    new_idx := volume_levels.Length

; Set new volume
new_volume := volume_levels[new_idx]
SoundSetVolume new_volume
ToolTip("Volume " new_volume "%")
SetTimer () => ToolTip(), -500
