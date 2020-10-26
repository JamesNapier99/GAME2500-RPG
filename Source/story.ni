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

The player is in the Tenement.
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
		if the time of day is before 6 PM and the time of day is after 5:44 AM:
			say "You approach him, but he suddenly starts coughing hysterically, and gestures at you to move away. Maybe this isn't the best time to be talking to him, anyway.";
		otherwise:
			say "You go up to him and nudge him awake, but he pulls his covers tighter over himself in response.";
		continue the action;
	if the noun is Winston:
		say "Winston seems more perturbed than usual - but rightfully so. Everyone's been a bit anxious since... 'it' happened. 
		
		'Seems like the boss is gone today,' he observes. 'Must be in some serious legal trouble right now.'
		
		You listen silently, wondering if this whole situation could end up putting you all out of work.
		
		'Now everyone's just wondering who ordered Jones' wife to go to the basement in the first place.... Perhaps the ladies in the Spindle Room would know something like that; they do seem to know just about everything.'";
		now the player has the lunch bag;
		continue the action;
	else if the noun is Overseer:
		say "The Overseer isn't the conversational type.";
	otherwise:
		say "Who?";
		continue the action;
	
Instead of sleeping:
	if the player is in the Tenement and the time of day is before 5 AM or the time of day is after 6 PM:
		say "You rest your eyes, and before you know it, it's already morning again. It's time for yet another shift.";
		now the time of day is 5:45 AM;
		now the current weekday is the weekday after the current weekday;
	else if the player is in the Tenement:
		say "You rest your eyes, but you can't get yourself to go to sleep. Maybe try again later.";
	otherwise:
		say "This isn't an appropriate place to be sleeping.".
[-----------------------------------------------------------------------Actions-----------------------------------------------------------------------]

purchasing is an action applying to one thing.
understand "buy [thing]" as purchasing.
understand "purchase [thing]" as purchasing.
understand "get [thing]" as purchasing.

instead of purchasing a thing:
	if the noun is newspaper or the noun is paper:
		if the boy is carrying the newspaper:
			now the player is carrying the newspaper;
			say "Well, there goes a quarter. This better be good.";
			say "a newspaper has been added to your inventory.";
		otherwise:
			say "You already bought it...";
	otherwise:
		say "You can't buy this."
		

working is an action applying to nothing.
understand "work" as working.

instead of working:
	if the player is in the Cotton Engines and the time of day is after 6 AM and the time of day is before 6 PM:
		say "You toil at the cotton mill for your entire shift. It's hard work, but at least it gets you... some money?";
		now the time of day is 6 PM;
	otherwise:
		if the time of day is after 6 PM or the time of day is before 6 AM:
			say "There's no need to work at this time of day!";
		otherwise:
			say "You can't work here; your workspace is in the Cotton Engines."
	

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
	say "The sun falls below the horizon and the temperature drops. [If the player is not in a factory room]Best not be out for too long."; 
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
		now the current weekday is the weekday after the current weekday;
	move Boy to Alley.

Day is a recurring scene. Day begins when Dawn ends. Day ends when (the time of day is 6:00 PM or the time of day is after 6:00 PM). 

When Day begins: 
	say "The sun is now properly up.";
	move the Overseer to Cotton Engines;
	if Overseer can be seen by the player, say "The Overseer walks in to his shift, clearly grumpy that today even exists.
He looks at you, confused, and says, 'You're here awful early for a slacker....'";
	move Jackie to Intake Desk;
	if Jackie can be seen by the player, say "Jackie tromps into the Intake Desk, clearly still drowsy.";
	move Robin to Spindle Room;
	if Robin can be seen by the player, say "Jackie skips into work, clearly about to overflow with new gossip";
	move Winston to Cotton Engines;
	if Winston can be seen by the player, say "Winston trudges into work, begrudingly prepared for today's shift".
	

