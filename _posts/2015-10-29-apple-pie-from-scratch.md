---
title: Apple Pie From Scratch
image: /2015/10/29/apple-pie-from-scratch-zoom@960x540.webp
tags: [blog, webdev]
layout: layout-post
---

This is a quick write-up of my solution to one of the first problems I bumped
into in my latest project. I’m building a JavaScript model of the solar system,
which in the end will hopefully feature all the planets orbiting the Sun
according to some approximation of Newtonian gravity.

The problem arose because it’s easier to implement the equations if your data
model uses SI units: meters, kilograms and seconds. Plus, if you adopt a nice
convention like SI units, it makes the code so much more readable. I find names
like distanceInKm or massInKg super ugly. It’s nicer if you can use distance and
mass and just infer the units from the convention.

```javascript
class Planet {
  constructor ({ mass, position, radius }) {
  this.mass = mass;
  this.position = position; // { x, y }
  this.radius = radius;
  }
}
```

This is lovely, but the CanvasRenderingContext2D API works in pixels. Take it or
leave it. So the code in charge of rendering planets needs to know how to
convert between meters and pixels.

It’s the kind of problem that’s tempting to sort of hack your way through. Just
keep throwing code at the wall and eventually something will stick. Easy enough,
but the result is usually not great. It’s bad enough not understanding your own
code a few weeks after writing it. Not understanding it while you’re still
writing it is just… no fun.

So I made a cup of tea, cleared a whiteboard, and had a bit of a think. The
resulting diagram is a bit incomprehensible, but I sometimes think it’d be nice
if people were more open about how lost they get with even simple stuff like
this, so here it is.

The gist of the solution is to have a scale property somewhere, denoting the
conversion rate between pixels and meters. Next, I needed there to be a “thing”
in my system to actually own that property and apply it. The name I settled on
for that “thing” was Viewport.

The Viewport needs to a few things to do its job. It needs that scale value, for
starters. It needs a reference to the rendering context, too. And I figured it
also needs to know which part of the universe it’s centered on, which I pass in
as an object called center with an x and a y property. Because x and y are
spatial values, you can just assume they’re in meters. See how nice that is?

```javascript
class Viewport {
  constructor({ center, context, scale }) {
  this.center = center; // { x, y }
  this.context = context;
  this.scale = scale;
  }
}
```

The last thing that’s missing is a Viewport method to render planets. Rendering
circles is nice and simple because it’s part of the browser API, so that’s a
freebie. What’s less simple is that I’ve designed the Viewport to accept the
coordinates of its center point in meters, whereas the built-in arc method
expects the coordinates of the circle in pixels from the top-left corner.

This is important, because I need it to be easy to center the viewport on a
given planet. I want it to be as simple as viewport.center = planet.position. As
usual, the price of simplicity somewhere is complexity elsewhere.

Converting between those two points is a two-step calculation. First, you have
to calculate the position of the top-left pixel of the canvas in imaginary space
meters. Then you subtract the coordinates of that position from the coordinates
of the planet, and multiply the results by the scale property from earlier. This
gives you the pixel position of the planet within the canvas. The resulting code
is really heavy on arithmetic and took a while to get right.

```javascript
drawPlanet (planet) {
  const { width, height } = this.context.canvas;
  const topLeft = new Point(
  this.center.x - ((width / 2) * (1 / this.scale)),
  this.center.y - ((height / 2) * (1 / this.scale))
  );

  this.context.fillStyle = planet.color;
  this.context.beginPath();

  this.context.arc(
  (planet.position.x - topLeft.x) * this.scale,
  (planet.position.y - topLeft.y) * this.scale,
  planet.radius * this.scale,
  0,
  Math.PI * 2
  );

  this.context.closePath();
  this.context.fill();
}
```

With that in place, I now have a working graphical layer that understands how to
render my SI units data model onto a 2D canvas element.

It’s a really fundamental part of the system, so you don’t end up with much to
show for all the effort, but I did manage to squeeze one cool thing out of it.
By gradually shrinking the value of the scale property, I can generate a “flying
backwards through space” effect. Check it out. Right at the very end you can see
the Moon whizz by on the right once we’re far enough from Earth.

<figure>
 <video
  src="/2015/10/29/apple-pie-from-scratch-zoom@960x540.mp4"
  poster="/2015/10/29/apple-pie-from-scratch-zoom@960x540.webp"
  title="2D earth fading into the distance as the camera moves backwards"
  controls
  preload="none"
  playsinline>
 </video>
 <figcaption>
  Fun, fun, fun.
 </figcaption>
</figure>

Now that the basics are in place to display what’s going on, the next step is to
get everything moving. Right now I’m still struggling to make gravity work
right. It’s a lot harder than this was.
