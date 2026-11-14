---
title: Simplifying and tidying my labour market documentation projects with Opus 5.5
layout: layout-post
---

When I first built out [arbetsmiljo.github.io](https://arbetsmiljo.github.io/)
and [lagstiftning.github.io](https://lagstiftning.github.io) by hand I
overengineered the living fuck out of them. Too many little repositories
requiring way too much manual labour to propagate updates. It was killing my
inspiration to continue maintaining them, and being able to fix those mistakes
by describing them to Opus 5.5 may have saved these projects.

For the arbetsmiljö project, I have this web scraper that ingests
Arbetsmiljöverket’s diarium into a SQLite database. I was worried that this
database would be too big to store on the likes of GitHub so I decided to shard
it into a repository per year. Then I added an “autoindex” Next.js project
which could build a year’s worth of data visualization for each repo. Then for
the lagstiftning project, it was more like I already had this micro-repository
workflow in place, so why not just apply it here too? And so I had a repo per
law, and another “auto index”.

The end result of all this was that propagating an update to one of the base
components required pushing like 20 or 30 different commits. It was genuinely
very silly what I’d done here and this meaningless busywork was a headwind that
killed my motivation to improve these projects. I knew it was unnecessarily
clunky and that one repo per site would’ve been plenty but couldn’t be arsed
with the huge mountain of boring manual text editing and file moving that would
be required to get me there.

So tonight I said this to Opus 5.5.

> currently arbetsmiljo.github.io is built by this repo and also
> ../arbetsmiljo-autoindex which builds the yearly sqlite files in e.g.
> ../arbetsmiljo-2021 etc. i would like to do away with
> ../arbetsmiljo-autoindex so that all the datavis happens in here. i would
> like to the url structure there but render it here like app/[year]/page.tsx
> and so on

I checked in with the work once in a while to provide answers and decisions,
and two hours later the restructure was complete across both projects. It
probably required about 15 minutes of my time in total, most of which was the
time it took to manually delete the obsolete GitHub repos. Both of these
projects are now simpler, easier to maintain, and consume less resources than
they did before.

This change to the economics of these kinds of important but arduous cleanup
jobs is one of my fav things about the “new era”. I’m trying to make a
conscious effort to formulate and express some of these thoughts as part of the
process of moving on from the grief of losing the “old era”, and this one is
important to me. One of the seductive ideas that the grief has employed to
hold me back is that the new tools are only useful for speeding ahead at the
cost of making a gigantic mess. It’s not true and this is my example I’m going
to use to help myself remember that