Dusk is a recurring scene. Dusk begins when Day ends. Dusk ends when (the time of day is 7:00 PM or the time of day is after 7:00 PM). 

When Dusk begins:
	say "The sun has taken its journey through the sky and is on the verge of setting.";
	increase insanity by 20;
	if Jackie can be seen by the player, say "Jackie packs up her things for the day, clearly wary of your prying eyes, and makes her way out of the main entrance.";
	move Jackie to NPC Room;
	if Robin can be seen by the player, say "Robin gives you a wave, then packs up her things and heads out of the factory for the day.";
	move Robin to NPC Room;
	if Winston can be seen by the player, say "Winston gives you a grim smile, and says 'See ya tomorrow, ya sod,' as he heads out towards the Locker Rooms.";
	move Winston to NPC Room;
	if Boy can be seen by the player, say "The boy gives you a strange look, and then goes home for the night.";
	move Boy to NPC Room;
	if the player is in a Factory Room:
		say "
It's dusk. You pack up your things and make your way through the Worker's Entrance towards home. Whatever happens at night in the Factory, you're not sure if you want to be there to see it. 
Hit SPACE to continue.";
		wait for the SPACE key;
		move the player to the Tenement;
		

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
		say "Your legs buckle and you collapse to the floor: a puppet with its strings. severed. 
		
			You wonder why. 
			
			And then it happens.
			
			The pillars of your mind forget their form and cease to be. Thoughts from beyond take you in like a swelling dark tide - enveloping you, swallowing you...You let out a pleaful gasp - your last consciousness act - as the fateful currents seize you from reason's shores and carry you off into a sea of unspeakable turmoil. 
			
			You are no more.
			
			All that's left is Madness.";
		stop game abruptly;
	otherwise:
		continue the action.
[-----------------------------------------------------------------------Rooms-----------------------------------------------------------------------]

The NPC room is a room.
[----------------------------------------]

A Factory Room is a kind of room. 
	[Tenement F0]


The Tenement is a room. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM] 
You wake up to a sear of cold dripping on your head.

It's just water. 

Nothing unusual; the neighbors above have had a dilapidated floor for months now. It's amazing that it hasn't given in entirely.

The unforgiving drops continue to pound mericlessly against your head - drilling into you the miserly state of your surroundings. Swerving from the next oncoming drip, you adjust yourself, and observe the other tenants in your room. 

Like shadows, being just as thin and sulken, they all curl, and clutch to themselves as if to hold on to the meager remains of their life-force to their cagey bodies. Clothes are a laugh at this point, looking more like throwaway rags than anything else. Looking at them adds no hope to your already meager pile. 

The dim rays of treacherous sunlight begin to blaze through the musty room, announcing the break of dawn. Work awaits.
[otherwise]
You're back home. Your bed is right there, and you feel a strong urge to sleep, but at the same time you can't stop thinking about the factory.
".


[NOTE TO SELF]	[Make sure some of this is only repeated in the mornings or one time]
	
	[Alley F0]
The Alley is east of The Tenement. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
You stumble from the darkness of the tenement into the gloomy alley. It's eerily quiet as this time of day, but in a few minutes you know the crowds will come pouring out from every household you can see. Perhaps you should move quickly to avoid the rush.
[otherwise]
You walk stealthily through the alley, hoping that nobody will detect you and think you're a thief. (Who else is going to be walking here at this time of night?) It's strangely peaceful, with the full moon directly overhead. ".

	[Front Gate F0]

The Front Gate is east of The Alley. "[If the time of day is before 6 PM and the time of day is after 5:44 AM]
After about 15 minutes of walking through a waking town, you have arrived at the factory front gate. Snakes of smoke pour from the high chimneys and hide the sun behind a screen of noxious white. The world lies in a dreamish haze.
You see all the other factory laborers slowly filing in, and sigh at the thought of having to start your 11 hour shift.
[otherwise]
It's a rare sight to see the factory completely free of noxious smoke. You almost start feeling pleasant, but then you hear the echo of a loud crash. It seems like it came inside the factory. Suddenly, your mind races, as infinite fears - rational and irrational - cross your mind. Is the Overseer still here? Is someone getting killed? Are the machines acting up? You wonder if it's safe to be here at this hour.".


