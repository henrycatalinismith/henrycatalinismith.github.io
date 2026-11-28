const updateCurrentSection = () => {
  let current = null;
  const links = document.querySelectorAll(".section-links a");

  links.forEach((link) => {
    const section = document.getElementById(link.hash.slice(1));
    if (
      section &&
      section.getBoundingClientRect().top <= window.innerHeight / 3
    ) {
      current = link;
    }
  });

  links.forEach((link) => {
    link.classList.toggle("current", link === current);
  });
};

window.addEventListener("scroll", updateCurrentSection);
updateCurrentSection();
