---
title: Porting Zed's journal feature to Rex
tags: [blog]
layout: layout-post
---

Zed's killer feature IMO is the built-in journal. You run the
`journal::NewJournalEntry` command in the command palette (or map it to a
keyboard shortcut) and it dumps you in `~/journal/YYYY/MM/DD.md` ready to make
a quick note about something. I recently became very excited indeed about Rex
from Superlogical but wanted to bring this piece of Zed magic with me.

In exchange for about five minutes of propting I cooked up
[`journal.lua`](https://github.com/henrycatalinismith/dotfiles/blob/05c093a0a6e77c9c3f42b0ec7316da2ac8d0410e/dot_config/rex/journal.lua)
in my `~/.config.rex` directory. Pressing `⌘^J` opens a little [text input
field](https://gist.github.com/henrycatalinismith/ec46578e3536b96ffd6c900e4df2fb72)
that stores your input in `~/journal/YYYY/MM/DD.md` when you're ready. This
actually felt like a UX improvemnent on Zed because it makes the operation feel
more append-only. In Zed's journal I would become distracted by the sight of my
older entries when adding a new one whereas now I don't even need to see them
until I want to.

Even better though was once Rex's incredible API started to sink in for me and
it hit me that I can store "screenshots" to the journal too. So I hooked up
another shortcut at `⌘^3`, which reads the full text of the currently active
pane and stores that as a journal entry in its own right. So I can grab the
full UI state of even a TUI program (which are often a pain in the ass to
copypaste from normally) and chuck it effortlessly into my permanent record.

Here's a quick demo where I do a couple of placeholder command line operations,
save the entire result as a screenshot, and then chuck in a quick journal entry
about it as an afterthought.

<figure>
  <video controls preload="none"
    poster="/2026/11/06/journal-poster@960x666.webp">
    <source src="/2026/11/06/journal@960x666.mp4" type="video/mp4">
  </video>
</figure>

Rex is the absolute dog's bollocks and you should go sign up for the beta waitlist immediately.
