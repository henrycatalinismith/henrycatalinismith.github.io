---
title: Passport Hacking
image: /2022/11/09/passport-hacking-running-poster@768x432.webp
tags: [blog, webdev]
layout: layout-post
---

The passport system in Sweden collapsed earlier this year when pandemic travel
restrictions lifted and half the country tried to renew their passports at once.
In March I tried to book an appointment to get passports for the kids so they
could visit their extended family for the first time. The date I got was in
October.


<figure>
 <img
  src="/2022/11/09/passport-hacking-passexpedition@768x640.webp"
  alt="Waiting room with fluorescent lights and an LED sign showing current queue positions. Wooden benches in the foreground. Behind them are several booths with curtains around them for taking flash photos inside."
 />
 <figcaption>
  In Sweden you have to go to one of these special offices where a cop literally watches you pose for your passport photo.
 </figcaption>
</figure>

## Pass für alle

By May the crisis was so bad that
[Pass für alle](https://github.com/jonkpirateboy/Pass-fur-alle) went viral. This
was a bit of JavaScript that could automatically refresh the passport booking
page and grab earlier slots.

It helped a few Stockholm people I knew get a better appointment, but it wasn't
working for me down in Skåne. In Stockholm there was more of everything: more
passport offices, more cancellations, more new booking slots available. In Skåne
there was less activity, so the script needed to run longer to get results. And
there's only one passport office per town here, so the logistics are more
complicated.

I _really_ wanted to get the kids to the UK during the summer if possible so
that we wouldn't spend the whole trip indoors. So I set about building my own
Skåne-friendly version of Pass für alle.

## Beep boop

The first thing I did was make it beep. Skåne's slower pace meant it wasn't
practical to sit and watch the screen. The beeping meant the laptop could be
across the room and I'd know how it was going without looking.

### Beep beep

First up: some constant high pitched beeping.

```javascript
setInterval(() => {
  sfx(pow2(9), "triangle", pow2(8))
}, pow2(10))
setInterval(() => {
  sfx(pow2(9), "triangle", pow2(8))
}, pow2(11))
```

<figure>
 <audio
  controls
  src="/2022/11/09/passport-hacking-beep-beep.mp3"
 ></audio>
 <figcaption>
  Beep beep
 </figcaption>
</figure>

That made for a nice loud heartbeat so that the sudden silence would be
noticeable if anything broke and it stopped running. It's quite a high-pitched
and annoying sound, but it had to compete with the noise from two small kids.

### Boop boooooop

The most common thing to happen after reloading the page was for no appointments
to be found. This needed a noise too.

```javascript
sfx(20, "square", 500)
  .then(() => wait(10))
  .then(() => sfx(40, "square", 4000))
```

<figure>
 <audio
  controls
  src="/2022/11/09/passport-hacking-boop-boooop.mp3"
 ></audio>
 <figcaption>
  Boop booooop.
 </figcaption>
</figure>

I kept the pitch low for this one. The script failed like 99.99% of the time so
this didn't need a lot of attention. Plus from a musical perspective it combined
quite nicely with the high pitch of the page load heartbeat like this.

### Beep beep boop

Sometimes there would be an appointment a few towns away. As long as it was late
enough to get there in time by train this was great news! A nice high pitched
alert sound announced this scenario.

```javascript
sfx(600, "sawtooth", 400)
  .then(() => wait(10))
  .then(() => sfx(400, "sawtooth", 420))
  .then(() => wait(10))
  .then(() => sfx(200, "sawtooth", 440))
```

<figure>
 <audio
  controls
  src="/2022/11/09/passport-hacking-beep-beep-boop.mp3"
 ></audio>
 <figcaption>
  Beep beep boop.
 </figcaption>
</figure>

### Boop boop beep

The best case scenario was an appointment here in Malmö. A triumphant little
chirp was the sound for this.

```javascript
sfx(400, "triangle", 500)
  .then(() => wait(10))
  .then(() => sfx(500, "triangle", 220))
  .then(() => wait(10))
  .then(() => sfx(600, "triangle", 240))
```

<figure>
 <audio
  controls
  src="/2022/11/09/passport-hacking-boop-boop-beep.mp3"
 ></audio>
 <figcaption>
  Boop boop beep!
 </figcaption>
</figure>

## The finished product

If you're interested, you can read
[the full source code](/2022/11/09/passport-hacking-script.js). For a few days I
ran that for several hours at a time. Here's a little ten second taste of that
experience.

<figure>
 <video
  poster="/2022/11/09/passport-hacking-running-poster@768x432.webp"
  src="/2022/11/09/passport-hacking-running@768x432.mp4"
  title="Macbook with the code linked above visible on screen and an excited baby repeatedly hitting the keyboard with his hand."
  controls
  preload="none"
  playsinline>
 </video>
 <figcaption>
  The secret ingredient is violence.
 </figcaption>
</figure>

## Climactic Ending

Around about the same time as I got this running, the police increased their
capacity and added a bunch of new times. The instant they did that I got a
next-day booking the old fashioned way. lol.
