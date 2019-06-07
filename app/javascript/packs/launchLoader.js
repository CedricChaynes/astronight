import { CountUp } from 'countup.js'
import { initStars } from './initStars'

const loader = document.querySelector(".loader");

const launchLoader = (callback) => {
  if (loader) {
    setTimeout(() => {
      const countUpSite = new CountUp('countup-site', 587, {duration: 11, separator: ' ', prefix: '<span class="countup-counter">', suffix: '</span> Sites d\'observation'});
      countUpSite.start();
    }, 800);

    setTimeout(() => {
      const countUpLightPol = new CountUp('countup-light-pol', 934, {duration: 12, separator: ' ', prefix: '<span class="countup-counter">', suffix: '</span> Indices de pollution lumineuse'});
      countUpLightPol.start();
    }, 2000)

    setTimeout(() => {
      const countUpAstro = new CountUp('countup-astro-events', 114, {duration: 9, separator: ' ', prefix: '<span class="countup-counter">', suffix: '</span> Evenements astronomiques'});
      countUpAstro.start();
    }, 3500)

    setTimeout(() => {
      const countUpMeteo = new CountUp('countup-meteo', 11740, {duration: 12, separator: ' ', prefix: '<span class="countup-counter">', suffix: '</span> Bulletins meteo nocturne'});
      countUpMeteo.start(() => {
        loader.classList.add("fade-out");
        setTimeout(() => {
          document.querySelector('body').classList.remove('has-loader');
          callback();
        }, 500)
      })
    }, 2500)
  }
};

export { launchLoader }


    setTimeout(() => {}, 500)
