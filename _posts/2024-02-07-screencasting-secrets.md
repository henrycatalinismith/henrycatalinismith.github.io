---
title: Screencasting Secrets
image: /2024/02/07/screenshot@1024x640.webp
tags: [blog, accessibility, devtools]
layout: layout-post
---

Screencasting is my secret weapon as a remote software engineer. I'm one of
those people who just wants to go fast all the time, and you get to move a lot
faster once you get good at showing people what you've made and putting them at
ease about the idea of shipping it. At any job, one of the most common questions
I hear is "How do you do all those GIFs and videos and screenshots and stuff?".
Here's how.


## Text is first

Working well with plain old text is a prerequisite for any kind of screencasting
success. Deep down it's the same thing: you're trying to get information from
your head into someone else's. If your written communication isn't clear, your
screen recordings won't be either.

Think about how you report bugs, for example. The phrase "it's broken" might
mean anything from "it's crashing on startup for 100% of users" to "I don't feel
like the performance is reliable enough". The phrase "the numbers are wrong"
might mean something as severe as "these miscalculations will get us sued by the
tax authorities" or as minor as "we're showing too many decimal places here". If
your text communication style is vague, your screenshots and screen recordings
will probably be vague too.

The trick with the bug report example is to think about what your expectations
were, contrast them with what actually happened, and write something that
conveys the difference between the two as clearly as possible. It's a thought
process that requires you to put yourself in the shoes of the audience and take
the time to shape the message around their perspective. Half the ingredients of
success when producing a video or screenshot of something is applying that same
thought process in a visual way.

## Screenshots

The simplest thing to share is often a screenshot. If something can be conveyed
in a static image, it's almost always preferable to do so rather than deal with
the extra headaches that come with video. The principles of taking good
screenshots, such as tailoring the framing and sizing to suit the target
platform and audience, are fundamental to good screen recordings too.

You can take a screenshot of your entire desktop by pressing ⌘⇧3. That's usually
the wrong option though. It's almost always better to use ⌘⇧4 and then select a
region using the mouse. Another great option is to press ⌘⇧4, then space, and
then click on a window to take a screenshot of it. In the following video, I'll
demo all three of these, in the same order as they're written.

<figure>
  <video src="/2024/02/07/screenshot@1024x640.mp4" poster="/2024/02/07/screenshot@1024x640.webp" controls preload="none"></video>
  <figcaption>
    I'm using <a href="https://appahead.studio/apps/keystroke-pro/">Keystroke Pro</a> in the video above to visualise the key presses. It's a tool I recommend very highly. It comes in especially handy if you need to screencast a series of keyboard interactions like this one.
  </figcaption>
</figure>

Even the humble screenshot has some nuances that are worth thinking about. Where
will you upload your screenshot and how much space is available for it there?
What size is optimal to help your audience understand your point as easily as
possible? If there are multiple windows involved, is there some way you can
rearrange them to structure the information in the screenshot more clearly?

