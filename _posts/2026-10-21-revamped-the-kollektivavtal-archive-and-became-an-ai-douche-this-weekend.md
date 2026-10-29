---
title: "Revamped the kollektivavtal archive and became an AI douche this weekend"
tags: [blog, devtools]
layout: layout-post
---

After well over a year of procrastination I finally shipped the next iteration of the [kollektivavtal archive](https://kollektivavtal.github.io/) this week. The new version introduces the ability to browse by union, so you can look at e.g. all the [agreements signed by Byggnads](https://fackforbund.github.io/byggnads/).

I’m very proud of it. If it succeeds at getting people to actually [leak agreements](https://kollektivavtal.github.io/bidra/) it’ll be solving a worthwhile problem with transparency. And I like to imagine that having it on GitHub might make the Swedish labour movement feel a little more “local” to one or two tech people in this country too.

The technical architecture for that site is a headache, to be honest. In order to run it as a static site and avoid having to rebuild the entire thing for each new PDF I find, it’s split up into lots of little repos. That works, but it makes rolling out big site-wide migrations a huge pain in the ass. It was nearly 200 commits total, across over a dozen repositories. No wonder I couldn’t be arsed for so long.

What actually unblocked it was the [move back from Codeberg to GitHub](/2026/10/17/the-kollektivavtal-archives-moved-back-to-github/), because that made it possible to throw agents at the problem. I vibecoded the absolute _fuck_ out of this thing. And don’t get me wrong, I’ve done plenty of that since the Opus 4.5 release last November. What was new about this time was that a: I did it  of my own free will outside of work and b: I enjoyed it.

Taken me almost a year to come to terms with the agents thing then. But I think I’m finally there. What a fuckin relief, frankly.

I’d definitely fallen into the refusal politics tarpit along the way; like being so focused on what you’re _against_ that it gets in the way of adapting to reality and advancing an agenda of your own. Which is bloody annoying! Because I’m normally _meticulous_ about avoiding specifically _that_. Like half the idea of the kollektivavtal campaign at Spotify back in the day was that proactively organising to influence working conditions and compensation beats passively moaning when they’re changed without your input. This is not supposed to be one of my weaknesses!

Funnily enough, something that helped the penny drop for me was all the people who are like _mega_ angry with Linus Torvalds for not banning AI code from the Linux kernel project. Winning a “being opinionated and angry about code” competition with Linus fucking Torvalds is definitely impressive, don’t get me wrong. Possibly not the best basis on which to build a mass movement against capitalism though, I dunno.

<figure>
 <img
  src="/2026/10/21/douche@1024x576.webp"
  alt="Father Ted meme, man standing behind wall, caption 'I hear youre an AI douche now father'"
 >
</figure>

So I’m a certified AI douche now! Always very exciting to change your mind about something. Mostly I’m just relieved to feel that growing sense of alienation subside a little bit. Quite fun to reevaluate some dead ends that might not be ends any more too.

Like I have this one PICO-8 game I’ve been developing on and off for over six years now. It’s a bit like the kollektivavtal site in that it has a complicated structure that’s both necessary and difficult to work with. It’s like 90% built, and I know exactly what the missing 10% is and how it will work, but have procrastinated on it since before my youngest kid was born. Maybe I’ll finish that off next.
