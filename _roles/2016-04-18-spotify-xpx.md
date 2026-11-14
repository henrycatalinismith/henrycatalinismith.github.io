---
tags: [role]
title: Software Engineer @ Spotify
subtitle: Apr 2016 — Oct 2018
role:
  company_name: Spotify
  job_title: Software Engineer
  start: 2016-04-18
  end: 2018-10-26
  prev_role:
    link_text: Software Engineer @ MixRadio
    link_href: /cv/mixradio
  next_role:
    link_text: Front End Architect @ Natural Cycles
    link_href: /cv/natural-cycles
  topics: podcasts, React, Sass, and Node
  tech: [HTML, CSS, JavaScript, React, Sass]
  practices: ["A/B testing", "design sprints", "mob programming"]
permalink: /cv/spotify-xpx/index.html
layout: layout-role
sitemap: false
description: >
  Full-stack role building and maintaining the Spotify desktop app and web
  player. I immigrated to Sweden for this role, and it was also my first taste
  of the politics of larger organisations. Learning how to contribute in this
  new environment was a major focus here.
---



## Podcasts

Spotify's entry into podcasting was something I was excited to support. The
first ever podcast episode page on the web player was added by me personally as
a "hack day" project. I also did a lot of UI work relating to video episodes on
the desktop app, and later helped to ship the library UI for saved podcasts on
desktop.

## React

My time at Spotify coincided with the infamous iframe-based micro frontends
architecture. This architecture was no longer popular internally when my tenure
began and there was a growing consensus around migrating to React.

I invested some of the only voluntary overtime of my career in overcoming the
institutional inertia around this transition, rewriting small parts of the
desktop app in React one at a time in order to help progress the conversation
from "if" to "how". Later I was part of the team who rebuilt the Spotify embed
widget in React.

## Sass

Less was the CSS preprocessor of choice at Spotify for the same reason as at
many other companies: it was a legacy decision dating back to Bootstrap's
heyday. For a JavaScript-centric front end engineer this was still fine in the
late 2010s, but felt limiting and antiquated to a more CSS-centric engineer.

A colleague and I identified this as an opportunity to share some CSS love in
the team (and maybe build some confidence for the React transition). We took it
upon ourselves to migrate the desktop app – and later the web player too – from
Less to Sass. It took a hefty combination of tech & people skills from us both
to land a change this big without requiring a top-down edict to pave the way.

## Node

The use of PHP to power open.spotify.com had become an obstacle to innovation by
the time I joined that team. Consensus around Node as the ideal replacement was
very strong, but progress was blocked by a combination of inertia and internal
architectural rules.

A group formed to look at this issue during a Hack Week, and a small but
important contribution I made to that initiative was convincing the group to
prioritise adding Node to the site's Docker image and shipping it to production
rather than writing an RFC about it. I believe shipping something small broke
down more psychological barriers than anything we could have said in an RFC.
Later, in the final months of my time in this role, I spent any slack time I
could find rewriting our trickiest PHP in Node to facilitate the Node transition
beyond my departure date.
