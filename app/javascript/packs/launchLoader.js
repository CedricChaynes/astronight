import { CountUp } from 'countup.js'
import { initStars } from './initStars'

const loader = document.querySelector(".loader");

const launchLoader = (callback) => {
  if (loader) {
    setTimeout(() => {
      const countUpSite = new CountUp('countup-site', 587, {duration: window.animationDuration + 3, separator: ' ', suffix: ' sites d\'observation'});
      countUpSite.start();
    }, 500);

    setTimeout(() => {
      const countUpMeteo = new CountUp('countup-meteo', 11740, {duration: window.animationDuration + 6, separator: ' ', suffix: ' bulletins météo nocturne'});
      countUpMeteo.start();
    }, 800)

    setTimeout(() => {
      const countUpAstro = new CountUp('countup-astro-events', 114, {duration: window.animationDuration + 2, separator: ' ', suffix: ' événements astronomiques'});
      countUpAstro.start();
    }, 1200)

    setTimeout(() => {
      const countUpLightPol = new CountUp('countup-light-pol', 934, {duration: window.animationDuration + 4, separator: ' ', suffix: ' indices de pollution lumineuse'});
      countUpLightPol.start(() => {
        document.querySelector('body').classList.remove('has-loader');
        loader.classList.add("fade-out");
        callback();
      })
    }, 1600)
  }
};

export { launchLoader }
