---
title: Kubernetes homelab on an old MacBook Air
image: /2024/10/01/kubernetes-homelab-on-an-old-macbook-air@1024x768.webp
tags: [blog]
layout: layout-post
---

<figure>
  <img
    src="/2024/10/01/kubernetes-homelab-on-an-old-macbook-air@1024x768.webp"
    alt="Router, laptop and other computer equipment sitting together on a shelf"
  >
</figure>

Reflecting on
[the ten year milestone of using my Ergodox](https://henry.catalinismith.com/2024/08/18/ergodox-ten-years-later/)
the other day really got me thinking. Tech's so dominated by consumerism. It's
all very American really. Bigger is better and all that. Silly.

So instead here's a run through of quite a realistic, minimal homelab setup. It
lives on the shelf above our front door. And it's grown organically over time,
through reusing old equipment and avoiding buying loads of expensive new stuff.

## Modem

The big chunky boy on the left is our modem. This belongs to our ISP, and isn't
very good. I keep it standing up on its side like that so I can see the status
lights when the connection drops out. That happens a lot.

We actually only have one choice of ISP in our building. Recently it came out in
the news that
[landlords in Sweden are getting kickbacks from ISPs](https://www.dn.se/ekonomi/kickbacks-omsatter-miljarder-hamnar-pa-hyresgasternas-bredbandsnota/)
for monopolies like this one. So maybe that's why.

Anyway, its range isn't good enough to get a WiFi signal to any of the parts of
the apartment where it's needed. So it's bridged to the Google Nest WiFi router
next to it.

## Router

This Google Nest WiFi thing is practically a member of the family. It floods the
entire apartment with glorious internet. "Hey Google, stop" were some of the
kids' first words.

Sometimes I wonder what it must be like to grow up with a talking computer. What
it must do to your expectations about what it's possible for the computer to do.
Then I find myself doing a sarcastic impersonation of an American because it
can't understand "Hey Google, play BBC Radio Merseyside" unless you say it like
someone from California. Never mind.

It has a little ethernet port underneath, which is plugged into our NAS.

## NAS

Way back in the old country I had one of those AirPort Time Capsule things that
Apple don't make any more. There wasn't room for it when I packed to move to
Sweden, so it went in a cupboard in my parents' house for a good six or seven
years until they found it one day.

It'll be about ten years old soon and it still works. Homelab nerds would
probably cringe at the thought of using such an old single disk NAS. And sure,
it'll probably die soon. But we had zero disks before this showed up, and that
was basically fine. Not trying to compete with the Arctic World Archive here.

## Server

At some point in like 2021 I went to play
[Casual Sex In The Cineplex](https://open.spotify.com/album/3Nunc0C2S3K5heQ9VRQFPy)
on Spotify and it said "This content is not available". Still does today,
actually.

<figure>
 <img
  alt="Spotify screenshot where the tracks in the album Casual Sex In The Cineplex by Sultans of Ping FC are greyed out and a toast notification saying 'This content is not available' is displayed"
  src="/2024/10/01/not-available@1146x1224.webp"
 />
 <figcaption>Not available my arse.</figcaption>
</figure>

Anyway something snapped in me that day. A real "Hey, that's not the wallet
inspector" moment. I set up Plex on my laptop and put the album on there
instead. After a few days I realised this was something I was probably going to
keep using, so I dug out my old 2013 MacBook Air and moved the Plex server over
onto that. And that laptop has been a Plex server ever since.

Those old MacBooks didn't come with tons of storage, so it didn't take long to
fill up. Eventually I bought a 1TB external SSD. It still runs off that today.
Sometimes it fills up and I'll delete a show or a film to make space. Over time
I upgraded it to a nice Docker Compose & Traefik setup with some help from a
friend. Then later I installed Minikube and upgraded it to Kubernetes.

Old laptops are underrated homelab servers. For one, the battery means it
doesn't immediately die if the power goes out. That's a built-in UPS! Even
better though are the built-in speakers. If I'm away on a work trip I'll often
SSH into it while I'm FaceTiming with the kids and run
`say -vDaniel -r90 "Piss off naughty boys"`. I see a lot of very fancy rackmount
homelab clusters on YouTube and they never have speakers. Not one of them can
deliver the joy of watching two little boys running around laughing and shouting
"No _you_ piss off Google".

## Oh yeah, Kubernetes

Sorry, you're probably here from Google about the Kubernetes MacBook Air homelab
thing aren't you. Let's get into it then.

I'm running Minikube on this thing. It's a fairly standard traefik &
cert-manager setup. I've stopped bothering with setting up an automated dynamic
DNS thing, to be honest. My modem's public IP changes rarely enough that I don't
mind just logging into Cloudflare and updating it once every few weeks.

That's it though. It seems a bit maxed out with just that workload. I tried to
spin up Authentik on it once and the whole thing kind of died on its arse. CPU
fans roaring, pods getting evicted left and right, that kind of thing. It's
gonna need replacing with something proper before I can do more with it. So if
you're here from Google hoping to learn about running a badass k8s cluster on
your old MacBook Air, too bad. Can't be done, sorry. But do give "Piss off
naughty boys" a try sometime.
