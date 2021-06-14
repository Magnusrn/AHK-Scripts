#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

+^s::  ;;Google selected text
 	clipsaved:= ClipboardAll    ; This line is here so the original clipboard contents can be restored when the script is finished.
 	Clipboard =    ; This erases the clipboard, so that we can be sure something new is added in the next step.
	Send, ^c    ; Add the highlighted text to the clipboard
	ClipWait, 0.5    ; Give Windows time to actually populate the clipboard - you may need to experiment with the time here.
 	WinGetTitle, CurrentWinTitle    ; Gets the title of the active window
 	WinActivate, %CurrentWinTitle%    ; Makes sure you are still in the original window.
 	Run, https://www.google.com/search?q=%Clipboard%
 	Clipboard := clipsaved    ; Sets the clipboard back to whatever was on it before you ran this script.
Return