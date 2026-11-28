---
tags: [role]
title: Front End Architect @ Natural Cycles
subtitle: Nov 2018 — May 2021
role:
  company_name: Natural Cycles
  job_title: Front End Architect
  start: 2018-11-19
  end: 2021-05-15
  prev_role:
    link_text: Software Engineer @ Spotify
    link_href: /cv/spotify-xpx
  next_role:
    link_text: Senior Software Engineer @ Spotify
    link_href: /cv/spotify-soundtrap
  topics: headless Wordpress, A/B testing and Shopify
  tech: [HTML, CSS, JavaScript, React, Sass, Gatsby]
  practices: ["A/B testing"]
permalink: /cv/natural-cycles/index.html
layout: layout-role
sitemap: false
description: >
  Technical leadership role helping the Natural Cycles web team to unlock their
  potential. This was my first senior role, and I found I thrived with the
  ambiguity and openness that came with that.
---



## Headless Wordpress

Coming into this role, I learned that Wordpress had been identified as a front
end recruiting obstacle and so there was interest in replacing it. At first I
focused on addressing the pain points, and after a while it became clear there
were aspects of the Wordpress setup that were obstacles to things like
continuous deployment and A/B testing as well.

I devised an incremental migration to Gatsby using the
[Strangler Fig pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/strangler-fig)
to replace the Wordpress theme with React components one page at a time. This
migration took six months, and happened in parallel with regular development
work. The fact that it preserved the Wordpress CMS behind the scenes facilitated
onboarding Wordpress developers to the new approach to rendering. Once in place,
the new system enabled the team to adopt a continuous deployment process and
begin A/B testing.

## A/B Testing

Natural Cycles had a PR crisis in 2018 shortly before I joined. The impact this
had on the company created a commercial imperative to better understand the
impact of each individual change to the messaging, design and structure of the
website.

Immediately after the headless Wordpress migration was complete, I introduced
the capability to run A/B tests on the website using
[Netlify's split testing functionality](https://docs.netlify.com/site-deploys/split-testing/)
and Mixpanel events. For the remaining two years of my tenure after this, we
averaged two A/B tests per month. Growth recovered during this period and we
were happy to have played a part in that in the web team.

## Shopify

Natural Cycles sells things like thermometers and ovulation tests via a web
store, and when I joined this was still in its first iteration, on a seperate
subdomain with its visuals lagging behind the rest of the company's online
presence.

I proposed using Shopify's GraphQL API and their Buy SDK to integrate this
e-commerce offering into the main website. Within about a month, the new store
was live. Streamlining it into the main site like this meant it could benefit
from the web team's UX analytics and A/B testing toolset, would no longer lag
behind future branding iterations, and eliminated an entire alternative
repository and tech stack for the web team to maintain.
