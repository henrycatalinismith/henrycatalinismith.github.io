---
title: "Code I Like: Twig Loaders"
tags: [blog, webdev]
layout: layout-post
---

The [Twig templating library for PHP](http://twig.sensiolabs.org/) is really
quite a nice piece of software. In terms of external quality, it's stable, open
source, actively maintained, and well documented. I've been lucky enough to
spend some time at work exploring its internals from time to time over the last
12 months or so, and I've found the internal quality to be equally high. It's a
pleasure to work with code that has been properly looked after.

One particular aspect of Twig's design that I think exemplifies its internal
quality is the way in which it loads template source code for compilation.
There's more to it than just `file_get_contents`, and Twig manages that extra
complexity well enough that it makes it look extremely simple.

## The Hidden Complexity Of Template Loading

A first iteration of a very basic templating library would probably read
template source code from a file on disk, like so.

```php
return file_get_contents("$templateName.twig");
```

A mature, general purpose library like Twig, on the other hand, needs to support
its users' diverse needs. Some people may not want to use the filesystem at all,
because they may already have a string, or even an array of strings, ready for
compilation. There's no getting away from this kind of complexity, so ideally it
should be engaged head-on as a first class part of the design.

## Successful Complexity Management In Twig

Twig rightly treats each different way of loading templates as a separate
concern, with its own class implementing
[`Twig_LoaderInterface`](https://github.com/fabpot/Twig/blob/v1.13.1/lib/Twig/LoaderInterface.php).
Filesystem interaction happens in
[`Twig_Loader_Filesystem`](https://github.com/fabpot/Twig/blob/v1.13.1/lib/Twig/Loader/Filesystem.php),
while
[`Twig_Loader_String`](https://github.com/fabpot/Twig/blob/v1.13.1/lib/Twig/Loader/String.php)
serves the use-case of those who just want to compile from a string. These
classes are absolutely tiny, so they're immediately comprehensible.

As well as keeping Twig's own internal code tidy, this approach provides a great
deal of flexibility for anybody who needs bespoke template loading behaviour.
Got some bizarre restriction forcing you to store templates in your database?
Just write your own implementation of `Twig_LoaderInterface` and inject it into
your `Twig_Environment` at instantiation.

You can even chain loaders together using
[`Twig_Loader_Chain`](https://github.com/fabpot/Twig/blob/v1.13.1/lib/Twig/Loader/Chain.php).
Need to fall back to your crazy database template storage only in the event that
the file isn't found on disk? Add those two loaders in that order to a
`Twig_Loader_Chain` and inject that into your `Twig_Environment`.

Twig provides all this flexibility and makes it look easy, and it achieves this
by a ruthless separation of concerns. It's a minor triumph of careful software
design.

## Failed Complexity Management In Smarty

This may seem like a lot of fuss about nothing. So Twig takes a relatively
simple problem and makes it look simple, what's the big deal? It's a big deal to
me because this kind of quality is actually rare.

As a counterexample, look at the approach taken by Twig's main competitor in the
arena of PHP template libraries: [Smarty](http://www.smarty.net/). The Smarty
equivalent to Twig's loaders all resides within
[one enormous "fetch" method](https://github.com/TMSolution/smarty/blob/ecd289cab1f3687d9273eb401ef9bc807f706bbb/distribution/libs/sysplugins/smarty_internal_templatebase.php#L20-L361).
It's 300 lines of inflexible, incomprehensible code. The many repsonsibilities
of this method include: output buffering, caching, cookies, errors, response
headers, and the generation and evaluation of PHP code.

To compile a template from a string in Smarty, you must prefix your template
source code with the magic incantation `string:` and pass it as the name of the
template to this "fetch" method. If the fifth parameter - `$display` - is true,
then "fetch" also takes charge of cache invalidation and the sending of rendered
template output as part of the response body. In short, this is very untidy code
with an equally messy API.

## Dependency Injection Done Right

Twig's flexibility and cleanliness here is a big win for the
[dependency injection pattern](http://en.wikipedia.org/wiki/Dependency_injection).
It's a great example of how DI isn't just about maximising testability, and of
why I think DHH is a little too extreme in
[his criticism of it](http://david.heinemeierhansson.com/2012/dependency-injection-is-not-a-virtue.html).
Twig is a clear example where DI has made the API better, not worse.

```php
$loader = new Twig_Loader_String;
$twig = new Twig_Environment($loader);
echo $twig->render('Hello !', array('name' => 'Fabien'));
```

As well as flexibility and code quality, this approach to loading templates
happens to be very amenable to unit testing. Small classes with single
responsibilities and few dependencies usually are easier to test than KLOC
behemoths.

That's it, really. Twig gets this right, and I think that's worth a little
praise. Go Twig.
