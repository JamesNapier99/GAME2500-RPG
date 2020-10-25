"GAME2500 RPG" by James Napier

[Entry Text: Intro to the game, reminder for commands, etc]
When play begins:
	Say "Welcome to our Interactive Text-based RPG! We hope you enjoy your experience! When playing our game, make sure you have a look at the possible actions that
		can be taken!".

Understand "look [direction]" as facing.

Facing is an action applying to one visible thing.

Carry out facing:
	let the viewed item be the room noun from the location;
	if the viewed item is not a room, say "You can't see anything promising that way." instead;
	try looking toward the viewed item.
	
Instead of facing up:
	say "Above you is bright sky."

Understand "look toward [any adjacent room]" as looking toward. Understand "examine [any adjacent room]" as looking toward.

Looking toward is an action applying to one visible thing.

Carry out looking toward:
	say "You make out [the noun] that way."

[-----------------------------------------------------------------------Extensions-----------------------------------------------------------------------]

Include Basic Screen Effects by Emily Short.


Table of Fancy Status
left	central	right 
"--Day--"	"Time of Day"	"Insanity" 
"[current weekday]"	"[time of day as 24h time]"	"[Insanity]/100"

Rule for constructing the status line:
	 fill status bar with Table of Fancy Status;
	 rule succeeds.

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
			say "Well, there goes your quarter. This better be good.";
			say "a newspaper has been added to your inventory.";
		otherwise:
			say "You already bought it...";
	otherwise:
		say "You can't buy this."


[-----------------------------------------------------------------------Time-----------------------------------------------------------------------]

To say (relevant time - a time) as 24h time: 
	let H be the hours part of relevant time; 
	let M be the minutes part of relevant time; 
	say "[if H is less than 10]0[end if][H][if M is less than 10]0[end if][M]". 

When play begins: 
	now the time of day is 5:45 AM; 
		
[-----------------------------------------------------------------------Time of Day-----------------------------------------------------------------------]

The sun is a backdrop. It is everywhere. The description is "Currently out of sight." 


Night is a recurring scene. [Night begins when play begins. ]Night begins when Dusk ends. Night ends when ((the time of day is 5:00 AM or the time of day is after 5:00 AM) and the time of day is before 7:00 AM).

When Night begins: 
	say "The sun falls below the horizon and the temperature drops abruptly to well below zero."; 
	now the description of the sun is "Currently out of sight." 

Dawn is a recurring scene. Dawn begins when play begins. Dawn begins when Night ends. Dawn ends when (the time of day is 6:00 AM or the time of day is after 6:00 AM). 

When Dawn begins: 
	say "The sun appears on the horizon.";
	now the description of the sun is "It is tiny and weak.";
	if the StartState is true:
		now StartState is false;
	else if the current weekday is Friday:
		say "Your continued exposure to the machine has driven you insane.";
		stop game abruptly; [MORE DESCRIPTION!!!]
	otherwise:
		now the current weekday is the weekday after the current weekday.

Day is a recurring scene. Day begins when Dawn ends. Day ends when (the time of day is 6:00 PM or the time of day is after 6:00 PM). 

When Day begins: 
	say "The sun is now properly up." 

Dusk is a recurring scene. Dusk begins when Day ends. Dusk ends when (the time of day is 7:00 PM or the time of day is after 7:00 PM). 

When Dusk begins: 
	say "The sun has passed across the sky and is on the verge of setting.";
	increase insanity by 20.

[-----------------------------------------------------------------------Time of Day-----------------------------------------------------------------------]

A weekday is a kind of value. The weekdays are Monday, Tuesday, Wednesday, Thursday, Friday. The current weekday is a weekday that varies. The current weekday is Monday.

StartState is a truth state that varies. StartState is true.

[-----------------------------------------------------------------------Action Duration-----------------------------------------------------------------------]

Work duration is a number that varies. 

Every turn: 
	now work duration is 0; 
	increment the turn count; 
	follow the time allotment rules; 
	if work duration is 0, rule succeeds; 
	increase the time of day by (work duration minutes - 1 minute). 

The time allotment rules are a rulebook. 

A time allotment rule for examining or looking: 
	now work duration is 0; 
	rule succeeds. 

A time allotment rule for going: 
	now work duration is 15; 
	rule succeeds. 

