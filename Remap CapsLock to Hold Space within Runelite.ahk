#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CapsLock::
RepeatKey := !RepeatKey
If RepeatKey
	SetTimer, SendTheKey, 30	; The integer here is the number of milliseconds between repeats.
Else
	SetTimer, SendTheKey, Off
Return

SendTheKey:

IfWinActive, RuneLite
	SendInput {Space}
Return