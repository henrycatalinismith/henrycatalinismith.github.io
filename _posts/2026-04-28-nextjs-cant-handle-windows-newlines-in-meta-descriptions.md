---
title: "Next.js can’t handle Windows newlines in meta descriptions"
tags: [blog, webdev]
layout: layout-post
---

Meta descriptions containing Windows-style `\r\n` newlines are broken in Next.js. When `\r` is present in a meta description, Next.js will render two `<meta name="description">` tags instead of one, and each with slightly different content.

Reproducing this bug is fairly simple.

```javascript
export async function generateMetadata() {
  return {
    description: "Hello, World!\r\nHello, World!",
  };
}
```

After building the site, you’ll see one meta description in the built HTML, as expected. Next strips the carriage return, which is why we only see `$` instead of `^M$` in the output below.

```bash
$ curl -s http://localhost:3002/ | htmlq "meta[name='description']" | cat -vet
<meta content="Hello, World!$
Hello, World!" name="description">$
```

But in the RSC payload, the carriage return is still there.

```bash
$ cat .next/server/app/index.rsc | grep -o '"name":"description","content":"[^"]*'
"name":"description","content":"Hello, World!\r\nHello, World!
```

When the page loads, Next compares the meta tags in the HTML with the ones in the RSC payload. It notices that this one with the carriage return in it is “missing”, and adds it.

```javascript
> [...document.querySelectorAll('meta[name="description"]')].map(e => e.getAttribute('content'))
< [
  'Hello, World!\nHello, World!',
  'Hello, World!\r\nHello, World!'
]
```

If you have a Next.js site hooked up to a CMS and the people using the CMS are on Windows, then there’s a good chance you have pages affected by this bug. It might take Vercel a while to get around to fixing [the problem](https://github.com/vercel/next.js/issues/93089), but it’s easy enough to run your metadata through `.replace(/\r/g, '')` to avoid it in the meantime.
