---
title: Rewriting ppl in Rust
layout: layout-post
---

Back in 2012 I made a command-line address book called [ppl](/ppl) which became
pretty popular for a while despite the fact that I wrote it in Ruby and it was
dog slow. I stopped using it at some point but needed it again recently – wanted
to clean out the old contacts on my phone without completely deleting them and a
Git repo seemed a good archive for them – and decided to sort out the Rust
rewrite that I’ve been daydreaming about for years.

It took about an hour or so, which is just incredible to me. Last year this
would have been _months_ of work for me, as it’d have required fully learning
Rust up front. Now instead I have a Rust codebase whose business logic I know
inside out, where my familiarity with the problem domain and the pre-existing
structure of the solution help me to learn Rust just by reading the new source
code. It’s a weird and surprisingly fun new way to learn a language!

Unsurprisingly, the Rust version is 10 times faster than the Ruby version was. I
was always very ashamed of ppl’s bad performance, so that’s a great feeling to
use it today and have it finally be as snappy as I always knew it should be.

The actual Rust port phase of the work literally took 30 minutes and two
prompts. The Cucumber tests proved very valuable indeed: the agent treated them
as a spec. Passing the tests was an important milestone.

When I first built `ppl` I was obsessed with the book Clean Code, and it showed
in the architecture. This proved less valuable than the high level of test
coverage. The agent was able to understand the overall structure of the codebase
very quickly as a result of all the Clean Code shit, but it’s telling (IMO) that
it chose not to preserve the structure in the Rust version. Still embarrassed
about my “Clean Code phase” TBH.

I’m very happy that one of my oldest and most successful projects has gotten a
new lease on life. November 2026 has been my own personal November 2025 when it
comes to coding with these AI agents. A lot of what I’ve said and thought about
them in the interim has definitely been motivated reasoning grounded in grief
about the sudden obsolescence of my (relatively high) speed of execution without
them.

I was very proud of that ability to outwork people. On my LinkedIn there’s an
old recommendation from a former colleague calling out my ability to churn out
5-10 PRs in a day. Five years ago you were a _freak_ if you could do that, and
all of a sudden it’s completely unremarkable. Ouch!!!

This period of mourning about that, where I’ve been using agents at work but
boycotting them in my own projects, is going to go down in my memories as
basically a second “Clean Code phase” I think. And I enjoy the slight poetic
justice in the fact that the end of it has also helped me rip out the remnants
of my first “Clean Code phase” from `ppl`.
