import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox } from './initMapbox'
// import { launchLoader } from './launchLoader'

placesAutocomplete();
initMapbox();
// launchLoader()

const chatbox = document.querySelector('#chatbox')

const scrollToLastMessage = () => {

  chatbox.scrollTop = chatbox.scrollHeight
};

chatbox.addEventListener('onchange', () => {
  scrollToLastMessage;
})

window.setInterval(scrollToLastMessage, 50);
