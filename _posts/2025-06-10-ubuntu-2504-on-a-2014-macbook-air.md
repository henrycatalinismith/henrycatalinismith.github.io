---
title: Ubuntu 25.04 on a 2014 Macbook Air
tags: [blog]
layout: layout-post
---

The old MacBook Air I'd been
[running k8s on](/2024/10/01/kubernetes-homelab-on-an-old-macbook-air/) had
become a bit problematic. The battery's gone very bad, and newer versions of
macOS have begun to run very poorly on it. After macOS Tahoe, Apple's
[ending support for these old Intel Macs completely](https://arstechnica.com/gadgets/2025/06/macos-tahoe-signals-that-the-end-is-near-for-intel-macs-dumping-all-but-four-models/)
too. Time to make a change!

It makes sense to deal with the battery later once we've shown we can save the
rest of the hardware, so step one was to install Ubuntu. Harder than expected!

First thing I did was to download `ubuntu-25.04-desktop-amd64.iso`. This boots
to GRUB, where you get these four options.

1. Try or Install Ubuntu
2. Ubuntu (safe graphics)
3. Boot from next volume
4. UEFI Firmware Settings

Couldn't get further than this, though. Options 1 and 2 both just led to a black
screen of death. Through Googling I found various forum posts suggesting
different boot flags to try. None of that helped either.

I've been away from desktop Linux for about 15 years and I'm very out of date
with the modern troubleshooting techniques. One new thing I learned this time is
that YouTube videos have become a key source of information for this kind of
thing. In a video by someone called "Level 2 Jeff" titled
[Resurrecting my ancient MacBook Air with Ubuntu Linux](https://www.youtube.com/watch?v=1G0v5s1nEZk)
I saw the exact same problem resolved by booting from an older Ubuntu ISO.

Starting again with `ubuntu-20.04.6-desktop-amd64.iso` and choosing
`Ubuntu (safe graphics)` proved successful. From there, it was a matter of
following the
[upgrade instructions](https://ubuntu.com/tutorials/upgrading-ubuntu-desktop) to
upgrade to the latest version.

So far so good! And Linux looks a lot better than I remember. With any luck this
could be the first step in a journey out of a dependence on proprietary American
tech!
