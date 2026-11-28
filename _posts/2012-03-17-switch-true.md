---
title: switch (true)
tags: [blog]
layout: layout-post
---

A while ago I learned a quirky little programming trick which has occasionally
come in handy. It's something I picked up from some random blog post about 'cool
programming tricks' that I can no longer find. It involves the `switch`
statement, which is fairly universal in programming languages and normally looks
like this:

```javascript
switch (name) {
 case 'henry':
  tabWidth = 8
  tabMode  = 'tabs'
  break;
 default:
  tabWidth = 4
  tabMode  = 'spaces'
  break;
}
```

It's generally used to compare one variable, given in parentheses after the
`switch` keyword, against a series of possible matches given in a list of `case`
statements. The alternative usage of it that I've been very occasionally
employing looks like this:

```javascript
switch (true) {
 case name.length >= 20:
 case name.match(/\d{3}/):
 case name.indexOf('test'):
 case name === 'special_case':
  do_this();
  break;

 default:
  do_that();
  break;
}
```

## The Good

It looks a little confusing at first glance, but once you understand it, it's
actually a means of improving readability. If you need a piece of code to test a
very long list of conditions and then do one thing if they all pass or if one of
them fails, then a `switch (true)` or `switch (false)` can do that for you
without having to write one of those really unsightly over-long `if` statements
that wrap across several lines.

It works in exactly the same way as `if (x || y || z)`, in that once one of the
cases matches, execution hops past the other conditions and your actual code
starts executing. Consider that
[the normal alternative](http://framework.zend.com/manual/en/coding-standard.coding-style.html#coding-standard.coding-style.control-statements.if-else-elseif)
to my above example would look like this:

```javascript
if (name.length >= 20
 || name.match(/\d{3}/)
 || name.indexOf('test')
 || name === 'special_case'
) {
 do_this();
} else {
 do_that();
}
```

I think that the `switch (true)` pattern can be a very elegant-looking way of
handling large sets of conditions. It kind of forces the statement into either
[disjunctive normal form](http://en.wikipedia.org/wiki/Disjunctive_normal_form)
or
[conjunctive normal form](http://en.wikipedia.org/wiki/Conjunctive_normal_form)
depending on whether you use `switch (true)` or `switch (false)`. The `case`
keyword is an absolute barrier to operator precedence, so your list of cases is
guaranteed to be either a conjunction or disjunction, and no amount of
parentheses can overcome this simplification. For example, take this slight
variation on the above code snippet:

```javascript
if (name.length >= 20
 || (name.match(/\d{3}/)
 && name.indexOf('test'))
 || name === 'special_case')
)
```

Using a `switch (true)` statement, it would look like much clearer:

```javascript
switch (true) {
 case name.length >= 20:
 case name.match(/\d{3}/) && name.indexOf('test'):
 case name === 'special_case':
}
```
```

## The Bad

For someone who isn't familiar with the trick, however, seeing it for the first
time in some code they have to maintain, it probably looks quite quirky and
maybe even a little daunting to change.

It's also technically a little bit of an abuse of the language constructs. The
`if` statement is what you're _supposed_ to use for doing something _if_
something else. That's why it's called "if". In some parallel universe I can
imagine myself quietly wondering about the motivations of some colleague who
insisted on using a trick like this.

I wish I had some conclusive point to make at the end of all this, but if
anything it's that "good code" is not always clear cut. One of the guiding
principles that I try my best to stick to when coding is to **avoid writing
quirky code**. I hate quirky code, where somebody has developed their own
esoteric style in defiance of prevailing standards and refused to conform. Code
style is not about freedom of artistic expression any more than your
pronunciation is. Code has two functions:

- Tell a computer what to do and how
- Tell a human what the computer is doing and why

I don't know which order those two belong in, so I've used an unordered list.
I'm someone who puts a lot of importance on the second one, probably more so
than most developers because of my previous background in human languages. With
a foreign language the aim is to sound like an authentic native speaker, and
people who flat-out refuse to attempt part of the native accent, such as the
rolled Spanish 'r', often don't realise that this shyness actually draws more
attention to their accent than if they actually gave it a go.

The thing about programming is that each language that you learn comes in two
parts, just like with human languages. All programmers learn the first part: the
grammar and vocabulary. It's really easy to forget about the second part,
though: learning how to imitate the way
[native speakers](http://www.kernel.org/doc/Documentation/CodingStyle) turn that
[framework](http://framework.zend.com/manual/en/coding-standard.html) of
[rules](http://nodeguide.com/style.html) into actual communication.

This is the main thing that puts me off the `switch (true)` pattern. It feels
like using a really uncommon word or phrase just because technically it captures
a meaning well, forgetting that the whole point of a word is to be instantly
understandable by others. It may be kind of elegant semantically, but it kind of
makes you sound like a beginner language learner directly translating an
idiomatic phrase from their own native language.

## Damnit

On reflection, I think I'm more against this pattern than for it. It's a shame,
because I'm convinced that it's a good fit for a certain small set of
programming problems. Consider this post, then, a public apology for writing
weird, quirky code and violating the sacred
[principle of least astonishment](http://en.wikipedia.org/wiki/Principle_of_least_astonishment)
. It's certainly not my only offense by a long shot.
