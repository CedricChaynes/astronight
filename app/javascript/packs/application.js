import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox } from './initMapbox'
import { launchLoader } from './launchLoader'
import { initGauge } from './initGauge'
import { initStars } from './initStars'

placesAutocomplete()
initMapbox()

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
