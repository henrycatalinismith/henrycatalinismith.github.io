---
title: Maining VSCode Terminal
tags: [blog, devtools]
layout: layout-post
---

Once upon a time, the main tools I used for work were Vim and tmux. And until
recently, once every few months I'd get this compulsive urge to try to recapture
those glory days. If you know, you know.. That urge has stopped lately though.
Visual Studio Code has reached a tipping point where the Vim support and
terminal emulator are a better package than anything I can hack together with
lua plugins and tmux config.

Turning VSCode into something that feels cosy for this type of retro workflow
preference doesn't even take a lot of configuration. Here's how I'm doing it.

## Editor

The editor is basically good to go once you install the
[Vim plugin](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
and make one or two tweaks. By default, VSCode does a lot of automatic closing
of brackets and tags and such. Some people love this. For me it just feels like
that Sorcerer's Apprentice scene with the out-of-control magic brooms in
Fantasia, so I gotta turn it all off.

```jsonc
"editor.autoClosingBrackets": "never",
"editor.autoClosingDelete": "never",
"editor.autoClosingOvertype": "never",
"editor.autoClosingQuotes": "never",
"html.autoClosingTags": false,
"javascript.autoClosingTags": false,
"typescript.autoClosingTags": false,
```

That's about it, actually. The rest is handled by
[extensions](https://github.com/stars/henrycatalinismith/lists/vscode).

## Terminal

The terminal is where most of the tweaking is necessary. The default setup
caters for limited use cases – stuff like opening it in the morning to run
`yarn start` and then closing it in the evening. If you're using the terminal
more like an IDE, it needs a little bit of extra juice.

### Colors

VSCode's terminal has this incredible
[minimum contrast ratio option](https://code.visualstudio.com/docs/editor/accessibility#_minimum-contrast-ratio)
that I can't live without any more. This option alone might be enough to
convince many people to switch from other terminal emulators. Ever used a
program in the terminal whose ANSI colors contasted so little with your
background color that the text became effectively invisible? Crank up this
setting to 4.5 and VSCode will automatically detect and fix that whenever it
happens.

```jsonc
"terminal.integrated.minimumContrastRatio": 4.5,
```

I've been using Solarized for pretty much my whole career, and I love that
VSCode ships with it included. It also ships with what I consider to be
Solarized's worst flaw: the "bright" version of the palette is a gross soup of
grays and oranges. VSCode makes it real easy to patch this though. I tend to
just duplicate the regular palette, and then trust the magic of the minimum
contrast ratio setting to fix any trouble this causes.

```jsonc
"workbench.colorTheme": "Solarized Dark",
"workbench.colorCustomizations": {
  "gitlens.trailingLineForegroundColor": "#93a1a1",
  "terminal.ansiBrightBlack": "#002b36",
  "terminal.ansiBrightBlue": "#268bd2",
  "terminal.ansiBrightCyan": "#2aa198",
  "terminal.ansiBrightGreen": "#9bb300",
  "terminal.ansiBrightMagenta": "#d33682",
  "terminal.ansiBrightRed": "#dc322f",
  "terminal.ansiBrightWhite": "#fdf6e3",
  "terminal.ansiBrightYellow": "#b58900"
}
```

### Keyboard

The keyboard shortcuts to control the terminals are the other big thing to
address. Once you've experienced tmux it's hard to accept the rigidity of just
having one little panel you can toggle below the code that requires mouse
interactions for half its functionality.

First up is the focus management. I need to be able to toggle focus back and
forth between the editor and the terminal easily. The following
`keybindings.json` entries configure ⌘&darr; to focus the terminal and ⌘&uarr;
to focus the editor.

```jsonc
{
	"key": "cmd+up",
	"command": "workbench.action.focusActiveEditorGroup",
	"when": "terminalFocus"
},
{
	"key": "cmd+down",
	"command": "workbench.action.terminal.toggleTerminal",
	"when": "!terminalFocus"
}
```

When I'm working in the terminal, I want common shortcuts like ⌘T and ⌘W to open
and close terminal tabs like they would in iTerm2. In VSCode there are two
contexts a terminal can be open in: either the panel, or the editor area. The
default keyboard controls for these two contexts are different, and the
following `keybindings.json` entries standardise them across both.

```jsonc
{
  "key": "cmd+t",
  "command": "workbench.action.terminal.newInActiveWorkspace",
  "when": "terminalFocus"
},
{
  "key": "cmd+t",
  "command": "workbench.action.createTerminalEditor",
  "when": "terminalEditorFocus"
},
{
  "key": "cmd+w",
  "command": "workbench.action.terminal.kill",
  "when": "terminalFocus"
},
{
  "key": "cmd+w",
  "command": "workbench.action.terminal.killEditor",
  "when": "terminalEditorFocus"
}
```

Another quality of life thing is to have ^⇥ and ^⇧⇥ always mean "focus next tab"
and "focus previous tab". When I'm working in the panel with multiple terminal
tabs open, I want these combos to switch over seamlessly so that they iterate
through terminal tabs instead of editor tabs. The defaults here are a _long_ way
from this. This next bit of config makes ^⇥ and ^⇧⇥ do the right thing no matter
what's focused.

```jsonc
{
  "key": "ctrl+tab",
  "command": "workbench.action.nextEditor"
},
{
  "key": "ctrl+shift+tab",
  "command": "workbench.action.previousEditor"
},
{
  "key": "ctrl+tab",
  "when": "terminalFocus",
  "command": "workbench.action.terminal.focusNext"
},
{
  "key": "ctrl+shift+tab",
  "when": "terminalFocus",
  "command": "workbench.action.terminal.focusPrevious"
},
{
  "key": "ctrl+tab",
  "when": "terminalEditorFocus",
  "command": "workbench.action.nextEditor"
},
{
  "key": "ctrl+shift+tab",
  "when": "terminalEditorFocus",
  "command": "workbench.action.previousEditor"
}
```

Depending on the size of the VSCode window, the position of the panel might
vary. Sometimes it needs to be on the right of the editor, and sometimes below.
I do most of my window management using
[Rectangle.app](https://rectangleapp.com/)'s keyboard shortcuts, so it's most
efficient if I can follow one of those combos with another in VSCode. The
following bit of config sets up VSCode so that ⌘⇧&rarr; and ⌘⇧&darr; move it to
those positions.

This is going to be more lines of config than you're probably expecting. The
reason for the bloat here is that this way preserves keyboard focus. If you just
run `workbench.action.positionPanelRight`, then afterwards you have to refocus
whatever bit of UI you were working in. The keybindings here detect whether
you're invoking the shortcuts from inside a terminal or not, and ensure you land
back where you started.

```jsonc
{
  "key": "cmd+shift+right",
  "when": "terminalFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.positionPanelRight",
      "workbench.action.terminal.focus"
    ]
  }
},
{
  "key": "cmd+shift+down",
  "when": "terminalFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.positionPanelBottom",
      "workbench.action.terminal.focus"
    ]
  }
},
{
  "key": "cmd+shift+right",
  "when": "!terminalFocus && !terminalEditorFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.positionPanelRight",
      "workbench.action.focusActiveEditorGroup"
    ]
  }
},
{
  "key": "cmd+shift+down",
  "when": "!terminalFocus && !terminalEditorFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.positionPanelBottom",
      "workbench.action.focusActiveEditorGroup"
    ]
  }
}
```

VSCode's support for placing terminals in the editor area is brilliant when
you're doing something really terminal centric. Sometimes a little panel off to
the side isn't big enough. By default, this is a mouse-driven interaction
though. If I'm in a terminal in a bottom panel, I want ⌘⇧&uarr; to move it into
the editor area, hide the panel, and focus the terminal. This next bit of config
makes that happen.

```jsonc
{
  "key": "cmd+shift+up",
  "when": "terminalFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.togglePanel",
      "workbench.action.terminal.moveToEditor",
      "workbench.action.focusActiveEditorGroup"
    ]
  }
},
```

For the reverse scenario, when I want to clear away my editor area terminal back
down into the panel, this entry makes ⌘⇧&darr; do that.

```jsonc
{
  "key": "cmd+shift+down",
  "when": "terminalEditorFocus",
  "command": "runCommands",
  "args": {
    "commands": [
      "workbench.action.terminal.moveToTerminalPanel",
      "workbench.action.positionPanelBottom"
    ]
  }
},
```

That's pretty much it. It's just enough so that I can shuffle around the
position of the panel and move terminals in and out of it using the keyboard.
Apparently that's all I ever actually wanted. It feels pretty fantastic to have
the keyboard-driven terminal winxow management I love without sacrificing any of
the benefits that come from using the most popular tool in my corner of the
industry. Much like
[using SQLite in production](/2024/01/14/my-sqlite-in-production-epiphany), it
feels like it shouldn't even be possible. I'm certainly in a real happy place
these days regarding devtools.

## Future Tweaks

Yesterday, I decided the final piece of the puzzle would be to have VSCode start
up with the terminal open in the editor area. I chucked
`vscode startupeditor terminal` into Google and found my way to a GitHub issue
thread titled
"[`workbench.startupEditor` should support opening a terminal in editor area](https://github.com/microsoft/vscode/issues/154366)".
It had a bunch of other people back in 2022 describing exactly what I was
looking for.

This is a type of search result I normally associate with disappointment. The
purple "Closed" badge here normally means "thanks, but no thanks". Not this time
though. I scrolled to the bottom and could hardly believe what I was seeing: a
pull request, merged 4 days ago, titled
[Add terminal as a startup editor](https://github.com/microsoft/vscode/pull/203567).
OMFG! So when that commit makes it into a shipped build, the config line to use
it will be like this.

```jsonc
"workbench.startupEditor": "terminal",
```

Can't wait! In the meantime, the
[entire config all together](https://gist.github.com/henrycatalinismith/1358f66b029d8a0a358c159b1ce1c146)
is available as a gist.