[NOTE TO SELF]	[MAKE SURE THIS IS TIME SENSITIVE]

	[Main Entrance F0]


The Main Entrance is a Factory Room. The Main Entrance is south of Front Gate. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
The hulking doors invite to swallow you in. You are hit by a gush of humid sweltry breeze - no, more than a breeze - it's the air you'll have to breathe now. 'There won’t be much to eat tonight,' You think sardonically.
This isn't your entrance; this is for the factory elites - the owner, the overseer, and their friends. It's a privilege to use the main entrance. Wage workers like you have to go the long way through the worker's entrance.
[otherwise]
The Main Factory Door is wide open. You're surprised at first, but you recall that the Overseer has been forgetful about these kinds of things. You assume that he just forgot to close it.".

	[Intake Desk F0]

The Intake Desk is a Factory Room. The Intake Desk is south of Main Entrance. "Crafted from luxurious black wood, the intake desks stand in stark contrast from the rest of the factory. No one ever mans it, but it still makes you feel watched. "

	[Spindle Room F0]
	
The Spindle Room is south of Intake Desk. "You sneak into the Spindle Room. Machines stretch the length and width of the factory creating a grid like labyrith of rust and steel..It's hard to see an end to the rows of contraptions. [If the time of day is after 6 PM or the time of day is before 5:44 AM]The room is silent."

The Spindle Room Gossip is scenery in Spindle Room. The sound of Spindle Room Gossip is "[If the time of day is before 6 PM and the time of day is after 5:44 AM]
conversation between Robin and her partner:
'...Who even ordered her down there in the first place? It doesn't make sense! There's no reason management would care to have her outside of the Spindle Room!'
Her partner's response: 'Rumor has it that Jackie wanted her down there. Only God knows why, though...' You're fascinated, but you should always take it with a grain of salt when it comes[otherwise]silence".

	[Loading Dock F0]
	
The Loading Dock is east of Cotton Engines. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
You feel a light gust of outdoor air. Still, you feel just as caged in as you would in the Cotton Engines; the air is still full of chimney smoke, and the sounds are just as grating as ever.
It’s hard to see anything ahead of you with so many stacks of boxes in the way. You see Randy - a balding, overweight man - organize them in some way you can’t understand, and then walk behind the boxes again, out of sight.
[otherwise]
You feel a light gust of outdoor air. ".

	[Boiler Room F0]
