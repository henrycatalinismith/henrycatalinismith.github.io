---
title: Testing in JAWS on a Mac
image: /2026/03/25/jaws@1024x726.webp
tags: [accessibility, blog, devtools]
layout: layout-post
---

A
[tricky-looking screen reader bug in Forgejo](https://codeberg.org/forgejo/forgejo/pulls/10615)
inspired me to spin up a JAWS testing environment on my Mac.

JAWS is one of the most widely used screen readers in the world and its
behaviour is quite different to the VoiceOver screen reader that Apple
ships with macOS. I've always been a little bit in awe of accessibility pros
who have a JAWS testing setup, and have long wanted to join that club. Here's
how it went down!

## Install VMWare

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

<figure>
 <img
  alt="
   The VMWare download page, saying VirtualBox Platform Packages
   Windows hosts
   macOS / Intel hosts
   macos / Apple Silicon hosts
   Linux distributions
   Solaris hosts
   Solaris 11 IPS hosts
  "
  src="/2026/03/25/vmware@1434x856.webp"
 />
 <figcaption>
  I clicked 'macOS / Apple Silicon hosts'.
 </figcaption>
</figure>

## Download Windows 11

[https://www.microsoft.com/en-us/software-download/windows11arm64](https://www.microsoft.com/en-us/software-download/windows11arm64)

<figure>
 <img
  alt="Website screenshot saying Download Windows 11 for Arm-based PCs"
  src="/2026/03/25/windows11@1426x846.webp"
 />
</figure>

## Buy a Windows 11 product key

[https://www.gamekeys.se/produkt/windows-11-home-retail](https://www.gamekeys.se/produkt/windows-11-home-retail)

<figure>
 <img
  alt="Website screenshot saying gamekeys.se, Windows 11 Home Retail, 129kr"
  src="/2026/03/25/gamekeys@1428x840.webp"
 />
</figure>

## Start Windows

<figure>
 <img
  alt="
   Installing 42%
   Please keep your computer on.
   Your computer may restart a few times.
  "
  src="/2026/03/25/installing@1566x1019.webp"
 />
 <figcaption>
  This part took a while.
 </figcaption>
</figure>

## Install JAWS

[https://support.freedomscientific.com/Downloads/JAWS](https://support.freedomscientific.com/Downloads/JAWS)

<figure>
 <img
  alt="
   Pertorming JAWS Install
   Press Escape to Cancel
   Status: Acquiring…
  "
  src="/2026/03/25/jawsinstall@1732x1223.webp"
 />
</figure>

## Start JAWS

Starting JAWS at this point was as simple as double clicking its icon in the
Windows start menu. You get a 40 minute free trial before needing to pay for
JAWS, which is more than enough for typical exploratory manual testing. Here's
the screen recording I produced while attempting to reproduce the Forgejo bug.

<figure>
 <video
  controls
  loop
  muted
  playsinline
  preload="none"
  poster="/2026/03/25/jaws@1024x726.webp"
  src="/2026/03/25/jaws@1024x724.mp4"
 ></video>
</figure>

Reproducing the bug in this case would have meant JAWS not picking up the
relationship between the checkboxes and their labels. A blind user has reported
that the use of JavaScript to dynamically insert `for` and `id` attributes to
retrofit proper relationships onto form controls isn't working for their screen
reader, and I thought this sounded like a likely JAWS issue, with the worst
case scenario being that all JAWS users might be affected.

The video above enables us to rule out that worst case scenario. I've replied
[asking for more detailed information](https://codeberg.org/forgejo/forgejo/pulls/10615#issuecomment-12053496)
about the environment necessary to reproduce the problem.

Setting this up cost me 120kr and about 45 minutes of my time. Wasn't even half
as tricky as I'd always imagined it'd be. I'm excited to see what kind of
trouble I can find now that I'm armed with this new capability!

