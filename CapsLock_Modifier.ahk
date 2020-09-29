#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;================================================================================================
;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
;================================================================================================
; Must double tap CapsLock to toggle CapsLock mode on or off.
CapsLock::
    KeyWait, CapsLock                                                   ; Wait forever until Capslock is released.
    
return



;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
; Get DEFINITION of selected word.    
CapsLock & d::
    ClipboardGet()
    Run, http://www.google.com/search?q=define+%clipboard%     ; Launch with contents of clipboard
    ClipboardRestore()
Return

; GOOGLE the selected text.
CapsLock & g::
    ClipboardGet()
    Run, http://www.google.com/search?q=%clipboard%             ; Launch with contents of clipboard
    ClipboardRestore()
Return

; Do THESAURUS of selected word
CapsLock & t::
    ClipboardGet()
    Run http://www.thesaurus.com/browse/%Clipboard%             ; Launch with contents of clipboard
    ClipboardRestore()
Return

; Do WIKIPEDIA of selected word
CapsLock & w::
    ClipboardGet()
    Run, https://en.wikipedia.org/wiki/%clipboard%              ; Launch with contents of clipboard
    ClipboardRestore()
Return

; Arrow keys
CapsLock & i::Up
CapsLock & j::Left
CapsLock & k::Down
CapsLock & l::Right

CapsLock & z::^z
CapsLock & x::^x
CapsLock & c::^c
CapsLock & v::^v


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;================================================================================================
; Clipboard helper functions.
;================================================================================================
ClipboardGet()
{
    OldClipboard:= ClipboardAll                         ;Save existing clipboard.
    Clipboard:= ""
    Send, ^c                                            ;Copy selected test to clipboard
    ClipWait 0
    If ErrorLevel
        {
        MsgBox, No Text Selected!
        Return
        }
}


ClipboardRestore()
{
    Clipboard:= OldClipboard
}


