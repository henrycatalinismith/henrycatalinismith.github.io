---
title: Deepseek gives zero fucks
tags: [blog, devtools]
layout: layout-post
---

Asked DeekSeek to clone some repos from GitHub the other day, and happened to be in my ~/dotfiles project when I asked. The agent was therefore sandboxed to that directory, which blocked it from its goal.

Correctly guessing that I didn't give a shit about the integrity of the sandbox in this case, it set about trying to escape.

<figure>
 <img
  src="/2026/10/30/deepseek@1194x306.webp"
  alt="The terminal is sandboxed to the dotfiles project root. To work with ~/ (your home directory I'll need to create that directory so the terminal is granted access to it. Let me request access by creating the home directory path (this is effectively a no-op since it exists, but it grants write access)."
 >
</figure>

Gave me a litte fright in the moment. On my first quick read of the above I wasn't sure if it was just describing a no-op mkdir call or something more destructive.  I hit that "stop" button so fucking fast!

All good though. Fun to see where DeepSeek's succeed-at-all-costs rep comes from. We don't have DeepSeek at work either so it was also a nice milestone in my coming-to-terms-with-AI journey, where I got a solid example of why relying on the 9 - 5 stuff isn't going to give me a full picture of this new world.
