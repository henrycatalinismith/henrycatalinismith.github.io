---
title: Using AI to help humans translate Swedish labour laws
image: /2024/11/12/donotwant@420x315.webp
tags: [666a, blog]
layout: layout-post
---

Over on 666a I provide
[English translations of Swedish labour laws](https://666a.se/labour-law). For
the most part these are based on some translated PDFs that the Swedish
government sometimes publish. The government update the laws more frequently
than they update the translations though. Providing an up to date resource here
meant updating the translations myself, which is a challenging problem.


I used a little bit of AI as part of the solution. But that doesn't mean these
are "AI translations". Christ no.

![Still from Star Wars bootleg "The Backstroke of the West" with Darth Vader and the caption "Do Not Want"](/2024/11/12/donotwant@420x315.webp)

What's interesting about translating legal text in particular is that you really
_want_ lots of uniformity in the outcome. If a particular phrase has been
translated a particular way nine times before then the tenth translation should
follow the pattern too. This means it's not enough to speak Swedish.

Familiarity with the source text and the existing translations is key. In
practice, translating any given sentence becomes a long process of searching the
already-translated text for similar words and then reading those existing
translations to build an understanding of the prior context. Where I found a
good role for AI was in optimising that process, enabling me to spend less time
on the manual searching and more time on the reading and understanding.

Take the second paragraph of section 13 of the Working Hours Act for example.

| Swedish                                                                                                                                                                                                                                                                           | English                                                                                                                                                                                                                                                                                                  |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| I den dygnsvila som alla arbetstagare har rätt till skall tiden mellan midnatt och klockan 5 ingå. Avvikelse får göras, om arbetet med hänsyn till dess art, allmänhetens behov eller andra särskilda omständigheter måste bedrivas mellan midnatt och klockan 5. Lag (2005:165). | The daily rest period that all employees are entitled to shall include the hours between midnight and 05.00. Derogations may be made if the work, in view of its nature, the needs of the general public or other special circumstances, must be carried out between midnight and 05.00. Act (2005:165). |

First, I
[use ChatGPT to break this up into sentence pairs](https://codeberg.org/henrycatalinismith/666a.se/src/branch/main/app/jobs/labour_law/element_sentences_job.rb).

| Swedish                                                                                                                                                        | English                                                                                                                                                                     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| I den dygnsvila som alla arbetstagare har rätt till skall tiden mellan midnatt och klockan 5 ingå.                                                             | The daily rest period that all employees are entitled to shall include the hours between midnight and 05.00.                                                                |
| Avvikelse får göras, om arbetet med hänsyn till dess art, allmänhetens behov eller andra särskilda omständigheter måste bedrivas mellan midnatt och klockan 5. | Derogations may be made if the work, in view of its nature, the needs of the general public or other special circumstances, must be carried out between midnight and 05.00. |

Then a little more
[ChatGPT to mulch those sentence pairs down further into pairs of words and phrases](https://codeberg.org/henrycatalinismith/666a.se/src/branch/main/app/jobs/labour_law/sentence_phrases_job.rb).

| Swedish                             | English                            |
| ----------------------------------- | ---------------------------------- |
| dygnsvila                           | daily rest period                  |
| som alla arbetstagare har rätt till | that all employees are entitled to |
| Avvikelse får göras                 | Derogations may be made            |
| allmänhetens behov                  | the needs of the general public    |

Once we have those word/phrase pairs generated for all existing translations, we
can have a
[page that automatically lists matches for each word in a given paragraph of source text](https://codeberg.org/henrycatalinismith/666a.se/src/branch/main/app/views/rails_admin/main/element_translation_suggestions.html.erb).

![Website admin UI screenshot showing many word/phrase pairs](/2024/11/12/element_translation_suggestions@1788x2192.webp)

The results aren't perfect, and what's great is that they don't need to be.
Sometimes the AI fucks up the word/phrase pairs, and it doesn't matter. Since
we're not removing humans from the process – but rather optimising how the
available time is used – it's okay for this to be a little bit sketchy.

What this enables is to pick out any new paragraph that needs translating and
instantaneously scan the entire corpus of existing translations for the bits
that might be of interest to the human about to produce the new translation.
Even after visually scanning the results one time you immediately start to feel
a bit confident that you know how you're going to translate some of the
legalistic glue phrases. It frees up your remaining attention and time to focus
on translating anything that's actually novel about the new paragraph.

In the end I'm not sure if I saved time from this or just spent the same amount
of time more impactfully. With the correctness of legal text having such an
obvious importance, you end up _wanting_ to invest a certain amount of love into
the work just for a sense of hygiene about the outcome. Like if it's too quick,
it just doesn't feel done. So in this case I think it's more likely that using
AI just made the work more enjoyable and improved the outcome rather than
bringing it to an end sooner. Perhaps that's not the standard capitalist
narrative about what this technology's benefits are for society, but I'll take
it.

Really happy with this. The level of hype around AI is nauseatingly intense and
that's leading to a lot of overapplicaton of the tech. There's a decent amount
of people using it to fully communicate on their behalf, which I really don't
get. It has such a distinctive tone of voice with all those extra adjectives and
adverbs, and that uncanny beehive-looking regularity in the structure of the
sentences and paragraphs. It's amazing to me that people either don't see how
obvious it is or don't feel how unengaging it is once you twig that you're
reading something that wasn't important enough to write. Negative experiences
like those leave the door wide open to outright cynicism about the tech in
general. I'm glad I have a nice example like this to keep my head balanced.
