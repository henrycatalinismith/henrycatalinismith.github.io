---
title: Is metadata streaming really SEO armageddon?
image: /2025/06/15/source@1369x252.webp
tags: [blog, devtools, webdev]
layout: layout-post
description: >
  I don't like some of these silly Rube Goldberg additions to Next.js either but
  I do think this one at least works as described.
---

This blog post called
[Next.js 15.1+ is unusable outside of Vercel](https://omarabid.com/nextjs-vercel)
has been doing the rounds this past week.

> Starting with version 15.1.8, Next.js might break metadata handling for
> non-Vercel deployments, potentially devastating your search rankings.

It's about
[metadata streaming](https://nextjs.org/docs/app/api-reference/functions/generate-metadata#streaming-metadata),
which is this new TTFB optimisation where Next can load in meta tags
asynchronously after the initial page load. The post presents this feature as an
SEO doomsday scenario. It has a tinge of
"[Hackers Can Turn Your Home Computer into a BOMB](https://dtrap-blog.acm.org/2019/09/04/hackers-can-turn-your-home-computer-into-a-bomb/)"
energy.

I'm not convinced. We've had this version of Next running in production at work
for months. We have asynchronous
[`generateMetadata`](https://nextjs.org/docs/app/api-reference/functions/generate-metadata)
functions all over the place. Not running on Vercel. No SEO doomsday has
materialised as of yet.

I spent a good while rereading the article and the linked GitHub issues and
couldn't find anything suggesting that metadata streaming behaves differently
depending on whether you host your app on Vercel or elsewhere either. The claim
that this new feature represents an escalation to a new level of vendor lock-in
seems to be based on vibes as far as I can tell.

There was also this part about static sites.

> Here's where it gets absurd. Even with static builds, metadata tags aren't
> included in the HTML head anymore. They're bundled with React Server
> Components and require JavaScript execution. Your static site server now needs
> crawler detection logic just to serve basic HTML metadata.

This claim seemed both unlikely and easy to check. So I created a
[quick test app](https://codeberg.org/henrycatalinismith/nextjs-static-metadata-demo/)
by running `create-next-app` and then
[configuring it to be a static build](https://codeberg.org/henrycatalinismith/nextjs-static-metadata-demo/commit/e42c24842c6ca2c0acb72e7378d6a423f9d6b927)
and
[adding an asynchronous metadata fetch](https://codeberg.org/henrycatalinismith/nextjs-static-metadata-demo/commit/6a9988d584a364a52a901472c587b393af0ad65f).
You can load
[the resulting webpage](https://henrycatalinismith.github.io/nextjs-static-metadata-demo/)
yourself and see the result in its source code.

![<title>Example Title</title><meta name="description" content="Example Description"/>](/2025/06/15/source@1369x252.webp)

Metadata tags are indeed still included in the HTML head in static Next sites.
The claim seems to simply be false.

There's plenty to dislike about React and Next. Even though I've been paying my
bills by writing JSX for the better part of a decade, Heydon Pickering's
[What Is React?](https://briefs.video/videos/what-is-react/) sums up my feelings
about the whole thing fairly well.

<iframe width="560" height="315" src="https://www.youtube.com/embed/BO71b3l22mM?si=JXdoVlTUwVmOGUbQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

This is the dominant web development tech stack of our time and it's flawed in
lots of really fundamental ways. There's so much that's problematic about it
that I don't think we need to stretch quite this hard in search of new
complaints. Metadata streaming itself seems to embody everything that's become
so silly about contemporary React, always growing ever more complex in order to
solve increasingly niche problems. But it does at least seem to work.
