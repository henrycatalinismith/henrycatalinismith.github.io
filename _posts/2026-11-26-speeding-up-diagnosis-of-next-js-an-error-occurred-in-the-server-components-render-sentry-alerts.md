---
title: Speeding up diagnosis of Next.js “An error occurred in the Server Components render” Sentry alerts
layout: layout-post
---

When a Next.js server component errors during rendering, it produces two errors:
one emitted by the server, and another by the browser when it receives the
broken component. The server version of the error has the real error message,
while the browser version has this absolute ¯\\\_(ツ)_/¯ of an error message instead.

> Error: An error occurred in the Server Components render. The specific message
is omitted in production builds to avoid leaking sensitive details. A digest
property is included on this error instance which may provide additional details
about the nature of the error.

Given a fairly typical production setup where the server is behind a CDN, the
browser version will vastly outnumber the server version of this error. So if
there’s a spike that crosses an alerting threshold, it’s the browser version
that’s going to actually alert, which means frequent alerts where the only clue
is “An error occurred”. It’s a bit of a dead end! You have to go digging
elsewhere in Sentry or other observability tools for leads to find out what’s
actually wrong.

There is some special Sentry plumbing you can do in your Next app’s
[instrumentation.js](https://nextjs.org/docs/app/api-reference/file-conventions/instrumentation)
and
[instrumentation-client.js](https://nextjs.org/docs/app/api-reference/file-conventions/instrumentation-client)
that helps with this. In short, you need to add the digest as a tag on both
versions of the error before they’re uploaded to Sentry. That way, when you
click through to the useless browser error that’s alerting, you can find the
digest there, and search for `digest:XXXXXXX` to dig up the real error message.

This doesn’t really seem to be written down anywhere, and I mostly had to figure
it out for myself. For me it felt like a clear-cut example of something that
you’d have been confident of finding an answer for on Stack Overflow five years
ago. It’s a shame we’ve lost that resource even if it was very flawed.

In my [Sentry Appreciation Post](/2026/10/11/sentry-appreciation-post/) last
month I wrote about how much I love making these kinds of observability
improvements. Today’s example was a particularly satisfying one as these “An
error occurred” errors have been chipping away at my patience for a while now.

I also have a little vibe coded Rust-based CLI utility for quickly fetching
useful Sentry issue & event metadata without wasting tokens, and an agent skill
so that it gets used for questions about Sentry issues. Once the digest was in
place, I modified the CLI to automatically handle the digest dereferencing
operation, and added an explanatory note to the skill about it. The result: I
can sling an “An error occurred” Sentry issue URL into a fresh OpenCode session
and expect a quick diagnosis that doesn’t waste any tokens faffing with error
digest lookups.

Can highly recommend this setup if you’re also struggling with "¯\\\_(ツ)_/¯ An
error occurred".

