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
    ClipboardRestore()
Return

; Navigation
CapsLock & i::Up
CapsLock & j::Left
CapsLock & k::Down
CapsLock & l::Right
CapsLock & u::^Left
CapsLock & o::^Right
CapsLock & m::Home
CapsLock & .::End
CapsLock & y::PgUp
CapsLock & h::PgDn
CapsLock & e::WheelUp
CapsLock & d::WheelDown

CapsLock & '::Delete
CapsLock & `;::Backspace
CapsLock & ?::^Delete
CapsLock & p::^Backspace
CapsLock & \::CapsLock
CapsLock & n::Insert
CapsLock & ,::AppsKey

; Media
CapsLock & q::Media_Play_Pause
CapsLock & w::Media_Prev
CapsLock & r::Media_Next

; Shortcuts
CapsLock & z::^z
CapsLock & x::^x
CapsLock & c::^c
CapsLock & v::^v
CapsLock & b::^y
CapsLock & a::^a
CapsLock & s::^s
CapsLock & f::^f
CapsLock & t::^t

; Top row
CapsLock & @::^+Tab
CapsLock & #::^Tab
CapsLock & $::^F4
CapsLock & 5::F5

CapsLock & Space::Space
CapsLock & Enter::Enter
CapsLock & Backspace::Backspace
CapsLock & Tab::Run chrome.exe
CapsLock & Esc::!F4


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
        Run chrome.exe
        Return
        }
	Else {
		Run http://www.google.com/search?q=%clipboard%             ; Launch with contents of clipboard
		Return
	}
}


ClipboardRestore()
{
    Clipboard:= OldClipboard
}


