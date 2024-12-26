; Hotkeys for changing languages
^1::  ; Ctrl + 1 for English
{
    SetInputLanguage("en")
}

^2::  ; Ctrl + 2 for Persian
{
    SetInputLanguage("fa")
}

; Function to change input language
SetInputLanguage(LanguageCode) {
    ; Adjusting the code to switch input languages
    PostMessage(0x50, 0, 0, , "A")  ; Send WM_INPUTLANGCHANGEREQUEST message to the active window
}


previousProgram := ""  ; Initialize previousProgram to an empty string

; Periodically check windows to get changes
SetTimer(CheckWindow, 100)

CheckWindow() {
    global previousProgram  ; Declare previousProgram as a global variable

    ; Try to get the window ID of the active window
    try {
        activeWindowID := WinGetID("A")  ; Get the ID of the active window
    } catch TargetError {
        ; Handle the error if the active window ID can't be retrieved
        return
    }

    ; Check if the active window ID is valid
    if !activeWindowID {
        ; If there's no active window ID, return early
        return
    }

    ; Try to get the process name of the active window
    try {
        activeProgram := WinGetProcessName(activeWindowID)  ; Get the process name of the active window
    } catch TargetError {
        ; Handle the error if the process name can't be retrieved
        MsgBox("Error retrieving process name for the active window.")
        return
    }

    ; Check if the active program has changed
    if (activeProgram != previousProgram) {
        ; Do something when the program changes
        MsgBox("Active Program: " activeProgram)
        previousProgram := activeProgram  ; Update previousProgram with the current program

        ; Check if the active program is "Telegram.exe"
        if (activeProgram = "Telegram.exe") {
            MsgBox("Let's change language to Persian")
            ; Simulate pressing Ctrl + 2 to switch to Persian
            Send("^2")  ; Send Ctrl + 2 keystroke
        }
    }
}


