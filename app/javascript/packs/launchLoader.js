import { CountUp } from 'countup.js'
import { initStars } from './initStars'

const loader = document.querySelector(".loader");


const launchLoader = (callback) => {
  if (loader) {
    document.querySelector('.navbar').style.display= "none"
    loader.style.display = "block";
    const countUpSite = new CountUp('countup-site', 587, {duration: window.animationDuration + 3, separator: ' ', suffix: ' sites d\'observation'});
    countUpSite.start()
    const countUpLightPol = new CountUp('countup-light-pol', 934, {duration: window.animationDuration + 4, separator: ' ', suffix: ' indices de pollution lumineuse'});
    countUpLightPol.start()
    setTimeout(50000)
    const countUpAstro = new CountUp('countup-astro-events', 114, {duration: window.animationDuration + 2, separator: ' ', suffix: ' événements astronomiques'});
    countUpAstro.start()
    const countUpMeteo = new CountUp('countup-meteo', 11740, {duration: window.animationDuration + 6, separator: ' ', suffix: ' bulletins météo nocturne'});
    countUpMeteo.start(() => {
        loader.classList.add("fade-out")
        callback()
      })
    }
};

export { launchLoader }
