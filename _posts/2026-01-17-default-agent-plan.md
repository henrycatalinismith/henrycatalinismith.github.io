---
title: '"default_agent": "plan"'
tags: [blog, devtools]
layout: layout-post
---

Pushed my first
[AI tool config](https://github.com/henrycatalinismith/dotfiles/commit/2bb8235bd47a6f8642e3cab6aef8478b6c28f88e)
to my dotfiles repo this week. It was config for OpenCode, and it looks like
this.

```json
{
  "$schema": "https://opencode.ai/config.json",
  "default_agent": "plan"
}
```

All it does is make it start in plan mode instead of build mode. Doesn't sound
much, but it's transformed my relationship with the bloody thing.

I grew to really
[dislike those real-time typeahead code suggestions](/2025/03/14/survival-mode/).
That emphasis on adding new code embeds a junior approach into the very workflow
itself. Reckon they were an obvious net downgrade to my skills in hindsight, and
I regret the time wasted using them.

One of my fav games is NetHack, and it has this concept of items being blessed
or cursed. Blessed weapons do more damage. Cursed ones malfunction and can't be
taken off. You pick up a weapon you found on the floor, and the game says "the
weapon welds itself to your hand", and that's when you realise you're boned.

> - Anything that can be worn or wielded is reluctant to be taken off or put
>   aside if it's cursed.
> - Potions and scrolls generally work worse if they are cursed.
> - Wands have a chance of exploding when you zap them while they are cursed.
>
> [https://nethackwiki.com/wiki/BUC#Cursed_items](https://nethackwiki.com/wiki/BUC#Cursed_items)

Those real-time AI code suggestions are a cursed NetHack item. They feel welded
to your cursor, so you're stuck with them, and you're worse off for it. I know
you _can_ toggle them on and off, but I never did, and I don't think I've ever
seen anyone else do it either.

OpenCode defaulting into plan mode is the opposite. It feels more like an actual
tool. Like you pick it up when you need it, and then you put it down when you're
finished.

Been doing some C# at work lately. Not done much of that before, so it's been a
learning process. One major barrier has been just not knowing the new vocabulary
for things. I've found that by cloning a bunch of our C# repos locally, I can
fire up OpenCode in plan mode and ask like "I have {problem}, look at {list of
repos} and tell me how they're approaching it", and a minute later I'm in
business.

Or I can ask it "Look at my unstaged changes and see if I've missed anything
obvious, or another approach that might achieve the same outcome in a better
way". I particularly love that one cos shovelling out a bunch of pull requests
has never been the slow part of the process for me, whereas making things
_mergeable_ sooner is moving the needle in a way that actually matters to me. I
know you can "assign to Copilot" on a PR too but I'm not convinced the noise it
generates is a net win for the review process.

So much of the hype about this tech focuses on code generation, yet so little of
the everyday value I'm finding in it is in that part of the process. No wonder
it's been such a headfuck coming to terms with all these changes to the
industry. It's been over 12 months since
[the last time I wrote something positive about AI](/2024/11/12/using-ai-to-help-humans-translate-swedish-labour-laws/).

There's been a big round of new hype lately around things like the
[Linus Antigravity commit](https://github.com/torvalds/AudioNoise/commit/93a72563cba609a414297b558cb46ddd3ce9d6b5)
and the [Don't fall into the anti-AI hype](https://antirez.com/news/158) post.
For the record, I think Antirez's take that it's "irrelevant, in the long run"
if the stock market crashes reminds me of the
[Everything's Fine sketch by Mitchell & Webb](https://www.youtube.com/watch?v=smoBjnTeSp4).
And I find his hand-wavy idea of voting away the social repercussions less
plausible than
[Rosa Luxemburg's take on the problem](/2025/10/20/rosa-luxemburg-predicted-the-ai-crash-in-1913/).

But I am glad about my little bit of dotfiles repo JSON giving me a sense of
control over some tiny aspect of all this.