A time allotment rule for going up: 
	now work duration is 15; 
	rule succeeds. 

A time allotment rule for waiting: 
	now work duration is 60; 
	rule succeeds. 
	
A time allotment rule for purchasing:
	now work duration is 3;
	rule succeeds.

A time allotment rule for talking:
	now work duration is 5;
	rule succeeds.

The last time allotment rule: 
	now work duration is 1. 

[-----------------------------------------------------------------------Insanity-----------------------------------------------------------------------]

Insanity is a number that varies. Insanity is 0.

Every turn:
	if (insanity) >= (100):
		say "You collapse to your knees, mind buckling under the strain of what you have learned. Embrace the Madness.";
		stop game abruptly;
	otherwise:
		continue the action;
[-----------------------------------------------------------------------Rooms-----------------------------------------------------------------------]

	[Tenement F0]

The Tenement is a room. "You wake up to the drip of some cold water on your head. It's nothing unusual; the neighbors above have had a dilapidated floor for months now. It's amazing that it hasn't given in entirely.
The unforgiving drops continue to pound mericlessly against your head - drilling in the miserly state of your surroundings. Swerving from the next oncoming drip, you adjust yourself, and observe other tenants in your room. Each of them are shells:  diminished beings curling, clutching themselves as if to hold on to the meager remains of their life-force in their cagey bodies. Clothes are a laugh at this point, looking more like throwaway rags than anything else. The dim rays of sunlight peek through the musty room, announcing the break of dawn. You force yourself out of bed. Work awaits."

[NOTE TO SELF]	[Make sure some of this is only repeated in the mornings or one time]
	
	[Alley F0]

The Alley is east of The Tenement. "You stumble from the darkness of the tenement into the gloomy alley. It's eerily quiet as this time of day, but in a few minutes you know the crowds will come pouring out from every household you can see. Perhaps you should move quickly to avoid the rush."

	[Front Gate F0]

The Front Gate is east of The Alley. "After about 15 minutes of walking, you finally show up at the factory front gate. Peeking through the clouds of smoke pouring from the chimneys, you can just barely tell that it's a sunny day.
You see all the other factory laborers slowly filing in, and sigh at the thought of having to start your 11 hour shift."

[NOTE TO SELF]	[MAKE SURE THIS IS TIME SENSITIVE]

	[Main Entrance F0]

The Main Entrance is south of Front Gate. "The hulking doors invite to swallow you in. You are hit by a gush of humid sweltry breeze - no, more than a breeze - it's the air you'll have to breathe now. 'There won’t be much to eat tonight,' You think sardonically. 

This isn't your entrance; this is for the factory elites - the owner, the overseer, and their friends. It's a privilege to use the main entrance. Wage workers like you have to go the long way through the worker's entrance."

	[Intake Desk F0]

The Intake Desk is south of Main Entrance

	[Spindle Room F0]
	
The Spindle Room is south of Intake Desk.

The Spindle Room Gossip is scenery in Spindle Room. The sound of Spindle Room Gossip is "Whisper whisper whisper".
	[Loading Dock F0]
	
The Loading Dock is east of Cotton Engines.
"You feel a light gust of outdoor air. Still, you feel just as caged in as you would in the Cotton Engines; the air is still full of chimney smoke, and the sounds are just as grating as ever.
It’s hard to see anything ahead of you with so many stacks of boxes in the way. You see Randy - a balding, overweight man - organizing them in some way you can’t understand."

	[Boiler Room F0]

