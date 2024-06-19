#Requires AutoHotkey v2.0+
; ask what WLED preset to run
MyGui := Gui(, "Choose WLED Preset")
MyGui.Add("Text",, "Preset:")
MyGui.AddDropDownList("vColorChoice", ["Off","Purpley","Blue Pacifica","Magma Flow"])
MyGui.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput)
MyGui.OnEvent("Close", ProcessUserInput)
MyGui.Show()

ProcessUserInput(*)
{
    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
    ; MsgBox("You entered '" Saved.ColorChoice " '.")
    switch Saved.ColorChoice
    {
        case "Off": Run('curl "http://192.168.1.143/win&PL=1"')
        case "Purpley": Run('curl "http://192.168.1.143/win&PL=2"')
        case "Blue Pacifica": Run('curl "http://192.168.1.143/win&PL=3"')
        case "Magma Flow": Run('curl "http://192.168.1.143/win&PL=4"')
    }
}
Return