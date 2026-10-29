---
title: Integrating the moon into your terminal
image: /2026/04/06/phoon@2866x1692.webp
tags: [blog, devtools]
layout: layout-post
---

As I write this, a spaceship full of astronauts is flying around the moon for
the first time in my life. They don't even have a working toilet right now
either so they're all gasping for a piss while they do it. It's all very
exciting.

Moon shit is some of the best kind of science IMO. I'm into basically anything
moon-related. A while back I decided even on my computer I'm more interested in
the moon than any of  the stereotypial nerd telemetry like CPU graphs and
whatever. I reckon it's a healthy grounding thing to rig your computer to
remind you of the passage of time and your tiny place in the universe instead of
focusing your attention on a bunch of meaningless blinkenlights about an
environment under your full control.

So whenever I open a new terminal, I get this little ASCII art thing
that shows me the current phase of the moon.

<figure>
 <img
  src="/2026/04/06/phoon@2866x1692.webp"
  alt="Terminal screenshot showing an ASCII art representation of the moon in multiple colours"
 >
</figure>

Since the moon is cool as fuck right now, let's see if we can hype some more
people up into making their terminals do this. First up, you need `phoon` and
`lolcat`. 

```bash
brew install phoon lolcat
```

The first one – phoon – prints the ASCII art moon phase. The second one –
lolcat – applies some rainbow colourisation to it. All you have to do to get
that cool rainbow moon as the splash screen for every new terminal you open
for the rest of your life is to pipe phoon into lolcat.


```bash
phoon | lolcat
```

You can chuck that into `~/.zshrc` or `~/.bashrc` and you're good to go. I've
been using [fish](https://fishshell.com/) lately, where this sort of thing
belongs in [`fish_greeting`](https://fishshell.com/docs/current/cmds/fish_greeting.html).

```fish
function fish_greeting
  phoon | lolcat
end
```

Highly recommended! While watching tonight's livestream of the Artemis fly-by, I
noticed that the shadow in the top left of the moon was different from the top
right shadow in the Earth perspective, despite the moon not being visible from
my window in Malmö tonight.

<figure>
 <img
  src="/2026/04/06/phases@1172x562.webp"
  alt="Composite image. Left hand side shows a moon with the top right hand side blacked out by shadow. Right hand side shows a moon with the top left blacked out by shadow. The right-hand moon is markedly flatter."
 >
 <figcaption>Earth perspective on the left, Artemis II perspective on the right</figcaption>
</figure>

This sense of perspective really enhanced the coolness of the livestream. And I
wouldn't have picked up on this if it hadn't been for the fact that my computer
reminds me of what's going on with the moon basically every time I use it.
