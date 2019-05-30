import { CountUp } from 'countup.js'

const loader = document.querySelector(".loader");

const launchLoader = () => {
  if (loader) {
  loader.style.display = "block";
  const countUpSite = new CountUp('countup-site', 587, {duration: 4, separator: ' ', suffix: ' sites d\'observation'});
  countUpSite.start()
  const countUpLightPol = new CountUp('countup-light-pol', 934, {duration: 4, separator: ' ', suffix: ' indices de pollution lumineuse'});
  countUpLightPol.start()
  const countUpAstro = new CountUp('countup-astro-events', 114, {duration: 3, separator: ' ', suffix: ' événements astronomiques'});
  countUpAstro.start()
  const countUpMeteo = new CountUp('countup-meteo', 11740, {duration: 6, separator: ' ', suffix: ' bulletins météo nocturne'});
  countUpMeteo.start(() => loader.classList.add("fade-out"))
  }
};

export { launchLoader }



