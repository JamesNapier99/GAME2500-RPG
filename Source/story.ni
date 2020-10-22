"GAME2500 RPG" by James Napier

[Entry Text: Intro to the game, reminder for commands, etc]
When play begins:
	Say "Welcome to our Interactive Text-based RPG! We hope you enjoy your experience! When playing our game, make sure you have a look at the possible actions that
		can be taken!";

[-----------------------------------------------------------------------Rooms-----------------------------------------------------------------------]

	[Tenement F0]

The Tenement is a room. "You wake up to the drip of some cold water on your head. It's nothing unusual; the neighbors above have had a dilapidated floor for months now. It's amazing that it hasn't given in entirely.
As you adjust yourself, you see all the other tenants in your room. Each of them are visibly malnourished, wearing clothes that look more like throwaway rags than anything else. The dim rays of sunlight coming into the room suggest that it's about 6 AM.
You force yourself out of bed, guessing that work must start in about 30 minutes."

	
	[Alley F0]

The Alley is east of The Tenement. "You stumble from the darkness of the tenement into the gloomy alley. It's eerily quiet as this time of day, but in a few minutes you know the crowds will come pouring out from every household you can see. Perhaps you should move quickly to avoid the rush."

	[Front Gate F0]

The Front Gate is east of The Alley. "After about 10 minutes of walking, you finally show up at the factory front gate. Peeking through the clouds of smoke pouring from the chimneys, you can just barely tell that it's a sunny day.
You see all the other factory workers slowly filing in. 
Will you walk into the factory? As soon as you walk into the factory, you'll be starting your 11-hour shift."

	[Main Entrance F0]

The Main Entrance is south of Front Gate. 

	[Intake Desk F0]

The Intake Desk is south of Main Entrance

	[Spindle Room F0]
	
The Spindle Room is south of Intake Desk.

	[Loading Dock F0]
	
The Loading Dock is east of Cotton Engines.

	[Boiler Room F0]

The Boiler Room is south of Central Stairs.

	[Worker's Entrance F0]

The Worker's Entrance is west of Main Entrance.

	[Locker Rooms F0]
The Locker Rooms is south of Worker's Entrance and west of Cotton Engines.

	[Cotton Engines F0]

The Cotton Engines is south of the Spindle Room. "As you work, the violent, periodic smashing of machinery forces itself in your head. You try to ignore it and focus on your cotton gin work, but every time you look at the thing, you can't help but picture what happened to Jones' wife. You shudder at the thought, and turn away from the machine for a bit, but there your boss is, staring in your soul with a furious glare. You turn back to the machine and keep working.
5 hours later, the machine whirring stops for lunch break. You only have 10 minutes.
You see your friend Winston in the other corner of the room. Being the (slightly) more well-off of you two, he has lunch for both of you."

	[Central Stairs B1-F1]

The Central Stairs is south of Cotton Engines.

	[----------F1--------]
	
		[Finishing Room]
		
	The Finishing Room is above Central Stairs.
	
	[----------B1----------]
	
		[Basement Stairs]
	The Basement Stairs is below Central Stairs.

[-----------------------------------------------------------------------People-----------------------------------------------------------------------]

	[Jones]

Jones is a person in the Tenement. "Jones is the only other tenant that appears to be awake. It's only reasonable - how could he sleep? Nobody - not if they went through what he did.
You feel the urge to approach him, but you're not sure if it's the right thing to do right now."

	[Boy]

The Boy is a person in the Alley. "You pass a newspaper boy, yelling about the latest issue of the Boston Globe. He holds up the paper to your face and says 'You want it, pal? Just 25 cents...' 
Your daily wage is about 50 cents. Is it really worth it?"

	[Winston]

Winston is a person in the Cotton Engines. Winston is carrying a lunch bag.
		
[------------------------------------------------------------------------Things-----------------------------------------------------------------------]
The newspaper, paper is a thing.  The newspaper, paper is carried by the Boy. 

instead of examining a thing:
	if the noun is newspaper or the noun is paper:
		if the Boy is carrying the newspaper:
			say "The newspaper boy pulls the newspaper out of your face, saying 'Oi, you can't look before ya buy!'";
		otherwise:
			 say "The paper is dated October 4, 1872. Seems to be a high end newspaper, because you can't understand many of the words. There is, however, one section that catches your eye.
			
			'Cotton Gin Accident leaves Factory Worker Dead'
			
			The paper then explained what had happened to Jones' wife. She got too close to the machine, the paper said, and before she knew it, it sucked her in and tore her apart. Only some of her remains were found.
			
			You knew about this event well; it was in your own factory. But you hadn't seen the event take place, so it was interesting to see the details somewhere - especially when the company itself has been completely silent.
			
			You doubt that it'll break the silence any time soon, either.";

[-----------------------------------------------------------------------Talking Actions-----------------------------------------------------------------------]
		
talking is an action applying to one thing.
understand "ask [thing]" as talking.
understand "ask [thing] about" as talking.
understand "talk to [thing]" as talking.
understand "speak to [thing]" as talking.
understand "approach [thing]" as talking.
understand "go to [thing]" as talking.

instead of talking a person:
	if the noun is Jones:
		say "You approach him, but he suddenly starts coughing hysterically, and gestures at you to move away. Maybe this isn't the best time to be talking to him, anyway.";
	if the noun is Winston:
		say "You come up to him and he gives you the lunch bag.";
		now the player has the lunch bag;
	otherwise:
		say "Who?";
	continue the action;
		
[-----------------------------------------------------------------------Actions-----------------------------------------------------------------------]

purchasing is an action applying to one thing.
understand "buy [thing]" as purchasing.
understand "purchase [thing]" as purchasing.
understand "get [thing]" as purchasing.

instead of purchasing a thing:
	if the noun is newspaper or the noun is paper:
		if the boy is carrying the newspaper:
			now the player is carrying the newspaper;
			say "Well, there goes your quarter. This better be good....";
		otherwise:
			say "You already bought it...";
	otherwise:
		say "You can't buy this."
				