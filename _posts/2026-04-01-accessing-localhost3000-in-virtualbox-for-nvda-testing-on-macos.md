---
title: Accessing localhost:3000 in VirtualBox for NVDA testing on macOS
image: /2026/04/01/nvda@1024x724.webp
tags: [accessibility, blog, webdev, devtools]
layout: layout-post
---

After [getting my JAWS setup in place](/2026/03/25/testing-in-jaws-on-a-mac)
recently, NVDA was next on the agenda. It was easy enough to install, which
left me with enough leftover time and energy to make an attempt at loading
[http://localhost:3000](localhost:3000) on it in order to be able to test
unmerged changes. It went better than expected!

I found out you can use [http://10.0.2.2:3000](10.0.2.2:3000) to access
port 3000 on the host machine. No config needed.

<figure>
 <video controls preload="none" poster="/2026/04/01/nvda@1024x724.webp">
  <source src="/2026/04/01/nvda@1024x724.mp4" type="video/mp4">
 </video>
</figure>

Very cool indeed to be this well-equipped. NVDA is a little bit nicer to use
somehow than JAWS, too.

Plus, since setting up the JAWS thing, I learned that it's a violation of the
license to use the trial version of JAWS for accessibility testing. So NVDA
seems like it's going to be my go-to option for Windows screen reader testing.
