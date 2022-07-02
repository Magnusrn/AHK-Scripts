#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.$a::

F4::
if (key_presses > 0) ; SetTimer already started, so we log the keypress instead.
{
    key_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
key_presses := 1
SetTimer, keypressHandler, -400 ; Wait for more presses within a 500 millisecond window.
return

keypressHandler:
if (key_presses = 1) ; The key was pressed once.
{
    Send {Media_Play_Pause}
}
else if (key_presses = 2) ; The key was pressed twice.
{
    Send {Media_Next}
}
else if (key_presses > 2)
{
    Send {Media_Prev}
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
key_presses := 0
return