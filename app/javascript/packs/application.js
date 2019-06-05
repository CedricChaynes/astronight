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
// modalFade()

const loaderCallback = () => {
  document.querySelector('.navbar').style.display= "";
  initGauge();
}

if (document.querySelector(".loader")) {
  window.onload = initStars()
  launchLoader(loaderCallback)
} else {
  initGauge();
}
