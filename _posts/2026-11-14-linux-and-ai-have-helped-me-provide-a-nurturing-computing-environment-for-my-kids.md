---
title: Linux and AI have helped me provide a nurturing computing environment for my kids
layout: layout-post
---

When I was a kid, computing meant stuff like Encarta 98, MSPaint, random programs that on demo discs that came with computer magazines, and writing little stories and poems and songs and satirical school newspapers. It was creative and exploratory, and not addictive in the way it’s become today, and I’ve longed to give my kids access to that world. Ubuntu was the key to this, and agents were the magic missing ingredient to really make it sing.

We had an old iMac become available for duty as a kids’ computer recently, and I tried macOS first, but the parental controls on an old Intel Mac are a joke so I tried Ubuntu next. And holy shit, Ubuntu’s fucking _perfect_ for a kids’ computer. It’s a minute’s work to turn off the browser and install Tuxmath, an offline copy of Wikipedia, GNOME Chess, Tux Paint, Celestia, GNOME Maps, and all kinds of interesting stuff like that.

Tuxmath is bloody amazing. It’s like Space Invaders, except you have to solve little maths problems to aim the gun. Overnight we had the kids practicing arithmetic for fun. A bonafide miracle. A day later I noticed one problem: no sound. Typical Linux problem! I fired up OpenCode and wrote this.

> log in to ssh henry@imac.local and help me figure out why my
> ubuntu imac isnt playing any sound. my kid is playing tux math 
> rn and no sound is coming

It did some investigation and eventually narrowed it down to a missing driver. It identified [`snd_hda_macbookpro`](https://github.com/davidjo/snd_hda_macbookpro) as a likely solution and gave me a shell script to run on the iMac to install it. One reboot later sound was working, and practicing arithmetic had magically become even more fun than the miracle of the day before.

One more day went by, and we discovered Tuxmath’s “Factoroids” mini game. And in Factoroids, instead of doing mental arithmetic, you can have a shitload of fun just flying the spaceship around and blowing up the asteroids. The learning stopped immediately, and we were back in addictive screen time territory. So I Googled (like an absolute boomer) and learned that Tuxmath’s main menu has an XML config file, and then asked Opus this.

> my kids love tuxmath on the imac at henry@imac.local but they
> have become fixated on the stupid factoroids game and i dont
> wnat them to play that. the idea of the imac is to be a
> computer with only good educatiaonal options on it and i want
> to remove factoroids. can you log into it via ssh and look for
> some kind of `tuxmath/menus/main_menu.xml`

A few moments later all that was left to do was to remind the kids what we’d agreed the computer was for, explain why Factoroids was about to disappear, and restart Tuxmath so that the updated snap could start with the new menu.

Either of these two investigations would have taken me multiple entire evenings if I’d done them the old fashioned way with a combination of Googling and trial and error. In practice this means neither of them would have actually happened. Thanks to the availability of these new agentic tools, I’ve been able to give my kids a best-of-both-worlds computing environment combining the [creative limitations](https://en.wikipedia.org/wiki/Creative_limitation) of an offline environment with the upsides of the internet.

The idea of agents as mostly tools for greedy self-enrichment and rampantly addictive consumption is one of the forms my grief about the loss of the pre-AI era of computing has taken. This anecdote is my own personal case study in how the new tools can also be used to go in the exact opposite direction of all that and polish a relatively modest, nurturing, and creative thing that’s deliberately possible to get bored of.

