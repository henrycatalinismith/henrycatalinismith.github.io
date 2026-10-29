---
tags: [role]
title: Senior Software Engineer @ Spotify
subtitle: Jun 2021 — Jul 2023
role:
  company_name: Spotify
  job_title: Senior Software Engineer
  start: 2021-06-31
  end: 2023-07-30
  prev_role:
    link_text: Front End Architect @ Natural Cycles
    link_href: /cv/natural-cycles
  next_role:
    link_text: Senior Software Engineer @ Yazen
    link_href: /cv/yazen
  topics: distributed systems, accessibility and technical leadership
  tech: [HTML, CSS, Dart]
  practices: ["Functional programming"]
  parallel_role:
    link_text: Founder & President @ Spotify Workers Unionen
    link_href: /cv/spotify-workers-unionen
permalink: /cv/spotify-soundtrap/index.html
layout: layout-role
sitemap: false
description: >
  Senior full-stack role working on a Digital Audio Workstation called
  Soundtrap. I succeeded at some fairly major challenges here in the context of
  a complex app and a very large organisation.
---



## Accessibility

Soundtrap signed a lot of new business during the COVID-19 pandemic as music
teachers turned to online collaboration in order to continue their work during
lockdown. This brought an unforeseen new compliance requirement, as
government-funded institutions like schools typically require software vendors
to comply with legislation such as
[Section 508 of the Rehabilitation Act](https://en.wikipedia.org/wiki/Section_508_Amendment_to_the_Rehabilitation_Act_of_1973).
This was problematic for Soundtrap, who had a ten year backlog of functionality
built without accessibility in mind.

I grabbed this learning opportunity with both hands, retrofitting several
accessibility bugs per day with a work rate that became somewhat legendary
within the team. I wanted my passion for the topic to be contagious, so I was
meticulous about documenting each pull request with e.g.
[the screen reader UX of a feature](/2022/04/04/sequencer-voiceover-demo/)
before & after the code change. In the final weeks of the project, I produced a
large body of documentation about the WCAG success criteria that had most
frequently come up while retrofitting, and the specific nuances of how they
related to our product. During my evenings I also studied for the IAAP's
[Certified Professional in Web Accessibility (CPWA)](https://www.accessibilityassociation.org/s/certified-professional-web-accessibility)
certification, which is a difficult certification that I passed later that year.

## Real-time Collaborative Editing

My team in Soundtrap were midway through building a new Google Docs-style
autosave & collaborative editing feature when I joined. This feature was well
engineered using advanced functional programming concepts, but lacked a clearly
articulated perspective on the distributed systems aspect of the problem. As a
result there were hard-to-reproduce consistency issues with the design, and the
team lacked a shared vocabulary to talk about them.

Drawing on my network from my previous Spotify tenure, I asked a friend from
another department – who I knew to be a distributed systems nerd – to come and
share some of his knowledge with the team. I worked to build a sense of
excitement about the fact that we were solving really hard problems which could
be understood using interesting ideas from computer science literature. The
motivation boost helped us get the project across the finish line, and learning
about concepts like "eventual consistency" and "preservation of user intent"
together helped us to describe our observations and ideas more fluently to each
other.

## Technical Leadership

Soundtrap's unusual front end tech stack was very heavily based on Dart, and the
back end was a distributed system comprised of several services. This
combination meant that engineering work couldn't benefit freely from the
familiar tooling ecosystem that a web engineer normally relies upon, and the
setup process for a local development environment was lengthy and involved hacks
like running Chrome with the `--disable-web-security` flag.

One early proposal I made that improved the tooling setup significantly was to
integrate the Redux devtools browser extension into the app's homegrown state
management system. This put a familiar face on the state transitions that
governed the app's behaviour, and proved invaluable for debugging consistency
bugs in the real-time collaborative editing feature. Another improvement I made
was to introduce an nginx-based reverse proxy and a self-signed SSL certificate
to the development environment. This streamlined the setup process
significantly, and the addition of the SSL certificate had unexpected benefits,
such as facilitating testing in mobile device simulators.

## Salesforce Redeployment

My role at Soundtrap was eliminated during the wider Spotify layoff of
January 2023. Rather than accept a disruption to my son's first days at
preschool and a setback to the union campaign I was leading at Spotify at the
time, I chose to turn down the severance offer and take my chances with the
redundancy process. I received a more junior, lower paying role focused on
Salesforce administration.

This was a challenging time, and I'm eternally grateful for the generosity of
spirit shown to me by the Sales Ops team. Learning about B2B SaaS sales was not
something I was expecting out of my time at Soundtrap, but became the silver
lining in an otherwise quite bleak period of my career.
