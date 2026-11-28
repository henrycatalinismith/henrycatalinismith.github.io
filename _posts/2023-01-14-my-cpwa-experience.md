---
title: My CPWA Experience
image: /2023/01/14/my-cpwa-experience-notebooks@1024x768.webp
tags: [blog, accessibility, webdev]
layout: layout-post
---

2022 was the year my dream of getting more into accessibility finally came true.
While I was studying for the
[IAAP certifications](https://www.accessibilityassociation.org/s/certification)
I was surprised by how valuable I found other people’s accounts of how they
studied for them. I promised myself I’d contribute back to that if I passed the
exams. And I passed, so here’s what I did!


## Background

Most people writing about accessibility online seem to be hardcore experts with
years upon years of experience working exclusively on accessibility. That’s not
me, and I think that’s probably important information here. Like, this
certification isn’t just for those superstars. So here’s some background in case
it helps someone make a decision about taking these exams.

At my previous job one of my side projects was scoping out and building a
business case for a WCAG compliance retrofitting project. My accessibility
knowledge back then was within the average range for a decent web developer: I
knew how to fire up VoiceOver and how to fix the worst & simplest issues. I knew
I wanted to learn more, and that our app’s accessibility issues had commercial
drawbacks, but I’d never done anything like build an
[accessible ARIA combobox implementation](https://www.w3.org/WAI/ARIA/apg/example-index/combobox/combobox-select-only.html)
myself yet.

The COVID-19 pandemic spoiled my plans there, because in the healthtech business
anything that wasn’t COVID-related got deprioritised in 2020. But at my next
job, COVID had the opposite effect, as the rise of remote learning brought
_that_ app under the jurisdiction of
[government procurement legislation](https://www.section508.gov), with all its
accessibility requirements.

So I spent most of 2022 retrofitting a decade’s worth of accessibility issues as
quickly as I possibly could, and learned a whole lot in a very short period of
time. This was a well-funded project where I got to learn from expert colleagues
as well as third party auditors and UX research. Towards the end of this project
was when I decided to shoot my shot for the IAAP certs.

## Studying

The
[Deque study package for the CPACC and WAS exams](https://dequeuniversity.com/curriculum/packages/iaap-certification-prep)
is some of the best $170 I’ve ever spent. If you’re thinking of having a go at
these exams, and if you take away nothing else from this post, you should at
least buy that package. The three most important things for me in my studies
were:

- The deque course.
- Notebooks.
- Flash cards.

I went through the Deque material for both exams once very slowly, making my own
set of notes in my own words. This was the part of the process where I’d stop
for more research if I found something I didn’t immediately understand. It
filled a good few notebooks by the time it was done. Once the notebook phase was
done and I was confident I’d seen and understood the full breadth of the
material, I created flash cards based on the notes.

![Two A5 spiral-bound notebooks on a wooden table next to a stack of flash cards about 15cm high. ](/2023/01/14/my-cpwa-experience-notebooks@1024x768.webp)

My full study material for both courses looked like this once complete.

## CPACC

The CPACC course had the most material that was totally new to me, so I focused
most of my study efforts on it. The international laws, the different models of
disability, the Universal Design for Learning stuff: all of it was new and
exciting (and a bit intimidating too) so I threw most of my weight behind
learning it.

![
Spiral bound notebook open to a page titled 'Economic model'.
Below the title, handwritten text as follows.
Defines disability in terms of a persons inability to participate in work.
Assesses severity in terms of the degree of lost productivity and the economic consequences to individuals, employers and the state.](/2023/01/14/my-cpwa-experience-economic-model@1024x768.webp)

As someone who dropped out of a humanities university degree course back in 2006
it felt great to see that I’ve learned how to engage with this kind of material
properly in the years since.

It was great fun learning about the different
[models of disability](https://en.wikipedia.org/wiki/Social_model_of_disability).
That’s such a useful conceptual framework for making sense of so many things.
[Universal Design for Learning](https://en.wikipedia.org/wiki/Universal_Design_for_Learning)
was a topic I expected to find a little irrelevant to my own interests, but
ended up finding super fun too. The way it categorises the different aspects of
learning helped me understand my own learning process better. And the
[international legal material](https://ec.europa.eu/social/main.jsp?catId=1202)
felt like a bit of a slog at first, but the value of the knowledge felt really
clear once it was inside my head. Having a broad idea of what the legal
requirements are like in different countries across the world gives a great
high-level perspective.

All told, I think the material for this exam felt about equivalent to a typical
semester-long university module. The Deque course is a great complement to the
IAAP’s own
[CPACC Book of Knowledge](https://www.accessibilityassociation.org/resource/IAAP_CPACC_BOK_March2020).
I don’t believe there was a single exam question that wasn’t covered by the
Deque course. They have really created a very special resource in that course.
And no, they’re not paying me to promote it.

If you’re interested in accessibility, I think you should definitely consider
studying for the CPACC exam. The material isn’t particularly technical as it’s
not aimed solely at software engineers. If you’re excited about accessibility
and willing to study, you can absolutely pass this exam.

This exam went quite well for me, which reflects how much effort I put in, I
think. I was really happy with my result, which built my confidence up for the
much harder Web Accessibility Specialist exam.

## WAS

The study material for the WAS exam felt more familiar to me than the CPACC
stuff because it‘s more technical, which led me to invest less of my study time
in it. I regret this now. This exam turned out to be the harder of the two, and
I didn’t pass it by as big a margin as the CPACC exam.

I also went off on more tangents, investing a lot of time studying
[ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) and
[ATAG](https://www.w3.org/WAI/standards-guidelines/atag/) in way more detail
than either the Deque course or the
[WAS Book of Knowledge](https://www.accessibilityassociation.org/resource/WAS_Certification_FInal_2020_FINAL)
cover them in. I even made an honest attempt to memorise the whole
[ARIA taxonomy](https://www.w3.org/TR/wai-aria/img/rdf_model), which was way too
ambitious and miles beyond the scope of the Book of Knowledge.

![Sprawling UML diagram showing all the ARIA roles as boxes and the inheritance relationships between them as connecting lines.](/2023/01/14/my-cpwa-experience-aria-taxonomy@1904x811.webp)

I tried to memorise this.

I’m still happy I did this because that’s knowledge I now personally value.
Having a bit of a general idea about how the different ARIA roles inherit from
other more general ones feels cool as fuck. But in hindsight I should probably
have focused more on the core material.

What was fun about this course was that it took me outside the stuff I’d covered
in the retrofitting project at work. One of the coolest things I was most
excited to learn about was
[the different screen reader modes in JAWS and NVDA](https://webaim.org/blog/three-things-voiceover/).
Since I only have access to VoiceOver, this course was my first exposure to that
concept, and it’s really important to know about!

![
Spiral bound notebook open to a page titled 'Screen reader modes'.
Below the title, handwritten text as follows.
Forms mode.
No char key shortcuts here b/c typing!
Focus only on focusable items so random text will be missed.
Document/Browse/Scan mode (default)
Lots of shortcuts, focus anything.](/2023/01/14/my-cpwa-experience-screen-reader-modes@1024x768.webp)

This is by far the most important UX difference between VoiceOver and the big
two Windows screen readers.

This certification does not fuck around. It’s not like those softball LinkedIn
skill tests, and it’s sure as hell not like those scrum master "certifications"
that you get after doing a quick two day course with a perfunctory little test
on the end. To stand a chance at passing this one, you need to be willing to try
to memorise
[keyboard shortcuts for a bunch of different screen readers](https://dequeuniversity.com/screenreaders/nvda-keyboard-shortcuts).
You need to at least have an honest try at memorising as many of the
[WCAG success criteria](https://www.w3.org/TR/WCAG21/) as you can. It would have
been impossible to pass this exam without the benefit of everything I learned
from the accessibility retrofitting project at work. My experience level within
the field of accessibility was definitely at the bottom end of the viable range
for this certification and I only squeezed through by studying my ass off to
compensate for that.

My result for this exam was too close for comfort. If I’d been a bit unlucky on
a handful of questions, I’d have failed. A pass is a pass, sure, but I’d have
preferred a comfortable pass for both exams rather than a slam dunk for one and
a near miss for the other. Something to think about if your experience profile
matches mine and you’re wondering how to structure your studies, I reckon.

## The exams themselves

Kryterion are doing a great job. The potential for cheating is obvious when
people are taking exams from home, and the risk that that represents for the
credibility of these certifications is equally obvious. After going through the
process twice, I came away with a really strong sense that successfully cheating
at these exams would have been harder than just studying for them. The Kryterion
folks know what they’re doing, and that’s great, I think.

That said, I’ve also heard anecdotally that this same online proctoring process
can prevent blind people from obtaining these accessibility certifications,
because it hasn’t been built in an accessible way. The irony would genuinely be
quite funny if this wasn’t having a material negative impact on peoples lives. I
hate that this is an issue. Everything else about this process has been so
fantastic, but this does piss on the cornflakes quite a bit and that’s a shame.

My approach to the exams was to charge my laptop beforehand and set it up on a
completely empty desk in a room with the door locked. I made sure to book the
exam for a time when it’d definitely be quiet at home too. I was a little
nervous about making the proctoring people suspicious, so taking steps like
these was a good way to bring my nerves down for the exam.

## Next Steps

My CPWA certification expires in 2025. If I want to renew it, I’ll have to earn
at least 55 "Continuing Accessibility Education Credits". So yet again the IAAP
is setting its certifications apart from the more dubious tech industry certs
where simply paying a fee is enough to renew them. Good for them.

I really hope I’ll manage to squeeze that continuous learning in and hang on to
the cert. Accessibility has shown me that there’s some genuine potential for
social good inherent to literally all software. If you wanted to read a whole
bunch of different stuff from all over the world 50 years ago you were basically
just shit out of luck if you were blind, for example, and technology has
transformed that in the years since. It’s healed a badly wounded part of my soul
to find a niche in this industry where the work and its outcomes are coherent
with my own personal values.

The downside with accessibility seems to be that it’s a more precarious form of
work than the industry standard AB testing grind. Elon Musk’s firing of the
entire accessibility team at Twitter was shortly followed by the cancellation of
the accessibility program I’d been expecting to work on at my own job. So
further specialisation in accessibility doesn’t seem like the best option from a
pure risk minimisation perspective, but I don’t think I care. Hopefully there
will be lots of opportunities ahead to put all this hard-earned knowledge to
good use!
