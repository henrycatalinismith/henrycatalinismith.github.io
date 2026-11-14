---
title: Onshoring My DNS
tags: [blog]
layout: layout-post
---

I was arsehole deep in American domain name services, I recently noticed.
Between Verisign, Tucows and Cloudflare I had rigged my digital identity to blow
in the event of any number of increasingly plausible crisis scenarios. I chose
to own this mistake and begin the work of fixing it.


First, I decided to stop trusting Verisign. For starters, the deregulatory
agenda of the new regime in Washington enables them to
[increase the price of .com domains](https://domainnamewire.com/2024/11/06/trump-win-likely-seals-fate-of-com-prices/).
I weighed this alongside the Obama-era precedent of ordering Verisign to
[seize .com domains](https://archive.is/8qNdX) and decided it adds up to too
much long term risk.

How much might .com domains cost by 2030? What are the odds of an
"America-first" price hike targeting foreign registrants? How many plot twists
away from politically-motivated domain seizures are we really? I don't know, and
that's the point. I came to the conclusion that I prefer the known up-front cost
of a migration over the unknown open-ended cost of the growing uncertainty.

I looked into the governance model of
[Internetstiftelsen](https://internetstiftelsen.se/), who operate the .se
top-level domain, and I liked what I saw. They're a public service organisation
who make important contributions to the Swedish technology sector and whose
[annual reports](https://internetstiftelsen.se/app/uploads/2024/04/arsredovisning-2023-internetstiftelsen.pdf)
are available to read online. I'd like them a lot more if they could find a way
to [make things right with the people of Nieue](https://archive.is/ca0Y6) but
otherwise I'm happy.

Then I checked out [Loopia](https://www.loopia.se/). They’re practically
synonymous with the web business in Sweden so it was the obvious first port of
call. They’ve been bought & sold a lot but still seem to be
[running their servers in Sweden](https://support.loopia.se/wiki/var-star-era-servrar/)
and [the conglomerate they’re currently owned](https://team.blue/) by is
European.

Loopia’s DNS admin UI belongs in a museum but it gets the job done. I was able
to replace everything I was using Tucows and Cloudflare for with Loopia. Thanks
to their focus on Sweden their 2FA is just BankID too. Much prefer that over
some authenticator app from one of the big US tech firms.

The downside of switching TLDs was having to do an email address migration.
These are the absolute worst. It's hours of logging into every account one by
one and trying to find the “update email” feature. There are a few categories of
these.

1. There’s a web form to update your email address. It sends a confirmation link
   to the old email address and the update only finalises when you click it.
2. The web form immediately updates your email address with no confirmation
   step.
3. There is no web form. You have to email support and complete an identity
   check for them to update your address on your behalf.
4. There is no web form. When you email support they update the email address on
   your account immediately with no identity check.

Most services are in category one. Far too many are in category four. The slow
process of finding out which category you’re dealing with as you log into each
account one by one gets old fast. Makes your hands hurt after a while too.

Feels good once it's finished though. The simple satisfaction of honest hard
work. And one less loose end to tie down before the storm.
