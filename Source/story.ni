"GAME2500 RPG" by James Napier

[Entry Text: Intro to the game, reminder for commands, etc]
When play begins:
	Say "Welcome to our Interactive Text-based RPG! We hope you enjoy your experience! When playing our game, make sure you have a look at the possible actions that
		can be taken!";

[Rooms]

	[Tenement]

The Tenement is a room. "You wake up to the drip of some cold water on your head. It's nothing unusual; the neighbors above have had a dilapidated floor for months now. It's amazing that it hasn't given in entirely.

As you adjust yourself, you see all the other tenants in your room. Each of them are visibly malnourished, wearing clothes that look more like throwaway rags than anything else. The dim rays of sunlight coming into the room suggest that it's about 6 AM.

You force yourself out of bed, guessing that work must start in about 30 minutes."
	
	[Alley]

The Alley is east of The Tenement. "You stumble from the darkness of the tenement into the gloomy alley. It's eerily quiet as this time of day, but in a few minutes you know the crowds will come pouring out from every household you can see. Perhaps you should move quickly to avoid the rush."

	[Entrance]

The Entrance is east of The Alley. "After about 10 minutes of walking, you finally show up at the factory entrance. Peeking through the clouds of smoke pouring from the chimneys, you can just barely tell that it's a sunny day.

You see all the other factory workers slowly filing in. 

Will you walk into the factory? As soon as you walk into the factory, you'll be starting your 11-hour shift."

	[Factory]

The Factory is south of the Entrance. "As you work, the violent, periodic smashing of machinery forces itself in your head. You try to ignore it and focus on your cotton gin work, but every time you look at the thing, you can't help but picture what happened to Jones' wife. You shudder at the thought, and turn away from the machine for a bit, but there your boss is, staring in your soul with a furious glare. You turn back to the machine and keep working.

5 hours later, the machine whirring stops for lunch break. You only have 10 minutes.

You see your friend Winston in the other corner of the room. Being the (slightly) more well-off of you two, he has lunch for both of you."

[Supporters of Rooms]

	[Jones]

Jones is a person in the Tenement. "Jones is the only other tenant that appears to be awake. It's only reasonable - how could he sleep? Nobody - not if they went through what he did.

You feel the urge to approach him, but you're not sure if it's the right thing to do right now."

	[Boy]

The Boy is a person in the Alley. "You pass a newspaper boy, yelling about the latest issue of the Boston Globe. He holds up the paper to your face and says 'You want it, pal? Just 25 cents...' 

Your daily wage is about 50 cents. Is it really worth it?" The Boy is carrying a newspaper, or paper.

	[Winston]

Winston is a person in the factory. Winston is carrying a lunch bag. The Basement is a room below the factory.
		
[Talking Actions]
		
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
		stop the action;
	if the noun is Winston:
		say "You come up to him and he gives you the lunch bag.";
		now the player has the lunch bag;
		say "He says...";
	otherwise:
		say "Who?";
		
[Actions]

purchasing is an action applying to one thing.
understand "buy [thing]" as purchasing.
understand "purchase [thing]" as purchasing.
understand "get [thing]" as purchasing.

instead of purchasing a thing:
	if the noun is newspaper or the noun is paper:
		if the boy is carrying the newspaper:
			now the player is carrying the newspaper;
			say "Well, there goes your quarter. This better be good....
			
			The paper is dated October 4, 1872. Seems to be a high end newspaper, because you can't understand many of the words. There is, however, one section that catches your eye.
			
			'Cotton Gin accident leaves Factory Worker Dead'
			
			The paper then explained what had happened to Jones' wife. She got too close to the machine, the paper said, and before she knew it, it sucked her in, mechanically splitting her body into scattered parts and organs. Only some of her remains were found.
			
			You knew about this event well; it was in your own factory. But you hadn't seen the event take place, so it was interesting to see the details somewhere - especially when the company itself has been completely silent.
			
			You doubt that it'll break its silence any time soon, either.";
		otherwise:
			say "You already bought it...";
	otherwise:
		say "You can't buy this."
				
			

			