The Boiler Room is a Factory Room. Boiler Room is south of Central Stairs."The heat is nearly unbearable. Steam dance in and out from a mosaic of pipes without warning, sometimes bathing you in burning condensation."

	[Worker's Entrance F0]
The Worker's Entrance is a Factory Room. The Worker's Entrance is west of Main Entrance. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
The grim workers shuffle around the Mecca of the puncher. It bites savagely into the slim slivers of paper slipped into the cracked rusted box. You join the slow-moving hoard and punch in your strip of paper. Click.
[otherwise]
You feel an uncomfortably cold gust of wind cross your body as you approach the Worker's Entrance.".

	[Locker Rooms F0]
The Locker Rooms is a Factory Room. The Locker Rooms is south of Worker's Entrance and west of Cotton Engines."
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
The first thing you notice as you walk into the locker rooms is the disgusting body odor radiating from every locker. You’re unsure how to describe the sensation of the smell hitting your body: perhaps it slammed into your body? Either way, you’re blinded momentarily by the horrid stench. After a few seconds that feel like an eternity, you regain your senses. You see the walls lined with tall metal lockers. A couple of benches are there on the ground for you to sit on while changing.
[otherwise]
The smell of the locker room is only slightly less horrendous at night - but the added darkness makes that smell all your mind can process. You see the walls lined with tall metal lockers. A couple of benches are there on the ground for you to sit on."

The Locker Rooms contains the metal lockers. The metal lockers is scenery.

The Locker Rooms contains a broken locker. In the broken locker is the Mysterious Key. The broken locker is closed and openable. The broken locker is scenery.

The Mysterious key is an object. "This strangely designed key seems to warp and shift it's non-euclidean geometry. It brings on a headache if looked at too closely.".

	[Cotton Engines F0]
The Cotton Engines is a Factory Room. The Cotton Engines is south of the Spindle Room. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
As you work, the violent, periodic smashing of machinery forces itself into your head. You try to ignore it and focus on your cotton gin work, but every time you look at the machine, you can't help but picture what happened to Jones' wife. You shudder at the thought, and turn away from it in disgust for a bit, but then you think of the Overseer. The Overseer wouldn't like to see you distracted from your work.
[otherwise]
It's so dark inside the Cotton Engines that you almost stab yourself on the harsher end of a machine. At this point, you start to hear a strange periodic whirring, but it's hard to tell where it is, or what it could be coming from.".

after going to the Cotton Engines:
	if the time of day is after 6 PM or the time of day is before 5:45 AM:
		increase insanity by 1;
		continue the action;
	otherwise:
		continue the action.

[5 hours later, the machine whirring stops for lunch break. You only have 10 minutes.
You see your friend Winston in the other corner of the room. Being the (slightly) more well-off of you two, he has lunch for both of you."]
[NOTE TO SELF]	[TIME LUNCH AND SHIT, DONT REPEAT IT EVERY TIME]

	[Central Stairs B1-F1]
The Central Stairs is a Factory Room. The Central Stairs is south of Cotton Engines.  "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
You arrive at the stairwell. It’s dimly lit and handrail-free, with grated metal stairs that seem like they could barely support one person. You can't make out much above or below you, but you do hear the violent whirring of cotton gin machines coming from directly below your feet.
[otherwise]
You remember where you are just in time to avoid losing your sense of direction and falling down the staircase. That whirring you heard in the Cotton Engines is intensifying. Getting louder. More violent. More painful. It's starting to grind on your senses. Where is it?".

after going to the Central Stairs:
	if the time of day is after 6 PM or the time of day is before 5:45 AM:
		increase insanity by 2;
		continue the action;
	otherwise:
		continue the action.

	[----------F1--------]
	
		[Finishing Room]
		
The Finishing Room is a Factory Room. The Finishing Room is above Central Stairs. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
The most peaceful section of the building, the finishing room is a safe haven away from the rotten sounds and smells that pervade the rest of the factory. Large, plentiful windows let the sunlight in.
You see three women whispering to each other as they knit cotton clothes. None of them look like they want to be bothered.
[otherwise]
The moonlight breaks through the window of the Finishing Room, letting you just barely see your surroundings. Doesn't seem to be anything of note."
	
The Finishing Room Gossip is scenery in Finishing Room. The sound of Finishing Room Gossip is "[If the time of day is before 6 PM and the time of day is after 5:44 AM]
whispering. They're discussing the fact that the basement has been closed off ever since the 'incident.' One of them says that the boss must have locked the basement away to avoid the police finding evidence of anything. Another replied that this couldn't be the case, as the basement key is in plain sight in the locker room. So is the wisdom
[otherwise]
silence".
	
	[----------B1----------]

	[Basement Stairs]
The Basement Stairs is below Central Stairs. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
Before you is a set of dusty, old, wooden stairs. The center of each stair has lost much of its color from use over the last however-many years. You look to the right and notice that the bare wooden framework of the cotton gin is visible. A single light bulb hangs from the ceiling to produce light.
On the bottom of the stairs is a heavy metal door, presumably leading to the rest of the basement. It looks as if there is a lock above the door knob. You think you would be able to open the door silently, but you’re not entirely sure.
[otherwise]
You guide yourself carefully down each individual step, as the whirring gets louder. Louder. Louder. You can hardly take it. You're internally screaming at yourself to run, to go higher and seek shelter from whatever's uttering this sound. But you continue anyway, torturing yourself, not knowing why.
On the bottom of the stairs is a heavy metal door, presumably leading to the rest of the basement. It looks as if there is a lock above the door knob.".

after going to the Basement Stairs:
	if the time of day is after 6 PM or the time of day is before 5:45 AM:
		increase insanity by 3;
		continue the action;
	otherwise:
		continue the action.
		[Basement Door]
	The Basement Door is a locked closed door. The Basement Door is west of Basement Stairs and east of Main Basement. The matching key of the Basement Door is the Mysterious Key.
	
instead of unlocking the Basement Door with the Mysterious Key:
	If the time of day is before 6 PM and the time of day is after 5:44 AM:
		say "You can hear your co-workers coming closer to the basement stairs. You can’t get caught doing something like this, so you put the key back in your pocket and rush upstairs.";
		move the player to the central stairs;
		stop the action;
	otherwise:
		continue the action.
			
		[Main Basement]
	Main Basement is a room. "As soon as you enter, you notice that the air is not as stale as you would expect for a room that allegedly people had not been inside of for a long time. You can’t see very well, as the light is not on."
		[Hidden Basement Room]
	Hidden Basement Room is a room.
	
[-----------------------------------------------------------------------People-----------------------------------------------------------------------]
	[Jones]
Jones is a man in the Tenement. "
[If the time of day is before 6 PM and the time of day is after 5:44 AM]
Jones is the only other tenant that appears to be awake. It's only reasonable - how could he sleep? Nobody - not if they went through what he did.
You feel the urge to approach him, but you're not sure if it's the right thing to do right now.
[otherwise]
You look at Jones to see if he's been doing any better, but there he is, already asleep."

	[Newspaper Boy]
The Boy is a man in the Alley. "You pass a boy, yelling about the latest issue of the Boston Globe. He holds up the paper to your face and says 'You want it, pal? Just 25 cents...' 
Your daily wage is about 50 cents. Is it really worth it?"

	[Winston]
Winston is a man in the Cotton Engines. Winston is carrying a lunch bag. "Your best friend, Winston, is working right next to you. He seems willing to talk."
		
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
				say "Right then and there, the Overseer stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
					You scurry back to the cotton engines.";
				move the player to Cotton Engines, without printing a room description;
				now the player is in Cotton Engines;
				say "(Well, that was rude. Guess I should avoid him next time.)";
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
					say "(Well, that was rude. Guess I should avoid him next time.)";
				otherwise:
					say "Right then and there, the Overseer stomps over to you, yelling 'What are you doing here! Get back to work, or I'll dock your pay for the rest of the month!'
You hurry back to the cotton engines";
					move the player to Cotton Engines, without printing a room description;
					now the player is in Cotton Engines;
					say "(Well, that was rude. Guess I should avoid him next time.)";
	now OverseerMove is false;
	now OverseerRepeat is false;
	
Before doing something to Overseer:
	now Overseer is passive;
	say "The Overseer glares at you. 'What are you looking at? Get back to work'.";
	
Every turn when Overseer is passive:
	now Overseer is active.
	
	[Jackie]
Jackie is a woman in Intake Desk. “You see Jackie, the company secretary, staring at the wall in silence as she sits at her reception desk. She glances at you quickly, taking on a suspicious expression, but then looks back, as if she has better things to do. Suddenly, she notices that you’re looking at the book on her desk. It’s hard to see what the title is, but instinctively, she grabs it and shoves it into the nearest drawer, locking it with a key.”

Every turn:
	if the player is in Intake Desk:
		if Jackie is in Intake Desk:
			say "Jackie, flustered, says 'What are you doing here!?' I have some strong words for that Overseer of yours.' and blows a small whistle.";
			move the Overseer to Intake Desk;
			say "The Overseer stalks into the room, clearly angry that he heard the whistle."
			
[NOTE TO SELF, REPEAT THIS ONCE]

	[Robin]
Robin is a woman in Spindle Room. “You see Robin among all the other spindle workers. She's gossiping with her neighbor (like usual). She’s trying to be discrete, but it’s hard not to hear her when she has to speak over the roar of the machines to be heard by anyone. You can’t make out every word, but maybe if you listen more carefully, you’ll get to hear something interesting…”
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
													
The newspaper, paper is a thing. The newspaper, paper is carried by the Boy.  The description of the newspaper is "[If the Boy is carrying the newspaper]The boy pulls the newspaper out of your face, saying 'Oi, you can't look before ya buy![else]The paper is dated October 4, 1872. Seems to be a high end newspaper, because you can't understand many of the words. There is, however, one section that catches your eye.
			
'Cotton Gin Accident leaves Factory Worker Dead'
			
The paper then explained what had happened to Jones' wife. She got too close to the machine, the paper said, and before she knew it, it sucked her in and tore her apart. Only some of her remains were found.
			
You knew about this event well; it had happened in your own factory. But you hadn't seen the event take place, so it was interesting to see the details somewhere - especially when the company itself has been completely silent.
			
You doubt that it'll break the silence any time soon, either.".

A bench is a kind of supporter. A bench is fixed in place. A bench is always enterable. In the Locker Rooms is three benches. 

After examining the mysterious key:
	increase Insanity by 5;

The reception desk is a thing in the Intake Desk. The description is "
[If the player is not carrying the book]
Jackie's reception desk - particularly its drawer - piques your interest.
[otherwise]
Nothing much left to see here.". Part of the reception desk is a closed openable container called a drawer. The reception desk is fixed in place. In the drawer is a book.
 
instead of examining the metal lockers:
	now the description of the Locker Rooms is "
	[If the time of day is before 6 PM and the time of day is after 5:44 AM]
	The first thing you notice as you walk into the locker rooms is the disgusting body odor radiating from every locker. You’re unsure how to describe the sensation of the smell hitting your body: perhaps it slammed into your body? Either way, you’re blinded momentarily by the horrid stench. After a few seconds that feel like an eternity, you regain your senses. You see the walls lined with tall metal lockers. A couple of benches are there on the ground for you to sit on while changing.

	A broken locker stands hidden in the corner, its lock damaged so badly that it no longer functions. You might be able to open this.
	[otherwise]
	The smell of the locker room is only slightly less horrendous at night - but the added darkness makes that smell all your mind can process. You see the walls lined with tall metal lockers. A couple of benches are there on the ground for you to sit on.

	A broken locker stands hidden in the corner, its lock damaged so badly that it no longer functions. You might be able to open this.";
	say "You try and peer through the small slits on the closed locker doors, but ultimately the stench is too much from each locker to investigate them thoroughly.
		
	Then, you examine the lockers that have been left open. Unfortunately, none of them are for anyone important. You take a peek through all of the doors and nothing of interest seems to be inside…

	That is, until you get to a lone broken locker on the back right of the room. From afar, it looks as though it was locked, but as you get closer you see that the lock has actually been broken and can now be opened.".
	
instead of examining the broken locker:
		say "The locker's lock is so badly broken that it no longer functions. You might be able to open this.";

[
	if the noun is drawer:
		say "Jackie put a book in here.";
	if the noun is book:
		say "The book is called 'The True Gospel'.".
]

instead of opening a broken locker:
	if the time of day is before 6 PM and the time of day is after 5:45 AM:
		say "I shouldn’t look at this in broad daylight - people are watching - but I should come back later.";
	otherwise:
		now the broken locker is open;
		say "You open the broken locker. [If the mysterious key is in the broken locker]Lying on the bottom is a Mysterious Key.[otherwise]It is empty.";