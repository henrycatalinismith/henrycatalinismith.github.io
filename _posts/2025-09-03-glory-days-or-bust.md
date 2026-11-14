---
title: Glory Days Or Bust
image: /2025/09/03/vscode@512x256.webp
tags: [blog, devtools]
layout: layout-post
description: >
  The road back to my coding happy place, i.e. a terminal emulator running Vim.
---

18 months ago I was all-in on VSCode. lol

> Once upon a time, the main tools I used for work were Vim and tmux. And until
> recently, once every few months I'd get this compulsive urge to try to
> recapture those glory days. That urge has stopped lately though. Visual Studio
> Code has reached a tipping point where the Vim support and terminal emulator
> are a better package than anything I can hack together with lua plugins and
> tmux config.
>
> [Maining VSCode Terminal](/2024/01/30/maining-vscode-terminal/)

Hasn't aged well! Have you seen the VSCode website lately?

![The open source AI code editor](/2025/09/03/vscode@512x256.webp)

Yikes!

<figure>
 <video controls preload="none" poster="/2025/09/03/glwat@512x384.webp">
  <source src="/2025/09/03/glwat@512x384.mp4" type="video/mp4">
 </video>
</figure>

So now I'm all-out. It's glory days or bust!

Real happy with
[my init.lua](https://github.com/henrycatalinismith/dotfiles/blob/main/dot_config/nvim/init.lua)
for Neovim. Doing Vim config in Lua is such a dream come true. For everyday
work, my core needs are simple enough.

1. LSP diagnostics (to highlight my mistakes)
2. Git integration (to highlight my changes)
3. Format on save

Those use cases are so mainstream that you're spoiled for choice regarding how
to set them up. I landed on [lspsaga](https://github.com/nvimdev/lspsaga.nvim),
[gitsigns](https://github.com/lewis6991/gitsigns.nvim) and
[conform](https://github.com/stevearc/conform.nvim).

<figure>
 <img
  alt="Screenshot of neovim editing this blog post. The text displayed is the same as the text preceding this image."
  src="/2025/09/03/screenshot@1024x635.webp"
 />
</figure>

It's such an incredible relief to be back working in proper Vim instead of some
IDE's bootleg reimplementation. You really learn to appreciate how finely
crafted Vim's core text editing functionality is by spending a few years seeing
talented people trying and failing to reproduce it in competing software time
and time again. Zed's implementation was decent, but even that had quirks I
never quite got used to.

[Zellij](https://zellij.dev/) is fantastic too. It's like a fully configured
tmux right out of the box. And while keybinding conflicts between Vim and tmux
used to be a big pain in the ass, with Zellij I've managed to move all its
keybindings onto the ⌘ key where there's no conflicts at all. Its vanilla
out-of-the box UX is what I've been trying (and failing) to coerce VSCode or Zed
to be all these years too.

Wasn't such a difficult switch to make in the end. This community-built tooling
has become _really_ fucking slick over the last few years. And with all the
commercial tooling focusing so intensely on AI it seems reasonable to expect
that balance to continue to shift in the coming years. I mean if you're a
product manager on VSCode and all your KPIs are about AI, why even prioritise
fixing code editing bugs if a degraded coding experience could arguably drive AI
adoption?

Nice being rid of tools that are funded with blood money and all. Did you know
[Microsoft recently fired](https://www.aljazeera.com/news/2025/8/29/microsoft-fires-four-workers-over-protests-against-firms-ties-to-israel)
a group of [No Azure For Apartheid](https://noazureforapartheid.com/)
protestors? Or that Zed recently took money from
[Shaun Maguire & co](https://shaunmaguire.fyi/)? Increasingly I find myself
wanting as few points of contact with this type of depravity as humanly possible
in my everyday life.

I had actually underestimated how good this integrity boost would feel. Seems I
had become quite numb to the dissonance of sharing in the mundane everyday
spoils of a genocidal war I was otherwise willing to
[boycott a beloved event for](/2024/05/12/eurovision-week/). Cool as hell to
discover that the high road is increasingly the best one too these days, at
least when it comes to devtools.
