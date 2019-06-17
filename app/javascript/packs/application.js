import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox, selectPin, cleanSelected } from './initMapbox'
import { launchLoader } from './launchLoader'
import { initGauge } from './initGauge'
import { initStars } from './initStars'
import { hideCalendarBtn } from './hideCalendarBtn'

placesAutocomplete()

hideCalendarBtn();

const loaderCallback = () => {
  document.querySelector('.navbar').style.display= "";
  initGauge();
  initMapbox()
}

if (document.querySelector(".loader")) {
  window.onload = initStars()
  launchLoader(loaderCallback)
} else {
  initGauge();
  initMapbox();
}

let markers = document.querySelectorAll('mapboxgl-popup-content')

let cards = document.querySelectorAll('.ul-cards');
console.log(cards);

cards.forEach(card => {
 card.addEventListener('mouseover', () => {
   const id = card.querySelector('[data-id]').dataset.id;
   // console.log(id);
   selectPin(id)
 });

 card.addEventListener('mouseout', () => {
   const id = card.querySelector('[data-id]').dataset.id;
   // console.log(id);
   cleanSelected(id)
 });
});
