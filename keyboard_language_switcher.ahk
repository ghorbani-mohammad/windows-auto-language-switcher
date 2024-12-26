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
        ; MsgBox("Active Program: " activeProgram)
        previousProgram := activeProgram  ; Update previousProgram with the current program

        ; Check if the active program is "Telegram.exe"
        if (activeProgram = "Telegram.exe") {
            ; MsgBox("Let's change language to Persian")
            currentLanguage := GetInputLangName(GetInputLangID())
            ; MsgBox("Current Language", currentLanguage)
            if (currentLanguage == "Persian"){
                              ; MsgBox("not need to toggle")
               return
            }
            ; Simulate pressing Ctrl + 2 to switch to Persian
            Send("^2")  ; Send Ctrl + 2 keystroke
        }
                ; Check if the active program is "Code.exe" or "Slack.exe"
        if (activeProgram = "Code.exe" || activeProgram = "Slack.exe" || activeProgram = "cmd.exe") {
            ; MsgBox("Let's change language to English")
            currentLanguage := GetInputLangName(GetInputLangID())
            ; MsgBox("Current Language", currentLanguage)
            if (currentLanguage == "English"){
                              ; MsgBox("not need to toggle")
               return
            }
            ; Simulate pressing Ctrl + 1 to switch to English
            Send("^1")  ; Send Ctrl + 2 keystroke
        }
    }
}

; MsgBox GetInputLangName(GetInputLangID()), 'Input language', 'Iconi'

GetInputLangID(hWnd := '') {
    (!hWnd) && hWnd := WinActive('A')
    threadId := DllCall('GetWindowThreadProcessId', 'Ptr', hWnd, 'UInt', 0)
    if (threadId = 0) {
        MsgBox("Failed to retrieve thread ID.")
        return ""
    }
    lyt := DllCall('GetKeyboardLayout', 'Ptr', threadId, 'UInt')
    if (lyt = 0) {
        MsgBox("Failed to retrieve keyboard layout.")
        return ""
    }
    Return Format('{:#x}', lyt & 0x3FFF)
}

GetInputLangName(langId)  {
 Static LOCALE_SENGLANGUAGE := 0x1001
 charCount := DllCall('GetLocaleInfo', 'UInt', langId, 'UInt', LOCALE_SENGLANGUAGE, 'UInt', 0, 'UInt', 0)
 localeSig := Buffer(size := charCount << 1)
 DllCall('GetLocaleInfo', 'UInt', langId, 'UInt', LOCALE_SENGLANGUAGE, 'Ptr', localeSig, 'UInt', size)
 Return StrGet(localeSig)
}
