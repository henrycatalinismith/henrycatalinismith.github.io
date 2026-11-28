---
title: Zellij and Helix together might actually be just plain better than Neovim
image: /2025/12/06/lazygit-filename@1024x598.webp
tags: [blog, devtools]
layout: layout-post
---

For starters Helix is a masterpiece. Imagine Neovim with
[telescope](https://github.com/nvim-telescope/telescope.nvim),
[lspconfig](https://github.com/neovim/nvim-lspconfig),
[lspsaga](https://github.com/nvim-telescope/telescope.nvim),
[gitsigns](https://github.com/lewis6991/gitsigns.nvim), and
[which-key](https://github.com/folke/which-key.nvim) all built-in. It's a
finished piece of software as far as I'm concerned. The maintainers could
permanently feature freeze it today and I'd be happy. They're shipping a plugin
engine soon and I almost wish they wouldn't.

The reason I find the prospect of a plugin engine in Helix almost unnecessary is
that Zellij already acts as a limited plugin API. It's limited but it's enough.
By configuring keyboard shortcuts to fire up terminal utilities against the
current file in a Zellij pane you can easily streamline any workflows that would
otherwise require context switching into a shell.

For most of my career my workflow to read the commit log for a file has been to
[copy its relative path to the clipboard](/2025/11/27/copy-relative-path-to-file-in-helix/)
and then paste that into a terminal command. With Zellij and Helix I can
automate that with config like this.

```toml
[keys.normal.backspace]
h = ":sh zellij run --close-on-exit -f -x=1%% -y=4%% --width=99%% --height=92%% -- lazygit --filter \"%{buffer_name}\""
```

This enables me to invoke that same workflow with two keystrokes. Then I can
browse the history and when I'm finished, closing it drops me right back where I
was. I get to keep the exact same terminal-driven workflow as before and simply
upgrade its efficiency. Looks like this.

<figure>
 <video
  poster="/2025/12/06/lazygit-filename@1024x598.webp"
  src="/2025/12/06/lazygit-filename@1024x598.mp4"
  title="Terminal screenshot showing lazygit inside a Zellij pane"
  controls
  preload="none"
  playsinline>
 </video>
</figure>

So you have a core editor that's ready to use out of the box. And a terminal
workspace that makes it easy to integrate that editor with other terminal
software.

I think this is arguably superior to Neovim's excellent Lua plugin API and
ecosystem. The editor ships as a coherent finished product instead of a DIY kit.
Then the extensibility that does exist in the form of the Zellij magic is there
for streamlining integrations with external tools rather than for finishing off
an incomplete core editor.

Another thing I love about Helix is that the selection first approach to editing
makes it easier to visually follow what's going on. This is a lovely boost to
pair- or mob-programming sessions where the relative suddenness of Vim's editing
rhythm easily leaves collaborators feeling excluded and confused by what's
happening on the screen. The same is true of Helix's quick reference, which
means many keyboard shortcuts will be visually explained on the screen
immediately before they're invoked.

Integrating tools like lazygit is a natural extension of this inclusiveness.
_Loads_ of people use lazygit these days. Building workflows around well-known
tools like these instead of esoteric editor-specific plugins is a small but
meaningful opportunity to be a more inclusive collaborator.

I'm very happy with this setup. It's especially exciting that it's starting to
inspire me with little ideas for self-contained tools that would work well
within this workflow but don't yet exist. I hope I actually get around to
building one or two of them.
