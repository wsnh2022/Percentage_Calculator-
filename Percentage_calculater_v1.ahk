	#singleinstance Force
	#NoEnv
	; Reference https://percentcalc.com/
	
	; Gui layout
	;--------------
	;-----------------
	Gui, +AlwaysOnTop +ToolWindow +Border
	Gui, Color, 151B54 ;Name (black) or Enter hex Color Pattern
	Gui, Font, s12,
	; ------------------------- TITLE -------------------------
	Gui, Add, Text, x180  cWhite, Find Percentage of a Number :
	; -----------1-------------- What is 10 % OF 200 -------------------------
	Gui, Add, Text, x10 y45 cWhite, What is :
	Gui, Add, Text, x+140 cWhite, `% of :
	Gui, Add, Text, x+160 cWhite, ? :	
	Gui,Add,Button,x450 y45 w90 h20 gCalculate1,Calculate1  ; The label ButtonOK (if it exists) will be run when the button is pressed.
	Gui, Add, Edit, va1 x74 y40 w130 h25,   ; The ym option starts a new column of controls.
	Gui, Add, Edit, va2 x+50 y40 w150 h25,   ; The ym option starts a new column of controls.
	
	; -----------2--------------50% IS WHAT % OF 10,000  -------------------------	
	Gui, Add, Text, x130 y85 cWhite, is what `% of :
	Gui, Add, Text, x+140 y85 cWhite, ? :
	Gui, Add, Button, x450 y85 w90 h20 gCalculate2, Calculate2
	Gui, Add, Edit, vb1 x15 y80 w105 h25,
	Gui, Add, Edit, vb2 x+105 y80 w130 h25,
	
	; ------------3-------------if 23.5% is 456 then 100% = 1940  -------------------------	
	Gui, Add, Text, x150 y130 cWhite, is:
	Gui, Add, Text, x300 y130 cWhite, `% of what ? :
	Gui, Add, Button, x450 y125 w90 h20 gCalculate3, Calculate3
	Gui, Add, Edit, vc1 x15 y125 w125 h25,
	Gui, Add, Edit, vc2 x+30 y125 w120 h25,
	
	; ------------------------- TITLE 2 -------------------------
	Gui, Add, Text, x10 y165 cWhite, ********************************************************************************
	Gui, Add, Text, x160 cWhite, Find Percentage of Increase/Decrease :
	; -------------4------------ PERCENTAGE INCREASE/DECREASE -------------------------	
	Gui, Add, Text, x10 y235 cWhite, From:
	Gui, Add, Text, x+150 y235 cWhite, To :
	Gui, Add, Button, x450 y235 w90 h20 gCalculate4, Calculate4
	Gui, Add, Edit, vd1 x60 y232 w125 h25,
	Gui, Add, Edit, vd2 x+50 y232 w160 h25,
	
	; --------------------------------------------------
	;~ ;Gui, Add, Edit, vvalue ym
	; --------------------------------------------------
	Gui, Show, x1550 y400 w550 h280, Percentage calculators ; HEADING
	return  ; End of auto-execute section. The script is idle until the user does something.
	
	Calculate1:
	WinSet, AlwaysOnTop
	Gui, Submit, Nohide
	MsgBox % a1 `% " of " . a2 " is = " . Round((((a1*a2)*1) / 100),2)
	return
	
	Calculate2:
	Gui, Submit, Nohide
	MsgBox % b1 . " of " . b2 . " is = " . Round(((b1 * 100) / b2), 2)`%
	return
	
	Calculate3:
	Gui, Submit, Nohide
	MsgBox % " If " c2 `% . " is= " . c1 . " > Then 100% is= " . Round(((c1 * 100) / c2))
	return
	
	Calculate4:
	Gui, Submit, Nohide
	If (d2 > d1)
	{
		MsgBox % " Gain " . Round(((d2-d1) / d1) * 100 ,2)`%
	}
	if (d2 < d1)
	{
		MsgBox % " Loss " . Round(((d2-d1) / d1) * 100 ,2)`%
	}
	return
	
	
	GuiClose:
	!x::
	ExitApp