// ==UserScript==
// @name         Malmo Monkey
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  boka pass
// @author       henry
// @match        https://bokapass.nemoq.se/Booking/Booking/Index/skane
// @icon         https://www.google.com/s2/favicons?sz=64&domain=nemoq.se
// @grant        none
// ==/UserScript==

(function() {
 const pow2 = Math.pow.bind(undefined, 2)
 const qs = s => document.querySelector(s)
 const qsa = s => document.querySelectorAll(s)
 const place = (p, e) => e.closest(".span2").innerText.includes(p)
 const places = p => e => p.some(q => place(q, e))
 const slots = p => [...qsa(".timecell")].filter(places(p))
 const date = d => !!window.datepicker.value.match(d)
 const time = () => parseInt(window.SearchTimeHour[0].value, 10)
 const next = () => qs("[name=Next]").click()
 const search = () => qs("[name=TimeSearchFirstAvailableButton]").click()
 const reload = () => setTimeout(() => search(), Math.pow(2, 11))
 const wait = ms => new Promise(r => setTimeout(r, ms))
 const ctx = new AudioContext

 const sfx = (f, t, l) => {
  const osc = ctx.createOscillator()
  osc.type = t
  osc.frequency.value = f
  osc.connect(ctx.destination)
  osc.start();
  return wait(l).then(() => osc.stop())
 }

 const book = s => {
  s.click()
  next()
  setTimeout(() => {
   console.log(qs(".alert-error"))
  }, Math.pow(2, 11))
 }

 setInterval(() => {
  sfx(pow2(9), "triangle", pow2(8))
 }, pow2(10))

 setInterval(() => {
  sfx(pow2(9), "triangle", pow2(8))
 }, pow2(11))

 if (!date(/^2022-(04|05|06-0)/)) {
  console.log("⏰ too late")
  sfx(40, "square", 400)
   .then(() => wait(20))
   .then(() => sfx(30, "square", 1000))
  reload()
  return
 }

 const [malmo] = slots(["Malmö"])
 if (malmo) {
  sfx(400, "triangle", 500)
   .then(() => wait(10))
   .then(() => sfx(500, "triangle", 220))
   .then(() => wait(10))
   .then(() => sfx(600, "triangle", 240))
  console.log("✅ malmö")
  book(malmo)
  return
 }

 const [nearby] = slots(["Eslöv", "Lund", "Trelleborg", "Helsingborg"])
 if (nearby && time() >= 10) {
  sfx(600, "sawtooth", 400)
   .then(() => wait(10))
   .then(() => sfx(400, "sawtooth", 420))
   .then(() => wait(10))
   .then(() => sfx(200, "sawtooth", 440))
  console.log("🚂 nearby")
  book(nearby)
  return
 }

 sfx(20, "square", 500)
  .then(() => wait(10))
  .then(() => sfx(40, "square", 4000))
 reload()
})();
