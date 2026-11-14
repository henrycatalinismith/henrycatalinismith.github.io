---
title: "The kollektivavtal archive's moved back to GitHub"
tags: [blog, devtools]
layout: layout-post
---

Made the decision this week to pull the plug on [kollektivavtal.github.io](https://kollektivavtal.github.io/) and move it back to [kollektivavtal.github.io](https://kollektivavtal.github.io/). Not an easy decision to make as I'd come to really love Codeberg.

With the legacy [Codeberg Pages v2 sunset deadline](https://blog.codeberg.org/migrate-your-site-to-the-new-git-pages-backed-codeberg-pages-now-were-sunsetting-codeberg-pages-v2.html?via=dailydev) approaching, there was going to need to be some maintenance work on the site no matter what I did. It occurred to me that returning to GitHub would be a comparable amount of work to handling the upgrade on Codeberg itself. And GitHub won the trade-off.

One reason was licensing. I use the [CC-0 license](https://creativecommons.org/publicdomain/zero/1.0/deed.en) on the whole kollektivavtal archive project and all its sister projects like [arbetsmiljo.github.io](https://arbetsmiljo.github.io/) and all those. That's because 99% of the the value is in the form of data such as PDFs created by Swedish trade unions, data collected from the Swedish work environment agency, and laws written by the Swedish government. As I'm only aggregating that existing work, I don't want to make any claims of my own regarding ownership of it. I also can't be bothered with a hybrid license setup where the code is under one license and the data another. Codeberg's [licensing documentation](https://docs.codeberg.org/getting-started/licensing/#other-projects-(documentation%2C-music%2C-etc.)) is vaguely negative towards this type of usage in a way that always made me uneasy. GitHub doesn't give a shit.

Another one was the new [AI policy at Codeberg (that I voted in favour of)](https://henry.catalinismith.se/2026/08/06/why-i-voted-in-favour-of-codebergs-ai-policy/). So far the kollektivavtal archive is completely hand-built, but it is actually very boring and gruelling work to scour trade union websites, download PDFs, and then annotate everything with links to sources. And currently the archive only covers a small fraction of the real number of agreements out there. It's not feasible for me to find them all manually. In the future I want to explore delegating some of that work to AI, at which point I will risk being in violation of the new AI policy at Codeberg. I stand by my vote for that policy for the reasons I already outlined in my blog post about it. I think it's a good thing that there are different services for different use cases, and a vibecoding ban is a great fit both for Codeberg's community culture and for its resource constraints. It was the right decision even if it pushes me out.

The other reason was reliability, which admittedly might be a little unfair of me. The new pages server at Codeberg is likely to be miles more reliable than the old one. But uptime on `.github.io` _has_ been a problem. And people do give a shit about the uptime of the kollektivavtal archive, as I was reminded just last night. A few hours after completing the GitHub migration I got an email asking where the old site had gone and could I please fix it as this person was using URLs on it in their _work_, like at their _job_. So now there's some redirects up there just in case.

One last reason was the CI at GitHub. I built a pretty nice CI workflow into the kollektivavtal archive so that I can just upload a PDF and have it autoindexed on the site. Never felt super comfortable porting it over to Codeberg in case the bandwidth and disk usage of the PDFs could be a problem for the infra.

> **Resource usage must be reasonable for the intended use-case.**<br />
> CI requires substantial computing resources (cloning the repo and pulling the image, installing required tools, building and throwing everything away). Therefore, please consider twice how to create a good balance between ensuring code quality for your project and resource usage.<br />
> [https://docs.codeberg.org/ci/](https://docs.codeberg.org/ci/)

The above read like a closed door to me. Having to hand crank the build system and deploy every new PDF manually more or less doubled the workload of maintaining the site and led to me loving the project less and spending less time on it.

Bit of a shame as I had become quite emotionally attached to Codeberg. But it will be fun to see if the move breathes some new life into the project.
