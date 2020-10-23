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

[NOTE TO SELF]	[Make sure some of this is only repeated in the mornings or one time]
	
	[Alley F0]

The Alley is east of The Tenement. "You stumble from the darkness of the tenement into the gloomy alley. It's eerily quiet as this time of day, but in a few minutes you know the crowds will come pouring out from every household you can see. Perhaps you should move quickly to avoid the rush."

	[Front Gate F0]

The Front Gate is east of The Alley. "After about 10 minutes of walking, you finally show up at the factory front gate. Peeking through the clouds of smoke pouring from the chimneys, you can just barely tell that it's a sunny day.
You see all the other factory workers slowly filing in. 
Will you walk into the factory? As soon as you walk into the factory, you'll be starting your 11-hour shift."

[NOTE TO SELF]	[MAKE SURE THIS IS TIME SENSITIVE]

	[Main Entrance F0]

The Main Entrance is south of Front Gate. 

	[Intake Desk F0]

The Intake Desk is south of Main Entrance

	[Spindle Room F0]
	
The Spindle Room is south of Intake Desk.

The Spindle Room Gossip is scenery in Spindle Room. The sound of Spindle Room Gossip is "Whisper whisper whisper".
	[Loading Dock F0]
	
The Loading Dock is east of Cotton Engines.

	[Boiler Room F0]

