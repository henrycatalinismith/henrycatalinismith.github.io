---
title: Lessons learned from the Forgejo v15 release blocker
image: /2026/04/15/demo@1024x620.webp
tags: [blog, accessibility, devtools]
layout: layout-post
---

A [pull request of mine](https://codeberg.org/forgejo/forgejo/pulls/11846) recently needed to be [reverted](https://codeberg.org/forgejo/forgejo/pulls/12088) due to a [visual bug](https://codeberg.org/forgejo/forgejo/issues/12082) in order to unblock the release of Forgejo version 15. This was about 10% embarrassing, 10% frustrating, and 80% really really interesting. I learned a whole bunch about Forgejo's code and release process, as well as my own biases and focus areas to become a better contributor. It would be a good problem to have if more people like me came along to contribute and made mistakes like these. I figured I'd write down what I learned so that it's easy to pay it forward.

Open source release cycles are so different to typical private sector release cycles. It's been more than ten years since I last worked somewhere where something like backporting fixes to older releases was a concern. Every job since then has been somewhere between continuous deployment and biweekly releases. You can afford to have more of a push-and-pray attitude to quality in that kind of environment, since mistakes can be mopped up in the next release. I hadn't noticed how much my habits had been shaped by that context until seeing them fail in this one.

Another bias it helped me to notice is related to tools. The dominance of components as the primary front end building block in recent years has taught me to think of each UI element as its own self-contained little world. I’d updated the HTML template and the most relevant-looking associated CSS so the job *felt* very done at some subconscious level. The idea that other layers of further-away CSS might also be in play simply did not occur to me due to this component-centric mindset.

A third bias I discovered was that I had a little too much faith in my own process. For example, I’m utterly meticulous about providing “before” & “after” screen recording demos for fixes like these. The act of producing these videos is a key moment in my process. Because it requires distilling the change down into a bitesize comparison and capturing it visually, it’s the moment where I catch most of my “oh shit, I nearly missed that!” bugs. In this case, due to the bug being in a visual detail I wasn’t trying to change and relating to CSS code that wasn’t in the diff, I missed this one anyway even though it’s clearly visible in [the “after” video on the pull request](https://codeberg.org/attachments/73375292-d749-4e5c-84e1-203b6b56b6f5).

Something that went very well here, though, was the fast turnaround on the revert pull request. In the regression issue thread I estimated that fixing it would take several days and offered to revert the original PR instead to unblock the release. I’m glad we went with that option. My stress level was immediately back at baseline once I’d created the revert pull request.

Another positive was that the new perspective resulting from the mistake made me understand how overextended and sloppy I’d become. The [same mistake](https://codeberg.org/forgejo/forgejo/pulls/11953#issuecomment-13026201) was present in another open pull request of mine, I learned. So I closed it, along with a few others, to give myself some thinking time and free up maintainer resources to work on the release instead.

That thinking time went more or less like this: I feel utterly determined to continue contributing to this project, but also some embarrassment and frustration about the level of quality of some of my work so far. How can I tweak my approach in order to get those levels somewhere satisfactory despite being quite unfamiliar with the code still?

One technique I love for catching unexpected visual differences between two versions of a webpage is to open the old version and the new one in adjacent tabs and rapidly jump back and forth between the two tabs. The speed is key, because it gives the differences an almost animation-like quality and makes them jump out of the screen at you. I decided to figure out a workflow to bring this check into my process.

What I came up with involves checking out the `forgejo` (i.e. main) branch, building and running the application and opening a tab showing the feature being worked on, then switching branches and repeating the process there. At that point you have a "before" tab and an "after" tab and can use the rapid tab switching technique to surface any unexpected changes.

Here's a demo! I run each command in sequence on the left, and then at around 00:36 when both tabs are ready I begin switching back and forth between them. The visual bug jumps out at you very clearly.

<figure>
 <video
  src="/2026/04/15/demo@1024x620.mp4"
  poster="/2026/04/15/demo@1024x620.webp"
  controls
  preload="none"
  playsinline>
 </video>
</figure>

Given that structural HTML changes are such a key part of accessibility retrofitting and that Forgejo's approach to selectors couples its CSS quite tightly to the structure of the HTML, I think this technique is going to be critically important to be able to deliver the necessary amount of retrofitting work without these kinds of regressions. And hopefully it can be of use to others who show up to help in the future too!
