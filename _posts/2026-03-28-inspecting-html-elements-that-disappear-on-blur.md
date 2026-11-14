---
title: Inspecting HTML elements that disappear on blur
image: /2026/03/28/no@1000x544.webp
tags: [accessibility, blog, webdev, devtools]
layout: layout-post
---

Web accessibility is mostly about HTML, I reckon. Tons of the bugs you work on
end up being about adding or removing some attribute from an element. So the
inspect element tool is a really important part of the toolkit. And most of the
time you don't even have to think about it: just ⌘⇧C, click on the element
you're curious about, and you're in business.

That simple workflow falls apart when you need to debug an element that
disappears when you blur the document. Stuff like comboboxes and dropdown menus
are built to close themselves when the user is finished with them. So when you
try to expand them in the inspect element tool, they vanish. It's bloody
frustrating!

Sometimes it's easy to work around the problem by hardcoding the UI component
to ignore the blur event and remain open. This is most often possible in
projects that contain their own set of base UI components. Today I found myself
dealing with a case where that wasn't practical, and realised it might be worth
sharing the workaround I always use.

I'd found this really interesting issue about [the @mention combobox in Forgejo's
issue comment UI not being announced properly](https://codeberg.org/forgejo/forgejo/issues/7668).
Forgejo uses the `@github/text-expander-element` for this, and GitHub's known
for taking accessibility pretty seriously, so I was surprised it didn't just
work perfectly out of the box and curious about why. Couldn't use inspect
element though!

<figure>
 <video
  poster="/2026/03/28/no@1000x544.webp"
  src="/2026/03/28/no@1000x544.mp4"
  title="Browser debugging session"
  controls
  preload="none"
  playsinline>
 </video>
 <figcaption>
  It disappears every time you try to inspect it!
 </figcaption>
</figure>

The workaround I went with was one of my favourite little accessibility trade
secrets: `setTimeout`, `console.log`, and `innerHTML`! You give up on the
inspect element tool and go to the console instead. You rig up a `setTimeout`
that will wait 2 seconds before printing the HTML of the element you're
interested in, then you race over to get the UI into the state you're curious
about in time for the timeout to fire.

```javascript
setTimeout(() =>
 console.log(
  document
   .querySelector('.suggestions')
   .innerHTML
), 2000)
```

<figure>
 <video
  poster="/2026/03/28/yes@1000x544.webp"
  src="/2026/03/28/yes@1000x544.mp4"
  title="Browser debugging session"
  controls
  preload="none"
  playsinline>
 </video>
 <figcaption>
  There it is!
 </figcaption>
</figure>

Thanks to that trick, it became clear that the combobox items lacked unique IDs,
which prevented `@github/text-expander-element` from setting
[`aria-activedescendant`](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
properly on the textarea element. From there, it was an [easy pull
request](https://codeberg.org/forgejo/forgejo/pulls/11860) to put together.

By the way, did you spot the console warning in the second video?

> Empty string passed to getElementById()

Firefox is fucking _brilliant_ for that kind of stuff. That warning is coming
from `@github/combobox-nav`, and it's caused by the same lack of unique IDs
that break the screen reader accessibility of the dropdown. Clicking on the
line number in the stack trace showed me exactly where the missing IDs were
causing trouble, and helped me quickly build a mental model of what was wrong.
So second tip: debug in Firefox!

It's a lot of fun working on Foregejo's accessibility. The UI has a very
late-2000's / early-2010's architecture, with lots of jQuery. A big strength
I've noticed about this is that it seems to impose a fairly low ceiling on code
complexity, discouraging ambitious metaprogramming. The downside of that
trade-off is well understood thanks to a decade of React hegemony, but I want
it in writing that I was surprised by how approachable and understandable I
found this type of code even after so many years away from it. It reminds me of
the internals of the [80's boombox I've
been slowly working on refurbishing](/2026/03/11/restoring-an-old-80s-boombox/),
and I mean that as an enormous complement.

It would be very cool if there was more competition over all these interesting
little Forgejo accessibility puzzles. If it's something you're into, I can
reassure you that Forgejo's the kind of project where accessibility bug reports
and fixes are well-received. Come join us in
[#forgejo-accessibility](https://matrix.to/#/#forgejo-accessibility:matrix.org)
and let's make the new home of free and open source software accessible to everyone!