If you're posting something on a GitHub issue or pull request, for example,
you'll have about 800px of width to play with. Could it work for you to resize
the window in preparation for your screenshot so that it doesn't appear too
zoomed out and squished there? For
[before/after screenshots](https://github.com/zetkin/app.zetkin.org/pull/1631),
it fits particularly well if both screenshots are a common mobile resolution.

## Annotated screenshots

Sometimes your screenshots need a little extra something. Like occasionally it's
just easier to
[visually highlight some detail](https://github.com/zetkin/app.zetkin.org/pull/1641)
in there with an annotation. For this, I use Skitch.

Awkwardly,
[Evernote acquired Skitch back in 2011](https://techcrunch.com/2011/08/18/evernote-acquires-image-sharing-site-skitch/),
and in recent years it's basically become abandonware. But for now at least, you
can still do `brew install --cask skitch`, and it'll run. In theory you can do
⌘⇧5 to take screenshots directly into Skitch, but in practice that's been broken
for years, so I take them with the macOS native ⌘⇧4 and then drag & drop them
into Skitch like this.

<figure>
  <video src="/2024/02/07/skitch@1024x640.mp4" poster="/2024/02/07/skitch@1024x640.webp" controls preload="none"></video>
  <figcaption>
    I'm using the ⌘-Space keyboard shortcut here to open Skitch using <a href="https://support.apple.com/guide/mac-help/search-with-spotlight-mchlp1008/mac">Spotlight</a>.
  </figcaption>
</figure>

It's a shame Skitch is slowly dying. I've been recommending it to colleagues
since like 2015, and still occasionally see someone I introduced it to share
something annotated with it on social media. Will be sad when that connection is
finally broken.

## Animated GIF screen recordings

You can get a lot done with screen recordings in animated GIF format. They're
incredibly versatile, because almost all chat & collaboration platforms allow
you to post GIFs. [Gifox](https://gifox.app/) is the best app for this, and well
worth the cost.

Fear of failure holds people back from trying this. People worry it'll require
advanced technical skills. It doesn't. Here's a video of the full end-to-end
recording and editing workflow to produce one GIF. It takes less than a minute.

<figure>
  <video src="/2024/02/07/gifox@1024x640.mp4" poster="/2024/02/07/gifox@1024x640.webp" controls preload="none"></video>
  <figcaption>
    This is what it looks like to create a screencast GIF using Gifox. The app I'm using as an example to record is <a href="https://github.com/IvanMathy/Boop">Boop</a>.
  </figcaption>
</figure>

Gifox gives you lots of control over how to export your GIF. The one I use most
often is the resizing option, which is why I made sure to demo it in the video
above. Big animated GIFs take so long to load that nobody will watch your video,
and scaling down is an easy way to avoid this. Most of the time you don't really
need a full 100% original size GIF either.

The secret to doing these things right is to keep them short. Animated GIFs
almost never have playback controls, so your audience has no way to rewind or
pause your video. And longer GIFs will exceed most platforms' upload file size
limits anyway.

Another thing to bear in mind is that GIFs loop. Sometimes it's necessary for
the clarity of the video that the end point should be very distinctive. Other
times it's super nice to make the loop completely seamless. It's a case-by-case
thing and you get a feel for it after a while.

## Video screen recordings

When something won't fit within the limitations of the GIF format, I'll fire up
QuickTime and do a screen recording instead. This has a similar workflow to
Gifox. You select an area to record, do your demo, end the recording with the
little taskbar stop button, and then press ⌘T to trim the clip.

<figure>
  <video src="/2024/02/07/quicktime@1024x640.mp4" poster="/2024/02/07/quicktime@1024x640.webp" controls preload="none"></video>
  <figcaption>
    I made all the other videos for this post using this workflow. <em>This</em> one took some fucking doing though.
  </figcaption>
</figure>

It's worth checking the options before hitting `Record`. Pay particular
attention to the microphone setting. Most of the time you'll want to set this to
`None`. Nobody needs to hear the background hum of your dishwasher while you
demo your new feature or whatever you're recording.

QuickTime will output a fairly chunky `.mov` file at the end of this. I tend to
use `ffmpeg` to scale these down and convert them to `.mp4`. This will often cut
the file size from tens or hundreds of megabytes down into the 1MB-ish range.

```bash
ffmpeg -i words.mov -vf "scale=iw/2:ih/2" words.mp4
```

## Video screen recordings with system audio

When I need to include system audio in a screen recording, I reach for Rogue
Amoeba's excellent [Loopback](https://rogueamoeba.com/loopback/) app. Nine times
out of ten, if I'm doing this it's because I want someone to hear what a screen
reader interaction with their UI sounds like. For this, I have a premade
VoiceOver virtual device configured in Loopback. It just needs switching on, and
then it's available as a microphone in QuickTime's recording options.

<figure>
  <video src="/2024/02/07/loopback@1024x640.mp4" poster="/2024/02/07/loopback@1024x640.webp" controls preload="none"></video>
  <figcaption>
    This one's complex enough that I figured it's helpful to make <a href="/2024/02/07/voiceover@1024x640.mp4" target="_blank">the resulting screen recording</a> available so that you can see for yourself that the screen reader announcement audio has been captured in the recording.
  </figcaption>
</figure>

For screen reader announcements in particular, it's often overkill to go to
these lengths. I've mainly found it useful when working in partnership with
blind people to evaluate and improve complex ARIA implementations. For
demonstrating screen reader announcement changes to sighted colleagues I've
often found it sufficient to show them
[animated GIFs with VoiceOver's visual announcement visible in the viewport](https://github.com/zetkin/app.zetkin.org/pull/1724).

## Give it a try

You don't need to wait for your employer to approve budget for some expensive
3rd party SaaS screencasting platform like Loom. Fancypants extras – like
enabling you to overlay a video of yourself talking on your screencasts – might
sound like gamechangers. But I think most of the outcome in these techniques
depends on whether or not you personally engage with communication as a craft in
itself, and you don't necessarily need to add another subscription to your
monthly bills if you're willing to learn your way around a handful of standalone
tools.

Sighted people bloody _love_ a visual demo, and catering to that preference is
an underutilised way to speed up feedback loops and build trust and consensus
around shipping things sooner. If you take away nothing else from this, I hope
you install Gifox today!
