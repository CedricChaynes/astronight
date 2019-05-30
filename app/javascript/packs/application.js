import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { placesAutocomplete } from './placesAutocomplete';
import { initMapbox } from './initMapbox';


placesAutocomplete();
initMapbox();

const chatbox = document.querySelector('#chatbox')

const scrollToLastMessage = () => {

  chatbox.scrollTop = chatbox.scrollHeight
};

chatbox.addEventListener('onchange', () => {
  scrollToLastMessage;
})

window.setInterval(scrollToLastMessage, 50);
