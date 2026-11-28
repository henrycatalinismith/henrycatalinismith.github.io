---
title: "Sentry Appreciation Post"
tags: [blog, devtools]
layout: layout-post
---

It struck me recently that Sentry has been one of my fav dev tools for like a decade. The more I thought about it, the more I appreciated how impressive that is.

Companies vary a lot in terms of what tools they pay for. One employer might have Slack, then the next job will be on Google Chat, followed by a gig a Microsoft Teams place. Everyone but _everyone_ has Sentry though. Across five different jobs over the last ten years it's always been there. Everyone from little cash-strapped startups to big evil corporations buys Sentry.

That longevity is impressive  in itself too. Tools I thought I'd use forever, like Vim and Codepen, have fallen by the wayside in that time, but Sentry remains.

I don't know what's special about Sentry from a business perspective to keep it so popular. I know ***exactly*** what ***I*** love about it though: it's the magic window to the outside world! Coding is a bullshit-heavy line of work where direct contact with the cleansing sunshine of reality is at a premium. Our organisations optimise our time around producing, so we have precious little contact with users, sales leads, customers, investors, or what have you. There's an alienation to having a spanner for company in the depths of the submarine for so much of your working life. You can become lost, and _weird_. For those who prefer a firm grip on reality, Sentry offers a way to cut through the noise and ground ourselves in the sight of the smoke billowing from usually several hundred mysterious real-world problems.

There's a quiet excitement to the experience of exploring a Sentry issue for the first time. Each one is a new mystery to solve. Is it brand new, maybe connected to a recent release? Or is it a months-old problem that's slipped under the radar? Is it browser-specific? Oh fuck, could there be a race condition in this code? Hang on, this looks like the error I thought we fixed last week, what's going on here? I reckon I learn something new more often than not from these little investigations.

Half the time an issue turns out not to be a bug at all, and that's part of the fun too. Errors from old unsupported browsers sometimes just need adding to `ignoreErrors`. Weird headless browser scrapers can generate noise that's best tuning out as well. It's all good honest work.

And that kind of cleanup feels really meaningful and worthwhile, even when it's not leading to bugfixes, precisely because it's in service of maintaining that magic window to the outside world. Silencing a meaningless error that's been pointlessly consuming 20% of your total event volume feels great because you know it's strengthening that connection to reality. We might never know whether the next feature on the roadmap is a real artefact of the product strategy or just a byproduct of the politics of the board of directors, but we ***will*** know how broken the site is, and there is dignity in that.

Even against the backdrop of so much ongoing change to the everyday work of coding, Sentry's relevance doesn't seem under threat. Evan Garris wrote an interesting essay called  [The Picturing Relation](https://www.evangarris.com/writing/the-picturing-relation.html) earlier this year, and in places it reminds me a little bit of my relationship with Sentry.

> Engineering work is also answerable to a mind-independent reality. Production systems exist whether they are described accurately or not. Users have actual needs whether they are modeled correctly or not. The infrastructure runs on physics. Claims about what the system does, what the user wants, what the failure mode is, are either true to the system or not.

I think about this essay often. Now I wonder if part of why I'm suddenly motivated to write a Sentry appreciation post is that the proportion of the picturing work that happens in Sentry has grown in proportion to the growth of agentic coding. There's a sadly inescapable trade-off in letting agents write code for you, and grips on reality are loosening industry-wide. Chatting merrily with our spanners Castaway-style alone in the bowels of the submarine, some of us are positively losing it. Like, how else do you explain the creator of Rails doing a keynote at Rails World about using agents to migrate _away from Rails_ and then being surprised at the frosty reception?

That's not to say I won't use agents when exploring Sentry either. The other day one helped me to diagnose an entire issue as headless browser noise by spotting `&sr=800x600` somewhere in the Google Analytics request params in the breadcrumbs of every event and mapping it effortlessly to [Puppeteer's default viewport size](https://github.com/puppeteer/puppeteer/blob/0805b622a4ede4202d6f7567ebeb7a4f193ac466/packages/puppeteer-core/src/common/util.ts#L37). I'd never have spotted that in a million years and it was very cool to witness. It's an example that falls under this part of Evan's essay.

> An AI used to amplify reasoning that participants are doing themselves, surfacing alternatives that participants then evaluate against the system, accelerating routine work, supports cultivation. It leaves the picturing work to participants who are capable of being formed by it. An AI used to substitute for reasoning, producing outputs accepted on the basis of fluency, is corrosive. It removes the picturing work from those who would otherwise be doing it 

Sentry's role as a tool for understanding reality biases agent usage away from the corrosive use-cases. You _could_  tell Claude "Fix one of our top Sentry issues" and YOLO merge the resulting PR and its slop grenade of a description. But that would strike most people as a weird thing to do, because with Sentry the exploring and learning and understanding is half the point, and automating that part away all but guarantees the team will repeat the same mistakes over and over.

So hurray for Sentry, a little oasis of honest knowledge work in a weird era of increased alienation. I hope I'm still using it in more or less the same way as I do today ten years from now.
