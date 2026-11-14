---
title: C# LSP in Helix on macOS
image: /2026/01/27/lsp@1908x1424.webp
tags: [blog, devtools]
layout: layout-post
---

Found myself writing C# in Helix on macOS a bit lately. Weird combination. It
took a moment to tweak things so that it all plays nice together.

<figure>
 <img
  alt="Helix screenshot showing some C# code with the cursor on a Reverse() call and a popup window displaying the API documentation for Reverse()"
  src="/2026/01/27/lsp@1908x1424.webp"
 />
 <figcaption>
  Works great once it's configured!
 </figcaption>
</figure>

To set up the actual SDK and the language server I did the following.

```bash
brew install dotnet
dotnet tool install --global csharp-ls
```

That puts the tools in place, but I found that running `hx --health c-sharp`
after this step revealed that Helix couldn't find the `csharp-ls` binary. Adding
`~/.dotnet/tools` to my `$PATH` fixed it.

```fish
set -U fish_user_paths $fish_user_paths ~/.dotnet/tools
```

From here I had a green checkmark in `hx --health c-sharp` but it still didn't
quite work. Inspecting the language server logs in Helix with `:log-open`, I saw
that `csharp-ls` was unable to find the dotnet SDK. Setting the `DOTNET_ROOT`
environment variable in the language server config in
`~/.config/helix/languages.toml` fixed this.

```toml
[language-server.csharp]
command = "csharp-ls"
environment = { DOTNET_ROOT = "/opt/homebrew/Cellar/dotnet/10.0.102/libexec" }
```

This was everything. Annoying that C#'s devtools are so badly integrated with
each other and with macOS that you have to manually aim everything at each other
like that. But nothing too strenous.
