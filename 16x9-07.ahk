#Requires AutoHotkey v2.0

; Get the active window
activeWindow := WinExist("A")
if !activeWindow {
    MsgBox("No active window found!")
    ExitApp
}

; Get window position and dimensions
WinGetPos(&wLeft, &wTop, &wWidth, &wHeight, activeWindow)

; Find the correct monitor by checking each monitor's bounds
windowCenterX := wLeft + wWidth/2
windowCenterY := wTop + wHeight/2
monitorCount := MonitorGetCount()
currentMonitor := 1

Loop monitorCount {
    MonitorGet(A_Index, &mLeft, &mTop, &mRight, &mBottom)
    if (windowCenterX >= mLeft && windowCenterX <= mRight && 
        windowCenterY >= mTop && windowCenterY <= mBottom) {
        currentMonitor := A_Index
        break
    }
}

; Get the work area of the correct monitor
MonitorGetWorkArea(currentMonitor, &mLeft, &mTop, &mRight, &mBottom)

; Calculate monitor dimensions
monitorWidth := mRight - mLeft
monitorHeight := mBottom - mTop

; Create GUI for scale selection
MyGui := Gui(, "Scale Active Window")
MyGui.Add("Text",, "Select window scale (percentage of screen):")
scaleDropdown := MyGui.Add("DropDownList", "Choose3", ["100", "90", "80", "70", "60", "50"])  ; Choose3 sets default to 80%
MyGui.Add("Button", "default", "Scale").OnEvent("Click", ScaleWindow)
MyGui.OnEvent("Close", ScaleWindow)
MyGui.Show()

ScaleWindow(*) {
    global activeWindow, monitorWidth, monitorHeight, mLeft, mTop, scaleDropdown
    
    ; Get selected scale
    selectedScale := Number(scaleDropdown.Text) / 100
    
    ; Calculate new dimensions maintaining 16:9 aspect ratio
    if (monitorWidth / monitorHeight > 16/9) {
        ; Monitor is wider than 16:9
        newHeight := monitorHeight * selectedScale
        newWidth := newHeight * 16/9
    } else {
        ; Monitor is taller than 16:9
        newWidth := monitorWidth * selectedScale
        newHeight := newWidth * 9/16
    }
    
    ; Calculate center position
    newLeft := mLeft + (monitorWidth - newWidth) / 2
    newTop := mTop + (monitorHeight - newHeight) / 2
    
    ; Move and resize window
    WinMove(newLeft, newTop, newWidth, newHeight, activeWindow)
    
    ; Close GUI after applying
    MyGui.Destroy()
}

; Clean up when script exits
MyGui.OnEvent("Close", (*) => ExitApp())