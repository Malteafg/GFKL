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

; GOOGLE the selected text.
CapsLock & g::
    ClipboardGet()
    Run, http://www.google.com/search?q=%clipboard%             ; Launch with contents of clipboard
    ClipboardRestore()
Return

; Navigation
CapsLock & i::Up
CapsLock & j::Left
CapsLock & k::Down
CapsLock & l::Right
CapsLock & m::^Left
CapsLock & .::^Right
CapsLock & u::Home
CapsLock & o::End
CapsLock & y::PgUp
CapsLock & h::PgDn
CapsLock & e::WheelUp
CapsLock & d::WheelDown

CapsLock & q::Media_Play_Pause
CapsLock & w::Media_Prev
CapsLock & r::Media_Next
CapsLock & t::Browser_Refresh

; Shortcuts
CapsLock & z::^z
CapsLock & x::^x
CapsLock & c::^c
CapsLock & v::^v
CapsLock & b::^y
CapsLock & a::^a
CapsLock & s::^s


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


