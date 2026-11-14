---
title: My SQLite in production epiphany
tags: [blog, databases, devtools, webdev]
layout: layout-post
---

My work environment email alerts service – [666a](https://666a.se/) – is a Rails
app using SQLite for its production database. I'm super happy with this stack,
but it wasn't an obvious choice from the start, and I know a lot of folks still
haven't heard the growing hype about using SQLite in production in the Rails
community. Here's how I ended up shipping a production app with a SQLite
database, and how it helped me rediscover some joy in full-stack work.


## Back on Rails

I built the very first prototype version of 666a in Rails. Nothing beats Active
Record when you need to iterate really quick on a concept for a database schema.
It ran on our old MacBook Air where our Plex server lives. Then, in late August,
I got sidetracked by the idea that for the "real" version I needed to redo it in
a more "modern" web stack like Next.js.

What a waste of a month this turned out to be. You have to jump through so many
hoops for this new edge computing paradigm, but none of the benefits are
applicable to an app like 666a with relatively stable load whose users are
concentrated in one geographic location. Plus, the core things 666a actually
_needs_ – mundane stuff like an ORM or a nice mature localisation framework –
are all third party plugins in Next.js. Afterthoughts.

I churned through so many libraries and platforms trying to make this mismatch
work. The ones I can remember include [Kysely](https://kysely.dev/),
[Prisma](https://www.prisma.io/), [Planetscale](https://planetscale.com/),
[Vercel Postgres](https://vercel.com/docs/storage/vercel-postgres), and
[Inngest](https://www.inngest.com/). It seemed like no matter what I picked, it
was going to get expensive fast, and yet at the same time nothing's fully
working right yet because the whole edge functions thing is still so bleeding
edge.

By the end of September I was fed up. I deleted my Next.js app and ran
`rails new` with some considerable relief.

## But… SQLite? In production?

As I was making that decision to jump back to Rails, I was aware of a growing
wave of hype about using SQLite in production. I eagerly followed Stephen
Margheim's series of
[SQLite-related blog posts](https://fractaledmind.github.io/tags/sqlite/),
[AppSignal's series on LiteStack](https://blog.appsignal.com/2023/09/27/an-introduction-to-litestack-for-ruby-on-rails.html),
as well as
[anything Fly.io published about it](https://fly.io/ruby-dispatch/sqlite-and-rails-in-production/).

This used to be unthinkable. In fact it's only in the past month that the Rails
core team
[removed the warning message about running SQLite in production](https://github.com/rails/rails/pull/50463).
I reckon it's a combination of factors: it's enabled by technological advances,
and driven by a reduced focus on exponential growth due to high interest rates.

Whatever the underlying reason for the mindset shift, it doesn't seem to be news
to the folks behind SQLite itself. The quote below has been on their site
[since at least 2005](https://web.archive.org/web/20050204022544/https://www.sqlite.org/whentouse.html).

> SQLite works great as the database engine for most low to medium traffic
> websites (which is to say, most websites). Generally speaking, any site that
> gets fewer than a 100,000 hits/day should work fine with SQLite.

666a is right in the centre of the sweet spot for a SQLite in production
use-case. It's a service targeting a niche interest group in a tiny country of
10 million people. I reckon the entire Swedish labour movement could sign up
before I'd even need to starting googling for performance tips.

## The experience so far

It's rare for me to find this much joy in the back-end & infrastructure side of
a project. Normally it's the front-end work that gives me these feelings, but
there's something truly special about this tech stack. And the fact that it's
cheaper – 666a currently fits within the Fly.io free tier – is only part of it.

The sensation of being able to ship an entire full-stack app as a single Docker
image and not even have a `docker-compose.yml` at all is difficult to describe.
There's something weirdly cosy about it. It also feels like it shouldn't even be
possible, and brings back nostalgic memories of the 2000s-era trend for PHP
features to use a "flat file" for storage instead of a database.

Four months in, there have been no downsides to speak of. It's literally just…
fantastic. My database is around 350MB, doing something on the order of 1000ish
writes and (_really_ guessing now) 10,000ish reads per day. It's got indexes,
I'm doing joins and group by statements and all that normal stuff, and I'm never
being confronted with unexpected barriers resulting from the choice of SQLite.

In fact I'm even using
[ULID primary keys](https://fractaledmind.github.io/2023/09/22/enhancing-rails-sqlite-ulid-primary-keys/)
cos I didn't want the infosec headaches of autoincrementing integers (any labour
movement-related software always deserves a bit of paranoia) or the awkward
ergonomics of regular UUIDs. Setting that up was a piece of piss too.

The contrast I find the most striking in all this is that in Next.js I was just
setting up a normal app the normal way, yet somehow still it felt like swimming
against the tide, whereas with Rails, even configuring a quirky primary key
format on a non-standard database was easy and actually kind of fun.

When you consider the fact that I have zero professional Rails experience, and
that I've spent the better part of a decade working mostly with React, it does
seem a bit weird. I mean I even really _like_ React for fuck's sake. Seems silly
that it's somehow not the easiest way for me to ship a simple app like this one.

My gut feeling is that it's partly an incentives thing. Vercel's in the PaaS
business, so obviously the product strategy for Next.js is wrapped up in that
and it makes sense to prioritise promoting the serverless paradigm they've bet
their entire company on over e.g. integrating a production-ready i18n solution.
By contrast, nothing about 37signals' SaaS business incentivises Rails to double
as the top of a freemium conversion funnel.

Nothing showcases that difference in incentives better than production SQLite.
We use Next.js at my current job, where it's a great fit, and I think I kinda
get it: this new serverless stuff is way more worth the trouble when you're
hoping to scale up as fast and as big as possible. For more modest projects with
smaller troubleshooting time budgets, maybe it’s natural that a tool built by
and for the VC ecosystem doesn't fit so great. It feels great that this
production SQLite adventure has helped me understand all this a bit better, and
after a decade of React I'm stoked about the prospect of having a new go-to
stack with more batteries included.
