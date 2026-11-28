---
title: Darkstar is Solarized without the contrast bugs
tags: [blog]
layout: layout-post
---

Over the past year or so I've finally gotten around to fixing the contrast
problems in the [Solarized](https://ethanschoonover.com/solarized/) colour
palette. Darkstar is what I've been calling my private fork with the fixes.

For early 2010s Vim users, Solarized was a minor cultural phenomenon. Ethan's
site with his description of the thought process behind it is an
underappreciated bit of marketing work. That tagline "Precision colors for
machines and people" is brilliant. This was _looooong_ before you could push a
button to churn out a slick landing page full of generic cokehead yank salesman
lingo and it went down very well indeed. Solarized was everywhere.

It's funny how certain things can get locked in to your psyche just because you
happened to pick them up early in life. I was using Solarized in the most
formative and prolific years of my career, and as a result, it's a visual "home"
for me at some deep psychological level.

Only trouble is, it often doesn't work well with real world software. There's
nowhere near enough colours or contrast in the palette, and you end up losing
all kinds of information as a result. Most problematic of all are all the
colours that are almost identical to the background colour. The design intent of
the palette is that those should not be used as foreground colours. Many do
though. When Mocha was the trendy JavaScript unit testing framework, this was
what the output looked like in Solarized.

<img
  alt="Mocha test output in a terminal using Solarized. Under a heading of 'Cart', three green checkmarks are followed by blank space where the test names should be, then a red line reading '1) applies discount codes'. The summary reads '3 passing', '1 failing', and a red error 'TypeError: Cannot read properties of undefined (reading 'percent')' with nothing visible underneath it where the stack trace should be."
  src="/2026/11/22/mocha-solarized@816x422.svg"
  width="816"
  height="422"
/>

The text after the checkmarks has been themed using a colour that Solarized
considers a background colour. As a result, it's invisible. For years I would
work around this by selecting blocks of text in the terminal to reveal them
with the selection highlight background, like a kid doing one of those
lemon juice & candle hidden message craft projects.

Ultimately this is a design flaw in Solarized.
The world of terminal programs is chaotic and to create a theme for it you have
to engage with that chaos. You can't unilaterally imagine away the reality that
authors of terminal software expect all available palette colours to be
available for usage as foreground colours.

Solarized ships with two colours whose WCAG contrast ratios are an outright
`FAIL` rating against the background colour. Several of the foreground colours
are only rated `AA Large` too, which means they're technically below the WCAG
thresholds at the smaller font sizes 99% of people use in practice.

<img
  alt="Grid of the 15 Solarized colours on its dark teal background, each labelled with its contrast rating against that background. The two darkest greys are rated Fail and are barely distinguishable from the background. Red, orange, magenta, violet, blue and the next grey are rated AA Large. Yellow, green, cyan and two lighter greys are rated AA, and only the two cream colours reach AAA."
  src="/2026/11/22/solarized@800x800.svg"
  width="800"
  height="800"
/>

It also doesn't ship anything for the "bright" colour variants that terminals
expect. Instead it fills many of those "bright" gaps with various greys. Since many
authors of terminal software expect those colours to be available for use, this
ends up breaking tons of programs. In NetHack, it leads to certain types of
monster looking almost identical to each other. In the scene below, the player is in a room
with three hill orcs and one orc shaman. The bright blue orc shaman should be
very distinctive from the bright yellow hill orcs, but instead all four are just
grey.

<img
  alt="NetHack screen using Solarized, showing a cave level. The player's white @ stands in a corridor with four grey-blue letter o's clustered just to the left, all practically the same shade. The message line at the top reads 'The orc shaman casts a spell!'"
  src="/2026/11/22/nethack-solarized@792x360.svg"
  width="792"
  height="360"
/>

Darkstar addresses these problems first by massively darkening the background
colour. This measure alone is enough to avoid the invisible text problem. Every
colour has at least an `AA` rating against the background. It then also defines
proper bright variants for each colour so that they're possible to tell apart
from one another. This fixes all the issues caused by information encoded using
colour. It's a dramatic change, but I've found in practice my expectations easily
adjust to the new darker background, while the familiarity of the foreground
colours preserves the sense of "home" in the overall palette. It looks almost
black in a small sample image in the middle of a screen of different colours,
but in real usage when it fills most of the screen it looks a lot more blue.

<img
  alt="Grid of the 18 Darkstar colours on its near-black background, each labelled with its contrast rating against that background. Colours are arranged in pairs, each regular colour next to its brighter variant: grey, cream, red, orange, yellow, green, cyan, blue and magenta. Every regular colour is rated AA and every bright variant is rated AAA. None are rated Fail or AA Large."
  src="/2026/11/22/darkstar@800x800.svg"
  width="800"
  height="800"
/>

Here's the exact same Mocha output as the example earlier, with the new colours
applied. No more selection highlight decoder ring workflow here.

<img
  alt="The same Mocha test output using Darkstar, with everything readable. Under 'Cart', three green checkmarks are followed by grey test names: 'adds items to the basket', 'removes items from the basket' and 'calculates the subtotal'. The summary reads '3 passing (14ms)' and '1 failing', and the red TypeError is followed by a grey stack trace pointing at src/cart.js line 18 and test/cart.test.js line 24."
  src="/2026/11/22/mocha-darkstar@816x422.svg"
  width="816"
  height="422"
/>

And finally here's that same NetHack scene from before. Turns out the orc shaman
was the one right next to us! Good to know!

<img
  alt="The same NetHack scene using Darkstar. Of the four letter o's clustered near the player's @, three are bright yellow and one, closest to the player, is bright blue, making the orc shaman easy to pick out."
  src="/2026/11/22/nethack-darkstar@792x360.svg"
  width="792"
  height="360"
/>

The name's a Slackware reference. If you don't set a hostname during
installation of Slackware, it sets it to `darkstar` for you. Installing
Slackware 10.0 from a Linux Format CD was a turning point in my life and
I have even more nostalgia for that experience of first discovering Linux than
for the early 2010s Vim usage.

For now Darkstar is just for my own personal use in [my
dotfiles](https://github.com/henrycatalinismith/dotfiles/). You're very welcome
to borrow or steal ideas from it for yourself, and if one or two people [email
me asking for a proper set of installable themes for different
stuff](mailto:henry@catalinismith.se?subject=Please%20package%20Darkstar%20as%20an%20installable%20theme%20for%20loads%20of%20different%20things%20so%20I%20can%20give%20it%20a%20try!)
I will definitely do that.

Here's a couple of screenshots of it in action. 

<a href="/2026/11/22/lazygit@1200x846.webp">
<img
  alt="Lazygit in a terminal using Darkstar. On the left are panels for status, files, local branches, commits and stash. On the right is a git log with a branch graph drawn in red and blue lines, yellow commit hashes and a bold teal HEAD label, and below it a command log in teal and yellow text with a pink 'Deleting path' line. A row of blue keyboard shortcuts runs along the bottom."
  src="/2026/11/22/lazygit@1200x846.webp"
  width="1200"
  height="846"
/>
</a>

<a href="/2026/11/22/helix@1200x840.webp">
<img
  alt="The Helix editor using Darkstar, showing a TypeScript React component. Keywords are coral, type names blue, imported names yellow, strings green, and null and undefined pink. A JSDoc comment is in grey italics with a pink @example tag, and line 26 is highlighted as the cursor line."
  src="/2026/11/22/helix@1200x840.webp"
  width="1200"
  height="840"
/>
</a>

---

Edit:
https://henry.catalinismith.se/darkstar/
