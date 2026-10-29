---
title: Copy relative path to file in Helix
tags: [blog, devtools]
layout: layout-post
---

In recent weeks I've accidentally migrated from Neovim to Helix. I say
"accidentally" because I wasn't really intending to switch. There was a
[post on Lobste.rs called "Notes on switching to Helix from vim"](https://lobste.rs/s/rahklm/notes_on_switching_helix_from_vim)
that I read about a month ago, which inspired me to give Helix a bit of a try.
My expectation had been that it'd be an interesting experiment but instead I
found myself choosing to use Helix all the time.

I just love how snappy and minimalist it is. Helix has everything I need and
nothing I don't. For example, while I really like the "added, removed and
updated" lines thing that it has, I've never gotten along with in-depth VCS
integrations relating to e.g. browsing a file's history within text editors or
plugins. For that kind of stuff I've always preferred to just work in the
terminal itself so Helix's plus/minus/delta colours in the gutter are all I want
from it.

That being said, the one missing step is the ability to copy the current file's
relative path to the clipboard so that it can be pasted into some git command in
another tab. This proved possible to implement as a keybinding as follows.

```toml
[keys.normal.space.z]
p = ":sh echo \"%{buffer_name}\" | pbcopy"
```

I'm using "space z" as a prefix because Helix's default keybindings already use
almost the entire keyboard except for that. So for me "space z" is like a
personal namespace for any custom keybindings where I can pick any letter I want
without conflicting.
