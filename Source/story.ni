"GAME2500 RPG" by James Napier

[Entry Text: Intro to the game, reminder for commands, etc]
When play begins:
	Say "Welcome to our Interactive Text-based RPG! We hope you enjoy your experience! When playing our game, make sure you have a look at the possible actions that
		can be taken!";
		

[STORY NOTES
	Player works for Boston Manufacturing Company
	Lives in Waltham, MA near main building
]

[HEXAGONAL MAP DECLARATION]
Forward is a direction. Forward has opposite backward. Understand "f" as forward. 
Backward is a direction. Backward has opposite forward. Understand "b" and "back" as backward. 
Forward left is a direction. Forward left has opposite backward right. Understand "fl" as forward left. 
Forward right is a direction. Forward right has opposite backward left. Understand "fr" as forward right. 
Backward left is a direction. Backward left has opposite forward right. Understand "bl" as backward left. 
Backward right is a direction. Backward right has opposite forward left. Understand "br" as backward right. 

A direction can be hexagonal or squared-off. A direction is usually squared-off. Forward, backward, forward left, forward right, backward left and backward right are hexagonal. 

Before going a squared-off direction, say "In this hexagonally-divided landscape, squared-off directions are not allowed." instead.

Does the player mean going backward: it is very likely. Does the player mean going forward: it is very likely. 

To say legend (D - direction): 
	let destination hex be the room D from the location; 
	if the destination hex is nothing, say " "; 
	otherwise say the destination hex. 

Carry out looking: 
	say "[fixed letter spacing] \ [legend forward] /[line break][legend forward left] ---- [legend forward right][line break] / \[line break]--< [location] >--[line break] \ /[line break][legend backward left] ---- [legend backward right][line break] / [legend backward] \[variable letter spacing][line break]". 

The player is in Home.

Test me with "f / forward / backward left / bl / br / br / f".

[Rooms]

Home is a room. "Your small basement apartment in an alley of Main Street. Looks like a tornado has passed through it, but you haven't had the effort to clean up for years."

Main Street is a room. Main Street is forward of Home.

Cotton Gin - Main Entrance is a room. Cotton Gin - Main Entrance is forward left of Front Gate.

Cotton Gin - Worker's Entrance is a room. Cotton Gin - Worker's Entrance is forward right of Front Gate.

Locker Room is a room.  Locker Room is forward left of Cotton Gin - Worker's Entrance.

Front Gate is a room. Front Gate is forward left of Main Street.

Intake Desk is a room. Intake Desk is forward of Cotton Gin - Main Entrance.

Factory Floor - Main Level is a room. Factory Floor - Main Level is forward of Intake Desk and forward left of Locker Room.



[Variables]

[People/Animals]

[Tables]



