import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox } from './initMapbox'
import { launchLoader } from './launchLoader'
import { initGauge } from './initGauge'
import { initStars } from './initStars'
import { modalFade } from './modalFade'

placesAutocomplete()
initMapbox()
modalFade()

if (document.querySelector(".loader")) {
  window.onload = initStars()
  launchLoader(() => {
    document.querySelector('.navbar').style.display= "";
    initGauge;
  })
} else {
  initGauge();
}
