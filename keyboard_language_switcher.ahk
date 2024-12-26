previousProgram := ""  ; Initialize previousProgram to an empty string

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
            ; Change the keyboard language to Persian (Assuming Persian is layout 1)
            Send("{LAlt down}{Shift down}{Shift up}{LAlt up}")  ; This toggles between languages, change as needed
        }
        else {
            ; Change the keyboard language to English (Assuming English is layout 0)
            Send("{LAlt down}{Shift down}{Shift up}{LAlt up}")  ; This toggles between languages, change as needed
        }
    }
}
