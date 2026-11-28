---
title: Monkeypatches broke my build
tags: [blog, devtools]
layout: layout-post
---

The prevalence of monkey patching as a Ruby development practice is a complete
pain in the arse. Sure, some of Ruby's expressiveness as a tool for building
DSLs is derived from the ability to monkey patch things like 10.days.ago into
the core classes. Admittedly, I occasionally indulge my sweet tooth at the Rails
all-you-can-eat syntactic sugar buffet. But it's not my favourite approach to
software development by a long shot.

A couple of months ago I wrote a little about the general awkwardness resulting
from monkey patching. I've been burnt worse since then, and now I have a
concrete example which I think supports my point of view quite strongly.

## Coveralls/Colorized/Colored Clusterfuck

Today I wanted to add a service called Coveralls to ppl's build process.
Coveralls measures test coverage, provides statistics about test coverage over
time, and supplies a dynamic README badge for advertising your project's
commitment to thorough testing. It's a perfect fit for a project like ppl, so I
was keen to get it running.

Take a quick look at the commit which added Coveralls to ppl. It's a tiny
commit, and seemingly harmless. To my great surprise, it broke the build on
Travis CI. And which test did it break?

```text
Failures:

1) Ppl::Format::Table#to_s should colorize columns if requested
Failure/Error: @table.to_s.should eq "\e[31m12345  \e[0m\e[33mJohn Doe  \e[0m\e[34mjdoe@example.org  \e[0m"

expected: "\e[31m12345  \e[0m\e[33mJohn Doe  \e[0m\e[34mjdoe@example.org  \e[0m"
        got: "\e[0;31;49m12345  \e[0m\e[0;33;49mJohn Doe  \e[0m\e[0;34;49mjdoe@example.org  \e[0m"

(compared using ==)
# ./spec/ppl/format/table_spec.rb:80:in `block (3 levels) in <top (required)>'
```

The design of that test is actually a bit of a minor mistake on my part. The
color adapter probably ought to be mocked out, as this test isn't really about
the ANSI color escape codes themselves.

On the plus side, this has exposed something very interesting: the escape codes
surrounding the strings have changed subtly. And why is that? Because the
Coveralls gem depends on a string colorization library called colorize. When
Coveralls is loaded by the line require "coveralls", colorize's String class
monkey patches overwrite the ones previously made by
Ppl::Adapter::Color::Colored when it loads the colored gem.

## What. The. Fuck.

Did you catch that? My project's test suite failed because one of Coveralls'
dependencies changed the behaviour of Ruby's core String class in a way that
overwrites changes previously made to that class by a dependency of ppl. This is
absolute chaos. It's not even anybody's fault, but rather an inevitable
consequence of monkey patching.

I'm quite new to Ruby, so I have to rely on others for perspective on this
approach to Ruby development. Judging by Avdi Grimm's 2008 post, "Monkeypatching
is Destroying Ruby", it was considered quite hip five years ago. Here we are in
2013, and installing a code coverage tool has literally changed the output of my
code. It's pretty clear that Avdi was right, anyway.

Refinements look set to right some of these wrongs, but Ruby 2.0 is still warm
from the oven, and projects like ppl will probably be supporting 1.9 for a long
time to come. In the meantime, I've decided to start treating monkey patches
more or less like a bad idea. Not because they are necessarily fragile in
themselves, but because of the fragility they so inscrutably create in other
code.
