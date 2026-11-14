---
title: PICO-8 language server for Helix
image: /2026/01/24/google@1400x654.webp
tags: [blog, devtools, gamedev]
layout: layout-post
---

Been working on this one PICO-8 game on and off for like five years now. Having
[switched to Helix](/2025/12/06/zellij-and-helix-together-might-actually-be-just-plain-better-than-neovim/)
since the last time I touched it, I needed to set up the PICO-8 language server
for Helix first. It felt like nobody had glued together this combination of
tools before.

<figure>
 <img
  alt="Google screenshot showing query 'PICO-8 language server for Helix' and result 'Your search - PICO-8 language server for Helix - did not match any documents.'"
  src="/2026/01/24/google@1400x654.webp"
 />
 <figcaption>
  Some of us are still out here Googling and understanding things before doing them
 </figcaption>
</figure>

A
[very useful comment](https://github.com/japhib/pico8-ls/issues/34#issuecomment-1413433466)
on a GitHub issue thread about Neovim integration was the magic ingredient.
After carrying out the suggested steps there and hooking it up inside
`~/.config/helix/languages.toml` I was in business.

<figure>
 <img
  alt="Helix screenshot showing some PICO-8 Lua code with the cursor on a poke() call and a popup window displaying the API documentation for poke()"
  src="/2026/01/24/helix@1510x1504.webp"
 />
 <figcaption>
  Using the language server in the source code of my game <a href="/tailbone">Tailbone</a> to pull up the docs for <code><a href="https://pico-8.fandom.com/wiki/Poke">poke()</a></code>.
 </figcaption>
</figure>

You can see my full dotfiles commit adding the necessary `languages.toml`
entries over on Codeberg at
[`d7a2c21`](https://github.com/henrycatalinismith/dotfiles/commit/d7a2c218fabdedd263f3adfc2ff118c131b92133).
In case Codeberg's down (usually due to DDoS by crawlers belonging to AI
startups) the TOML is as follows.

```toml
[[language]]
name = "lua"
file-types = ["p8"]
language-servers = ["pico8-ls"]

[language-server.pico8-ls]
command = "pico8-ls"
```

Gamedev in PICO-8 and text editing in Helix have a similar kind of vibe. It's
the creative limitations thing I think. Being within a somewhat limited platform
encourages you to focus on your own creative output instead of becoming
distracted by the infinite possibilities of a perfectly flexible context.

And now hopefully that Google results page will be better for the next person
who comes along researching how to do this. Something tells me the intersection
of PICO-8 devs and Helix users is a crowd who are relatively more interested in
solving problems through research and understanding rather than vibecode
spray-and-pray so this feels like an appropriate kind of How I Fixed X blog post
for keeping the Old Ways alive.
