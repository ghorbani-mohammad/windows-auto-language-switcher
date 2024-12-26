previousProgram := ""  ; Initialize previousProgram to an empty string

SetTimer(CheckWindow, 100)

CheckWindow()
{
    global previousProgram  ; Declare previousProgram as a global variable

    ; Try to get the window ID of the active window
    try
    {
        activeWindowID := WinGetID("A")  ; Get the ID of the active window
    }
    catch TargetError
    {
        ; Handle the error if the active window ID can't be retrieved
        Return
    }

    ; Check if the active window ID is valid
    If !activeWindowID
    {
        ; If there's no active window ID, return early
        Return
    }

    ; Try to get the process name of the active window
    try
    {
        activeProgram := WinGetProcessName(activeWindowID)  ; Get the process name of the active window
    }
    catch TargetError
    {
        ; Handle the error if the process name can't be retrieved
        MsgBox("Error retrieving process name for the active window.")
        Return
    }

    ; Check if the active program has changed
    If (activeProgram != previousProgram)
    {
        ; Do something when the program changes
        MsgBox("Active Program: " activeProgram)
        previousProgram := activeProgram  ; Update previousProgram with the current program
    }
}
