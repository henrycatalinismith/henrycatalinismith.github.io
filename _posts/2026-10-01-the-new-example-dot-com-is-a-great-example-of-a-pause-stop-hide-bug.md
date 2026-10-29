---
title: "The new example.com is a great example of a Pause, Stop, Hide bug"
tags: [accessibility, blog, webdev]
layout: layout-post
---

The IANA put up a new version of [example.com](https://example.com/) recently, and in doing so have unintentionally provided a useful example of a [2.2.2 Pause, Stop, Hide](https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide.html) bug. I love a chance to dissect a common accessibility bug in a neutral public context like this, so let's go.

Until recently, example.com looked like this.

<figure>
 <img
  alt="Example Domain This domain is for use in documentation examples without needing permission. Avoid use in operations. Learn more"
  src="/2026/10/01/old@2048x1570.png"
 />
</figure>

As of this week, it uses quite an elegant-looking animation to cycle through a bunch of different languages automatically.

<figure>
 <video
  src="/2026/10/01/example.mp4"
  poster="/2026/10/01/example@2048x1568.png"
  title="This domain is for use in documentation examples without needing permission. This is not a service, avoid relying on it for testing and monitoring purposes."
  controls
  preload="none"
  playsinline>
 </video>
</figure>

In order to comply with the Pause, Stop, Hide success criterion, you have to provide a means of pausing, stopping or hiding any automatically updating information on a page. The reason why is that this kind of behaviour can range from very distracting for some people to unreadable for others, depending on each person's unique combination of cognitive disability and vision impairment.

The text on example.com updates every five seconds, which means once the text in the language you speak appears, you have five seconds to read before it's gone again. There's no way to pause it, so it's noncompliant.

I _love_ Pause, Stop, Hide. It's one of those wonderfully broad success criteria that reminds me how accessibility really is for everyone. It's commmon to imagine that accessibility is for the benefit of an unseen disabled third party, but Pause, Stop, Hide bugs can affect all of us at different stages of our lives. For our older selves whose eyesight may have deteriorated with age, and our younger selves whose reading comprehension isn't fully developed, designs like these erect little digital barriers into our very own lives.

It's an easy mistake to make, so little bugs like these crop up time and time again. And I often struggle to talk people out of them. Unlike implementation-level bugs where some missing ARIA attribute magic can be quietly added to an existing design without challenging anyone's grand idea, you can't fix a Pause, Stop, Hide bug unless someone compromises on their vision.

Unfortunately I haven't yet figured out a way to talk to people about these bugs that reliably leads to a satisfying outcome. There is admittedly a sense of magic about any design with a bit of looping animation in it. It makes it very difficult to formulate a Pause, Stop, Hide bug report to come off more like an invitation into a more inclusive world than a fart in an elevator. If you've figured out a way please do let me know.

## Update: October 5th (four days later)

They've only gone and bloody fixed it! The new design shows all the translations, one after another, as plain old static text.

<figure>
 <img
  alt="This domain is for use in documentation examples without needing permission. This is not a service; avoid relying on it for testing and monitoring purposes. هذا النطاق مُخصص للاستخدام في أمثلة التوثيق دون الحاجة إلى إذن. هذه ليست خدمة، يُرجى تجنب الاعتماد عليها لأغراض الاختبار والمراقبة. 该域名仅用于文档示例，无需获得许可。这并非一项服务，请勿将其用于测试和监控目的。 L’usage de ce domaine est réservé à des exemples de documentation, sans autorisation préalable. Il ne s’agit pas d’un service ; son utilisation à des fins de test ou de surveillance est à éviter."
  src="/2026/10/01/fixed@2048x1570.png"
 />
</figure>

Did this blog post somehow get seen by the right people at the IANA? If so, huge congratulations! Partly for being extremely cool in fixing this at all, but also for tweaking the design in a way that provides a great example of how accessibility can often be improved by simplifying a design.

The animation ***could*** have been made compliant by ***adding*** a pause button. But dropping the animation entirely achieves WCAG compliance while simultaneously improving ***and*** simplifying the design. As a result of this change, a Chinese speaker can now access the Chinese translation immediately upon page load, whereas previously they would have had to wait in limbo for 10 seconds wondering if their language might appear soon.***Genuinely a fantastic example of how the compliance retrofit (in this case a pause button) can often leave value on the table compared to a ground-up usability rethink that factors in accessibility as a first-class concern. Thank you!
