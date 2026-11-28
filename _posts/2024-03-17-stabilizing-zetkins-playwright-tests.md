---
title: Stabilizing Zetkin's Playwright Tests
image: /2024/03/17/fast@1200x256.gif
description: Reducing end-to-end test flakiness in a real-world open source app.
layout: layout-post
tags:
  - blog
  - zetkin
---

I recently did
[some work addressing the flakiness of some end-to-end playwright tests](https://github.com/zetkin/app.zetkin.org/pull/1807)
for Zetkin Foundation. This class of reliability issue is something I've seen
affect almost every team I've worked with throughout my career. It's hard, but
for once I think we actually secured a win with this PR. It's a bloody _messy_
PR though. So let's zoom in on what we actually changed and why it helped.

## Works On My Machine

A typical playwright test for a web app feature involves a series of button
clicks leading to an assertion at the end. It's common for each UI event to
depend on the ones before it. For example, a click on a menu item depends on the
previous click which opens the menu. We can distil this down to an example like
the one below, in which we click three buttons in turn and then see a status
message.

![Animation in which a button labeled "one" is clicked, which reveals a button labeled "two". When "two" is clicked it reveals button "three". When "three" is clicked a message appears that reads "success". In each case, the effect of the button presses is immediate.](/2024/03/17/fast@1200x256.gif)

If you've done any end-to-end testing before, you can probably imagine how you'd
automate a test for that. You'd have three automated clicks and then at the end
you'd assert the presence of the `success` text.

```js
await page.click("text=one");
await page.click("text=two");
await page.click("text=three");
expect(await page.locator("text=success").isVisible()).toBeTruthy();
```

This would be a perfectly normal thing to write, and you'd see it working just
fine when you tested it locally too. So you'd commit, push and it'd probably get
merged without comment as well.

## Results May Vary

Developer laptops tend to have fairly stable performance, whereas CI
environments are under much heavier and more variable system load. Let's take
our example page from before and simulate running it under shitty conditions
where each click takes an entire second to process.

![Animation in which a button labeled "one" is clicked, which reveals a button labeled "two". When "two" is clicked it reveals button "three". When "three" is clicked a message appears that reads "success". In each case, the button presses take one second to process.](/2024/03/17/slow@1200x256.gif)

The test fails when things slow down this much. Playwright tries to find an
element matching the `text=success` selector at the end and gives up when it
doesn't find it immediately after clicking on button three.

That might happen to a random end-to-end test in a CI build for an unrelated
code change you're trying to merge. That's when you say "God damn these stupid
fucking flaky tests" and you retrigger the build, hoping for a better outcome
next time. And if you get a green build on the retry, it's probably because
system load is lower on the cloud instance your second attempt runs on.

## Wait For It

The trick is in replacing that final `isVisible()` assertion with something that
doesn't fail if the `success` text takes a moment to appear. Here's an example
using Playwright's
[`waitFor`](https://playwright.dev/docs/api/class-locator#locator-wait-for)
method.

```js
const status = page.locator("#status");
await status.waitFor({ state: "visible" });
expect(await status.textContent()).toBe("success");
```

The first line there doesn't do much. It just instantiates a
[locator](https://playwright.dev/docs/api/class-locator) object for the status
text. The second line tells Playwright to chill for a second until the status
appears. Then finally, line three asserts that its text content is `success`.

Whereas the code in the original example will randomly fail depending on system
load at runtime, this approach is robust enough to pass reliably even if it's
running on a struggling, overworked CI server.

## Locators For Everything

It goes beyond just the assertion at the end, actually. The first thing
[Playwright's documentation for `page.click()`](https://playwright.dev/docs/api/class-page#page-click)
says about it is not to use it.

![Discouraged. Use locator-based locator.click() instead. Read more about locators.](/2024/03/17/click@1198x378.webp)

[Playwright's docs for locators](https://playwright.dev/docs/locators) describe
them as "the central piece of Playwright's auto-waiting and retry-ability".
Nice! Sounds like a great all-purpose flakiness vaccine to me.

For our example test, that means that it ends up looking like this.

```js
const one = page.locator("text=one");
const two = page.locator("text=two");
const three = page.locator("text=three");
const status = page.locator("#status");

await one.click();
await two.click();
await three.click();

await status.waitFor({ state: "visible" });
expect(await status.textContent()).toBe("success");
```

That's about as good as I understand what I did in
[the Zetkin PR](https://github.com/zetkin/app.zetkin.org/pull/1807). I always
resort to a bit of guesswork and superstitious coding when dealing with tricky
stuff like this, and this time was no different. We managed to catch and remove
[some of it](https://github.com/zetkin/app.zetkin.org/pull/1807#discussion_r1503611724)
but who knows if that was all of it.

Was every `waitFor()` call I added 100% necessary? Honestly not sure. I sure as
hell didn't replace all the `page.click()` calls with locators either. Maybe I
should have? IDK, it's tricky cos that would have _felt_ superstitious unless I
could reliably reproduce a test failure that was fixed by swapping to locators,
but OTOH the very nature of this problem is that you can't reliably reproduce
them. This stuff is bloody hard, but at least we scored ourselves a clear win
here.
