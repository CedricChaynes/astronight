import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox } from './initMapbox'
import { launchLoader } from './launchLoader'
import { initGauge } from './initGauge'
import { modalFade } from './modalFade'


placesAutocomplete()
initMapbox()
// modalFade()

if (document.querySelector(".loader")) {
  launchLoader(initGauge)
} else {
  initGauge();
}




