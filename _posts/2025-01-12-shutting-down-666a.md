---
title: Shutting down 666a
tags: [666a, blog]
layout: layout-post
---

Since [October 31st 2023](/2023/10/31/announcing-666a/) I've been providing a
work environment email service called [666a](https://666a.se/). On March 31st
2025 it's shutting down. Today I'm beginning the process of winding it down
gently, and I wanted to post something explaining that process and why it's
happening.


## Immediate Changes

The following are effective right now. They've already happened, in fact.

1. The SendGrid account is downgraded to the free tier.
1. Sign ups are disabled on [666a.se](https://666a.se/).
1. The translated Swedish legislation has been migrated to
   [lagstiftning.github.io](https://lagstiftning.github.io/). This part
   I'm particularly pleased with. I actually think it will be easier to maintain
   this resource in the long term in this new form.

With these changes in place, what's left on 666a.se is the code for delivering
the email alerting service. Existing users are welcome to update their contact
details or even [request a full account deletion](https://666a.se/delete) if
they wish to.

## February 1st 2025

At the start of Feburary, the SendGrid downgrade will kick in. This probably
won't have any major effect on the reliability of the service as we're in the
relatively quiet early months of the year. But if there's a busy day in February
or March, some email alerts are going to fail to send.

## March 31st 2025

The idea is to keep the alerts running until the end of March so that you get
pretty much an entire quarter of the year of notice before they stop coming.
I've seen paid services close down and disappear faster than this and it feels
sufficient. March 31st is the final day, and here's how it's going to go down.

1. Delete the
   [rolling database backups I keep on my home server's external USB](https://github.com/henrycatalinismith/666a.se/blob/main/bin/backup.sh).
2. Run
   [`shutdown:anonymize`](https://github.com/henrycatalinismith/666a.se/blob/main/lib/tasks/shutdown.rake)
   on my only remaining copy of the data to clean out the personally
   identifiable information from it and make it privately archivable for myself.
3. Scale down the Fly cluster to 0 instances and delete the storage volume. At
   this point the service will become unrecoverable.
4. Point the domain name at a static host containing a short explanatory notice
   and 301 redirects for all the translated Swedish legislation URLs.

After that I'll probably leave the domain up to serve the redirects for a year
or two. I think people mostly share links to employment law with each other for
very situational reasons so the harm of breaking those links two or three years
later is going to be close to zero. Nice that the content's new home is a free
subdomain which will hopefully outlast the maximum lifespan of a domain name
funded by an individual person.

## Why It's Happening

It costs money to run a service like this, and money's a little tighter here
this year. I've been looking through my recurring monthly expenses for things to
cut and 666a sticks out because at around 300kr per month it's one of the larger
ones.

It also takes time to run a service like this, and I'm feeling a little poorer
on that front this year too. In June last year
[it randomly broke due to an update to the HTML on av.se](/2024/06/06/about-arbetsmiljoverkets-new-webdiarium/).
Who knows what they'll ship this year that might break it again, or how long
it'll take to fix next time, or what I might already be busy doing when it
happens.

Been a lot of fun building and operating this, even though Arbetsmiljöverket
should definitely just be delivering it themselves directly on
[av.se](https://www.av.se/). I've ended up effectively having my own personal
copy of their diarium database as a result of running this for the past year or
so and there's probably some interesting and/or entertaining stuff in that
dataset which I'll hopefully have time to dig out over the next couple of
months. It'd be cool to mark the final shutdown date with a bit of that.
