import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox } from './initMapbox'
// import { launchLoader } from './launchLoader'

placesAutocomplete();
initMapbox();
launchLoader()