The Boiler Room is south of Central Stairs.

	[Worker's Entrance F0]

The Worker's Entrance is west of Main Entrance.

	[Locker Rooms F0]
The Locker Rooms is south of Worker's Entrance and west of Cotton Engines.

	[Cotton Engines F0]

The Cotton Engines is south of the Spindle Room. "As you work, the violent, periodic smashing of machinery forces itself in your head. You try to ignore it and focus on your cotton gin work, but every time you look at the thing, you can't help but picture what happened to Jones' wife. You shudder at the thought, and turn away from the machine for a bit, but there your boss is, staring in your soul with a furious glare. You turn back to the machine and keep working."
[5 hours later, the machine whirring stops for lunch break. You only have 10 minutes.
You see your friend Winston in the other corner of the room. Being the (slightly) more well-off of you two, he has lunch for both of you."]

[NOTE TO SELF]	[TIME LUNCH AND SHIT, DONT REPEAT IT EVERY TIME]
	[Central Stairs B1-F1]

The Central Stairs is south of Cotton Engines.

	[----------F1--------]
	
		[Finishing Room]
		
	The Finishing Room is above Central Stairs.
	
	[----------B1----------]
	
		[Basement Stairs]
	The Basement Stairs is below Central Stairs. "Before you is a set of dusty, old, wooden stairs. The center of each stair has lost much of its color from use over the last however-many years. You look to the right and notice that the bare wooden framework of the cotton gin is visible. A single light bulb hangs from the ceiling to produce light.
On the bottom of the stairs is a heavy metal door, presumably leading to the rest of the basement. It looks as if there is a lock above the door knob. You think you would be able to open the door silently, but you’re not entirely sure."

[-----------------------------------------------------------------------People-----------------------------------------------------------------------]

	[Jones]

Jones is a man in the Tenement. "Jones is the only other tenant that appears to be awake. It's only reasonable - how could he sleep? Nobody - not if they went through what he did.
You feel the urge to approach him, but you're not sure if it's the right thing to do right now."

	[Newspaper Boy]

The Boy is a man in the Alley. "You pass a boy, yelling about the latest issue of the Boston Globe. He holds up the paper to your face and says 'You want it, pal? Just 25 cents...' 
Your daily wage is about 50 cents. Is it really worth it?"

	[Winston]

Winston is a man in the Cotton Engines. Winston is carrying a lunch bag.
		
	[Overseer]
	[Forces player back to work]
Overseer is a man in Cotton Engines. 

Overseer can be active or passive. Overseer is Active.

Table of Overseer's Movement
destination
Intake Desk
Spindle Room
Loading Dock
Boiler Room
Central Stairs
Cotton Engines

OverseerMove is a truth state that varies.
OverseerMove is false.

OverseerRepeat is a truth state that varies.
OverseerRepeat is false.

Every turn when Overseer is active:
	if Overseer is in a room (called the current space):
		if the player is in current space:
			say "The Overseer stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
You scurry back to the cotton engines";
			move the player to Cotton Engines, without printing a room description;
			now the player is in Cotton Engines;
			say "Well that was rude. Guess I should avoid him next time.";
			continue the action;
		let next space be a random room which is adjacent to the current space;
		repeat through the Table of Overseer's Movement:
			if next space is the destination entry:
				if Overseer can be seen by the player, say "The Overseer heads to [the next space].";
				move Overseer to the next space;
				now OverseerMove is true;
				break;
			otherwise:
				if OverseerRepeat is false:
					if Overseer can be seen by the player, say "You see the Overseer looking around impatiently, almost wanting to find something wrong with the place.";
					now OverseerRepeat is true;
		if Overseer can be seen by the player:
			if the player is in Cotton Engines:
				if OverseerMove is true, say "Overseer arrives from [the current space] and glares at you.";
			otherwise:
				if OverseerMove is true:
					say "The Overseer arrives from [the current space] and stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
You hurry back to the cotton engines.";
					move the player to Cotton Engines, without printing a room description;
					now the player is in Cotton Engines;
					say "Well that was rude. Guess I should avoid him next time.";
				otherwise:
					say "The Overseer stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
You hurry back to the cottno engines";
					move the player to Cotton Engines, without printing a room description;
					now the player is in Cotton Engines;
					say "Well that was rude. Guess I should avoid him next time.";
	now OverseerMove is false;
	now OverseerRepeat is false;

Before doing something to Overseer:
	now Overseer is passive;
	say "The Overseer glares at you. 'What are you looking at. Get back to work'.";

Every turn when Overseer is passive:
	now Overseer is active.

	[Jackie]
Jackie is a woman in Intake Desk. “You see Jackie, the company secretary, staring at the wall in silence as she sits at her reception desk. She glances at you quickly, taking on a suspicious expression, but then looks back, as if she has better things to do. Suddenly, she notices that you’re looking at the book on her desk. It’s hard to see what the title is, but instinctively, she grabs it and shoves it into the nearest drawer, locking it with a key.”
Every turn:
	if the player is in Intake Desk:
		say "Jackie, flustered, says 'What are you doing here!?' I have some strong words for that Overseer of yours.' and blows a small whistle.";
		move the Overseer to Intake Desk;
		say "The Overseer stalks into the room, clearly angry that he heard the whistle."

[NOTE TO SELF, REPEAT THIS ONCE]

	[Robin]
Robin is a woman in Spindle Room. “You see Robin, who is (like usual) gossiping with her neighbor. She’s trying to be discrete, but it’s hard not to hear her when she has to speak over the roar of the machines to be heard by anyone. You can’t make our every word, but maybe if you listen more carefully, you’ll get to hear something interesting…”

[------------------------------------------------------------------------Things-----------------------------------------------------------------------]
													[----------Sound----------]
													
A thing has some text called sound. The sound of a thing is usually "silence". 

The report listening rule is not listed in the report listening to rules. 

Carry out listening to something: 
	say "From [the noun] you hear [the sound of the noun]." 

Instead of listening to a room: 
	if an audible thing can be touched by the player, say "You hear [the list of audible things which can be touched by the player]."; 
	otherwise say "Nothing of note.";

Definition: a thing is audible if the sound of it is not "silence". 

Before printing the name of something audible while listening to a room: 
	say "[sound] from the ";
													[---------------------------]
													
The newspaper, paper is a thing. The newspaper, paper is carried by the Boy. 

instead of examining a thing:
	if the noun is newspaper or the noun is paper:
		if the Boy is carrying the newspaper:
			say "The boy pulls the newspaper out of your face, saying 'Oi, you can't look before ya buy!'";
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
		continue the action;
	if the noun is Winston:
		say "You come up to him and he gives you the lunch bag.";
		now the player has the lunch bag;
		continue the action;
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
				