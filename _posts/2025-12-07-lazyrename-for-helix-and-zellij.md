---
title: lazyrename for Helix and Zellij
image: /2025/12/07/demo@1024x722.webp
tags: [blog, devtools]
layout: layout-post
---

Earlier today I finally expelled
[a happy rant about Helix and Zellij](/2025/12/06/zellij-and-helix-together-might-actually-be-just-plain-better-than-neovim/)
that's been building up inside of me for weeks. And the instant it was out of me
I was itching to get the ball rolling on a tool I've been needing in this cosy
little ecosystem. In a few stolen moments of coding here and there throughout
the day I've managed to implement a rudimentary 0.0.0 version of a new tool I'm
calling [lazyrename](https://codeberg.org/henrycatalinismith/lazyrename/).

Renaming files is something the mainstream editors like VSCode have put a lot of
love into. If your new filename has stuff in it like spaces or funky punctuation
it's handled for you. If the destination path includes non-existent directories
they're created automatically. And once the new file's created the editor opens
it immediately. This kind of polish is valuable when you're arsehole deep in a
really hard problem and you just need to move some files around to get to the
next step, and it's been missing from Helix.

So lazyrename's purpose is to add that little bit of extra polish. It spawns
inside a Zellij pane where you simply edit the relative filename of the current
buffer and hit enter when you're done. Then it performs any necessary file
system operations, closes the pane, and re-opens your Helix buffer at the new
path. Looks like this.

<figure>
 <video
  poster="/2025/12/07/demo@1024x722.webp"
  src="/2025/12/07/demo@1024x722.mp4"
  title="Terminal screenshot showing lazyrename inside Helix"
  controls
  preload="none"
  playsinline>
 </video>
</figure>

I've been increasingly interested in Rust lately and have found myself watching
more and more videos about it. This project was my first time really trying to
build something with the language and I had an absolute shitload of fun with it.

It would be interesting to find out if this tool is of interest to others in the
Helix community so do please feel free to share this post or
[the Codeberg repo](https://codeberg.org/henrycatalinismith/lazyrename/)
wherever you think people might find it interesting. There's probably more
development potential in the project such as maybe using the LSP server to
update any references to the old filename in the repo so let's find out if this
is a "one and done" project or something with a little bit of legs!
