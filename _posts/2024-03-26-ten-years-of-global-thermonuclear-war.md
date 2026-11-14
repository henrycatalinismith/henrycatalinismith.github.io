---
title: 10 Years Of Global Thermonuclear War
image: /2024/03/26/wargames@688x570.webp
tags: [blog, gamedev, wargames, webdev]
layout: layout-post
---

It's coming up on the tenth anniversary of the release of my infamous global
thermonuclear war game. It's been offline for longer than it was ever online
now. I want to get the story of this thing and its general context in my life &
career written down and posted in time for the ten year milestone, so here it
is.

## Origins

I don't really remember how I ended up making this. My best guess is that I was
probably pissing around with the Google Maps API one day and noticed it was
possible to animate the
[geodesic lines](https://developers.google.com/maps/documentation/javascript/examples/geometry-headings)
to look like live-updating nuclear warhead trajectories.

It was a challenging idea to turn into a game and I'd bought some whiteboards to
help with things like that, so I did
[some sketches](https://henry.catalinismith.com/2014/08/04/not-planning-any-nuclear-attacks/)
to help myself work through some of the concepts and vocabulary.

## The Landlord Visit

The visit was a scheduled inspection. In the UK these are a common practice in
the rental market. In Sweden they're not. Moving here changed my perspective on
this aspect of the story very significantly. In the UK, people's reaction to
this story was always “I can't believe they actually called the police”. In
Sweden, it's “Wait, what do you mean ‘inspection’?”.

In one of my interviews last year I talked a lot of shit about Thatcher, and how
eye-opening it was to move to Sweden and realise what a dump the UK was in so
many ways. This was one of the many realisations on that journey.

There's a lot of bloodthirst about deregulating the Swedish housing market these
days. Here's hoping we manage to hang on to this one small dignity at least. We
have a right to enjoy our lives without the surveillance of our private homes by
the landlord class. Let's keep that.

## The Police Report

The whole point of publishing the blog posts about the incident was to try to
pre-empt a police intervention. I don't know if the blog posts going viral made
any difference, but the police never came.

In hindsight, my fear response to the police report makes a lot of sense. The
vast majority of my police interactions back home were negative. One time, I was
walking to my local supermarket in Liverpool, and I was stopped and searched by
police for no reason, under
[section 60 of the Criminal Justice and Public Order Act 1994](https://www.lancashire.police.uk/help-advice/stop-and-search/section-60-without-suspicion-searches/).

That's another thing we don't have here in Sweden. Or didn't have, more like.
Starting Thursday, Swedish police will have
[comparable powers for suspicionless stop-and-search](https://sverigesradio.se/artikel/regeringen-visitationszoner-infors-i-mars).
In
[an Arbetsvärlden interview I did recently](https://www.arbetsvarlden.se/the-cba-struggle-at-spotify-traumatized-him/),
I talked about Sweden becoming more like the UK. This would be a specific
example of that.

## The Media Attention

Someone on Twitter saw my blog posts and posted them on Hacker News. Someone at
The Guardian saw the Hacker News post and contacted me for quotes for
[a story about it](https://www.theguardian.com/technology/2014/aug/26/police-video-game-developer-global-thermonuclear-war-plans).
Various publications picked up the story from there.

Gaming-related stories sometimes get reinterpreted with a particular agenda
where it's about how the stupid “normies” don't understand the refined culture
of the poor beleaguered gamer. I saw this happen a little bit with my story.
Simultaneously, I saw it happen with Anita Sarkeesian.

The idea of benefiting from the same destructive social forces that I could see
destroying other people's lives made me a little bit sick. I think I wrote
[Gaming's Persecution Complex](/2014/12/26/gamings-persecution-complex/) more or
less just to ease my own conscience about that.

## The Big Launch

The guy at The Guardian told me what day the story would go up, and that became
my deadline. It was fun to have an externally imposed deadline. It helped me to
cut my crap and ship the thing. The whole project had been stuck in a
[boring dead zone of aimless pissing about](https://github.com/henrycatalinismith/wargames/commit/91ba8000dd3bf120a477eb6ffdd3e6999f4f7299)
before that.

Once the story was up and the game was online it was really exciting. I kept
having to do all these seat-of-my-pants optimisations to keep everything
running. The back end leaked memory and crashed from time to time. The front end
slowed to a crawl with all the missiles and I had to do things like
[limit how many would even render](https://github.com/henrycatalinismith/wargames/commit/98f74759dad114ec3e68adabe09ad127e1f3145f).

<img src="/2024/03/26/map@672x350.webp" alt="Google Maps screenshot covered in red dots and red geodesic lines" />

When I shipped this game, the Google Maps API was free. Today, serving the
amount of traffic I did back then would have cost me hundreds of dollars in Maps
API fees. I don't know if I could have afforded it.

## The Long Tail

The publicity lasted about a day, and the social media buzz about a week. The
game itself retained users way better than it had any right to though. People
kept coming back, and the thing stayed decently busy for a long while after the
launch.

The traffic did eventually flatline. But then, something surprising happened:
every so often the server would light up again with a surge of activity for a
short while. Individual online communities would rediscover it and have a few
days of fun playing it together before moving on.

After a while, it narrowed down to one community in particular who came back
repeatedly. And unfortunately, that community was creeps from 4chan. I managed
to track down the thread about it once based on the top referers list in Google
Analytics, and they were all in there hooting and hollering about role playing
their violent racist fantasies. I stopped renewing the domain name after that,
and the game's been offline ever since.

## Career Impact

It seemed like everyone in the Bristol tech scene in the mid 2010s had heard of
the nuclear landlord police report story. It was a pretty good ice breaker at
events for a while.

Attributing career progression to any individual piece of work is tricky. But I
did move jobs not long after all this. And I think having such a well-known
JavaScript side project helped a lot, because the new gig was my first ever
JavaScript job, after a very PHP-centric career up to that point.

That job also happened to be MixRadio, which led me directly to Spotify when it
later closed down. So I do reckon Global Thermonuclear War helped me escape the
UK. Maybe not directly. But I doubt I'd be sat here in Malmö today writing this
otherwise.

## The WebGL Demo Thing

It never sat well with me having such an important career milestone project just
be this offline app from the past. I wanted there to at least be _something_
online to show people. Eventually the idea came to me that I could probably make
some kind of watchable demo out of some of the old missile launch log data.

So now [there's that](https://henrycatalinismith.github.io/wargames/).

<figure>
  <video controls src="/2024/03/26/wargames@688x570.mp4" poster="/2024/03/26/wargames@688x570.webp" preload="none"></video>
  <figcaption>
    <a href="https://henrycatalinismith.github.io/wargames/">
      henrycatalinismith.github.io/wargames
    </a>
  </figcaption>
</figure>

It'll do! It gives a nice sense of the scale of the popularity the game reached
at its peak, and it preserves the sense of endlessness and pointlessness to the
conflict. It was fun as hell to build, too. And it means there's _something_,
not just an old readme.

## Krisen Eller Kriget

Being in the news as a suspected nuclear terrorist leaves you with a lingering
interest in the general topic. In 2018, the Swedish government sent everyone
these little booklets about what to do if there's a war. I was a little bit
obsessed with these. In them, they mention public fallout shelters.

<img
  lang="sv"
  alt="Skyddsrum och andra skyddande utrymmen.
Skyddsrum ska ge skydd ät befolkningen i krig.
Alla skyddsrum och byggnader med skyddsrum är märkta med skylt. Du tillhör inget särskilt skyddsrum utan anänder det som finns närmast.
Ta reda pä var ditt närmaste skyddsrum finns där du bor och där du befinner dig dagtid. Vid flyglarm ska du omedelbart bege dig till ett skyddsrum eller i nödfall till annat skyddande utrymme som källare, tunnel eller tunnelbanestation."
  src="/2024/03/26/skyddsrum@672x829.webp"
/>

Sweden has
[65000 of these fallout shelters](https://www.thelocal.se/20171101/why-sweden-is-home-to-65000-fallout-shelters).
Within a one block radius of my home, there are four. Within a one kilometre
radius, there are about 100. Remember what I said about life in Sweden making me
realise what a dump the UK was? Yeah, they don't have anything like this back
home. What kind of dickhead country builds one of the world's largest nuclear
arsenals but nowhere to shelter from its effects?

Anyway, I read a really captivating alternate history timeline last year called
[Protect & Survive](https://www.alternatehistory.com/wiki/doku.php?id=timelines:protect_and_survive).
It's about the UK in the aftermath of a global thermonuclear war in 1984, and
it's fucking horrible. Towards the end, the few survivors establish radio
contact with Sweden, who are doing comparatively well, I guess partly due to the
neutrality making us less of a target, and partly due to all these public
fallout shelters.

Been reflecting on that aspect of the story a fair bit recently. Sweden's NATO
membership got approved two weeks ago, and I found myself living in an EU & NATO
member state again, just like back in 2014. And I guess the fallout shelters
here are more directly valuable to me personally than the UK's nuclear warheads
ever were, so that's a solid upgrade. But wasn't the only winning move not to
play? Definitely was in my version of the game at least.
