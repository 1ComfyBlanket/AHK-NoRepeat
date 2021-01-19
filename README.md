Prevents repeated keypresses when a key is held down.

A feature that is surprisingly missing from AHK. While this can be accomplished with an 'if' that checked against a global variable, this gets messy
fast when you have a large amount of hotkeys. More accurately this halts execution beyond usage of the function.

Usage:
Add NoRepeat(n) to any part of your script where you want a repeated keypress to exit. N = Number of modifiers the hotkey has


Example:

*a::

Send, {b}

NoRepeat(1)      ; Anything beyond this line will not execute on a repeated keypress

Send, {f}

Return


*~a Up::NoRepeat(2)
