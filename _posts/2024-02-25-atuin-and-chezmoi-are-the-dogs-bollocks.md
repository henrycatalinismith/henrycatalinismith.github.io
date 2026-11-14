---
title: Atuin and chezmoi are the dog's bollocks
image: /2024/02/25/atuin-stats@672x256.webp
tags: [blog, devtools]
layout: layout-post
---

My [dotfiles repo](https://github.com/henrycatalinismith/dotfiles) is the
oldest one I still have. Its
[first commit](https://github.com/henrycatalinismith/dotfiles/commit/0f498b9)
is from 2012. The message I wrote for that commit tells a familiar story.

> Fresh start for config files<br /> The old config repo had become bloated and
> unwieldy

I don't remember what went wrong, but evidently, things had had gotten out of
control. Synchronising development tools across multiple computers has always
been such a pain in the ass. Not any more though. 12 years later, I finally have
a setup in place that I'm happy with.

## Atuin

Losing shell history when swapping back and forth between different terminal
tabs or different computers has always been frustrating. It's an annoyance I'd
accepted as inevitable. For no particular reason, I recently became inspired to
question that inevitability, and found [Atuin](https://atuin.sh/) soon after.

No idea how I lived without this tool before. In particular, as
[someone who uses `ffmpeg` frequently](/2024/02/07/screencasting-secrets), it's
been amazing to be able to refer back to any given set of filters I've ever
used.

The end-to-end encrypted sync feature is a game changer as well. Having access
to your full shell history on every computer you use feels like it changes what
the terminal _is_ somehow. Brings it a bit closer to being an extension of you
or something, I don't know.

The stats are cool too. For example, `atuin stats -c 3` prints your top three
most-used commands.

<img style="object-fit: none" src="/2024/02/25/atuin-stats@672x256.webp" alt="[▮▮▮▮▮▮▮▮▮▮] 1626 git s
[▮▮▮ ] 616 git b
[▮▮▮ ] 604 yarn test
Total commands: 10268
Unique commands: 2091" />

My top command there – `git s` – is my alias for `git status`. Learning that I'm
running that so often made me realise that those fancy terminal prompts that
include git status info are worth the trouble. I'd stopped bothering with them
because of the dotfiles syncing problem, and this inspired me to check in and
see if it was solved yet. It was!

## chezmoi

There are a lot of [dotfiles tools](https://dotfiles.github.io/utilities/). Most
of them are effectively proof-of-concept in terms of the maturity level of the
implementation. Someone has a core idea they're excited about, they implement
that, then the project quietly goes into maintenance mode. What makes
[chezmoi](https://www.chezmoi.io/) the best isn't any particular concept – it's
the work that's gone into polishing the annoying details around the edges.

In my case, I just wanted to use it to set up oh-my-zsh automatically and keep
the config in sync between different computers. There's an
[example in the chezmoi docs showing how to do exactly this thing](https://www.chezmoi.io/user-guide/include-files-from-elsewhere/).

```toml
[".oh-my-zsh"]
    type = "archive"
    url = "https://github.com/ohmyzsh/ohmyzsh/archive/master.tar.gz"
    exact = true
    stripComponents = 1
    refreshPeriod = "168h"
```

I was blown away by how easy it was to set that up. Syncing a few little
personal config files has always been the easy part, and it's generally these
externally-sourced configs where things become difficult. You always get it
syncing eventually, but it breaks along the way and so the end result feels
brittle. Somehow chezmoi has cracked it. For once this feels like it will work
on the first try when I next have to set up a new computer.

## Things are good

I'm in a really good place at the moment when it comes to tools. Shipping 666a
with
[SQLite as its production database](/2024/01/14/my-sqlite-in-production-epiphany)
was a huge personal revelation, going
[all-in on VSCode terminal](/2024/01/30/maining-vscode-terminal) has decluttered
my workflow, and doing a bunch of React Native at work is scratching a really
longstanding itch. I'm getting tons done and feeling happy in the process.

Interestingly, the creator of Atuin has
[quit her day job to found a company and work on Atuin full time](https://ellie.wtf/posts/i-quit-my-job-to-work-full-time-on-my-open-source-project).
Will be fun to see what happens next there.
