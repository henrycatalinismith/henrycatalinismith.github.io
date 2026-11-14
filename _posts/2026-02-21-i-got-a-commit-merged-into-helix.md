---
title: I got a commit merged into Helix!
image: /2026/02/21/bananas@1024x554.webp
tags: [blog, devtools]
layout: layout-post
---

After
[building lazyrename a couple of months ago](/2025/12/07/lazyrename-for-helix-and-zellij/)
I got curious about small ways of improving Helix's built-in file moving
functionality. The conclusion I came to was that a
[`fs::create_dir_all()`](https://doc.rust-lang.org/std/fs/fn.create_dir_all.html)
call would make a big difference all on its own, and so I set out to get that
added. The
[pull request finally got merged](https://github.com/helix-editor/helix/pull/15001/)
this week, which I'm really excited about.

My first attempt went off in the wrong direction by directly changing how
Helix's `:move` command works. I'm very grateful for the patient feedback that
guided me towards adding a `:move!` command instead. Helix uses that exclamation
mark suffix for things with side effects, and there was already a `:write!` for
creating necessary subdirectories when writing to a file.

Learning about Helix's internals has been really fun. It reminds me of some of
the more well-engineered stuff I've worked on, with a clear architectural vision
and lots of nice tidy structure.

I think the slow pace of development is probably a big factor in that. My pull
request sat unmerged for _months_ once it was ready. Eventually someone created
an issue about implementing it, and the merge happened when someone noticed the
work was already done. I've said before
[I think Helix is as good as a finished piece of software](/2025/12/06/zellij-and-helix-together-might-actually-be-just-plain-better-than-neovim/)
already and I stand by it.

This new command makes
[lazyrename](https://codeberg.org/henrycatalinismith/lazyrename) partially
obsolete. By
[adding a keymap](https://github.com/henrycatalinismith/dotfiles/commit/34879a8e4d627d1de3feaeb2c027787cac4d5be5)
that writes `:mv! %{buffer_name}` to Helix without pressing enter, you can
approximate most of that UX in a single line of config.

<figure>
 <video
  poster="/2026/02/21/bananas@1024x554.webp"
  src="/2026/02/21/bananas@1024x552.mp4"
  title="Demo of the :mv! command"
  controls
  preload="none"
  playsinline>
 </video>
</figure>

It's enough to let you edit the full relative path of the current buffer without
first having to type it in from scratch. For a Next.js project with lots of
`src/app/(something)/foo/baz/bar/page.tsx` where you're generally always moving
`page.tsx` to a new directory, that's probably enough. It lacks support for
things like Alt+Left to jump back to the previous word boundary, but the
increased simplicity might make that a good trade-off.

Very fun to have gotten a commit into the project anyway. In all those years of
Vim usage it never felt like contributing was anywhere near even being on the
horizon. Rust is so goddamn cool.
