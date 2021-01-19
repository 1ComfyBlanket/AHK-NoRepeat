; Prevent key from repeating while held down. Must specify the amount of modifiers in the hotkey or if left blank they must be matching and in the same order as the release hotkey and vice versa.
NoRepeat(ModCount := 0)
{
	Static KeyArray
	If !KeyArray
		KeyArray := []		; A static array is used to prevent the need for unique, global variables for each hotkey
	ModCount++
	KeyUp := SubStr(A_ThisHotkey, -2)		; Check if it's a release hotkey by extracting the " Up" string
	
	If KeyUp = %A_Space%Up		; Not case-sensitive
	{
		KeyDown := SubStr(A_ThisHotkey, ModCount, -3)		; Return hotkey without the " Up" portion
		For k, v in KeyArray	; Compare the key released with any matching values in the array, deleting them
		{
			If v = %KeyDown%
				KeyArray.RemoveAt(k)
		}
		Return
	}
	Else
	{
		KeyDown := SubStr(A_ThisHotkey, ModCount)		; Return hotkey
		For k, v in KeyArray		; Check to see if the pressed key matches anything in the array, if so it will end the thread to prevent repeats.
		{
			If v = %KeyDown%
				Exit
		}
		KeyArray.Push(KeyDown)
	}
}