The Boiler Room is south of Central Stairs.

	[Worker's Entrance F0]

The Worker's Entrance is west of Main Entrance. "As the workers file in, a young man yells at them to go faster. 'If any’un sees you messin’ around, you’ll be outuvva job!' You didn’t need any reminder of that."

	[Locker Rooms F0]
The Locker Rooms is south of Worker's Entrance and west of Cotton Engines.
"The first thing you notice as you walk into the locker rooms is the disgusting body odor radiating from every locker. You’re unsure how to describe the sensation of the smell hitting your body: perhaps it slammed into your body? Either way, you’re blinded momentarily by the horrid stench. After a few seconds that feel like an eternity, you regain your senses. You see the walls lined with tall metal lockers. A couple of benches are there on the ground for you to sit on while changing."

	[Cotton Engines F0]

The Cotton Engines is south of the Spindle Room. "As you work, the violent, periodic smashing of machinery forces itself into your head. You try to ignore it and focus on your cotton gin work, but every time you look at the machine, you can't help but picture what happened to Jones' wife. You shudder at the thought, and turn away from it in disgust for a bit, but then you think of the Overseer. The Overseer wouldn't like to see you distracted from your work."
[5 hours later, the machine whirring stops for lunch break. You only have 10 minutes.
You see your friend Winston in the other corner of the room. Being the (slightly) more well-off of you two, he has lunch for both of you."]

[NOTE TO SELF]	[TIME LUNCH AND SHIT, DONT REPEAT IT EVERY TIME]
	[Central Stairs B1-F1]

The Central Stairs is south of Cotton Engines. "You arrive at the stairwell. It’s dimly lit and handrail-free, with grated metal stairs that seem like they could barely support one person. You can't make out much above or below you, but you do hear the violent whirring of cotton gin machines coming from directly below your feet."

	[----------F1--------]
	
		[Finishing Room]
		
	The Finishing Room is above Central Stairs. "The most peaceful section of the building, the finishing room is a safe haven away from the rotten sounds and smells that pervade the rest of the factory. Large, plentiful windows let the sunlight in.
	
	You see three women silently knitting cotton clothes. None of them look like they want to be bothered."
	
	[----------B1----------]
	
		[Basement Stairs]
	The Basement Stairs is below Central Stairs. "Before you is a set of dusty, old, wooden stairs. The center of each stair has lost much of its color from use over the last however-many years. You look to the right and notice that the bare wooden framework of the cotton gin is visible. A single light bulb hangs from the ceiling to produce light.
On the bottom of the stairs is a heavy metal door, presumably leading to the rest of the basement. It looks as if there is a lock above the door knob. You think you would be able to open the door silently, but you’re not entirely sure."

		[Basement Door]
	The Basement Door is a locked closed door. The Basement Door is north of Basement Stairs and south of Main Basement.

		[Main Basement]
	The description of the Main Basement is "As soon as you enter, you notice that the air is not as stale as you would expect for a room that allegedly people had not been inside of for a long time. You can’t see very well, as the light is not on."

		[Hidden Basement Room]
	Hidden Basement Room is a room.
[-----------------------------------------------------------------------People-----------------------------------------------------------------------]

	[Jones]

Jones is a man in the Tenement. "Jones is the only other tenant that appears to be awake. It's only reasonable - how could he sleep? Nobody - not if they went through what he did.
You feel the urge to approach him, but you're not sure if it's the right thing to do right now."

	[Newspaper Boy]

The Boy is a man in the Alley. "You pass a boy, yelling about the latest issue of the Boston Globe. He holds up the paper to your face and says 'You want it, pal? Just 25 cents...' 
Your daily wage is about 50 cents. Is it really worth it?"

	[Winston]

Winston is a man in the Cotton Engines. Winston is carrying a lunch bag. "Your best friend, Winston, is working right next to you."
		
	[Overseer]
	[Forces player back to work]
Overseer is a man in the Cotton Engines. "You see the Overseer. The Overseer is heavy and muscular, with a large white beard and eyes you can barely make out, what with all the bags and wrinkles covering them up. He’s somehow intimidating, despite the fact that it seems like his body could fall apart any second."

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
			if the current space is not Cotton Engines:
				say "The Overseer stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
					You scurry back to the cotton engines.";
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
You hurry back to the cotton engines";
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

A bench is a kind of supporter. A bench is always enterable. In the Locker Rooms is three benches.

instead of examining a thing:
	if the noun is newspaper or the noun is paper:
		if the Boy is carrying the newspaper:
			say "The boy pulls the newspaper out of your face, saying 'Oi, you can't look before ya buy!'";
		otherwise:
			 say "The paper is dated October 4, 1872. Seems to be a high end newspaper, because you can't understand many of the words. There is, however, one section that catches your eye.
			
			'Cotton Gin Accident leaves Factory Worker Dead'
			
			The paper then explained what had happened to Jones' wife. She got too close to the machine, the paper said, and before she knew it, it sucked her in and tore her apart. Only some of her remains were found.
			
			You knew about this event well; it had happened in your own factory. But you hadn't seen the event take place, so it was interesting to see the details somewhere - especially when the company itself has been completely silent.
			
			You doubt that it'll break the silence any time soon, either.";