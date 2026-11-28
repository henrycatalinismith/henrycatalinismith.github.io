---
title: "Joining Forgejo’s Accessibility Team"
tags: [accessibility, blog, webdev, devtools]
layout: layout-post
---

If you go and look at [TEAMS.md#accessibility](https://codeberg.org/forgejo/governance/src/branch/main/TEAMS.md#accessibility) in Forgejo’s governance repo today you’ll find my name there in the list. I’m very proud of this!

Materially speaking, it’s minor stuff. There’s no money or power or anything like associated with it. Really it just means I did some accessibility work that was decent enough for the core team to be okay with putting my name in that list, I think partly as a bit of recognition and partly to help keep track of what capabilities the project has to hand at any given moment.

I wrote this in the background section of [my membership request](https://codeberg.org/forgejo/governance/issues/393).

> I see big opportunities ahead for Forgejo and Codeberg, and I know that WCAG compliance can be a sticking point for closing certain kinds of deal due to procurement legislation such as EN 301 549, so my hope is that any "problems" in this space are actually an opportunity for me to do lots of the kind of work I find most fun, and also contribute to the success of a a project I care a lot about.

Since [my adventures with the v15 release](/2026/04/15/lessons-learned-from-the-forgejo-v15-release-blocker/) a couple of weeks ago, we’ve successfully landed a [fix](https://codeberg.org/forgejo/forgejo/issues/11116) for the [repo file list table semantics issue](https://codeberg.org/forgejo/forgejo/issues/11116).

That one is a really big deal: the “latest commit” row used to live in the `<thead>` element. As a result, screen readers would announce the repo’s latest commit over and over and over again while navigating the list of files. It was pretty disorienting and it’s great that it’s fixed.

Next up is an upstream improvement for GitHub’s [`@github/combobox-nav`](https://github.com/github/combobox-nav) package. Forgejo had an [inaccessible combobox](https://codeberg.org/forgejo/forgejo/pulls/11860) that turned out to be the result of not assigning unique IDs to options. This felt like a mistake that could be handled more gracefully, so I sent a few ideas upstream, and now someone at GitHub is on board with [one of them](https://github.com/github/combobox-nav/pull/99). So hopefully together we’ll eliminate a whole category of accessibility bug that can arise when using that library, which is great news not only for Forgejo but for anyone else using it. Cool to see a nice example of collaboration among forge projects too.

After that, who knows. There’s plenty of interesting bugs to fix, for sure. One I’m particularly excited about is [making the heatmap keyboard- and screen reader-accessible](https://codeberg.org/forgejo/forgejo/issues/1627). I’m also trying to build a new habit of skimming through open PRs and issues looking for places where accessibility feedback can be a positive contribution.

I’m keen to do a little bit of auditing and see what bugs I can file myself, but that’s tricky before becoming more deeply familiar with the existing open issues on the issue tracker and the team’s less formal set of colloquially known issues. Besides, Forgejo has this great combination of factors of both being open source and having a critical mass of users, which means accessibility feedback tends to flow in directly as issues. So it doesn’t feel so urgent to actively add to that list given that bug reports from real-world use are inherently such a strong signal of priority and impact.

Always very rewarding to slowly acclimatise to a project like this outside of an employment context. A lovely thing about open source work is that it’s a context that can outlast individual jobs if you want it to. My [Zetkin work](/zetkin/) has outlived two or three jobs by now and I’m optimistic that Forgejo can be a similar deal.
